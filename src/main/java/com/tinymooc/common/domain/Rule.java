package com.tinymooc.common.domain;

/**
 * Created by 哓哓 on 2015/11/30 0030.
 */


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "rule", catalog = "tinymooc")
public class Rule implements java.io.Serializable {

    private String ruleId;
    private String action;
    private Integer credit;
    private Integer gold;
    private String remark;

    public Rule() {
    }

    public Rule(String ruleId) {
        this.ruleId = ruleId;
    }

    public Rule(String ruleId, String action, Integer credit, Integer gold,
                String remark) {
        this.ruleId = ruleId;
        this.action = action;
        this.credit = credit;
        this.gold = gold;
        this.remark = remark;
    }

    @Id
    @Column(name = "RULE_ID", unique = true, nullable = false, length = 32)
    public String getRuleId() {
        return this.ruleId;
    }

    public void setRuleId(String ruleId) {
        this.ruleId = ruleId;
    }

    @Column(name = "ACTION", length = 50)
    public String getAction() {
        return this.action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    @Column(name = "CREDIT")
    public Integer getCredit() {
        return this.credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    @Column(name = "GOLD")
    public Integer getGold() {
        return this.gold;
    }

    public void setGold(Integer gold) {
        this.gold = gold;
    }

    @Column(name = "REMARK", length = 100)
    public String getRemark() {
        return this.remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}

