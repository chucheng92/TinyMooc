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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "authority", catalog = "tinymooc")
public class Authority implements java.io.Serializable {

    private String authorityId;
    private String authorityName;
    private String authorityIntro;
    private Date updateDate;
    private Set<LevelAuthority> levelAuthorities = new HashSet<LevelAuthority>(
            0);

    public Authority() {
    }

    public Authority(String authorityId) {
        this.authorityId = authorityId;
    }

    public Authority(String authorityId, String authorityName,
                     String authorityIntro, Date updateDate,
                     Set<LevelAuthority> levelAuthorities) {
        this.authorityId = authorityId;
        this.authorityName = authorityName;
        this.authorityIntro = authorityIntro;
        this.updateDate = updateDate;
        this.levelAuthorities = levelAuthorities;
    }

    @Id
    @Column(name = "AUTHORITY_ID", unique = true, nullable = false, length = 32)
    public String getAuthorityId() {
        return this.authorityId;
    }

    public void setAuthorityId(String authorityId) {
        this.authorityId = authorityId;
    }

    @Column(name = "AUTHORITY_NAME", length = 200)
    public String getAuthorityName() {
        return this.authorityName;
    }

    public void setAuthorityName(String authorityName) {
        this.authorityName = authorityName;
    }

    @Column(name = "AUTHORITY_INTRO", length = 100)
    public String getAuthorityIntro() {
        return this.authorityIntro;
    }

    public void setAuthorityIntro(String authorityIntro) {
        this.authorityIntro = authorityIntro;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "UPDATE_DATE", length = 19)
    public Date getUpdateDate() {
        return this.updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "authority")
    public Set<LevelAuthority> getLevelAuthorities() {
        return this.levelAuthorities;
    }

    public void setLevelAuthorities(Set<LevelAuthority> levelAuthorities) {
        this.levelAuthorities = levelAuthorities;
    }

}

