
package com.tinymooc.common.domain;

/**
 * Created by 哓哓 on 2015/11/26 0026.
 */

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 用户
 */
@Entity
@Table(name = "user", catalog = "tinymooc")
public class User implements java.io.Serializable {

    private String userId;
    private HeadImage headImage;
    private String userName;
    private String gender;
    private Date birthday;
    private String city;
    private String intro;
    private String wechat;
    private String qq;
    private String password;
    private String email;
    private Integer credit;
    private Integer gold;
    private String userState;
    private Set<UserProp> userProps = new HashSet<UserProp>(0);
    private Set<UserCourse> userCourses = new HashSet<UserCourse>(0);
    private Set<Challenge> challenges = new HashSet<Challenge>(0);
    private Set<UserTeam> userTeams = new HashSet<UserTeam>(0);
    private Set<Discuss> discusses = new HashSet<Discuss>(0);
    private Set<Attention> attentionsForUserId = new HashSet<Attention>(0);
    private Set<Inform> informs = new HashSet<Inform>(0);
    private Set<Favorite> favorites = new HashSet<Favorite>(0);
    private Set<Attention> attentionsForAttentionedUserId = new HashSet<Attention>(0);
    private Set<Grade> grades = new HashSet<Grade>(0);
    private Set<Message> messagesForSenderId = new HashSet<Message>(0);
    private Set<Comment> comments = new HashSet<Comment>(0);
    private Set<Message> messagesForReceiverId = new HashSet<Message>(0);

    public User() {
    }

    public User(String userId) {
        this.userId = userId;
    }

    public User(String userId, HeadImage headImage, String userName, String gender, Date birthday, String city, String intro, String wechat, String qq, String password, String email, Integer credit, Integer gold, String userState, Set<UserProp> userProps, Set<UserCourse> userCourses, Set<Challenge> challenges, Set<UserTeam> userTeams, Set<Discuss> discusses, Set<Attention> attentionsForUserId, Set<Inform> informs, Set<Favorite> favorites, Set<Attention> attentionsForAttentionedUserId, Set<Grade> grades, Set<Message> messagesForSenderId, Set<Comment> comments, Set<Message> messagesForReceiverId) {
        this.userId = userId;
        this.headImage = headImage;
        this.userName = userName;
        this.gender = gender;
        this.birthday = birthday;
        this.city = city;
        this.intro = intro;
        this.wechat = wechat;
        this.qq = qq;
        this.password = password;
        this.email = email;
        this.credit = credit;
        this.gold = gold;
        this.userState = userState;
        this.userProps = userProps;
        this.userCourses = userCourses;
        this.challenges = challenges;
        this.userTeams = userTeams;
        this.discusses = discusses;
        this.attentionsForUserId = attentionsForUserId;
        this.informs = informs;
        this.favorites = favorites;
        this.attentionsForAttentionedUserId = attentionsForAttentionedUserId;
        this.grades = grades;
        this.messagesForSenderId = messagesForSenderId;
        this.comments = comments;
        this.messagesForReceiverId = messagesForReceiverId;
    }

    @Id
    @Column(name = "USER_ID", unique = true, nullable = false, length = 32)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "IMAGE_ID")
    public HeadImage getHeadImage() {
        return this.headImage;
    }

    public void setHeadImage(HeadImage headImage) {
        this.headImage = headImage;
    }

    @Column(name = "USERNAME", length = 50)
    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Column(name = "GENDER", length = 50)
    public String getGender() {
        return this.gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "BIRTHDAY", length = 10)
    public Date getBirthday() {
        return this.birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @Column(name = "CITY", length = 50)
    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Column(name = "INTRO", length = 200)
    public String getIntro() {
        return this.intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    @Column(name = "WECHAT", length = 200)
    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    @Column(name = "QQ", length = 200)
    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    @Column(name = "PASSWORD", length = 50)
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "EMAIL", length = 50)
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "CREDIT")
    public Integer getCredit() {
        return this.credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    @Column(name = "GOLD")
    public Integer getGold() {
        return this.gold;
    }

    public void setGold(Integer gold) {
        this.gold = gold;
    }

    @Column(name = "USER_STATE", length = 50)
    public String getUserState() {
        return this.userState;
    }

    public void setUserState(String userState) {
        this.userState = userState;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    public Set<UserProp> getUserProps() {
        return this.userProps;
    }

    public void setUserProps(Set<UserProp> userProps) {
        this.userProps = userProps;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    public Set<UserCourse> getUserCourses() {
        return this.userCourses;
    }

    public void setUserCourses(Set<UserCourse> userCourses) {
        this.userCourses = userCourses;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    public Set<Challenge> getChallenges() {
        return this.challenges;
    }

    public void setChallenges(Set<Challenge> challenges) {
        this.challenges = challenges;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    public Set<UserTeam> getUserTeams() {
        return this.userTeams;
    }

    public void setUserTeams(Set<UserTeam> userTeams) {
        this.userTeams = userTeams;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    public Set<Discuss> getDiscusses() {
        return this.discusses;
    }

    public void setDiscusses(Set<Discuss> discusses) {
        this.discusses = discusses;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "userByUserId")
    public Set<Attention> getAttentionsForUserId() {
        return this.attentionsForUserId;
    }

    public void setAttentionsForUserId(Set<Attention> attentionsForUserId) {
        this.attentionsForUserId = attentionsForUserId;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    public Set<Inform> getInforms() {
        return this.informs;
    }

    public void setInforms(Set<Inform> informs) {
        this.informs = informs;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    public Set<Favorite> getFavorites() {
        return this.favorites;
    }

    public void setFavorites(Set<Favorite> favorites) {
        this.favorites = favorites;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "userByAttentionedUserId")
    public Set<Attention> getAttentionsForAttentionedUserId() {
        return this.attentionsForAttentionedUserId;
    }

    public void setAttentionsForAttentionedUserId(
            Set<Attention> attentionsForAttentionedUserId) {
        this.attentionsForAttentionedUserId = attentionsForAttentionedUserId;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    public Set<Grade> getGrades() {
        return this.grades;
    }

    public void setGrades(Set<Grade> grades) {
        this.grades = grades;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "userBySenderId")
    public Set<Message> getMessagesForSenderId() {
        return this.messagesForSenderId;
    }

    public void setMessagesForSenderId(Set<Message> messagesForSenderId) {
        this.messagesForSenderId = messagesForSenderId;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    public Set<Comment> getComments() {
        return this.comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "userByReceiverId")
    public Set<Message> getMessagesForReceiverId() {
        return this.messagesForReceiverId;
    }

    public void setMessagesForReceiverId(Set<Message> messagesForReceiverId) {
        this.messagesForReceiverId = messagesForReceiverId;
    }
}
