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
 * 举报
 * 预留
 */
@Entity
@Table(name = "inform", catalog = "tinymooc")
public class Inform implements java.io.Serializable {

    private String informId;
    private User user;
    private String informReason;
    private Date informDate;
    private String informState;
    private String informObject;
    private String informType;

    public Inform() {
    }

    public Inform(String informId) {
        this.informId = informId;
    }

    public Inform(String informId, User user, String informReason,
                  Date informDate, String informState, String informObject,
                  String informType) {
        this.informId = informId;
        this.user = user;
        this.informReason = informReason;
        this.informDate = informDate;
        this.informState = informState;
        this.informObject = informObject;
        this.informType = informType;
    }

    @Id
    @Column(name = "INFORM_ID", unique = true, nullable = false, length = 32)
    public String getInformId() {
        return this.informId;
    }

    public void setInformId(String informId) {
        this.informId = informId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "USER_ID")
    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Column(name = "INFORM_REASON", length = 200)
    public String getInformReason() {
        return this.informReason;
    }

    public void setInformReason(String informReason) {
        this.informReason = informReason;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "INFORM_DATE", length = 19)
    public Date getInformDate() {
        return this.informDate;
    }

    public void setInformDate(Date informDate) {
        this.informDate = informDate;
    }

    @Column(name = "INFORM_STATE", length = 50)
    public String getInformState() {
        return this.informState;
    }

    public void setInformState(String informState) {
        this.informState = informState;
    }

    @Column(name = "INFORM_OBJECT", length = 32)
    public String getInformObject() {
        return this.informObject;
    }

    public void setInformObject(String informObject) {
        this.informObject = informObject;
    }

    @Column(name = "INFORM_TYPE", length = 50)
    public String getInformType() {
        return this.informType;
    }

    public void setInformType(String informType) {
        this.informType = informType;
    }

}

