package com.tinymooc.handler.login.service.impl;

import com.tinymooc.common.base.impl.BaseServiceImpl;
import com.tinymooc.common.domain.User;
import com.tinymooc.handler.login.service.LoginService;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by 哓哓 on 2015/11/30 0030.
 */
@Transactional
@Service
public class LoginServiceImpl extends BaseServiceImpl implements LoginService {
    @Override
    public String checkByEmailAndCookie(String cookieEmail, String cookiePswd) {

        List<User> userinfo = (List<User>) getCurrentSession().createCriteria(User.class)
                .add(Restrictions.eq("email", cookieEmail))
                .add(Restrictions.eqOrIsNull("password", cookiePswd))
                .add(Restrictions.eq("userState", "激活")).list();
        if (userinfo.size() != 0) {
            return userinfo.get(0).getUserId();
        } else {
            return "no-this-person";
        }

    }

    @Override
    public String checkByEmailAndPswd(String email, String pswd) {

        System.out.println("######测试checkByEmailAndPswd#######");
        List<User> userinfo = (List<User>) getCurrentSession().createCriteria(User.class)
                .add(Restrictions.eq("email", email))
                .add(Restrictions.eq("password", pswd))
                .add(Restrictions.eq("userState", "激活")).list();

        if (userinfo.size() != 0) {
            return userinfo.get(0).getUserId();
        } else {
            return "no-such-person";
        }
    }
}
