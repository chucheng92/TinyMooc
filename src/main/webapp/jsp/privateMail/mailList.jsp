<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ include file="/resource/jspf/commons.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>
    <title>私信列表 - 萌课网</title>
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
                    <a href="goSendMail.htm" class="btn btn-success btn-small fr"><span>写私信</span></a>
                    <h2>私信</h2>
                </div>
                <div class="mod">
                    <div class="mbm clearfix">
                        <span>共有${mailNum}个会话</span>
                    </div>
                    <ul class="message-thread-list mbm">
                        <c:forEach items="${mailList}" var="mail">
                            <li>
                                <table width="100%">
                                    <tbody><tr>
                                        <td>
                                            <div class="clearfix pts pbs">
                                                <img src="<c:url value="${mail[0].headImage.imageMid}"/>" class="avatar">
                                                <c:if test="${mail[2]=='未读'}">
                                                    <div class="time pls">有未读</div>
                                                </c:if>
                                                <div class="thread-main">
                                                    <div class="author">
                                                            ${mail[0].userName}
                                                    </div>
                                                    <a href="getDetail.htm?userId=${mail[0].userId}" class="thread-link">最新消息&nbsp;${mail[1]}</a>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="pl5" width="10px"><a href="deleteMail.htm" onclick="return confirm('真的要删除么?')">x</a></td>
                                    </tr>
                                    </tbody></table>
                            </li>
                        </c:forEach>
                    </ul>
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