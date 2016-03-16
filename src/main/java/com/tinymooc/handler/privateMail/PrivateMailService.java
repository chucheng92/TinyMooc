package com.tinymooc.handler.privateMail;

import com.tinymooc.common.base.BaseService;

import java.util.List;

/**
 * Created by 哓哓 on 2015/11/30 0030.
 */
public interface PrivateMailService extends BaseService {
    public void  sendMail(String sender, String receiver, String context);
    public List userMailList(String userId);
    public int sumMail(String userId);
    public void delMail(String mailId);
}
