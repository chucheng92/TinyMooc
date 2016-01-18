<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/resource/js/sea.js"/>"></script>
<script type="text/javascript">
	$('.carousel').carousel();
</script>
<title>萌课网</title>
</head>
<body class="flats-theme">


	<c:if test="${empty user.userId}">
	<jsp:include page="/jsp/include/head1.jsp"></jsp:include>
	</c:if>
	<c:if test="${!empty user.userId}">
		<jsp:include page="/jsp/include/head2.jsp"></jsp:include>
	</c:if>
	
	
	
	
<section class="container channel">

	<div class="channel-header channel-row">
		<h1>
			<a href="">${type}</a>
		</h1>
	</div>
	<div class="channel-row clearfix">
		<div class="channel-main">
			<div class="channel-featured flat">
				
				<div class="featured-slider slider">
            		<div class="slides">
            		
            			<div class="slide cloned" style="left:0px;">
            			<c:forEach items="${majorCourseList}" var="course">
                    		<div class="caption">
                        		<div class="title"><a href="">${course.course.courseTitle}</a></div>
                        		<div class="description">${course.course.courseIntro}</div>
                        		<div class="metas">
                           			
                            		<div class="stats">${course.course.scanNum}查看<span class="mhs">|</span><span>by <a href=""title="">${course.user.userName}</a></span></div>
                        		</div>
                    		</div>
                    		</c:forEach>
                    			<a href="" class="cover"><img src="<c:url value="/resource/pic/computer.jpg"/>"></a>
                		</div>
                		
                	</div>
                </div>
				</div>
			</div>
			<div class="channel-side channel-featured-adv"><a href="" target="_blank"><img src="<c:url value="/resource/pic/home/think.jpg"/>" width="300" height="250"></a></div>
		</div>
		
	<div class="channel-row channel-straight-row">
		<div class="flat clearfix">
			<h2>热门课程</h2>
			<ul class="cells cells-middle">


				<c:forEach items="${hotCourseList}" var="course">
				<li class="cell">
					<div class="course-item">
						<div class="thumb">
							<a href="courseDetailPage.htm?courseId=${course.course.courseId}"><img src="<c:url value="/resource/pic/course.jpg"/>"></a>
						</div>
						<p class="title">
							<a href="courseDetailPage.htm?courseId=${course.course.courseId}">${course.course.courseTitle}</a>
						</p>
						<div class="summary">${course.course.courseIntro}</div>
						<p class="metas clearfix">
							<span title="查看次数" style="float: right;"><i class="icon-signal"></i>${course.course.scanNum}</span>
							<span class="fl by">by
								<a href="goPersonnal.htm?userId=${course.user.userId}" class="show-user-card" title="">${course.user.userName}</a>
							</span>
						</p>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<div class="channel-row">
		<div class="flat clearfix">
			<h2>最新小组话题</h2>
			<div class="channel-main">

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
			<div class="gray mvm tar">加入你对味的的小组，查看更多话题吧！</div>
			</div>
			<div class="channel-side">
				<h3>${type}的相关小组</h3>
				<ul class="grids smallpic-grids">
					<c:forEach items="${teamList}" var="team">
						<li class="grid"><a href=""><img src="<c:url value="/resource/pic/team.jpg"/>" title="${team.teamName}" class="thumb"></a>
							<p>
								<a href="" title="${team.teamName}">${teamt.teamName}</a>
							</p>
						</li>
						</c:forEach>
					</ul>

				<div>
					<a href="createGuidePage.htm">» 申请创建小组</a>
				</div>
			</div>
		</div>
	</div>

	<div class="channel-row channel-straight-row clearfix">
		<div class="flat">
			<div class="clearfix">
				<h2 class="fl">最新课程</h2>
				<a href="" class="fr more">» 更多</a>
			</div>
			<ul class="cells cells-middle">
			<c:forEach items="${newCourseList}" var="course">
				<li class="cell">
					<div class="course-item">
						<div class="thumb">
							<a href="#"><img src="<c:url value="/resource/pic/course.jpg"/>"></a>
						</div>
						<p class="title">
							<a href="#">${course.course.courseTitle}</a>
						</p>
						<div class="summary">${course.course.courseIntro}</div>
						<p class="metas clearfix">
							<span title="查看次数" style="float: right;"><i class="icon-signal"></i>${course.course.scanNum}</span>
							<span class="fl by">by
								<a href="goPersonnal.htm?userId=${course.user.userId}" class="show-user-card" title="">${course.user.userName}</a>
							</span>
						</p>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	

	<div class="channel-row">
		<div class="flat clearfix">
			<h3>热门标签</h3>
				
				<div class="tags">
				<c:forEach items="${labelList}" var="label">
					<a href="#" class="tag">${label.labelName}</a>
					</c:forEach>
				</div>
		</div>
	</div>

	<div class="channel-row">
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
	</div>

</section>



<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body>
</html>