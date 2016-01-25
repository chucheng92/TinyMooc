<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的萌课 - 萌课网</title>
  <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>
</head>

<body class="archive category category-gnews category-3">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>


<div class="movedown">
</div>

<div class="wrapper">

    <div class="my-left">

        <header>
            <div class="movedown"></div>
            <div class="side">

                <jsp:include page="/jsp/include/leftside.jsp"></jsp:include>

            </div>
        </header>

        <div class="garlic"></div>

    </div>

    <div class="my-middle">
        <div class="right-top-banner gnews-banner-mytinymooc">
            <div></div>
        </div>
        <div class="right-top"></div>
        <div class="right">

            <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">
                <div class="main-main">


                    <div class="mod">

                        <div class="tab-bar">
                            <ul class="clearfix">
                                <li ><a href="myTinyMooc.htm">课程推荐</a></li>
                                <li class="active"><a href="recommendTeam.htm">小组推荐</a></li>

                            </ul>
                        </div>
                    </div>

                    <%-- 小组推荐 --%>
                    <div class="mod">
                        <div id="course-recommend" class="course-rows">
                            <c:forEach items="${teamList}" var="userTeam">

                                <div class="course-row" id="course-row-4612">
                                    <div class="imageblock">

                                        <div class="imageblock-image"><a href="teamHomePage.htm?teamId=${userTeam.team.teamId}"><img src="<c:url value="${userTeam.team.headImage.imageSmall}"/>"></a></div>
                                        <div class="imageblock-content">
                                            <div class="title">
                                                <a href="teamHomePage.htm?teamId=${userTeam.team.teamId}">${userTeam.team.teamName}</a>
                                            </div>
                                            <div class="summary">${userTeam.team.teamIntro}</div>
                                            <div class="metas">
                                                创建者： <a href="goPersonnal.htm?userId=${userTeam.user.userId}" class="show-user-card" title="${userTeam.user.userName}">${userTeam.user.userName}</a>
                                                &nbsp;&nbsp;建设度：<a href="">${userTeam.team.construction}</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                    </div>
                </div>

            </article>

        </div> <!-- end .right -->
        <div class="right-bottom"></div>

        <div class="movedown"></div>
    </div>

    <div class="my-right">
        <header>
            <div class="movedown"></div>

            <div class="main-side">

                <div class="mod checkin-mod clearfix" id="checkin-mod" style="">
                    <div class="btn-bar">
                        <div class="day">${month}.${day}<br /><strong>周${week}</strong></div>
                        <div class="checkin-text">分享给好友</div>
                        <a href="#" class="btn btn-small checkin-btn"><strong>分享</strong></a>
                        <div class="point-num"></div>
                    </div>
                </div>

                <li id="menu-item-4" class="menu-item menu-item-type-taxonomy menu-item-object-category current-menu-item menu-item-4 gnews-menu-major-board"><a href="turnToHomePage.htm"></a></li>



                <div class="mod">
                    <div class="mod-head"><h3><span>创建课程</span></h3></div>
                    <div class="gray mbs tar">
                        <span class="badge badge-warning fss">NEW</span> 创建课程，拿金币，做达人！
                    </div>
                    <div class="mbm"><a href="createCoursePage.htm" class="btn btn-success btn-large" style="width: 180px;">创建课程</a></div>
                    <div class="clearfix"><a href="howToCreate.htm" class="fr">如何创建课程？</a></div>
                </div>

                <li id="menu-item-4" class="menu-item menu-item-type-taxonomy menu-item-object-category current-menu-item menu-item-4 gnews-menu-major-board"><a href="turnToHomePage.htm"></a></li>

                <%--达人列表 expertList--%>
                <div class="mod">
                    <div class="mod-head">
                        <a href="javascript:;" id="change-recommend-daren-btn" class="more">换一组</a>
                        <h3><span>达人推荐</span></h3>
                    </div>
                    <ul id="recommend-daren-list">
                        <c:forEach items="${expertList}" var="expert">
                            <li style="display:block;">
                                <div class="imageblock clearfix">
                                    <div class="imageblock-image">
                                        <a href="goPersonal.htm?userId=${expert.userId}" class="show-user-card" >
                                            <img src="<c:url value="${expert.headImage.imageSmall}"/>" title="${expert.userName}"></a>
                                    </div>
                                    <div class="imageblock-content">
                                        <div class="mbs"><a href="goPersonal.htm?userId=${expert.userId}" class="show-user-card " title="${expert.userName}">${expert.userName}</a></div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <li id="menu-item-4" class="menu-item menu-item-type-taxonomy menu-item-object-category current-menu-item menu-item-4 gnews-menu-major-board"><a href="turnToHomePage.htm"></a></li>

                <%--标签列表 labelList--%>
                <div class="mod">
                    <div class="mod-head">
                        <h3><span>热门标签</span></h3>
                    </div>
                    <div class="tags">
                        <c:forEach items="${labelList}" var="label">
                            <a href="" class="tag">${label.labelName}</a>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </header>
    </div>

    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</div>

</body>
</html>