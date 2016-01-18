package com.tinymooc.common.domain;

/**
 * Created by 哓哓 on 2015/11/26 0026.
 */

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 挑战模块
 * 预留
 */
@Entity
@Table(name = "challenge", catalog = "tinymooc")
public class Challenge implements java.io.Serializable {

    private String challengeId;
    private User user;
    private Integer totalScore;
    private Integer passNum;
    private Integer teamRank;
    private Integer majorRank;
    private Date challengeDate;
    private String major;

    public Challenge() {
    }

    public Challenge(String challengeId) {
        this.challengeId = challengeId;
    }

    public Challenge(String challengeId, User user, Integer totalScore,
                     Integer passNum, Integer teamRank, Integer majorRank,
                     Date challengeDate, String major) {
        this.challengeId = challengeId;
        this.user = user;
        this.totalScore = totalScore;
        this.passNum = passNum;
        this.teamRank = teamRank;
        this.majorRank = majorRank;
        this.challengeDate = challengeDate;
        this.major = major;
    }

    @Id
    @Column(name = "CHALLENGE_ID", unique = true, nullable = false, length = 32)
    public String getChallengeId() {
        return this.challengeId;
    }

    public void setChallengeId(String challengeId) {
        this.challengeId = challengeId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "USER_ID")
    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Column(name = "TOTAL_SCORE")
    public Integer getTotalScore() {
        return this.totalScore;
    }

    public void setTotalScore(Integer totalScore) {
        this.totalScore = totalScore;
    }

    @Column(name = "PASS_NUM")
    public Integer getPassNum() {
        return this.passNum;
    }

    public void setPassNum(Integer passNum) {
        this.passNum = passNum;
    }

    @Column(name = "TEAM_RANK")
    public Integer getTeamRank() {
        return this.teamRank;
    }

    public void setTeamRank(Integer teamRank) {
        this.teamRank = teamRank;
    }

    @Column(name = "MAJOR_RANK")
    public Integer getMajorRank() {
        return this.majorRank;
    }

    public void setMajorRank(Integer majorRank) {
        this.majorRank = majorRank;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CHALLENGE_DATE", length = 19)
    public Date getChallengeDate() {
        return this.challengeDate;
    }

    public void setChallengeDate(Date challengeDate) {
        this.challengeDate = challengeDate;
    }

    @Column(name = "MAJOR", length = 50)
    public String getMajor() {
        return this.major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

}

