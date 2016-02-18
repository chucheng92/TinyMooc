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
 * Favorite
 * 预留
 */
@Entity
@Table(name = "favorite", catalog = "tinymooc")
public class Favorite implements java.io.Serializable {

    private String favoriteId;
    private User user;
    private String courseId;
    private String url;
    private Date favoriteDate;
    private String courseName;
//    private String objectId;

    public Favorite() {
    }

    public Favorite(String favoriteId) {
        this.favoriteId = favoriteId;
    }

    public Favorite(String favoriteId, User user, String courseId,
                    String url, Date favoriteDate, String courseName) {
        this.favoriteId = favoriteId;
        this.user = user;
        this.courseId = courseId;
        this.url = url;
        this.favoriteDate = favoriteDate;
        this.courseName = courseName;
    }

    @Id
    @Column(name = "FAVORITE_ID", unique = true, nullable = false, length = 32)
    public String getFavoriteId() {
        return this.favoriteId;
    }

    public void setFavoriteId(String favoriteId) {
        this.favoriteId = favoriteId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "USER_ID")
    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Column(name = "COURSE_ID", length = 100)
    public String getCourseId() {
        return this.courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    @Column(name = "URL", length = 500)
    public String getUrl() {
        return this.url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "FAVORITE_DATE", length = 19)
    public Date getFavoriteDate() {
        return this.favoriteDate;
    }

    public void setFavoriteDate(Date favoriteDate) {
        this.favoriteDate = favoriteDate;
    }

    @Column(name = "COURSE_NAME", length = 1000)
    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
}

