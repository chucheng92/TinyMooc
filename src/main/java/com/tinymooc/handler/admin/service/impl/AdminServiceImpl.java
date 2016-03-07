package com.tinymooc.handler.admin.service.impl;

import java.util.LinkedList;
import java.util.List;

import com.tinymooc.common.domain.Course;
import com.tinymooc.common.tag.pageTag.PageHelper;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import com.tinymooc.handler.admin.service.AdminService;
import com.tinymooc.common.base.impl.BaseServiceImpl;
import com.tinymooc.common.domain.User;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


@Transactional
@Component
public class AdminServiceImpl extends BaseServiceImpl implements AdminService {
	@Override
	public String checkByEmailAndPswd(String email, String pswd) {
	
		System.out.println("#################");
		List<User> userinfo=(List<User>) getCurrentSession().createCriteria(User.class).add(Restrictions.eq("email",email)).add(Restrictions.eq("password", pswd)).add(Restrictions.eq("userState", "管理员")).list();
 		
		if(userinfo.size()!=0){
			return userinfo.get(0).getUserId();
		}else{
			
			return "no-such-person";
		}


	}
    public List<Course> findApplyCourse() {
//        List<Course> applyCourse = getCurrentSession().cre
        return null;
    }

}
