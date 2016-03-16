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
 * 私信
 */
@Entity
@Table(name = "message", catalog = "tinymooc")
public class Message implements java.io.Serializable {

    private String messageId;
    private User userBySenderId;
    private User userByReceiverId;
    private String content;
    private Date sendDate;
    private String messageState;

    public Message() {
    }

    public Message(String messageId) {
        this.messageId = messageId;
    }

    public Message(String messageId, User userBySenderId,
                   User userByReceiverId, String content, Date sendDate,
                   String messageState) {
        this.messageId = messageId;
        this.userBySenderId = userBySenderId;
        this.userByReceiverId = userByReceiverId;
        this.content = content;
        this.sendDate = sendDate;
        this.messageState = messageState;
    }

    @Id
    @Column(name = "MESSAGE_ID", unique = true, nullable = false, length = 32)
    public String getMessageId() {
        return this.messageId;
    }

    public void setMessageId(String messageId) {
        this.messageId = messageId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SENDER_ID")
    public User getUserBySenderId() {
        return this.userBySenderId;
    }

    public void setUserBySenderId(User userBySenderId) {
        this.userBySenderId = userBySenderId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "RECEIVER_ID")
    public User getUserByReceiverId() {
        return this.userByReceiverId;
    }

    public void setUserByReceiverId(User userByReceiverId) {
        this.userByReceiverId = userByReceiverId;
    }

    @Column(name = "CONTENT", length = 200)
    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "SEND_DATE", length = 19)
    public Date getSendDate() {
        return this.sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    @Column(name = "MESSAGE_STATE", length = 50)
    public String getMessageState() {
        return this.messageState;
    }

    public void setMessageState(String messageState) {
        this.messageState = messageState;
    }

}

