<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>

    <title>我的关注 - 萌课网</title>
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
        <div class="right-top-banner gnews-banner-friendlist">
            <div></div>
        </div>
        <div class="right-top"></div>
        <div class="right">


            <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">
                <div class="mod">

                    <div class="tab-bar">
                        <ul class="clearfix">
                            <li class="active"><a href="myAttention.htm">关注的人</a></li>
                            <li><a href="myFans.htm">粉丝</a></li>

                        </ul>
                    </div>
                </div>

                <div class="mod">
                    <div class="thin-tab mbm" id="friend-groups-nav">
                        <a href="" class="on">全部</a>
                    </div>


                    <p class="mbm">
                        <span class="gray">共${sum}人</span>
                    </p>

                    <ul class="friend-list list vlist mbl" id="friend-list">
                        <c:forEach items="${list}" var="list">
                            <li class="item lightitem item-border">
                                <div class="imageblock clearfix mvm">
                                    <div class="imageblock-image"><img src="<c:url value="${list.userByAttentionedUserId.headImage.imageSmall}"/>">
                                    </div>
                                    <div class="imageblock-content">
                                        <div class="user-relation">
                                            <c:if test="${list.attentionEach=='互粉'}">
                                                <p>
                                                    相互关注
                                                </p>
                                            </c:if>
                                            <c:if test="${empty list.attentionEach}">
                                                <p>
                                                    已关注
                                                </p>
                                            </c:if>
                                            <p class="extra">
                                                <a href="delAttention1.htm?userBid=${list.userByAttentionedUserId.userId}&type=0" class="unfollow-opt">取消关注</a>
                                            </p>
                                        </div>
                                        <p>
                                            <span class="fr counter"></span>
                                            <span class="fsm"><a href="" class="show-user-card " data-uid="1359470" >${list.userByAttentionedUserId.userName}</a></span>
                                        </p>
                                    </div>
                                </div>

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