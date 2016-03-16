package com.tinymooc.handler.register.service;

import com.tinymooc.common.base.BaseService;
import com.tinymooc.common.domain.User;

public interface UserRegisterService extends BaseService {
public void userRegister(User user);
	
	public int checkEmail(String userEmail);
	
	public int checkUserName(String userName);
	
	public void emailVerify(User user);
	
	public User getUserInfo(String userId);
	
	public User getUserInfo1(String userEmail);
}
