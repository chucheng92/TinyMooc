package com.tinymooc.handler.label.service;


import com.tinymooc.handler.label.model.enums.LabelObjectType;
import com.tinymooc.common.base.BaseService;


public interface LabelService extends BaseService {

	public String getTenHotLabels();
	
	public String getObjectLabels(String objectId,String objectType);
	
	public void saveObjectLabels(String labels,String objectId,String objectType);
	
	public void deleteObjectLabels(String objectId,LabelObjectType objectType);
	
}
