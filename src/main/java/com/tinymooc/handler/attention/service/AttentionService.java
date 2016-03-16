package com.tinymooc.handler.attention.service;

import com.tinymooc.common.base.BaseService;

import java.util.List;

/**
 * Created by 哓哓 on 2015/12/1 Update v1.2
 */

public interface AttentionService extends BaseService {

    /**
     * 添加关注
     * @param userA 当前用户
     * @param userB 被关注的人
     */
    public void addAttention(String userA, String userB);

    /**
     * 查询 与当前用户互粉的人的ID
     * @param userAid 当前用户
     * @return List
     */
    public List queryBothFans(String userAid);

    /**
     * userAid 当前用户
     * userBid 要取消关注的人的Id
     * @param userAid
     * @param userBid
     */
    public void delAttention(String userAid, String userBid);

    /**
     * 统计当前用户关注的人的总数
     * @param userAid
     * @return int
     */
    public int sumAttention(String userAid);

    /**
     * 统计当前用户的粉丝数量
     * @param userAid
     * @return int
     */
    public int sumFans(String userAid);

    /**
     * 统计当前用户的互粉的数量
     * @param userAid
     * @return int
     */
    public int sumBothFans(String userAid);

    /**
     * 查询粉丝
     * @param userAid
     * @return List
     */
    public List queryFans(String userAid);

    /**
     * 查询关注的人
     * @param userAid
     * @return
     */
    public List queryAttention(String userAid);

    /**
     * 是否关注
     * @param userAid
     * @param userBid
     * @return
     */
    public boolean isAlreadyAttention(String userAid, String userBid);

    /**
     * 是否互粉
     * @param userAid
     * @param userBid
     * @return
     */
    public boolean isAlreadyBothFans(String userAid, String userBid);
}

