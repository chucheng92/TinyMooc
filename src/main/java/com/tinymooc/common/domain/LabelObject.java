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
@Table(name = "label_object", catalog = "tinymooc")
public class LabelObject implements java.io.Serializable {

    private String labelObjectId;
    private Label label;
    private String objectType;
    private String objectId;

    public LabelObject() {
    }

    public LabelObject(String labelObjectId) {
        this.labelObjectId = labelObjectId;
    }

    public LabelObject(String labelObjectId, Label label, String objectType,
                       String objectId) {
        this.labelObjectId = labelObjectId;
        this.label = label;
        this.objectType = objectType;
        this.objectId = objectId;
    }

    @Id
    @Column(name = "LABEL_OBJECT_ID", unique = true, nullable = false, length = 32)
    public String getLabelObjectId() {
        return this.labelObjectId;
    }

    public void setLabelObjectId(String labelObjectId) {
        this.labelObjectId = labelObjectId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LABEL_ID")
    public Label getLabel() {
        return this.label;
    }

    public void setLabel(Label label) {
        this.label = label;
    }

    @Column(name = "OBJECT_TYPE", length = 50)
    public String getObjectType() {
        return this.objectType;
    }

    public void setObjectType(String objectType) {
        this.objectType = objectType;
    }

    @Column(name = "OBJECT_ID", length = 32)
    public String getObjectId() {
        return this.objectId;
    }

    public void setObjectId(String objectId) {
        this.objectId = objectId;
    }

}
