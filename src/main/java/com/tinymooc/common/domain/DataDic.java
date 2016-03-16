package com.tinymooc.common.domain;

/**
 * Created by 哓哓 on 2015/11/26 0026.
 */

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 数据字典
 */
@Entity
@Table(name = "data_dic", catalog = "tinymooc")
public class DataDic implements java.io.Serializable {

    private String dicId;
    private String dicKey;
    private String dicValue;
    private String intro;

    public DataDic() {
    }

    public DataDic(String dicId) {
        this.dicId = dicId;
    }

    public DataDic(String dicId, String dicKey, String dicValue, String intro) {
        this.dicId = dicId;
        this.dicKey = dicKey;
        this.dicValue = dicValue;
        this.intro = intro;
    }

    @Id
    @Column(name = "DIC_ID", unique = true, nullable = false, length = 32)
    public String getDicId() {
        return this.dicId;
    }

    public void setDicId(String dicId) {
        this.dicId = dicId;
    }

    @Column(name = "DIC_KEY", length = 50)
    public String getDicKey() {
        return this.dicKey;
    }

    public void setDicKey(String dicKey) {
        this.dicKey = dicKey;
    }

    @Column(name = "DIC_VALUE", length = 50)
    public String getDicValue() {
        return this.dicValue;
    }

    public void setDicValue(String dicValue) {
        this.dicValue = dicValue;
    }

    @Column(name = "INTRO", length = 50)
    public String getIntro() {
        return this.intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

}

