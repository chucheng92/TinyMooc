<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">

<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v3.css"/>">
<script type="text/javascript" src="<c:url value="/resource/js/ga.js"/>"></script>

<%-- 本页面为用户未登录时主页 --%>

<title>萌课网-首页</title>
</head>
<body class="flats-theme">
<c:if test="${empty user}">
    <jsp:include page="/jsp/include/head1.jsp"></jsp:include>
</c:if>
<c:if test="${!empty user}">
    <jsp:include page="/jsp/include/head2.jsp"></jsp:include>
</c:if>
	
	<section class="container homepage">

		<div class="flat">
			<ul class="features clearfix">
				<li>
					<div class="feature">
						<i class="feature-icon feature-plan"></i>
						<div class="title">有计划的学习</div>
						<div class="note">一系列学习小工具，让你随时记录学习笔记、掌握学习进度。</div>
					</div>
				</li>
				<li>
					<div class="feature">
						<i class="feature-icon feature-friend"></i>
						<div class="title">找到学习的伙伴</div>
						<div class="note">向老师提问，与同学交流，让学习之路不再寂寞。</div>
					</div>
				</li>
				<li>
					<div class="feature">
						<i class="feature-icon feature-share"></i>
						<div class="title">分享你的知识</div>
						<div class="note">创建课程，让知识在流动中发光！</div>
					</div>
				</li>
			</ul>

			<div class="signup-bar clearfix">
				<div class="saying">
					<div class="text">学习是为了探索这个世界的本质。</div>
					<div class="speaker">--- 萌课网</div>
				</div>
				<div class="signup-btns">
					<a href="goRegisterPage.htm" class="btn btn btn-large signup-btn">立即注册</a>
					<div class="connects">
						已有帐号登录： <a href="#"><img src="/resource/pic/qq_48x48.gif" width="24" height="24"></a>
                        <a href="#"><img src="/resource/pic/weibo_48x48.png" width="24" height="24"></a>
                        <a  href="#"><img src="/resource/pic/renren_48x48.gif" width="24" height="24"></a>
                        <a href=""><img src="/resource/pic/douban_48x48.gif" width="24" height="24"></a>
					</div>

				</div>
			</div>
		</div>

		<!-- 推荐课程 -->

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
			<h2>最新课程 | 哇塞，又有新课开放了，感觉飞起来</h2>
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
				<li class="cell"><a href="goMajorHome.htm?type=公开课"><i
						class="channel-icon channel-icon-culture"></i>公开课</a></li>
				<li class="cell"><a href="goMajorHome.htm?type=其他"><i
						class="channel-icon channel-icon-openclass"></i>其他</a></li>
			</ul>
		</div>

		<!-- 友情链接 -->

		<div class="flat clearfix">
			<h2>友情链接</h2>
			<a href="https://cloud.seu.edu.cn/contest/" target="_blank" class="mrs">云计算创新大赛</a>
			| <a href="http://news.qq.com/" target="_blank" class="mrs">腾讯新闻</a>
			| <a href="http://www.qq.com/" target="_blank" class="mrs">QQ</a>
			| <a href="http://v.qq.com/" target="_blank" class="mrs">腾讯视频</a>
			| <a href="https://github.com/" target="_blank" class="mrs">
				GitHub</a> | <a href="http://maven.apache.org/" target="_blank" class="mrs">maven</a>
			| <a href="http://www.qcloud.com/" target="_blank" class="mrs">腾讯云</a>
			| <a href="http://www.xmu.edu.cn/" target="_blank" class="mrs">厦门大学</a>
			|
		</div>


	</section>

	<jsp:include page="/jsp/include/foot.jsp"></jsp:include>
</body>
</html>