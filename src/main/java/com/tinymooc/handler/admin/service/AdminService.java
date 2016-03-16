package com.tinymooc.handler.admin.service;
import com.tinymooc.common.base.BaseService;
import com.tinymooc.common.domain.Course;
import java.util.List;
public interface AdminService extends BaseService {
	public String checkByEmailAndPswd(String email, String pswd);

    public List<Course> findApplyCourse ();
}
