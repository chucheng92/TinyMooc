<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>写私信 - 萌课网</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>

    <script type="text/javascript" src="<c:url value="/resource/js/sendMail.js"/>"></script>
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
        <div class="right-top-banner gnews-banner-mail">
            <div></div>
        </div>
        <div class="right-top"></div>
        <div class="right">


            <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">
                <div class="main-head">
                    <a href="goPrivateMail.htm" class="fr">« 返回私信箱</a>
                    <h2>写私信</h2>
                </div>

                <div class="mod">
                    <%--<div class="alert alert-error" id="name"></div>改用scojs错误提示--%>

                    <form class="form-horizontal" method="post" id="message-form" action="sendMail.htm" name="form1">
                        <div class="control-group">
                            <label class="control-label required" for="message_receivers">收件人:</label>
                            <div class="controls">
                                <input type="text" id="message_receivers" value="请填写对方的用户名" name="userName" required="required" class="input input-xlarge" onblur="checkReg()">

                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label required" for="message_message">内容:</label>
                            <div class="controls">
                                <textarea id="message_message" name="context" required="required" rows="8" class="input input-xlarge" maxlength="1000"></textarea>
                            </div>
                        </div>

                        <div class="control-group">

                            <div class="controls">
                                <button type="submit" class="btn btn-success" onclick="validate()">发送</button>
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

</body></html>