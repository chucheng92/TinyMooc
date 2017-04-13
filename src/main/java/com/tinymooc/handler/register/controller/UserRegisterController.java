package com.tinymooc.handler.register.controller;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tinymooc.handler.register.service.SendMailService;
import com.tinymooc.handler.register.service.UserRegisterService;
import com.tinymooc.common.domain.HeadImage;
import  com.tinymooc.common.domain.User;
import com.tinymooc.util.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class UserRegisterController {
	
	@Autowired
	private UserRegisterService userRegisterService;
	
	
	//页面跳转
	@RequestMapping("goRegisterPage.htm")
	public ModelAndView goRegisterPage(){
		return new ModelAndView("/register/register");
	}

	//检测邮箱是否被注册，ajax处用
	@RequestMapping("checkUsedEmail.htm")
	public String checkUsedEmail(HttpServletRequest request ,HttpServletResponse response)throws Exception{
		String userEmail=ServletRequestUtils.getStringParameter(request, "userEmail");
		System.out.println(userEmail+"####################");
		PrintWriter out=null;
		String result=null;
		out=response.getWriter();
		if(userRegisterService.checkEmail(userEmail)!=0){
			result="registered";
			System.out.println(result);
		}else{
			result="ok";
		}
		out.print(result);
		return null;
	}
	@RequestMapping("checkRegisterUsedName.htm")
	public String checkUsedNick(HttpServletRequest request ,HttpServletResponse response) throws Exception{
		String name=ServletRequestUtils.getStringParameter(request, "userName");
		String userName = new String(name.getBytes("ISO8859-1"),"UTF-8");
		System.out.println(userName+"####################");
		PrintWriter out=null;
		String result=null;
		out=response.getWriter();
		if(userRegisterService.checkUserName(userName)!=0){
			
			result="registered";
			System.out.println(result);
		}else{
			result="ok";
		}
		out.print(result);
		return null;
	}
	//插入信息，并发送激活邮件
	
	@RequestMapping("userRegister.htm")
	public  ModelAndView userRegister(HttpServletRequest request ,HttpServletResponse response) throws Exception{
		String userEmail=ServletRequestUtils.getStringParameter(request, "userEmail");
		String userPassword=ServletRequestUtils.getStringParameter(request, "userPassword");
		String userName=ServletRequestUtils.getStringParameter(request, "userName");
		String userGender=ServletRequestUtils.getStringParameter(request, "userGender");
		
		String imageLarge="/resource/pic/imagehead/default1.jpg";
		String imageMid="/resource/pic/imagehead/default2.jpg";
		String imageSmall="/resource/pic/imagehead/default3.jpg";
		
		
		HeadImage headImage=new HeadImage();
		
		headImage.setImageId(UUIDGenerator.randomUUID());
		headImage.setImageLarge(imageLarge);
		headImage.setImageMid(imageMid);
		headImage.setImageSmall(imageSmall);
		
		
		userRegisterService.save(headImage);
		
		
		User user=new User();
		
		user.setEmail(userEmail);
		user.setUserName(userName);
		user.setPassword(userPassword);	
		user.setUserId(UUIDGenerator.randomUUID());
		user.setUserState("锁定");
		user.setGender(userGender);
		user.setCredit(1);
		user.setGold(10);
		user.setHeadImage(headImage);
		userRegisterService.save(user);
		
		SendMailService email = new SendMailService("smtp.163.com", 25, 0, true, "initialran@163.com","19920104tr",true);
		String url="尊敬的"+user.getUserName()+"您好，点击链接激活您的微课程账号<br><a href='http://119.29.231.159:8080/tinymooc/verifyEmail.htm?userid="+user.getUserId()+"'>激活</a><br>";
		try {
			email.sendEmail(
					"initialran@163.com",
					"微课程",
					userEmail,
					"激活邮件",url
					);
			request.setAttribute("note", "尊敬的用户,您已经成功注册，请前往注册邮箱激活账号。");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("send fail");
			request.setAttribute("note", "尊敬的用户,很不幸的消息，由于网络故障，注册激活邮件发送失败。");
		}
		return new ModelAndView("/register/registerSuccess");
	}

	//邮箱激活
	@RequestMapping("verifyEmail.htm")
	public ModelAndView verifyEmail(HttpServletRequest request ,HttpServletResponse response) throws Exception{
		
		String userid=request.getParameter("userid");
		System.out.println(userid);
		User user=userRegisterService.getUserInfo(userid);
		
		if(user.getUserId()!=null){
			
			user.setUserState("激活");
			userRegisterService.update(user);
			request.setAttribute("verify", "激活成功,马上可以登陆了....");
			return new ModelAndView("/register/verifySuccess");
		}else {
			request.setAttribute("verify","激活失败,重新注册");
			return new ModelAndView("/register/register");
		}
		
	}

    @RequestMapping("findPassword.htm")
    public ModelAndView findPassword(HttpServletRequest request ,HttpServletResponse response)throws Exception{

        String userEmail=request.getParameter("userEmail");
        System.out.println(userEmail);
        SendMailService email = new SendMailService("smtp.163.com", 25, 0, true, "initialran@163.com","19920104tr",true);
        System.out.println(userEmail);
        String url="尊敬的用户您好，点击链接跳转到密码重置页面重置您的密码<br><a href='http://119.29.231.159:8080/tinymooc/goChangePasswordPage.htm?userEmail="+userEmail+"'>重置密码</a><br>";

        try {
            email.sendEmail(
                    "initialran@163.com",
                    "微课程",
                    userEmail,
                    "找回密码",url
            );
            request.setAttribute("note", "尊敬的用户，系统已经给您的注册邮箱发送了找回密码的链接，请尽快查请前邮箱查看。");
        } catch (Exception e) {
            e.printStackTrace();System.out.println("send fail");
            request.setAttribute("note", "尊敬的用户,很不幸的消息，由于网络故障，注册验证邮件发送失败。");
        }
        System.out.println("*************************************");
        //request.setAttribute("findpswd", "系统已经给您的注册邮箱发送了找回密码的链接，请尽快查看");
        return new ModelAndView("/register/sendEmailSuccess");
        //return new ModelAndView("redirect:turnToHomePage.htm");
    }
	
	@RequestMapping("goChangePasswordPage.htm")
	public ModelAndView goChangePasswordPage(HttpServletRequest request,HttpServletResponse response) throws Exception{
	
		
		String userEmail=ServletRequestUtils.getStringParameter(request, "userEmail");
		User user=userRegisterService.getUserInfo1(userEmail);
		
		
		request.setAttribute("userEmail", userEmail);
		
		/*request.setAttribute("userId", user.getUserId());*/
		return new ModelAndView("/login/resetPassword");
	}
	@RequestMapping("goChangePassword.htm")
	public ModelAndView goChangePassword(HttpServletRequest request,HttpServletResponse response) throws Exception{
		/*String userid=request.getParameter("userid");*/
		String userEmail=request.getParameter("userEmail");
		String userPassword=request.getParameter("userPassword");
		
		 User user=userRegisterService.getUserInfo1(userEmail);
		
		  if(userPassword!=null){
			user.setPassword(userPassword);
			
			userRegisterService.update(user);
			  
			request.setAttribute("success", "重置密码成功，马上去登陆.........");
			  
			return new ModelAndView("/login/resetsuccess");
		  }else{
			  request.setAttribute("faild", "重置失败!!!");
			  
			return new ModelAndView("/login/login");
		  }
		
	}
	@RequestMapping("goFindPassword.htm")
	public ModelAndView goFindPassword(){
		return new ModelAndView("/login/findPassword");
	}
	
	
}
