package com.tinymooc.handler.upload.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

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
    public ModelAndView goUploadPage() {

        return new ModelAndView("/userPage/accountAvatar");
    }

    @RequestMapping("testEditor.htm")
    public ModelAndView testEditor() {
        return new ModelAndView("/test/testxheditors");
    }

    @RequestMapping("upload.htm")
    public void upload(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession hs = request.getSession();
        User user = (User) hs.getAttribute("user");

        //设置基本路径
        String rootPath = request.getSession().getServletContext().getRealPath("/") ;
        String uploadPath = "/resource/pic/imagehead/";

        // FIXME
        System.out.println("===============uploadPath=============" + uploadPath);

        File userUploadDir = new File(rootPath+uploadPath+ user.getUserName());
        try {
            if (!userUploadDir.exists())
                userUploadDir.mkdirs();
        } catch (Exception e) {
            System.out.println("创建目录失败");
        }

        String jsn = request.getParameter("dataAll");

        // FIXME
        System.out.println("+++++++jsn:" + jsn.substring(0, 50));

        JSONObject jsonObject = JSONObject.fromObject(jsn);
        String img1 = ((String) jsonObject.get("data1")).substring(22);
        img1 = img1.replaceAll("_", "+");
        String img2 = jsonObject.get("data2").toString().substring(22);
        img2 = img2.replaceAll("_", "+");
        String img3 = jsonObject.get("data3").toString().substring(22);
        img3 = img3.replaceAll("_", "+");

        // FIXME
        System.out.println("=========img1：" + img1.substring(0, 30));
        System.out.println("=========img2：" + img2.substring(0, 30));
        System.out.println("=========img3：" + img3.substring(0, 30));

        //创建大头像
        //byte[] b1=img1.getBytes();
        Base64 base64 = new Base64();
        System.out.println("img1：" + img1.substring(0, 30));
        byte[] b1 = base64.decode(img1);
        for (int i = 0; i < b1.length; ++i) {
            if (b1[i] < 0) {// 调整异常数据
                b1[i] += 256;
            }
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
        String d = sdf.format(new Date());
        File imageLarge = new File(userUploadDir, d+"_1.jpg");
        String uploadPath1 = uploadPath+ user.getUserName()+"/"+d+"_1.jpg";

        // FIXME
        System.out.print("==========="+uploadPath1+"=======");

        OutputStream d1 = new FileOutputStream(imageLarge);
        d1.write(b1);
        d1.flush();
        d1.close();
        // FIXME
        System.out.println("大头像已保存到" + imageLarge.getPath());


        //创建中头像
        System.out.println("img2：" + img2.substring(0, 30));
        byte[] b2 = img2.getBytes();
        Base64 base642 = new Base64();
        b2 = base642.decode(b2);

        File imageMid = new File(userUploadDir, d+"_2.jpg");
        String uploadPath2 = uploadPath+ user.getUserName()+"/"+d+"_2.jpg";

        // FIXME
        System.out.print("==========="+uploadPath2+"=======");

        FileOutputStream d2 = new FileOutputStream(imageMid);
        d2.write(b2);
        d2.flush();
        d2.close();
        // FIXME
        System.out.println("中头像已保存到" + imageMid.getPath());

        //创建小头像
        System.out.println("img3：" + img3.substring(0, 30));
        byte[] b3 = img3.getBytes();
        Base64 base643 = new Base64();
        b3 = base643.decode(b3);

        File imageSmall = new File(userUploadDir, d+"_3.jpg");
        String uploadPath3 = uploadPath+ user.getUserName()+"/"+d+"_3.jpg";

        // FIXME
        System.out.print("==========="+uploadPath3+"=======");

        FileOutputStream d3 = new FileOutputStream(imageSmall);
        d3.write(b3);
        d3.flush();
        d3.close();
        // FIXME
        System.out.println("小头像已保存到" + imageSmall.getPath());

        //存头像数据


        if (imageLarge.length() >= 0 && imageMid.length() >= 0 && imageSmall.length() >= 0) {
            HeadImage hi = new HeadImage();
            if (user.getHeadImage() == null) {
                hi.setImageId(UUIDGenerator.randomUUID());
                hi.setImageLarge(uploadPath1);
                hi.setImageMid(uploadPath2);
                hi.setImageSmall(uploadPath3);
            } else {
                hi = (HeadImage) uploadService.getCurrentSession().createCriteria(HeadImage.class).add(Restrictions.eq("imageId", user.getHeadImage().getImageId())).uniqueResult();

                hi.setImageLarge(uploadPath1);
                hi.setImageMid(uploadPath2);
                hi.setImageSmall(uploadPath3);
            }
            uploadService.saveOrUpdate(hi);
            user.setHeadImage(hi);
            uploadService.update(user);
        }

        //返回后台数据
        PrintWriter pw = response.getWriter();
                /*Map<String, String> map =new HashMap<String, String>();
		        map.put("pic1",uploadPath1);      
		          map.put("pic2", uploadPath2 ); 
		          map.put("pic3", uploadPath3 );
		        JSONObject data = new JSONObject(); 
		        data.putAll(map);*/
        String math = "?" + Math.random();
        uploadPath1 = "<c:url value=\"" + uploadPath1 + "\"/>";
        uploadPath2 = "<c:url value=\"" + uploadPath2 + "\"/>";
        uploadPath3 = "<c:url value=\"" + uploadPath3 + "\"/>";
        String data = uploadPath1 + "%" + uploadPath2 + "%" + uploadPath3;

        // FIXME
        System.out.println(data);
        pw.println(data);
    }

}
