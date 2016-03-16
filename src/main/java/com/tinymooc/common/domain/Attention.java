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
@Table(name = "attention", catalog = "tinymooc")
public class Attention implements java.io.Serializable {

    private String attentionId;
    private User userByAttentionedUserId;
    private User userByUserId;
    private Date attentionDate;
    private String attentionEach;

    public Attention() {
    }

    public Attention(String attentionId) {
        this.attentionId = attentionId;
    }

    public Attention(String attentionId, User userByAttentionedUserId,
                     User userByUserId, Date attentionDate, String attentionEach) {
        this.attentionId = attentionId;
        this.userByAttentionedUserId = userByAttentionedUserId;
        this.userByUserId = userByUserId;
        this.attentionDate = attentionDate;
        this.attentionEach = attentionEach;
    }

    @Id
    @Column(name = "ATTENTION_ID", unique = true, nullable = false, length = 32)
    public String getAttentionId() {
        return this.attentionId;
    }

    public void setAttentionId(String attentionId) {
        this.attentionId = attentionId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ATTENTIONED_USER_ID")
    public User getUserByAttentionedUserId() {
        return this.userByAttentionedUserId;
    }

    public void setUserByAttentionedUserId(User userByAttentionedUserId) {
        this.userByAttentionedUserId = userByAttentionedUserId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "USER_ID")
    public User getUserByUserId() {
        return this.userByUserId;
    }

    public void setUserByUserId(User userByUserId) {
        this.userByUserId = userByUserId;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "ATTENTION_DATE", length = 19)
    public Date getAttentionDate() {
        return this.attentionDate;
    }

    public void setAttentionDate(Date attentionDate) {
        this.attentionDate = attentionDate;
    }

    @Column(name = "ATTENTION_EACH", length = 50)
    public String getAttentionEach() {
        return this.attentionEach;
    }

    public void setAttentionEach(String attentionEach) {
        this.attentionEach = attentionEach;
    }

}

