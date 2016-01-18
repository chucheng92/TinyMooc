package com.tinymooc.common.domain;

/**
 * Created by 哓哓 on 2015/12/6 0006.
 */


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * ImageText 类
 */
@Entity
@Table(name = "image_text", catalog = "tinymooc")
public class ImageText implements java.io.Serializable {

    private String resourceId;
    private Resource resource;
    private String content;

    public ImageText() {
    }

    public ImageText(Resource resource) {
        this.resource = resource;
    }

    public ImageText(Resource resource, String content) {
        this.resource = resource;
        this.content = content;
    }

    @GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "resource"))
    @Id
    @GeneratedValue(generator = "generator")
    @Column(name = "RESOURCE_ID", unique = true, nullable = false, length = 32)
    public String getResourceId() {
        return this.resourceId;
    }

    public void setResourceId(String resourceId) {
        this.resourceId = resourceId;
    }

    @OneToOne(fetch = FetchType.LAZY)
    @PrimaryKeyJoinColumn
    public Resource getResource() {
        return this.resource;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }

    @Column(name = "CONTENT", length = 65535)
    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}

