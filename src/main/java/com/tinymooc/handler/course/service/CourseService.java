package com.tinymooc.handler.course.service;

import com.tinymooc.common.base.BaseService;
import com.tinymooc.common.domain.User;
import com.tinymooc.common.domain.Course;
import java.util.*;

public interface CourseService extends BaseService {
	
	public boolean isAreadyGrade(User user, String ObjId);

	public double queryGrade(String ObjId);

    public List<Course> getCourses();


    public List<Course> getCourses(String query);
    public boolean createCourseIndex();

}
