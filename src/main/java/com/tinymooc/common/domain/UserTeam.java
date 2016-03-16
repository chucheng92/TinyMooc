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

@Entity
@Table(name = "user_team", catalog = "tinymooc")
public class UserTeam implements java.io.Serializable {

    private String userTeamId;
    private User user;
    private Team team;
    private String userPosition;
    private Date applyDate;
    private Date approveDate;
    private String userState;
    private Integer contribution;

    public UserTeam() {
    }

    public UserTeam(String userTeamId) {
        this.userTeamId = userTeamId;
    }

    public UserTeam(String userTeamId, User user, Team team,
                    String userPosition, Date applyDate, Date approveDate,
                    String userState, Integer contribution) {
        this.userTeamId = userTeamId;
        this.user = user;
        this.team = team;
        this.userPosition = userPosition;
        this.applyDate = applyDate;
        this.approveDate = approveDate;
        this.userState = userState;
        this.contribution = contribution;
    }

    @Id
    @Column(name = "USER_TEAM_ID", unique = true, nullable = false, length = 32)
    public String getUserTeamId() {
        return this.userTeamId;
    }

    public void setUserTeamId(String userTeamId) {
        this.userTeamId = userTeamId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "USER_ID")
    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "TEAM_ID")
    public Team getTeam() {
        return this.team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    @Column(name = "USER_POSITION", length = 18)
    public String getUserPosition() {
        return this.userPosition;
    }

    public void setUserPosition(String userPosition) {
        this.userPosition = userPosition;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "APPLY_DATE", length = 19)
    public Date getApplyDate() {
        return this.applyDate;
    }

    public void setApplyDate(Date applyDate) {
        this.applyDate = applyDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "APPROVE_DATE", length = 19)
    public Date getApproveDate() {
        return this.approveDate;
    }

    public void setApproveDate(Date approveDate) {
        this.approveDate = approveDate;
    }

    @Column(name = "USER_STATE", length = 18)
    public String getUserState() {
        return this.userState;
    }

    public void setUserState(String userState) {
        this.userState = userState;
    }

    @Column(name = "CONTRIBUTION")
    public Integer getContribution() {
        return this.contribution;
    }

    public void setContribution(Integer contribution) {
        this.contribution = contribution;
    }

}

