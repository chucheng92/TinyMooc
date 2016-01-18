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
 * Video 类
 */
@Entity
@Table(name = "video", catalog = "tinymooc")
public class Video implements java.io.Serializable {

    private String resourceId;
    private Resource resource;
    private String videoUrl;
    private String tencentVideoId;

    public Video() {
    }

    public Video(Resource resource) {
        this.resource = resource;
    }

    public Video(Resource resource, String videoUrl) {
        this.resource = resource;
        this.videoUrl = videoUrl;
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

    @Column(name = "VIDEO_URL", length = 100)
    public String getVideoUrl() {
        return this.videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    @Column(name="TENCENT_VIDEO_ID")
    public String getTencentVideoId() {
        return this.tencentVideoId;
    }

    public void setTencentVideoId(String tencentVideoId) {
        this.tencentVideoId = tencentVideoId;
    }
}

