<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的萌课- 萌课网</title>
    <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
</head>
<body class="flats-theme">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

<section class="container clearfix" style="margin-top: 60px;">
    <div id="me" class="me clearfix">
        <div class="main">
            <div class="wrap">
                <div class="main-main">


                    <div class="mod">

                        <div class="tab-bar">
                            <ul class="clearfix">
                                <li class="active"><a href="myTinyMooc.htm">课程推荐</a></li>
                                <li ><a href="recommendTeam.htm">小组推荐</a></li>

                            </ul>
                        </div>
                    </div>

                    <%-- 课程推荐 --%>
                    <div class="mod">
                        <div id="course-recommend" class="course-rows">
                            <c:forEach items="${hotCourseList}" var="hotCourse">

                                <div class="course-row" id="course-row-4612">
                                    <div class="imageblock">

                                        <div class="imageblock-image"><a href="courseDetailPage.htm?courseId=${hotCourse.course.courseId}"><img src="/resource/pic/h2.jpg"></a></div>
                                        <div class="imageblock-content">
                                            <div class="title">
                                                <a href="courseDetailPage.htm?courseId=${hotCourse.course.courseId}">${hotCourse.course.courseTitle}</a>
                                            </div>
                                            <div class="summary">${hotCourse.course.courseIntro}</div>
                                            <div class="metas">
                                                By&nbsp;<a href="goPersonal.htm?userId=${hotCourse.user.userId}" class="show-user-card" title="${hotCourse.user.userName}">${hotCourse.user.userName}</a>
                                                &nbsp;&nbsp;浏览量：${hotCourse.course.scanNum}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <div class="main-side">

                    <div class="mod checkin-mod clearfix" id="checkin-mod" style="">
                        <div class="btn-bar">
                            <div class="day">${month}.${day}<br /><strong>周${week}</strong></div>
                            <div class="checkin-text">分享给好友</div>
                            <a href="#" class="btn btn-small checkin-btn"><strong>分享</strong></a>
                            <div class="point-num"></div>
                        </div>
                    </div>



                    <div class="mod">
                        <div class="mod-head"><h3><span>创建课程</span></h3></div>
                        <div class="gray mbs tar">
                            <span class="badge badge-warning fss">NEW</span> 创建课程，拿金币，做达人！
                        </div>
                        <div class="mbm"><a href="createCoursePage.htm" class="btn btn-success btn-large" style="width: 180px;">创建课程</a></div>
                        <div class="clearfix"><a href="howToCreate.htm" class="fr">如何创建课程？</a></div>
                    </div>

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
                                            <img src="<c:url value="${expert.headImage.imageMid}"/>" title="${expert.userName}"></a>
                                        </div>
                                        <div class="imageblock-content">
                                            <div class="mbs"><a href="goPersonal.htm?userId=${expert.userId}" class="show-user-card " title="${expert.userName}">${expert.userName}</a></div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

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

            </div>
        </div>
        <div class="side">

            <div class="avatar-mod clearfix">
                <a href="goPersonnal.htm?userId=${user.userId}" class="avatar"><img src="<c:url value="${user.headImage.imageMid}"/>" /></a>
                <div class="infos">
                    <div class="nickname"><a>${user.userName}</a></div>
                    <div class="icons">
                        <a class="user-level user-level-6"  href="" target="_blank">${level.lv}级</a>
                        <a class="user-level user-level-6"  href="">${level.title}</a>
                    </div>
                </div>
            </div>

            <div class="stats-mod">
                <ul class="user-stats clearfix">
                    <li><a href=""><strong>${user.credit}</strong>学分</a></li>
                    <li><a href=""><strong>${user.gold}</strong>金币</a></li>
                </ul>
            </div>

            <div class="menu-mod clearfix">
                <ul class="menus">
                    <li class="active"><a href="myTinyMooc.htm"><i class="feature-icon feature-icon-home"></i>我的萌课</a></li>
                    <li ><a href="courseList.htm"><i class="feature-icon feature-icon-teach"></i>课程管理</a></li>
                    <li ><a href="goNote.htm"><i class="feature-icon feature-icon-note"></i>笔记</a></li>
                    <%--<li ><a href="challenge.htm"><i class="feature-icon feature-icon-faq"></i>微挑战</a></li>--%>
                    <%--<li ><a href="rank.htm"><i class="feature-icon feature-icon-faq"></i>微排行</a></li>--%>
                    <%--<li ><a href="myrank.htm"><i class="feature-icon feature-icon-faq"></i>我的排行</a></li>--%>
                    <li ><a href="teamPage.htm"><i class="feature-icon feature-icon-group"></i>小组</a></li>
                    <%--<li ><a href="shop.htm"><i class="feature-icon feature-icon-faq"></i>商城</a></li>--%>
                    <%--<li ><a href="myprop.htm"><i class="feature-icon feature-icon-faq"></i>我的道具</a></li>--%>
                    <li ><a href="myFavotite.htm"><i class="feature-icon feature-icon-favorite"></i>收藏夹</a></li>
                </ul>

                <div class="divider"></div>

                <ul class="menus">
                    <li ><a href="myAttention.htm"><i class="feature-icon feature-icon-friend"></i>好友</a></li>
                    <li ><a href="goPrivateMail.htm"><i class="feature-icon feature-icon-message"></i>私信</a></li>
                </ul>

                <div class="divider"></div>

                <ul class="menus">
                    <li ><a href="recommendTeam.htm"><i class="feature-icon feature-icon-coin"></i>金币</a></li>
                    <li ><a href="account.htm"><i class="feature-icon feature-icon-setting"></i>账户设置</a></li>
                </ul>
            </div>

        </div>
    </div>

</section>


<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body>
</html>