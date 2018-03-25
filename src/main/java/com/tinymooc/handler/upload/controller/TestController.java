package com.tinymooc.handler.upload.controller;

import java.io.OutputStream;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tinymooc.util.FileUploadUtils;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
    @RequestMapping("test.htm")
    public ModelAndView test() {
        return new ModelAndView("/test/testxheditors");
    }

    @RequestMapping("delFile.htm")
    public void delFile(HttpServletRequest request, OutputStream out) throws Exception {
        FileUploadUtils.DelFile(request, request.getParameter("url"));
    }

    @RequestMapping("uploadFile.htm")
    public void uploadfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HashMap params = FileUploadUtils.UploadFile(request, response, "files");
        JSONObject responseInfo = JSONObject.fromObject("{'err':'','msg':'" + params.get("filedata") + "'}");
        response.getWriter().write(responseInfo.toString());
    }

    @RequestMapping("uploadPic.htm")
    public void uploadpic(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HashMap params = FileUploadUtils.UploadFile(request, response, "folder");
        JSONObject res = JSONObject.fromObject("{'err':'','msg':'" + params.get("filedata") + "'}");
        response.getWriter().write(res.toString());
        String picUrl = params.get("filedata").toString();
        request.getSession().setAttribute("picUrl", picUrl);
    }
}
