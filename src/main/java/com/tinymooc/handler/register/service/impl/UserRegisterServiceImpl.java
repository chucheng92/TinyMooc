package com.tinymooc.handler.register.service.impl;

import java.util.List;
import com.tinymooc.common.domain.Level;
import com.tinymooc.handler.register.service.UserRegisterService;
import org.hibernate.criterion.Restrictions;
import com.tinymooc.handler.register.service.UserRegisterService;
import com.tinymooc.common.base.impl.BaseServiceImpl;
import com.tinymooc.common.domain.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class UserRegisterServiceImpl extends BaseServiceImpl implements UserRegisterService {

	@Override
	public void userRegister(User user) {
		// TODO Auto-generated method stub
		getCurrentSession().save(user);
		
	}

	@Override
	public void emailVerify(User user) {
		// TODO Auto-generated method stub
		getCurrentSession().update(user);
	}

	@Override
	public int checkEmail(String userEmail) {
		// TODO Auto-generated method stub
		List<User> list=getCurrentSession().createCriteria(User.class).add(Restrictions.eq("email", userEmail)).list();
		
		
		return list.size();
	}

	@Override
	public User getUserInfo(String userId) {
		// TODO Auto-generated method stub
		User user=(User) getCurrentSession().createCriteria(User.class).add(Restrictions.eq("userId", userId)).setMaxResults(1).uniqueResult();
		
		return user;
	}

	@Override
	public User getUserInfo1(String userEmail) {
		// TODO Auto-generated method stub
		User user=(User) getCurrentSession().createCriteria(User.class).add(Restrictions.eq("email", userEmail)).setMaxResults(1).uniqueResult();
		
		return user;
	}

	@Override
	public int checkUserName(String userName) {
		// TODO Auto-generated method stub
		
		List<User> list=getCurrentSession().createCriteria(User.class).add(Restrictions.eq("userName", userName)).list();
		
		
		return list.size();
		
	}
	
	
	
}
