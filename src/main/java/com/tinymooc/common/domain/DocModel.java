package com.tinymooc.common.domain;

/**
 * Created by 哓哓 on 2015/11/30 0030.
 */

public class DocModel {

    private String nickName;
    private String userId;
    private String teamName;
    private String userTeamId;
    private String courseTitle;
    private String userCourseId;
    private String topic;
    private String discussId;
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getCourseTitle() {
        return courseTitle;
    }

    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getUserTeamId() {
        return userTeamId;
    }

    public void setUserTeamId(String userTeamId) {
        this.userTeamId = userTeamId;
    }

    public String getUserCourseId() {
        return userCourseId;
    }

    public void setUserCourseId(String userCourseId) {
        this.userCourseId = userCourseId;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getDiscussId() {
        return discussId;
    }

    public void setDiscussId(String discussId) {
        this.discussId = discussId;
    }

}

