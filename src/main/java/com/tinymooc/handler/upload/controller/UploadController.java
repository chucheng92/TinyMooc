package com.tinymooc.handler.upload.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tinymooc.common.domain.HeadImage;
import com.tinymooc.common.domain.User;
import com.tinymooc.handler.upload.service.UploadService;
import com.tinymooc.util.UUIDGenerator;
import net.sf.json.JSONObject;

import org.apache.commons.codec.binary.Base64;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {

	@Autowired
	private UploadService uploadService;
	
	@RequestMapping("goUploadPage.htm")
	public ModelAndView goUploadPage(){
		
		return new ModelAndView("/userPage/accountAvatar");
	}
	
	@RequestMapping("testEditor.htm")
	public ModelAndView testEditor(){
		return new ModelAndView("/test/testxheditors");
	}
	
	@RequestMapping("upload.htm")
	public void upload(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession hs=request.getSession();
		User user = (User) hs.getAttribute("user");
		
		//存两份一份供用户读取，如下
		//设置基本路径
		String uploadPath=request.getSession().getServletContext().getRealPath("/")+"";
		
		String PathToService=uploadPath+"/tinymooc/src/main/webapp/resource/pic/imagehead/";



        // FIXME
        System.out.println("===============uploadPath============="+uploadPath);
        System.out.println("================PathToService======="+PathToService);


//		String pan=path.split(".metadata")[0];
//		System.out.println("pan"+pan);
//		//String place=path.split("\\")[1];
//		
//		//String path1=pan+"/"+place;
//		
//		
//		//System.out.println("path1:***********************"+path1);
//		String uploadPath = pan+"/tinymooc/src/main/webapp";
		

        // FIXME
		System.out.println("*******************************uploadPath*********************"+uploadPath);
		File upPath=new File(PathToService);
		if (!upPath.exists())upPath.mkdirs();
		//创建大头像
		String jsn=request.getParameter("dataAll");

        // FIXME
		System.out.println("+++++++jsn:"+jsn.substring(0, 50));
		JSONObject jsonObject=JSONObject.fromObject(jsn);
		String img1=((String)jsonObject.get("data1")).substring(22);
		img1=img1.replaceAll("_", "+");
		String img2=jsonObject.get("data2").toString().substring(22);
		img2=img2.replaceAll("_", "+");
		String img3=jsonObject.get("data3").toString().substring(22);
		img3=img3.replaceAll("_", "+");

        // FIXME
		System.out.println("=========img1："+img1.substring(0, 30));
		System.out.println("=========img2："+img2.substring(0, 30));
		System.out.println("=========img3："+img3.substring(0, 30));
		   //byte[] b1=img1.getBytes();
	       Base64 base64=new Base64();
	       byte[] b1=base64.decode(img1);
	       for (int i = 0; i < b1.length; ++i) {
               if (b1[i] < 0) {// 调整异常数据
            	   b1[i] += 256;
               }
           }
	        String uploadPath1 = "/resource/pic/imagehead/"+user.getUserId()+"1.jpg";
	        System.out.println(uploadPath+uploadPath1);
			File folder1 = new File(uploadPath+uploadPath1);
			//检查文件存在与否
			if (folder1.exists())
                folder1.delete();
				folder1.createNewFile();
			File folder1S=new File(PathToService+user.getUserId()+"1.jpg");
			 if(folder1S.exists())
                 folder1S.delete();
                 folder1S.createNewFile();
		        // 创建文件输出流对象   
			    OutputStream d1 = new FileOutputStream(folder1);
		        // 写入输出流   
		        d1.write(b1);
		        d1.flush();
		        // 关闭输出流   
		        d1.close();

		        OutputStream d1S = new FileOutputStream(folder1S);
		        d1S.write(b1);
		        d1S.flush();
	            //  关闭输出流
		        d1S.close();
		        System.out.println("大头像已保存到"+uploadPath+uploadPath1);
		        
		        
		      //创建中头像
		        
				System.out.println("img2："+img2.substring(0, 30));
				    byte[] b2=img2.getBytes();  
			        Base64 base642=new Base64();  
			        b2=base642.decode(b2); 
			        String uploadPath2 = "/resource/pic/imagehead/"+user.getUserId()+"2.jpg";
			        System.out.println(uploadPath+uploadPath2);
					File folder2 = new File(uploadPath+uploadPath2);
					//检查目录存在与否
					if (folder2.exists())
                        folder2.delete();
						folder2.createNewFile();
					File folder2S=new File(PathToService+user.getUserId()+"2.jpg");
					 if(folder2S.exists())
                         folder2S.delete();
                         folder2S.createNewFile();
					 
				        // 创建文件输出流对象   
					    FileOutputStream d2 = new FileOutputStream(folder2);   
				        // 写入输出流   
				        d2.write(b2);
				        d2.flush();
				        // 关闭输出流   
				        d2.close();
				        OutputStream d2S = new FileOutputStream(folder2S);
				        d2S.write(b2);
				        d2S.flush();
				        // 关闭输出流   
				        d2S.close();
				        System.out.println("中头像已保存到"+uploadPath+uploadPath2);
				        
		                 //创建小头像
						System.out.println("img3："+img3.substring(0, 30));
						    byte[] b3=img3.getBytes();  
					        Base64 base643=new Base64();  
					        b3=base643.decode(b3); 
					        String uploadPath3 = "/resource/pic/imagehead/"+user.getUserId()+"3.jpg";
					        System.out.println(uploadPath+uploadPath3);
							File folder3 = new File(uploadPath+uploadPath3);
							//检查目录存在与否
							if (folder3.exists())
                                folder3.delete();
								folder3.createNewFile();
							File folder3S=new File(PathToService+user.getUserId()+"3.jpg");
							 if(folder3S.exists())
                                 folder3S.delete();
                                 folder3S.createNewFile();
						        // 创建文件输出流对象   
							    FileOutputStream d3 = new FileOutputStream(folder3);   
						        // 写入输出流   
						        d3.write(b3);
						        d3.flush();
						        // 关闭输出流   
						        d3.close(); 
						        OutputStream d3S = new FileOutputStream(folder3S);
						        d3S.write(b3);
						        d3S.flush();
      					        // 关闭输出流   
						        d3S.close();
						        System.out.println("小头像已保存到"+uploadPath+uploadPath3);
						        
		                    //存头像数据
					       if(folder3.length()>=0&&folder2.length()>=0&&folder1.length()>=0){
					    	   HeadImage hi=new HeadImage();
					    	   if(user.getHeadImage()==null){
					    	   hi.setImageId(UUIDGenerator.randomUUID());
					    	   hi.setImageLarge(uploadPath1);
					    	   hi.setImageMid(uploadPath2);
					    	   hi.setImageSmall(uploadPath3);
					    	   }
					    	   else{
					    		   hi=(HeadImage)uploadService.getCurrentSession().createCriteria(HeadImage.class).add(Restrictions.eq("imageId",user.getHeadImage().getImageId())).uniqueResult();
					    		   
						    	   hi.setImageLarge(uploadPath1);
						    	   hi.setImageMid(uploadPath2);
						    	   hi.setImageSmall(uploadPath3);
					    	   }
					    	   uploadService.saveOrUpdate(hi);
					    	   user.setHeadImage(hi);
					    	   uploadService.update(user);
					       }
		        
		        //返回后台数据
		        PrintWriter  pw = response.getWriter();  
		        /*Map<String, String> map =new HashMap<String, String>();
		        map.put("pic1",uploadPath1);      
		          map.put("pic2", uploadPath2 ); 
		          map.put("pic3", uploadPath3 );
		        JSONObject data = new JSONObject(); 
		        data.putAll(map);*/
		        String math="?"+Math.random();
		        uploadPath1="<c:url value=\""+uploadPath1+"\"/>";
                uploadPath2="<c:url value=\""+uploadPath2+"\"/>";
                uploadPath3="<c:url value=\""+uploadPath3+"\"/>";
                String data=uploadPath1+"%"+uploadPath2+"%"+uploadPath3;
		          
		        System.out.println(data);
		        pw.println(data);
	}

}
