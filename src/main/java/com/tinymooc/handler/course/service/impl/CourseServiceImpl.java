package com.tinymooc.handler.course.service.impl;

import java.util.List;
import com.tinymooc.common.base.impl.BaseServiceImpl;
import com.tinymooc.common.domain.Grade;
import com.tinymooc.common.domain.User;
import com.tinymooc.handler.course.service.CourseService;
import org.hibernate.criterion.Restrictions;

import org.springframework.stereotype.Component;

@Component
public class CourseServiceImpl extends BaseServiceImpl implements CourseService {
	@Override
	public boolean IsAreadyGrade(User user, String ObjId) {
		// TODO Auto-generated method stub
		
		List<Grade> list=getCurrentSession().createCriteria(Grade.class).add(Restrictions.eq("user", user)).add(Restrictions.eq("gradeObject", ObjId)).list();
		
		if(list.size()!=0){
			return false;
		}else{
			return true;	
		}
	}

	@Override
	public double queryGrade(String ObjId) {
		// TODO Auto-generated method stub
        String sql="select avg(mark) from Grade where GRADE_OBJECT='"+ObjId+"'";
		double avgGrade=(double) getCurrentSession().createQuery(sql).uniqueResult();
		
		double userGrade = avgGrade+5.0;

        return userGrade;
	}
}
