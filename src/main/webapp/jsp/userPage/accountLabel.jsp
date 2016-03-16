<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf" %>
 <%@ taglib prefix="sicd" uri="/sicd-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>标签</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>

    <script type="text/javascript" src="<c:url value="/resource/js/label.js"/>"></script>
</head>


<body class="archive category category-gnews category-3">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>


<div class="movedown"></div>

<div class="wrapper">
    <div class="left">
        <header>
            <div class="movedown"></div>
            <div class="side">

                <jsp:include page="/jsp/include/leftside.jsp"></jsp:include>

            </div>
        </header>

        <div class="garlic"></div>

    </div>

    <div class="right-container">
        <div class="right-top-banner gnews-banner-account">
            <div></div>
        </div>
        <div class="right-top"></div>
        <div class="right">


            <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">
                <div class="main-head">
                    <h2>帐户设置</h2>
                </div>


                <div class="mod">
                    <div class="tabs clearfix">
                        <ul>
                            <li><a href="account.htm">个人资料</a></li>
                            <li><a href="goAccountAvatar.htm">更新头像</a></li>
                            <li><a href="goAccountPassword.htm">修改密码</a></li>
                            <li class="on"><a href="queryLabel.htm?type=user">添加标签</a></li>

                        </ul>
                    </div>
                    <div class="mod">
                        <div class="addLabels" style=" height:300px; width:400px;float:left;" align="left">
                            <form action="editLabel.htm" method="post" id="labelForm">
                                <div class="keywords">
                                    当前标签编辑类型：<c:if test="${type=='course'}"><font color="red">课程</font></c:if>
                                    <c:if test="${type=='user'}"><font color="red">用户</font></c:if>
                                    <c:if test="${type=='team'}"><font color="red">小组</font></c:if>
                                    <sicd:label previousLabels="${previousLabels}" hotLabels="${labels}"/>
                                    <input type="hidden" value="${type}" name="type">
                                    <input type="hidden" value="${courseId}" name="courseId">
                                    <input type="hidden" value="${teamId}" name="teamId">
                                    <%--${type}--%>
                                    <%--<input type="hidden" value="${tagType}" name="type">--%>
                                </div>
                                <br>
                                <button  class="btn btn-success" type="submit" value="" id="checkl" >保存</button>

                                <button class="btn" type="button" value="" id="cancelll">取消</button>
                            </form>
                        </div>
                    </div>
                </div>

            </article>

            <div class="movedown2"></div>

        </div> <!-- end .right -->
        <div class="right-bottom"></div>

        <div class="movedown"></div>

    </div> <!-- end .right-container -->

    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>
</div>

</body>
</html>