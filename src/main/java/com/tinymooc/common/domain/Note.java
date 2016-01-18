package com.tinymooc.common.domain;

/**
 * Created by 哓哓 on 2015/11/30 0030.
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
 * 笔记
 */
@Entity
@Table(name = "note", catalog = "tinymooc")
public class Note implements java.io.Serializable {

    private String noteId;
    private UserCourse userCourse;
    private Date addDate;
    private String noteContent;
    private String public_;

    public Note() {
    }

    public Note(String noteId) {
        this.noteId = noteId;
    }

    public Note(String noteId, UserCourse userCourse, Date addDate,
                String noteContent, String public_) {
        this.noteId = noteId;
        this.userCourse = userCourse;
        this.addDate = addDate;
        this.noteContent = noteContent;
        this.public_ = public_;
    }

    @Id
    @Column(name = "NOTE_ID", unique = true, nullable = false, length = 32)
    public String getNoteId() {
        return this.noteId;
    }

    public void setNoteId(String noteId) {
        this.noteId = noteId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "USER_COURSE_ID")
    public UserCourse getUserCourse() {
        return this.userCourse;
    }

    public void setUserCourse(UserCourse userCourse) {
        this.userCourse = userCourse;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "ADD_DATE", length = 19)
    public Date getAddDate() {
        return this.addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    @Column(name = "NOTE_CONTENT", length = 65535)
    public String getNoteContent() {
        return this.noteContent;
    }

    public void setNoteContent(String noteContent) {
        this.noteContent = noteContent;
    }

    @Column(name = "PUBLIC", length = 50)
    public String getPublic_() {
        return this.public_;
    }

    public void setPublic_(String public_) {
        this.public_ = public_;
    }

}

