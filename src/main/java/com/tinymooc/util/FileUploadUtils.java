package com.tinymooc.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.marswork.core.exceptions.config.PropertiesNotFoundException;

public class FileUploadUtils
{
  public static final HashMap UploadFile(HttpServletRequest request, HttpServletResponse response, String filepaths) throws Exception  {
    HashMap params = new HashMap();
    String pathtype = "images";
    if (!(filepaths.equals("")))
      pathtype = filepaths;

    String readPath = "";
    String contextPath = "";

    if ((readPath == null) || (readPath.equals("")))
      readPath = request.getSession().getServletContext().getRealPath("");

    if ((contextPath == null) || (contextPath.equals("")))
      contextPath = request.getContextPath();

    String savePhotoPath = mkdirFile(readPath, pathtype, true);
    if (ServletFileUpload.isMultipartContent(request)) {
      DiskFileItemFactory dff = new DiskFileItemFactory();
      dff.setSizeThreshold(1024000);
      ServletFileUpload sfu = new ServletFileUpload(dff);
      List fileItems = sfu.parseRequest(request);
      sfu.setFileSizeMax(5000000L);
      sfu.setSizeMax(10000000L);
      sfu.setHeaderEncoding("UTF-8");
      Iterator iter = fileItems.iterator();

      while (iter.hasNext()) {
        FileItem item = (FileItem)iter.next();
        if (item.isFormField())
        {
          String name = item.getFieldName();
          String value = new String(item.getString().getBytes(
            "ISO8859-1"), "utf-8");
          params.put(name, value);
        } else if ((item.getSize() > 0L) && 
          (item.getName() != null)) {
          File fullFile = new File(item.getName());
          File fileOnServer = new File(savePhotoPath, 
            fullFile.getName());
          item.write(fileOnServer);
          String fileName2 = fileOnServer.getName();
          String fileType = fileName2.substring(fileName2
            .lastIndexOf("."));
          String filepath = savePhotoPath + "/" + 
            new Date().getTime() + fileType;
          File newFile = new File(filepath);
          fileOnServer.renameTo(newFile);
          String returnString = filepath.substring(readPath
            .length());
          params.put(item.getFieldName(), request.getRequestURL().toString().replace(request.getRequestURI(), "") + contextPath + 
            returnString);
        }
      }
    }

    return params;
  }

  public static final String mkdirFile(String readPath, String filepath, boolean withDate) throws Exception {
    String upfile = "/upfiles/";
    String savePhotoPath = readPath + 
      upfile + 
      filepath + 
      ((withDate) ? "/" + 
      new SimpleDateFormat("yyyyMMdd").format(new Date()) : 
      "");
    File savePhotoDir = new File(savePhotoPath);
    if (!(savePhotoDir.isDirectory()))
      savePhotoDir.mkdirs();

    // FIXME
      System.out.println("================savePhotoPath=========="+savePhotoPath);
    return savePhotoPath;
  }

  public static final void DelFile(HttpServletRequest request, String filepath)
    throws PropertiesNotFoundException
  {
    String readPath ="";
    String contextPath = "";
    if ((readPath == null) || (readPath.equals("")))
      readPath = request.getSession().getServletContext().getRealPath("");

    if ((contextPath == null) || (contextPath.equals("")))
      contextPath = request.getContextPath();

    String filepaths = filepath.replace(contextPath, "");
    String path = readPath + filepaths;
    File file = new File(path);
    if ((file.exists()) && (file.isFile()))
      file.delete();
  }  

  public static final void downFile(HttpServletRequest request, HttpServletResponse response, String filepath, String fileName)
    throws IOException
  {
    String path = filePath(request, filepath);
    System.out.println(path);
    response.setContentType("text/html;charset=utf-8");

    File isfile = new File(path);
    if (!(isfile.exists()))
      throw new IOException();

    if ((fileName == null) || (fileName.length() < 1)) {
      fileName = new String(path.substring(path.lastIndexOf("/")).substring(1)
        .getBytes("GBK"), "ISO8859_1");
    } else {
      fileName = new String(fileName.getBytes(), "ISO8859_1");
      fileName = fileName + path.substring(path.lastIndexOf("."));
    }

    File file = new File(path);

    response.setContentType("application/x-msdownload");

    response.setContentLength((int)file.length());

    response.setHeader("Content-Disposition", "attachment;filename=" + fileName);

    FileInputStream fis = new FileInputStream(file);
    BufferedInputStream buff = new BufferedInputStream(fis);

    byte[] b = new byte[1024];

    long k = 0L;

    OutputStream myout = response.getOutputStream();

    while (k < file.length()) {
      int j = buff.read(b, 0, 1024);
      k += j;

      myout.write(b, 0, j);
    }

    myout.flush();
  }

  public static final String filePath(HttpServletRequest request, String filepath)
  {
    String readPath = getReadPath(request);
    String contextPath = getContextPath(request);
    String filepaths = filepath.replace(contextPath, "");
    String path = readPath + filepaths;
    System.out.println("readPath:"+readPath);
    System.out.println("contextPath:"+contextPath);
    System.out.println("filePath:"+filepath);
    if (isFileExists(path))
      return path;

    return "";
  }

  public static String getReadPath(HttpServletRequest request)
  {
    String readPath ="";
    if ((readPath == null) || (readPath.equals("")))
      readPath = request.getSession().getServletContext().getRealPath("");

    return readPath;
  }

  public static String getContextPath(HttpServletRequest request)
  {
    String contextPath ="";

    if ((contextPath == null) || (contextPath.equals("")))
      contextPath = request.getContextPath();

    return contextPath;
  }

  public static final boolean isFileExists(String filePath)
  {
    File f = new File(filePath);

    return ((f.exists()) && (f.isFile()));
  }
}