package com.tinymooc.handler.user.service;

import com.tinymooc.common.base.BaseService;
import com.tinymooc.common.domain.Level;
import com.tinymooc.common.domain.User;

/**
 * Created by 哓哓 on 2015/11/25 0026.
 */
public interface UserService extends BaseService {
    public User getUserInfo(String userid);
    public Level getUserLevel(int credit);
}
