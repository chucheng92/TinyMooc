package com.tinymooc.handler.label.service.impl;

import java.util.Collections;
import java.util.List;

import com.tinymooc.common.base.impl.BaseServiceImpl;
import com.tinymooc.common.domain.Label;
import com.tinymooc.common.domain.LabelObject;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import com.tinymooc.handler.label.model.enums.LabelObjectType;
import com.tinymooc.handler.label.service.LabelService;
import com.tinymooc.util.UUIDGenerator;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


@Component
@Transactional
public class LabelServiceImpl extends BaseServiceImpl implements LabelService{

	@Override
	public String getTenHotLabels() {
		String labels = "";
		List<Label> labelList = (List<Label>) getCurrentSession().createCriteria(Label.class).addOrder(Order.desc("frequency")).list();
		Collections.shuffle(labelList); 
		for(int i = 0; i<labelList.size(); i++){
			labels += labelList.get(i).getLabelName() + ",";
		}
		return labels;
	}

	@Override
	public String getObjectLabels(String objectId, String objectType) {
		String labels  = "";
		List<LabelObject> labelObjectList = (List<LabelObject>) getCurrentSession().createCriteria(LabelObject.class)
				.add(Restrictions.eq("objectId", objectId)).add(Restrictions.eq("objectType", objectType)).list();
		for(int i = 0; i<labelObjectList.size(); i++){
			labels += labelObjectList.get(i).getLabel().getLabelName() + ",";
		}
		return labels;
	}

	@Override
	@Transactional
	public void saveObjectLabels(String labels, String objectId, String objectType) {
		List<LabelObject> labelObjectList = (List<LabelObject>) getCurrentSession().createCriteria(LabelObject.class)
				.add(Restrictions.eq("objectId", objectId)).add(Restrictions.eq("objectType", objectType)).list();
		deleteAll(labelObjectList);
		String labelArray[] = labels.split(",");
		for(int i = 0; i<labelArray.length; i++){
			List<Label> labelList = (List<Label>) getCurrentSession().createCriteria(Label.class).add(Restrictions.eq("labelName", labelArray[i])).list();
			if(labelList.size()==1){
				labelList.get(0).setFrequency(labelList.get(0).getFrequency()+1);
				getCurrentSession().update(labelList.get(0));
				
				LabelObject labelObject = new LabelObject();
				labelObject.setLabelObjectId(UUIDGenerator.randomUUID().toString());
				labelObject.setLabel(labelList.get(0));
				labelObject.setObjectId(objectId);
				labelObject.setObjectType(objectType);
				getCurrentSession().save(labelObject);

			} else {				
				Label label = new Label();
				label.setLabelId(UUIDGenerator.randomUUID().toString());
				label.setLabelName(labelArray[i]);
				label.setFrequency(1);
				getCurrentSession().save(label);
				
				LabelObject labelObject = new LabelObject();
				labelObject.setLabelObjectId(UUIDGenerator.randomUUID().toString());
				labelObject.setLabel(label);
				labelObject.setObjectId(objectId);
				labelObject.setObjectType(objectType);
				getCurrentSession().save(labelObject);
			}
		}
		
	}

	@Override
	public void deleteObjectLabels(String objectId, LabelObjectType objectType) {

	}

}
