package com.tinymooc.handler.privateMail.service;

import com.tinymooc.common.base.impl.BaseServiceImpl;
import com.tinymooc.common.domain.Message;
import com.tinymooc.common.domain.User;
import com.tinymooc.handler.privateMail.PrivateMailService;
import com.tinymooc.util.UUIDGenerator;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by 哓哓 on 2015/11/30 0030.
 */
@Transactional
@Service
public class PrivateMailServiceImpl extends BaseServiceImpl implements PrivateMailService {

    // 发送私信
    @Override
    public void sendMail(String sender, String receiver, String context) {
        Message ms = new Message();

        // 设置发送方接收方
        User user1 = new User();
        user1.setUserId(sender);
        User user2 = new User();
        user2.setUserId(receiver);

        // 设置私信的信息
        ms.setMessageId(UUIDGenerator.randomUUID());
        ms.setUserBySenderId(user1);
        ms.setUserByReceiverId(user2);
        ms.setContent(context);
        ms.setSendDate(new Date());
        ms.setMessageState("未读");

        getCurrentSession().save(ms);
    }

    // 私信列表
    @Override
    public List userMailList(String userId) {
        User user = new User();
        user.setUserId(userId);

        List<Message> msgList = getCurrentSession().createCriteria(Message.class)
                .add(Restrictions.eq("userByReceiverId", user))
                .addOrder(Order.desc("sendDate")).list();
        return msgList;
    }

    // 显示未读私信数目
    @Override
    public int sumMail(String userId) {
        User user = new User();
        user.setUserId(userId);

        List<Message> list = getCurrentSession().createCriteria(Message.class)
                .add(Restrictions.eq("userByReceiverId", user))
                .add(Restrictions.eq("messageState", "未读")).list();

        return list.size();
    }

    // 删除
    @Override
    public void delMail(String mailId) {
        Message msg = new Message();
        msg.setMessageId(mailId);

        getCurrentSession().clear();
        getCurrentSession().delete(msg);
    }
}
