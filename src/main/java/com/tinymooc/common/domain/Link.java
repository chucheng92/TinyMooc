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
 * Link 类
 */
@Entity
@Table(name = "link", catalog = "tinymooc")
public class Link implements java.io.Serializable {

    private String resourceId;
    private Resource resource;
    private String linkUrl;

    public Link() {
    }

    public Link(Resource resource) {
        this.resource = resource;
    }

    public Link(Resource resource, String linkUrl) {
        this.resource = resource;
        this.linkUrl = linkUrl;
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

    @Column(name = "LINK_URL", length = 100)
    public String getLinkUrl() {
        return this.linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

}

