package com.tinymooc.handler.attention.service.impl;

import com.tinymooc.common.base.impl.BaseServiceImpl;
import com.tinymooc.common.domain.Attention;
import com.tinymooc.common.domain.User;
import com.tinymooc.handler.attention.service.AttentionService;
import com.tinymooc.util.UUIDGenerator;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by 哓哓 on 2015/12/1 0001.
 */
@Transactional
@Service
public class AttentionServiceImpl extends BaseServiceImpl implements AttentionService {

    /**
     * 添加关注
     * @param userA 当前用户
     * @param userB 被关注的人
     */
    @Override
    public void addAttention(String userA, String userB) {
        User user1 = (User) getCurrentSession().createCriteria(User.class).add(Restrictions.eq("userId", userA)).list().get(0);
        User user2 = (User) getCurrentSession().createCriteria(User.class).add(Restrictions.eq("userId", userB)).list().get(0);

        Attention attention = new Attention();

        // 判断B是否也关注了A
        List<Attention> list=getCurrentSession().createCriteria(Attention.class)
                .add(Restrictions.eq("userByUserId", user2))
                .add(Restrictions.eq("userByAttentionedUserId", user1)).list();

         // 若B也关注了A走互粉逻辑并插入另一条Attention
        if (list.size()!=0) {

            // FIXME
            System.out.println("============== 进入互粉逻辑=======");

            Attention attention1=list.get(0);
            attention1.setAttentionEach("互粉");
            // FIXME   是不是应当执行 update 待测试 Campanulaceae1 2015年12月1日11:12:06
            // TODO 改为update CLEAR！ 2015年12月8日20:52:30
            getCurrentSession().update(attention1);

            attention.setUserByUserId(user1);
            attention.setUserByAttentionedUserId(user2);
            attention.setAttentionId(UUIDGenerator.randomUUID());
            attention.setAttentionDate(new Date());
            attention.setAttentionEach("互粉");
            getCurrentSession().save(attention);
        } else{
            // FIXME
            System.out.println("============== 进入单向关注=======");

             // 否则单向关注
            attention.setUserByUserId(user1);
            attention.setUserByAttentionedUserId(user2);
            attention.setAttentionId(UUIDGenerator.randomUUID());
            attention.setAttentionDate(new Date());
            getCurrentSession().save(attention);
        }
    }

    /**
     *  查询互粉
     * @param userAid 当前用户
     * @return List
     */
    @Override
    public List queryBothFans(String userAid) {
        User user=(User) getCurrentSession().createCriteria(User.class).add(Restrictions.eq("userId", userAid)).list().get(0);
        List <Attention> list =getCurrentSession().createCriteria(Attention.class)
                .add(Restrictions.eq("userByUserId", user))
                .add(Restrictions.eq("attentionEach", "互粉")).list();

        return list;
    }

    /**
     * 取消关注
     * @param userAid
     * @param userBid
     */
    @Override
    public void delAttention(String userAid, String userBid) {
        //A取消对B的关注
        User user1 = (User) getCurrentSession().createCriteria(User.class).add(Restrictions.eq("userId", userAid)).list().get(0);
        User user2 = (User) getCurrentSession().createCriteria(User.class).add(Restrictions.eq("userId", userBid)).list().get(0);

        // TODO  这里是不是应该先删除B的AttentionEach 待测试Campanulaceae2 2015年12月1日11:12:44
        List<Attention> list=getCurrentSession().createCriteria(Attention.class)
                .add(Restrictions.eq("userByUserId", user1))
                .add(Restrictions.eq("userByAttentionedUserId", user2)).list();

        Attention attention1=list.get(0);
        attention1.setAttentionEach("");
        getCurrentSession().update(attention1);

        Attention attention=(Attention) getCurrentSession().createCriteria(Attention.class)
                .add(Restrictions.eq("userByUserId", user1))
                .add(Restrictions.eq("userByAttentionedUserId", user2)).list().get(0);;
        getCurrentSession().clear();
        getCurrentSession().delete(attention);
    }

    /**
     * 统计当前用户关注的人总数
     * @param userAid
     * @return int
     */
    @Override
    public int sumAttention(String userAid) {
        User user=(User) getCurrentSession().createCriteria(User.class)
                .add(Restrictions.eq("userId", userAid)).list().get(0);
        List<Attention> list=getCurrentSession().createCriteria(Attention.class).add(Restrictions.eq("userByUserId", user)).list();

        return list.size();
    }

    /**
     * 统计当前用户的粉丝数量
     * @param userAid
     * @return int
     */
    @Override
    public int sumFans(String userAid) {
        User user=(User) getCurrentSession().createCriteria(User.class)
                .add(Restrictions.eq("userId", userAid)).list().get(0);
        List<Attention> list=getCurrentSession().createCriteria(Attention.class)
                .add(Restrictions.eq("userByAttentionedUserId", user)).list();

        return list.size();
    }


    /**
     * 统计当前用户的互粉的数量
     * @param userAid
     * @return int
     */
    @Override
    public int sumBothFans(String userAid) {
        User user=(User) getCurrentSession().createCriteria(User.class)
                .add(Restrictions.eq("userId", userAid)).list().get(0);
        List <Attention> list =getCurrentSession().createCriteria(Attention.class)
                .add(Restrictions.eq("userByUserId", user))
                .add(Restrictions.eq("attentionEach", "互粉")).list();

        return  list.size();
    }

    /**
     * 查询用户粉丝
     * @param userAid
     * @return List
     */
    @Override
    public List queryFans(String userAid) {
        User user=(User) getCurrentSession().createCriteria(User.class)
                .add(Restrictions.eq("userId", userAid)).list().get(0);
        List<Attention> list=getCurrentSession().createCriteria(Attention.class)
                .add(Restrictions.eq("userByAttentionedUserId", user)).list();

        return list;
    }

    /**
     * 查询关注的人
     * @param userAid
     * @return List
     */
    @Override
    public List queryAttention(String userAid) {
        User user=(User) getCurrentSession().createCriteria(User.class)
                .add(Restrictions.eq("userId", userAid)).list().get(0);
        List<Attention> list=getCurrentSession().createCriteria(Attention.class)
                .add(Restrictions.eq("userByUserId", user)).list();

        return list;
    }

    /**
     * 是否关注
     * @param userAid
     * @param userBid
     * @return boolean
     */
    @Override
    public boolean isAlreadyAttention(String userAid, String userBid) {
        User user1 = (User) getCurrentSession().createCriteria(User.class).add(Restrictions.eq("userId", userAid)).list().get(0);
        User user2 = (User) getCurrentSession().createCriteria(User.class).add(Restrictions.eq("userId", userBid)).list().get(0);

        List<Attention> list=getCurrentSession().createCriteria(Attention.class)
                .add(Restrictions.eq("userByUserId", user1))
                .add(Restrictions.eq("userByAttentionedUserId", user2)).list();

        if(list.size()==0){
            return false;
        } else{
            return true;
        }
    }

    /**
     * 是否互粉
     * @param userAid
     * @param userBid
     * @return boolean
     */
    @Override
    public boolean isAlreadyBothFans(String userAid, String userBid) {
        User user1=(User) getCurrentSession().createCriteria(User.class).add(Restrictions.eq("userId", userAid)).list().get(0);
        User user2=(User) getCurrentSession().createCriteria(User.class).add(Restrictions.eq("userId", userBid)).list().get(0);

        List<Attention> list=getCurrentSession().createCriteria(Attention.class)
                .add(Restrictions.eq("userByUserId", user1))
                .add(Restrictions.eq("userByAttentionedUserId", user2))
                .add(Restrictions.eq("attentionEach", "互粉")).list();

        // TODO 2015年12月1日11:22:37 Campanulaceae4 size==0应该返回false 待测试
        if(list.size()==0){
            return true;
        } else{
            return false;
        }
    }
}
