package com.tinymooc.common.domain;

/**
 * Created by 哓哓 on 2015/11/26 0026.
 */

/**
 * 道具功能 预留
 */

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "user_prop", catalog = "tinymooc")
public class UserProp implements java.io.Serializable {

    private String userPropId;
    private User user;
    private Prop prop;
    private Integer number;

    public UserProp() {
    }

    public UserProp(String userPropId) {
        this.userPropId = userPropId;
    }

    public UserProp(String userPropId, User user, Prop prop, Integer number) {
        this.userPropId = userPropId;
        this.user = user;
        this.prop = prop;
        this.number = number;
    }

    @Id
    @Column(name = "USER_PROP_ID", unique = true, nullable = false, length = 32)
    public String getUserPropId() {
        return this.userPropId;
    }

    public void setUserPropId(String userPropId) {
        this.userPropId = userPropId;
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
    @JoinColumn(name = "PROP_ID")
    public Prop getProp() {
        return this.prop;
    }

    public void setProp(Prop prop) {
        this.prop = prop;
    }

    @Column(name = "NUMBER")
    public Integer getNumber() {
        return this.number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

}

