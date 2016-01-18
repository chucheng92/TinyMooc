package com.tinymooc.common.domain;

/**
 * Created by 哓哓 on 2015/11/30 0030.
 */


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "level_authority", catalog = "tinymooc")
public class LevelAuthority implements java.io.Serializable {

    private String levelAuthorityId;
    private Level level;
    private Authority authority;

    public LevelAuthority() {
    }

    public LevelAuthority(String levelAuthorityId) {
        this.levelAuthorityId = levelAuthorityId;
    }

    public LevelAuthority(String levelAuthorityId, Level level,
                          Authority authority) {
        this.levelAuthorityId = levelAuthorityId;
        this.level = level;
        this.authority = authority;
    }

    @Id
    @Column(name = "LEVEL_AUTHORITY_ID", unique = true, nullable = false, length = 32)
    public String getLevelAuthorityId() {
        return this.levelAuthorityId;
    }

    public void setLevelAuthorityId(String levelAuthorityId) {
        this.levelAuthorityId = levelAuthorityId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LEVEL_ID")
    public Level getLevel() {
        return this.level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "AUTHORITY_ID")
    public Authority getAuthority() {
        return this.authority;
    }

    public void setAuthority(Authority authority) {
        this.authority = authority;
    }

}

