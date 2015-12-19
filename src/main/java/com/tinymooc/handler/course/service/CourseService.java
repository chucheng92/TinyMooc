package com.tinymooc.handler.course.service;

import com.tinymooc.common.base.BaseService;
import com.tinymooc.common.domain.User;

public interface CourseService extends BaseService {
	
	public boolean IsAreadyGrade(User user, String ObjId);

	public double queryGrade(String ObjId);

}
