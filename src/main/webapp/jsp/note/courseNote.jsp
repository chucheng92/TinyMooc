<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>私信列表</title>
<link rel="Shortcut Icon" href="<c:url value="/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.css"/>" media="screen">

<script type="text/javascript" src="<c:url value="/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v3.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/bdsstyle.css"/>">
<script type="text/javascript" src="<c:url value="/js/ga.js"/>"></script>
<script type="text/javascript">
	$(function(){
		$(".more-btn.or").click(function(){
			$(this).parent().next().css("display","block");

			});
		$(".less-btn.or").click(function(){
			
			$(this).parent().css("display","none");
			


		});
		});

</script>
</head>
<body class="flats-theme">
<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

	<section class="container course">
		
		<div id="course-main">
			<div id="course-header"
				class="flat course-header course-small-header">
				<div class="imageblock clearfix">
					<div class="imageblock-image">
						<a href=""><img src="" width="48" heiht="48"></a>
					</div>
					<div class="imageblock-content">
						

						<h1 class="mbm">
							<a href="">${course.courseTitle}</a>
						</h1>

						<div style="margin-left: -5px;">
							<div class="clearfix mtm">

								<div class="pills" style="margin-bottom: 0px">
									<a href="" class="on">笔记(${noteSum})</a>
									<a href="http://www.howzhi.com/course/4958/members">学员(${userNum})</a>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<div class="flat">
				<h2>
					笔记
					<div class="channel-column-view fr">
						<div class="btn-group">

							<a href=""
								class="btn btn-mini active">公开笔记</a>
						</div>
					</div>
				</h2>

				<ul class="node-rows note-list" data-role="note-list">
				<c:forEach var="course1" items="${courseList}">
					<c:forEach items="${course1.notes}" var="note">
					<c:if test="${note.public_=='是'}">
					<li class="node-row">
						<div class="imageblock">
							
							<div class="imageblock-content">
								<div>
									<a href="" class="title">${note.userCourse.course.courseTitle}的笔记</a>
								</div>
								<div class="summary">
									<div class="less">
										${note.noteContent}<a href="javascript:;" class="more-btn or">(展开)</a>
									</div>
									<div class="more" style="display: none;">
										<div class="editor-content">
											<p>${note.noteContent}</p>
										</div>
										<a href="javascript:;" class="less-btn or">(收起)</a>
										<div class="mvm clearfix">
											<a href=""class="btn btn-small fr mhs delete-btn">删除</a> 
											<a href=""class="btn btn-small fr mhs">编辑</a> 
											<span data-toggle="favorite" data-key="note-13164"class="status-btn fr mhs status-btn-on">
											<a class="btn btn-small status-on" href="javascript:;">
											<i class="icon-plus"></i> 收藏</a><span class="btn btn-small disabled status-off">已收藏 | <a
													href="javascript:;" class="cancel">取消</a></span></span>

										</div>

									</div>
								</div>
								<div class="metas">
									by <a href="" class="show-user-card ">${note.userCourse.user.userName}</a>
									<span class="mhs time">${note.addDate}</span>
								</div>

							</div>
						</div>
					</li>
					</c:if>
					</c:forEach>
					</c:forEach>
				</ul>


			</div>
			<div class="flat">
				<h2>相关课程</h2>
				<ul class="course-cards" id="course-looking-panel">
					<li>
						<div class="course-item">
							<div class="thumb">
								<a href=""><img src=""></a>
							</div>
							<p class="title">
								<a href=""></span>健康图书馆--斯坦福大学开放课程（第一部分）</a>
							</p>
							<p class="metas clearfix">
								<span class="fr learn" title="学员人数">65</span> <span
									class="fr view mrm" title="查看次数">3820</span> <span
									class="fl by">by <a href="http://www.howzhi.com/u/walk/"
									class="show-user-card " data-uid="40" title="轻步而来">轻步而来<span
										class="p-ver-icn" title="好知个人认证"></span></a></span>
							</p>
						</div>
					</li>
					
				</ul>
			</div>
		</div>
		<div id="course-side">
			<div class="flat">
				<h2>此课程中我的笔记</h2>
				<ul class="text-list">
				<c:forEach items="${courseList1}" var="list">
					<c:forEach items="${list.notes}" var="no1">
						<li><a href="">${course.courseTitle}</a>
						<div class="gray">${no1.noteContent}</div></li>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>


		</div>
	</section>
	
<jsp:include page="/jsp/include/foot.jsp"></jsp:include>
</body>
</html>