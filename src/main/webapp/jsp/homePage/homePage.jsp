<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%--<link rel="Shortcut Icon" href="/resource/pic/icon.ico"/>--%>
<script type="text/javascript" src="/resource/bootstrap/js/bootstrap.js" ></script>
<script type="text/javascript" src="./resource/bootstrap/js/bootstrap-carousel.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>萌课网-首页</title>
</head>

<body class="flats-theme">
<c:if test="${empty user}">
    <jsp:include page="/jsp/include/head1.jsp"></jsp:include>
</c:if>
<c:if test="${!empty user}">
    <jsp:include page="/jsp/include/head2.jsp"></jsp:include>
</c:if>
		<div>
            <div id="myCarousel" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>
                <!-- Carousel items -->
                <div class="carousel-inner">
                    <div class="active item"><a href="#"><img src="/resource/pic/info/block_picture_1.jpg" /></a></div>
                    <div class="item"><a href="#"><img src="/resource/pic/info/block_picture_2.jpg" /></a></div>
                    <div class="item"><a href="#"><img src="/resource/pic/info/block_picture_3.jpg" /></a></div>
                    <div class="item"><a href="#"><img src="/resource/pic/info/block_picture_4.jpg" /></a></div>
                </div>
                <!-- Carousel nav -->
                <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
            </div>
		</div>

		<!-- 推荐课程 -->
<section class="container homepage">
		<div class="flat clearfix">
			<h2>热门课程 | 瞧瞧大家都在学啥 o(*≧▽≦)ツ</h2>
			<ul class="cells cells-middle">
			<c:forEach items="${hotCourseList}" var="hotCourse" varStatus="iter">
				<li class="cell">
					<div class="course-item">
						<div class="thumb">
							<a href="courseDetailPage.htm?courseId=${hotCourse.course.courseId}"><img src="<c:url value="/resource/pic/courseLogo/course${iter.count}.jpg"/>"></a>
						</div>
						<p class="title">
							<a href="courseDetailPage.htm?courseId=${hotCourse.course.courseId}"><span class="video" title="视频课程"></span>${hotCourse.course.courseTitle}</a>
						</p>
						<div class="summary">${hotCourse.course.courseIntro}</div>
						<p class="metas clearfix">
							<span title="查看次数" style="float: right;"><i class="icon-signal"></i>${hotCourse.course.scanNum}</span>
							<span class="fl by">by
								<a href="#" class="show-user-card" title="">${hotCourse.user.userName}</a>
							</span>
						</p>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>

		<!-- 最新课程 -->

		<div class="flat clearfix">
			<h2>最新课程 | 哇塞，又有新课开放了，赶紧学起来</h2>
			<ul class="cells cells-middle">
			<c:forEach items="${newCourseList}" var="newCourse" varStatus="iter">
				<li class="cell">
					<div class="course-item">
						<div class="thumb">
							<a href="courseDetailPage.htm?courseId=${newCourse.course.courseId}"><img src="<c:url value="/resource/pic/courseLogo/course${iter.count}.jpg"/>"></a>
						</div>
						<p class="title">
							<a href="courseDetailPage.htm?courseId=${newCourse.course.courseId}"><span class="video" title="视频课程"></span>${newCourse.course.courseTitle}</a>
						</p>
						<div class="summary">${newCourse.course.courseIntro}</div>
						<p class="metas clearfix">
							<span title="查看次数" style="float: right;"><i class="icon-signal"></i>${newCourse.course.scanNum}</span>
							<span class="fl by">by
								<a href="#" class="show-user-card" title="">${newCourse.user.userName}</a>
							</span>
						</p>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>

		<!-- 话题、小组 -->


		<div class="flat clearfix">
			<h2>话题、小组</h2>
			<div class="flat-main">
				<h3>最新话题(●'◡'●)ﾉ♥</h3>

				<div class="discuss-list2">
					<ul>
					<c:forEach items="${discussList}" var="discuss">
						<li>
							<div class="imageblock clearfix">
								<div class="imageblock-image">
									<a href=""class="show-user-card" ><img src="${discuss.user.headImage.imageSmall}" title="${discuss.user.userName}"></a>
								</div>
								<div class="imageblock-content">

									<p class="title">
										<a href="">${discuss.topic}</a>
									</p>
									<p class="metas">
										<a href="" title="来自『${discuss.team.teamName}』小组"
											class="mrm">${discuss.team.teamName}</a> by <a
											href=""
											class="show-user-card"  title="${discuss.user.userName}">${discuss.user.userName}</a> <span
											class="mhm">${discuss.scanNum}次查看</span>
											<span class="mls">${discuss.publishDate}</span>
									</p>
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>

				</div>
			</div>

			<!-- 推荐小组 -->


			<div class="flat-side">
				<h3>推荐小组 (￣▽￣")  </h3>
				<div class="clearfix">
					<ul class="grids smallpic-grids">
					<c:forEach items="${teamList}" var="team">
						<li class="grid"><a href=""><img src="<c:url value="${team.headImage.imageSmall}"/>" title="${team.teamName}" class="thumb"></a>
							<p>
								<a href="" title="${team.teamName}">${team.teamName}</a>
							</p>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>


		</div>
		<!-- 笔记、标签 -->
		<div class="flat clearfix">
			<h2>课程笔记和热门标签</h2>
			<div class="flat-main">
				<h3>推荐笔记 (￣▽￣") </h3>
				<ul class="picked-notes">
				<c:forEach items="${noteList}" var="note">
					<li class="mbm">
						<div class="title">
							<a href="">${note.userCourse.course.courseTitle}的笔记</a>
						</div>
						<div class="summary gray">${note.noteContent}</div>
						<div class="metas gray">
							<span class="gray">by</span> <span class="thin mrm"><a
								href="" class="show-user-card"
								 title="${note.userCourse.user.userName}">${note.userCourse.user.userName}</a></span>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>

			<!-- 热门标签 -->

			<div class="flat-side">
				<h3>热门标签 (￣▽￣") </h3>

				<div class="tags">
				<c:forEach items="${labelList}" var="label">
					<a href="#" class="tag">${label.labelName}</a>
					</c:forEach>
				</div>

			</div>

		</div>

		<!-- 课程频道 -->

		<div class="flat clearfix">
			<h2>课程频道</h2>
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
				<li class="cell"><a href="goMajorHome.htm?type=其他"><i
						class="channel-icon channel-icon-openclass"></i>其他</a></li>
			</ul>
		</div>
	</section>

	<jsp:include page="/jsp/include/foot.jsp"></jsp:include>
</body>
</html>