<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
 <%@ taglib prefix="sicd" uri="/sicd-tags"%>
<%@ include file="/resource/jspf/commons.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建课程 - 萌课网</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>

    <%--<script type="text/javascript" src="<c:url value="/resource/js/label.js"/>"></script>--%>
    <script type="text/javascript" src="<c:url value="/resource/js/xheditor/xheditor-1.1.9-zh-cn.min.js"/>"></script>
</head>


<body class="archive category category-gnews category-3">


<jsp:include page="/jsp/include/head2.jsp"></jsp:include>


<div class="movedown"></div>

<div class="wrapper">

    <div class="middle-container">
        <div class="right-top-banner gnews-banner-major">
            <div></div>
        </div>
        <div class="middle-top"></div>
        <div class="middle">


            <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">
                <div class="page-head"><h2>创建课程</h2></div>
                <div class="page-body clearfix">

                    <div class="page-body-main">
                        <div class="control-group" style="margin-left: 120px; width: 85%" >
                            <div class="help-block" style="margin-top:10px">请上传课程封面图，支持jpg,jpeg,gif,png</div>
                            <textarea rows="20" class="xheditors" id="content" name="content" required="required" style="overflow:auto;width:100%"><strong>温馨提示：选择适当的封面图片可以让你的课程更受欢迎哦 []~(￣▽￣)~*。留空系统将采用默认图片，默认显示文字无需删除。</strong></textarea>
                        </div>

                        <form id="course-create-form" class="form-horizontal" method="post" action="createCourse.htm" data-widget="validator-bootstrap" data-auto-submit="false" data-auto-focus="false">
                            <div class="control-group ui-form-item">
                                <label class="control-label ui-label" for="course-title-field">标题</label>
                                <div class="controls">
                                    <input id="course-title-field" class="input-with-feedback" type="text" name="courseTitle" data-display="标题" required />
                                    <div class="help-block">给课程取个通俗易懂的标题</div>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="course-summary-field">简介</label>
                                <div class="controls">
                                    <textarea id="course-summary-field" class="input-with-feedback mceEditor" rows="5" name="courseIntro" style="width:100%;"></textarea>
                                    <div class="help-block">请简述课程的内容</div>
                                </div>
                            </div>

                            <style type="text/css">
                                #course-category-control-group select {
                                    width: 100px;
                                    margin-right: 5px;
                                }
                            </style>
                            <div class="control-group" id="course-category-control-group">
                                <label class="control-label">课程分类</label>
                                <div class="controls">
                                    <select name="type">
                                        <c:forEach items="${dataDicList}" var="data">
                                            <option value="${data.dicValue}">${data.dicValue}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls">
                                    <button type="submit" class="btn btn-success">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </article>


            <div class="movedown2"></div>

        </div> <!-- end .right -->
        <div class="middle-bottom"></div>

        <div class="movedown"></div>

    </div> <!-- end .right-container -->

    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</div>

</body>
<script type="text/javascript">
    jQuery(function($){
        if($('textarea.xheditors').length!=0){
            $('textarea.xheditors').xheditor({
                upLinkUrl:"uploadFile.htm",
                upLinkExt:"zip,rar,txt,doc,docx,pdf,ppt,pptx,pps,ppsx,xlsx,xls,7z",
                upImgUrl:"uploadPic.htm",
                upImgExt:"jpg,jpeg,gif,png", tools:'mini',
                forcePtag:false,
                html5Upload:false,
                emotMark:true
            });
        }
    });
</script>
