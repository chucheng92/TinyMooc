package com.tinymooc.common.domain;

/**
 * Created by 哓哓 on 2015/11/30 0030.
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
 * 小组
 */
@Entity
@Table(name = "team", catalog = "tinymooc")
public class Team implements java.io.Serializable {

    private String teamId;
    private HeadImage headImage;
    private String teamName;
    private String teamIntro;
    private Integer construction;
    private String type;
    private Date applyDate;
    private Date approveDate;
    private String teamState;
    private Set<UserTeam> userTeams = new HashSet<UserTeam>(0);
    private Set<Discuss> discusses = new HashSet<Discuss>(0);

    public Team() {
    }

    public Team(String teamId) {
        this.teamId = teamId;
    }

    public Team(String teamId, HeadImage headImage, String teamName,
                String teamIntro, Integer construction, String type,
                Date applyDate, Date approveDate, String teamState,
                Set<UserTeam> userTeams, Set<Discuss> discusses) {
        this.teamId = teamId;
        this.headImage = headImage;
        this.teamName = teamName;
        this.teamIntro = teamIntro;
        this.construction = construction;
        this.type = type;
        this.applyDate = applyDate;
        this.approveDate = approveDate;
        this.teamState = teamState;
        this.userTeams = userTeams;
        this.discusses = discusses;
    }

    @Id
    @Column(name = "TEAM_ID", unique = true, nullable = false, length = 32)
    public String getTeamId() {
        return this.teamId;
    }

    public void setTeamId(String teamId) {
        this.teamId = teamId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IMAGE_ID")
    public HeadImage getHeadImage() {
        return this.headImage;
    }

    public void setHeadImage(HeadImage headImage) {
        this.headImage = headImage;
    }

    @Column(name = "TEAM_NAME", length = 50)
    public String getTeamName() {
        return this.teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    @Column(name = "TEAM_INTRO", length = 200)
    public String getTeamIntro() {
        return this.teamIntro;
    }

    public void setTeamIntro(String teamIntro) {
        this.teamIntro = teamIntro;
    }

    @Column(name = "CONSTRUCTION")
    public Integer getConstruction() {
        return this.construction;
    }

    public void setConstruction(Integer construction) {
        this.construction = construction;
    }

    @Column(name = "TYPE", length = 50)
    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
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

    @Column(name = "TEAM_STATE", length = 50)
    public String getTeamState() {
        return this.teamState;
    }

    public void setTeamState(String teamState) {
        this.teamState = teamState;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "team")
    public Set<UserTeam> getUserTeams() {
        return this.userTeams;
    }

    public void setUserTeams(Set<UserTeam> userTeams) {
        this.userTeams = userTeams;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "team")
    public Set<Discuss> getDiscusses() {
        return this.discusses;
    }

    public void setDiscusses(Set<Discuss> discusses) {
        this.discusses = discusses;
    }

}

