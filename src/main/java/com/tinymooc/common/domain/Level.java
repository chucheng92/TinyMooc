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
 * 用户等级
 */
@Entity
@Table(name = "level", catalog = "tinymooc")
public class Level implements java.io.Serializable {

    private String levelId;
    private Integer lv;
    private String title;
    private Integer lvCondition;
    private String type;
    private Set<LevelAuthority> levelAuthorities = new HashSet<LevelAuthority>(0);

    public Level() {
    }

    public Level(String levelId) {
        this.levelId = levelId;
    }

    public Level(String levelId, Integer lv, String title, Integer lvCondition,
                 String type, Set<LevelAuthority> levelAuthorities) {
        this.levelId = levelId;
        this.lv = lv;
        this.title = title;
        this.lvCondition = lvCondition;
        this.type = type;
        this.levelAuthorities = levelAuthorities;
    }

    @Id
    @Column(name = "LEVEL_ID", unique = true, nullable = false, length = 32)
    public String getLevelId() {
        return this.levelId;
    }

    public void setLevelId(String levelId) {
        this.levelId = levelId;
    }

    @Column(name = "LV")
    public Integer getLv() {
        return this.lv;
    }

    public void setLv(Integer lv) {
        this.lv = lv;
    }

    @Column(name = "TITLE", length = 50)
    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "LV_CONDITION")
    public Integer getLvCondition() {
        return this.lvCondition;
    }

    public void setLvCondition(Integer lvCondition) {
        this.lvCondition = lvCondition;
    }

    @Column(name = "TYPE", length = 50)
    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "level")
    public Set<LevelAuthority> getLevelAuthorities() {
        return this.levelAuthorities;
    }

    public void setLevelAuthorities(Set<LevelAuthority> levelAuthorities) {
        this.levelAuthorities = levelAuthorities;
    }

}

