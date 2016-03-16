package com.tinymooc.handler.login.controller;

import com.tinymooc.common.domain.Level;
import com.tinymooc.common.domain.User;
import com.tinymooc.handler.login.service.LoginService;

import com.tinymooc.handler.privateMail.PrivateMailService;
import com.tinymooc.handler.user.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;

/**
 * Created by 哓哓 on 2015/11/29 0030.
 */
@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;

    @Autowired
    private UserService userService;

    @Autowired
    private PrivateMailService pmService;

    private static final Logger log = LoggerFactory.getLogger(LoginController.class);

    // 登录方式1：无Cookie
    @RequestMapping("login.htm")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws ServletRequestBindingException {

        HttpSession hs = request.getSession();
        hs.invalidate();

        String userEmail = ServletRequestUtils.getStringParameter(request, "userEmail");
        String userPswd = ServletRequestUtils.getStringParameter(request, "userPassword");
        String autoLogin = ServletRequestUtils.getStringParameter(request, "autoLogin");

        // TODO
        log.info("====userEmail={}===", userEmail);
        log.info("====userPassword={}===", userPswd);
        log.info("autoLogin={}", autoLogin);

        String userId = loginService.checkByEmailAndPswd(userEmail, userPswd);
        log.info("userId={}", userId);
        // 设置用户的私信数
        int sumMail = pmService.sumMail(userId);
        log.info("sumMail={}", userId);

        // 找到该用户，封装它的登录信息
        if (!userId.equals("no-such-person")) {
            User userInfo = loginService.findById(User.class, userId);
            //String avatar = userInfo.getHeadImage().getImageMid();
            // FIXME
            //log.info("====avatar={}===", avatar);
            int credit = userInfo.getCredit();
            // FIXME
            System.out.println("========credit=====" + credit);
            Level level = userService.getUserLevel(credit);
            System.out.println("===level===" + level.getLv());
            // FIXME
            //log.info("====credit={}===", credit);

            // 封装数据
            hs = request.getSession();
            hs.setAttribute("user", userInfo);
            hs.setAttribute("startTime", new Date());
            hs.setAttribute("sumMail", sumMail);
            hs.setAttribute("level", level);
            // FIXME
            System.out.println("=========LoginController -> autoLogin====="+ autoLogin);
            // 自动登录时效 一周
            if (autoLogin!=null) {
                Cookie cookie = new Cookie("cookie", userInfo.getEmail()+"&&"+userInfo.getPassword());
                cookie.setMaxAge(7*24*60*60);
                response.addCookie(cookie);
                // FIXME
                System.out.println("====LoginController -> cookie====="+cookie.getName()+" "+cookie.getValue()+"==============");
            }

            Calendar cal = Calendar.getInstance();
            request.getSession().setAttribute("month", cal.get(Calendar.MONTH)+1);
            request.getSession().setAttribute("day", cal.get(Calendar.DAY_OF_MONTH));
            request.getSession().setAttribute("week", cal.get(Calendar.DAY_OF_WEEK)-1);

            return new ModelAndView("redirect:turnToHomePage.htm");
        } else {
            request.setAttribute("note", "邮箱或密码不正确，请重新输入");
            return new ModelAndView("/login/login");
        }
    }

    // 登录方式2：从cookie登录
    @RequestMapping("checkLogin.htm")
    public ModelAndView checkLogin(HttpServletRequest request) {
        Enumeration<?> e = request.getSession().getAttributeNames();

        // FIXME
        System.out.println("=====checkLogin enter=========");
        while (e.hasMoreElements()) {
            String attributeName = (String)e.nextElement();
            request.getSession().removeAttribute(attributeName);
        }

        Cookie[] cookies = request.getCookies();
        String[] cooks = null;
        String cookieEmail = null;
        String cookiePswd = null;
        User userInfo = new User();

        if (cookies!=null) {
            boolean exist = false;
            for (Cookie coo: cookies) {
                String value = coo.getValue();
                cooks = value.split("&&");
                if (cooks.length == 2) {
                    cookieEmail = cooks[0];
                    cookiePswd = cooks[1];
                    exist = true;
                    break;
                }
            }
            // FIXME
            System.out.println("=======exist====="+ exist);

            if (exist) {
                String userId = loginService.checkByEmailAndCookie(cookieEmail, cookiePswd);
                if (!userId.equals("no-such-person")) {
                    int sumMail = pmService.sumMail(userId);
                    userInfo = loginService.findById(User.class, userId);
                    int credit = userInfo.getCredit();

                    // FIXME
                    log.info("======credit={}======", credit);
                    Level level = userService.getUserLevel(credit);

                    HttpSession hs= request.getSession();
                    // 封装到session
                    hs.setAttribute("userId", userInfo.getUserId());
                    //hs.setAttribute("userName", userInfo.getUserName());
                   // hs.setAttribute("userEmail", userInfo.getEmail());
                    hs.setAttribute("user", userInfo);
                    hs.setAttribute("startTime", new Date());
                    hs.setAttribute("sumMail", sumMail);
                   hs.setAttribute("level", level);
                    System.out.println("========cookie LoginController1=======");

                    Calendar cal = Calendar.getInstance();
                    request.getSession().setAttribute("month", cal.get(Calendar.MONTH)+1);
                    request.getSession().setAttribute("day", cal.get(Calendar.DAY_OF_MONTH));
                    request.getSession().setAttribute("week", cal.get(Calendar.DAY_OF_WEEK)-1);
                    System.out.println("========cookie LoginController2=======");

                    return new ModelAndView("redirect:turnToHomePage.htm");
                }
            }
        }
        return new ModelAndView("/login/login");
    }

    @RequestMapping("goLoginPage.htm")
    public ModelAndView goLoginPage() {
        return  new ModelAndView("redirect:checkLogin.htm");
    }

    @RequestMapping("logout.htm")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        Cookie cookie = new Cookie("cookie", null);
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return new ModelAndView("redirect:goLoginPage.htm");
    }
}
