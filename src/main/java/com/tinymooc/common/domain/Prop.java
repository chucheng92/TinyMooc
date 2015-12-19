package com.tinymooc.common.domain;

/**
 * Created by 哓哓 on 2015/11/30 0030.
 */

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 道具
 * 预留
 */
@Entity
@Table(name = "prop", catalog = "tinymooc")
public class Prop implements java.io.Serializable {

    private String propId;
    private String propName;
    private String propIntro;
    private Set<UserProp> userProps = new HashSet<UserProp>(0);

    public Prop() {
    }

    public Prop(String propId) {
        this.propId = propId;
    }

    public Prop(String propId, String propName, String propIntro,
                Set<UserProp> userProps) {
        this.propId = propId;
        this.propName = propName;
        this.propIntro = propIntro;
        this.userProps = userProps;
    }

    @Id
    @Column(name = "PROP_ID", unique = true, nullable = false, length = 32)
    public String getPropId() {
        return this.propId;
    }

    public void setPropId(String propId) {
        this.propId = propId;
    }

    @Column(name = "PROP_NAME", length = 50)
    public String getPropName() {
        return this.propName;
    }

    public void setPropName(String propName) {
        this.propName = propName;
    }

    @Column(name = "PROP_INTRO", length = 100)
    public String getPropIntro() {
        return this.propIntro;
    }

    public void setPropIntro(String propIntro) {
        this.propIntro = propIntro;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "prop")
    public Set<UserProp> getUserProps() {
        return this.userProps;
    }

    public void setUserProps(Set<UserProp> userProps) {
        this.userProps = userProps;
    }

}

