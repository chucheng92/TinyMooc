package com.tinymooc.authority.listener;



import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import com.tinymooc.authority.annotation.CheckAuthority;
import com.tinymooc.authority.util.ClassEnumUtils;
import com.tinymooc.common.base.impl.BaseServiceImpl;
import com.tinymooc.common.domain.Authority;
import com.tinymooc.util.UUIDGenerator;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;


public class SyncAuthority extends TimerTask {
	
	
	private BaseServiceImpl service;
	private String skanPackage;
	private String pattern;

	public SyncAuthority(BaseServiceImpl service, String skanPackage,
			String pattern) {
		super();
		this.service = service;
		this.skanPackage = skanPackage;
		this.pattern = pattern;
	}

	public void run() {
		
		System.out.println("准备开跑(ˇˍˇ） ");
		List<Authority> authorityList = new ArrayList<Authority>();
		Date date = new Date();

		try {
			List<Class<?>> classes = ClassEnumUtils.getClasses(skanPackage,pattern);
			System.out.println(classes.size());
			for (Class<?> clazz : classes) {
				for (Method method : clazz.getDeclaredMethods()) {
					CheckAuthority checkAuthority = method
							.getAnnotation(CheckAuthority.class);
					if (checkAuthority != null) {
						System.out.println("有名字么-_-||| ");
						Authority authority = new Authority();
						authority.setUpdateDate(date);
						authority.setAuthorityIntro(checkAuthority.name()
								.trim());
						authority.setAuthorityName(generateAuthorityName(clazz, method));
						authorityList.add(authority);
					}
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(authorityList.size()>0){
			System.out.println("咱入库吧~~~o(≧v≦)o~~好棒！");
			syncToDataBase(authorityList);
		}
	}

	private void syncToDataBase(List<Authority> authorityList) {

		int deleteNo = 0;
		Date updateTime = authorityList.get(0).getUpdateDate();
		for (Authority authority : authorityList) {

			DetachedCriteria criteria = DetachedCriteria
					.forClass(Authority.class);
			criteria.add(Restrictions.eq("authorityIntro",
					authority.getAuthorityIntro()));
			List<Authority> resList = service.queryAllOfCondition(
					Authority.class, criteria);
			if (resList.size() == 1) {
				authority.setAuthorityId(resList.get(0).getAuthorityId());
				service.update(authority);
			} else {
				authority.setAuthorityId(UUIDGenerator.randomUUID());
				service.save(authority);
			}
		}
		DetachedCriteria criteriaForDelete = DetachedCriteria
				.forClass(Authority.class);
		criteriaForDelete.add(Restrictions.lt("updateDate", updateTime));
		List<Authority> listForDelete = service.queryAllOfCondition(
				Authority.class, criteriaForDelete);
		deleteNo = listForDelete.size();
		if (deleteNo > 0) {
			service.deleteAll(listForDelete);
		}
	}
	
	private String generateAuthorityName(Class<?> clazz,Method method) {
		
		StringBuffer authorityNamegBuffer=new StringBuffer();
		authorityNamegBuffer.append(method.getReturnType().getSimpleName());
		authorityNamegBuffer.append(" ");
		authorityNamegBuffer.append(clazz.getName());
		authorityNamegBuffer.append(".");
		authorityNamegBuffer.append("(");
		Class<?>[] parameterTypes=method.getParameterTypes();
		if(parameterTypes.length>0){
			for(Class<?> pClazz : parameterTypes){
				authorityNamegBuffer.append(pClazz.getSimpleName());
				authorityNamegBuffer.append(",");
			}
			authorityNamegBuffer.deleteCharAt(authorityNamegBuffer.length()-1);
		}
		authorityNamegBuffer.append(")");
		return authorityNamegBuffer.toString();
	}

}
