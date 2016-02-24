<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sicd" uri="/sicd-tags"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/bootstrap.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">
<link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v3.css"/>">

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>

    <script type="text/javascript" src="<c:url value="/resource/js/sea.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resource/js/ga.js"/>"></script>
<title>课程</title>
</head>

<body class="archive category category-gnews category-3">

	<c:if test="${empty user.userId}">
	<jsp:include page="/jsp/include/head1.jsp"></jsp:include>
	</c:if>
	<c:if test="${!empty user.userId}">
		<jsp:include page="/jsp/include/head2.jsp"></jsp:include>
	</c:if>


    <div class="movedown"></div>
    <div class="wrapper">

        <div class="middle-container">
            <div class="right-top-banner gnews-banner-major">
                <div></div>
            </div>
            <div class="middle-top"></div>
            <div class="middle">


                <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">
                    <h2><font color="black">课程频道</font></h2>
                    <ul class="cells channel-cells">
                        <li class="cell"><a href="goMajorHome.htm?type=摄影"><i
                                class="channel-icon channel-icon-photography"></i>摄影</a></li>
                        <li class="cell"><a href="goMajorHome.htm?type=艺术"><i
                                class="channel-icon channel-icon-programme"></i>艺术</a></li>
                        <li class="cell"><a href="goMajorHome.htm?type=兴趣"><i
                                class="channel-icon channel-icon-interest"></i>兴趣</a></li>
                        <li class="cell"><a href="goMajorHome.htm?type=计算机"><i
                                class="channel-icon channel-icon-computer"></i>计算机</a></li>
                        <li class="cell"><a href="goMajorHome.htm?type=文学"><i
                                class="channel-icon channel-icon-language"></i>文学</a></li>
                        <li class="cell"><a href="goMajorHome.htm?type=求职"><i
                                class="channel-icon channel-icon-life"></i>求职</a></li>
                        <li class="cell"><a href="goMajorHome.htm?type=动漫"><i
                                class="channel-icon channel-icon-career"></i>动漫</a></li>
                        <li class="cell"><a href="goMajorHome.htm?type=音乐"><i
                                class="channel-icon channel-icon-culture"></i>音乐</a></li>
                        <li class="cell"><a href="goMajorHome.htm?type=其他"><i
                                class="channel-icon channel-icon-openclass"></i>其他</a></li>
                    </ul>
                    <hr class="custom-hr">
                </article>

                <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">
                    <div class="channel-row channel-straight-row clearfix">
                        <div class="flat">
                            <div class="clearfix">
                                <h2 class="fl"><font color="black">全部课程</font></h2>
                                <div class="discuss-list2">
                                    <span  class="metas" style="margin-left: 10px;">排序:&nbsp;&nbsp;<a href="goCourseHome.htm">默认</a>&nbsp;&nbsp;<a href="goCourseHome.htm?filterType=grade">评分</a>&nbsp;&nbsp;<a href="goCourseHome.htm?filterType=time">最新</a>&nbsp;&nbsp;<a href="goCourseHome.htm?filterType=hot">最热</a></span>
                                </div>
                                <a href="" class="fr more"><font color="black">» 更多</font></a>
                            </div>
                            <ul class="cells cells-middle">
                                <c:forEach items="${list1}" var="list1">
                                    <li class="cell">
                                        <div class="course-item">
                                            <div class="thumb">
                                                <a href="courseDetailPage.htm?courseId=${list1.course.courseId}"><img src="${list1.course.logoUrl}"></a>
                                            </div>
                                            <p class="title">
                                                <a href="courseDetailPage.htm?courseId=${list1.course.courseId}">${list1.course.courseTitle}</a>
                                            </p>
                                            <div class="summary">${list1.course.courseIntro}</div>
                                            <p class="metas clearfix">
                                                <span title="查看次数" style="float: right;"><i class="icon-signal"></i>${list1.course.scanNum}</span>
							<span class="fl by">by
								<a href="goPersonnal.htm?userId=${list1.user.userId}" class="show-user-card" title="">${list1.user.userName}</a>
							</span>
                                            </p>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="pagination pagination-centered">
                        <ul>
                            <li><sicd:page curPage="${curPage}" url="${url}" totalPage="${totalPage}" /></li>
                        </ul>
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
</html>