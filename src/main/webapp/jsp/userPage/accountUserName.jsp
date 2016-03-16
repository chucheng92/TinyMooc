<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>更改昵称 - 萌课网</title>
  <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">

<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v3.css"/>">
<script type="text/javascript" src="<c:url value="/resource/js/ga.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/css/scojs.css"/>">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>

    <script type="text/javascript" src="<c:url value="/resource/js/sco.message.js"/>"></script>
</head>
</head>


<body class="archive category category-gnews category-3">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

<script type="text/javascript">
    $(document).ready(function() {
        var messageNickname = "${requestScope.messageNickname}";
        if(messageNickname==null || messageNickname=='null' || messageNickname==""){

        }else{
            $.scojs_message(messageNickname, $.scojs_message.TYPE_OK);
        }
    });
</script>


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
                    <h2>更改昵称</h2>
                </div>

                <div class="mod">
                    <div class="tabs clearfix">
                        <ul>
                            <li class="on"><a href="account.htm">个人资料</a></li>
                            <li><a href="goAccountAvatar.htm">更新头像</a></li>
                            <li><a href="goAccountPassword.htm">修改密码</a></li>
                            <li><a href="queryLabel.htm?type=user">添加标签</a></li>

                        </ul>
                    </div>

                    <form id="account-nickname-form" class="form-horizontal" method="post" action="accountUserName.htm">
                        <div class="control-group">
                            <label class="control-label">昵称:</label>
                            <div class="controls">
                                <input type="text" name="userName" class="span4" />
                                <div class="help-block">昵称最多16个字符，支持中英文、数字、下划线，一个中文字算2个字符</div>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <div class="alert">注意：修改一次昵称，需要5个金币！</div>
                                <button type="submit" class="btn btn-success">保存</button>
                            </div>
                        </div>

                    </form>
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