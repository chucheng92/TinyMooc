package com.tinymooc.handler.upload.service;

import com.tinymooc.common.base.BaseService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public interface UploadService extends BaseService {


		public void insertDB(String fileName, String fileType, String fileUrl, String objectId);
		
		public String upLoad(HttpServletRequest request, HttpServletResponse response);

}
