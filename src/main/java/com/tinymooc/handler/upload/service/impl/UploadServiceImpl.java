package com.tinymooc.handler.upload.service.impl;

import java.io.File;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tinymooc.common.base.impl.BaseServiceImpl;
import com.tinymooc.common.domain.HeadImage;
import com.tinymooc.common.domain.User;
import com.tinymooc.handler.upload.service.UploadService;
import com.tinymooc.util.UUIDGenerator;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.criterion.Restrictions;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class UploadServiceImpl extends BaseServiceImpl implements UploadService {

	@Override
	public void insertDB(String fileName, String fileType, String fileUrl,  String objectId) {

		System.out.println("########@@@@@@@@@@@@@@@@@@@%%%%%%%%%");
		HeadImage head = new HeadImage();
        head.setImageId(UUIDGenerator.randomUUID());
		head.setImageLarge(fileUrl);
		save(head);
		User user=(User) getCurrentSession().createCriteria(User.class).add(Restrictions.eq("userId", objectId)).uniqueResult();
		user.setHeadImage(head);
		getCurrentSession().update(user);
	}

	@Override
	public String upLoad(HttpServletRequest request,HttpServletResponse response) {
		/*HttpServletRequest request = null;*/
		// 取出来的路径很长

        // FIXME
		System.out.println("从这里开始");
		String uploadPath = request.getSession().getServletContext().getRealPath("/") + "upload";

        // FIXME
		System.out.println(uploadPath);
		File folder = new File(uploadPath);

		String message = null;
		String uploadStr = null;
		String str = "";
		String str1 = "";

		if (!folder.exists())
			folder.mkdirs();

		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");

            // FIXME
			System.out.println(ServletFileUpload.isMultipartContent(request));

			if (true) {

				DiskFileItemFactory disk = new DiskFileItemFactory();
				disk.setSizeThreshold(20 * 1024);
				disk.setRepository(disk.getRepository());

				ServletFileUpload up = new ServletFileUpload(disk);
				int maxsize = 10 * 1024 * 1024;

				up.setFileSizeMax(5000000L);
				up.setSizeMax(10000000L);
				up.setHeaderEncoding("UTF-8");
				
				List list = up.parseRequest(request);
				Iterator i = list.iterator();
				
				while (i.hasNext()) {
					FileItem fm = (FileItem) i.next();
					
					if (!fm.isFormField()) {
						String filePath = fm.getName();
						System.out.println(filePath);
						String fileName = "";
						int startIndex =filePath.lastIndexOf("\\");
						if (startIndex != -1) {

							fileName = filePath.substring(startIndex + 1);
							
						} else {

							fileName = filePath;
							
						}
						
						if (fm.getSize() > maxsize) {

							message = "文件太大，不要超过2M";
							break;
						}
						if ((fileName == null || fileName.equals(""))
								&& (fm.getSize() == 0)) {

							message = "文件不能为空，大小不能为零";
							break;

						}
					

						// String name=fileName+new Date().getTime();
						File saveFile = new File(uploadPath, fileName);

						fm.write(saveFile);
						message = " 上传成功";

						String filename2 =saveFile.getName();

						String fileURL = uploadPath + "\\" + fileName;
						
						String filename3 = filename2.substring(0,
								fileName.lastIndexOf("."));

						uploadStr = filename3 + ";" + fileURL;
						
						
					}else{
						
						String bb=fm.getString();
						String name = new String(bb.getBytes("ISO8859-1"),"UTF-8"); 
						str=str+";"+name;
						
					}
					
					

				}
				 str1=str;
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadStr+str;
	}

}
