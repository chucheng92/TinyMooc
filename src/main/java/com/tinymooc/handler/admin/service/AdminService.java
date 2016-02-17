package com.tinymooc.handler.admin.service;
import com.tinymooc.common.base.BaseService;

public interface AdminService extends BaseService {
	public String checkByEmailAndPswd(String email, String pswd);
}
