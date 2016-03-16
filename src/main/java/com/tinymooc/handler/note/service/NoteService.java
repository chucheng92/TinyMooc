package com.tinymooc.handler.note.service;


import com.tinymooc.common.base.BaseService;
import com.tinymooc.common.domain.User;

public interface NoteService extends BaseService {
	
	public boolean isAreadyGrade(User user, String ObjId);
	public double queryGrade(String ObjId);
}
