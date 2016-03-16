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
 * 评论模块
 * 预留
 */
@Entity
@Table(name = "comment", catalog = "tinymooc")
public class Comment implements java.io.Serializable {

    private String commentId;
    private User user;
    private Comment comment;
    private String type;
    private String commentContent;
    private Date commentDate;
    private String commentObject;
    private Set<Comment> comments = new HashSet<Comment>(0);

    public Comment() {
    }

    public Comment(String commentId) {
        this.commentId = commentId;
    }

    public Comment(String commentId, User user, Comment comment, String type,
                   String commentContent, Date commentDate, String commentObject,
                   Set<Comment> comments) {
        this.commentId = commentId;
        this.user = user;
        this.comment = comment;
        this.type = type;
        this.commentContent = commentContent;
        this.commentDate = commentDate;
        this.commentObject = commentObject;
        this.comments = comments;
    }

    @Id
    @Column(name = "COMMENT_ID", unique = true, nullable = false, length = 32)
    public String getCommentId() {
        return this.commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId;
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
    @JoinColumn(name = "PARENT_ID")
    public Comment getComment() {
        return this.comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    @Column(name = "TYPE", length = 50)
    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Column(name = "COMMENT_CONTENT", length = 65535)
    public String getCommentContent() {
        return this.commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "COMMENT_DATE", length = 19)
    public Date getCommentDate() {
        return this.commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    @Column(name = "COMMENT_OBJECT", length = 32)
    public String getCommentObject() {
        return this.commentObject;
    }

    public void setCommentObject(String commentObject) {
        this.commentObject = commentObject;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "comment")
    public Set<Comment> getComments() {
        return this.comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

}

