package com.tinymooc.handler.login.service;

import com.tinymooc.common.base.BaseService;
import org.springframework.stereotype.Service;

/**
 * Created by 哓哓 on 2015/11/30 0030.
 */

public interface LoginService extends BaseService {
    String checkByEmailAndCookie(String cookieEmail, String cookiePswd);
    String checkByEmailAndPswd(String email, String pswd);

}
