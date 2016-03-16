package com.tinymooc.handler.note.service.impl;

import java.util.List;

import com.tinymooc.common.base.impl.BaseServiceImpl;
import com.tinymooc.common.domain.Grade;
import com.tinymooc.common.domain.User;
import com.tinymooc.handler.note.service.NoteService;
import org.hibernate.criterion.Restrictions;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class NoteServiceImpl extends BaseServiceImpl implements NoteService {

	@Override
	public boolean isAreadyGrade(User user,String ObjId) {
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
		String sql="select avg(mark) from grade where GRADE_OBJECT='"+ObjId+"'";
		double avgGrade=(double) getCurrentSession().createQuery(sql).uniqueResult();
		
		double a=(Math.round(avgGrade*10+5))/10;
		return a;
	}

}
