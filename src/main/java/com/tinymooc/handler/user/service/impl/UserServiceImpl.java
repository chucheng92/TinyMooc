package com.tinymooc.handler.user.service.impl;

import com.tinymooc.common.base.impl.BaseServiceImpl;
import com.tinymooc.common.domain.Level;
import com.tinymooc.common.domain.User;
import com.tinymooc.handler.user.service.UserService;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * Created by 哓哓 on 2015/11/26 0026.
 */
@Transactional
@Service
public class UserServiceImpl extends BaseServiceImpl implements UserService {

    /**
     * 获取用户基本信息
     */
    @Override
    public User getUserInfo(String userId) {
        User user = (User)getCurrentSession().createCriteria(User.class)
                .add(Restrictions.eq("userId",userId)).setMaxResults(1)
                .uniqueResult();
        return user;
    }

    /**
     * 获取用户等级
     */
    @Override
    public Level getUserLevel(int credit) {
        Level level = (Level)getCurrentSession().createCriteria(Level.class)
                .add(Restrictions.le("lvCondition", credit))
                .add(Restrictions.eq("type","用户"))
                .addOrder(Order.desc("lvCondition")).setFirstResult(0)
                .setMaxResults(1).uniqueResult();
        return level;
    }
}
