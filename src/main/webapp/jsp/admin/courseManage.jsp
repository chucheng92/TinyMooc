<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sicd" uri="/sicd-tags"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value="/resource/css/bootstrap.min.css"/>" />
<link rel="stylesheet" href="<c:url value="/resource/css/bootstrap-responsive.min.css"/>" />
<link rel="stylesheet" href="<c:url value="/resource/css/fullcalendar.css"/>" />
<link rel="stylesheet" href="<c:url value="/resource/css/unicorn.main.css"/>" />
<link rel="stylesheet" href="<c:url value="/resource/css/unicorn.grey.css"/>" class="skin-color" />
<script src="<c:url value="/resource/js/excanvas.min.js"/>"></script>
<script src="<c:url value="/resource/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resource/js/jquery.ui.custom.js"/>"></script>
<script src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resource/js/jquery.flot.min.js"/>"></script>
<script src="<c:url value="/resource/js/jquery.flot.resize.min.js"/>"></script>
<script src="<c:url value="/resource/js/jquery.peity.min.js"/>"></script>
<script src="<c:url value="/resource/js/unicorn.js"/>"></script>
<title>用户管理 - 萌课网</title>
    <script type="text/javascript">

        function _search()
        {
            var form = document.form1;
            form.searchValue.value = (form.searchValue.value).replace(/[&\|\\\*^%$#@\-]/g,"");
            if(form.searchValue.value == '')
            {
                alert("输入需要搜索关键字！");
                return false;
            }
            form.action ='searchCourseIndex.htm';
        }
    </script>
</head>
<body>
<div id="header">
			<h1><a href="">MicroCourse Admin</a></h1>		
		</div>

<form name="form1"  method="post" onsubmit="return _search()">
    <div id="search">
        <input type="text" name="searchValue"  placeholder="Search here..." /><button type="submit" class="tip-right" title="Search"><i class="icon-search icon-white"></i></button>
    </div>
</form>
		<div id="user-nav" class="navbar navbar-inverse">
            <ul class="nav btn-group">
                <li class="btn btn-inverse"><a title="" href="#"><i class="icon icon-user"></i> <span class="text">${admin.userName}</span></a></li>
                <li class="btn btn-inverse dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Messages</span> <span class="label label-important">${sumEmail}</span></a>
                </li>
                <li class="btn btn-inverse"><a title="" href="logout1.htm"><i class="icon icon-share-alt"></i> <span class="text">注销</span></a></li>
            </ul>
        </div>
            
		<div id="sidebar">
			<a href="" class="visible-phone"><i class="icon icon-file"></i>课程管理</a>
			<ul>
				<li><a href="goAdminHome.htm"><i class="icon icon-home"></i><span>统计信息</span></a></li>
				<li class="submenu">
					<a href="#"><i class="icon icon-th-list"></i> <span>规则管理</span> <span class="label">2</span></a>
					<ul>
						<li><a href="turnToCreditAndGold.htm">积分金币管理</a></li>
						<li><a href="turnToLevelManage.htm">等级管理</a></li>
					</ul>
				</li>
				<li class="submenu open active">
					<a href="turnToCourseManage.htm"><i class="icon icon-tint"></i> <span>课程管理</span> <span class="label">3</span></a>
					<ul>
						<li><a href="turnToCourseManage.htm">申请中课程</a></li>
						<li><a href="turnToNormalCourse.htm">已批准的课程</a></li>
						<li><a href="turnToLockCourse.htm">封禁的课程</a></li>
					</ul>
				</li>
				<li><a href="turnToTeamManage.htm"><i class="icon icon-user"></i> <span>小组管理</span></a></li>
				<li><a href="turnToUserManage.htm"><i class="icon icon-user"></i> <span>用户管理</span></a></li>
				<li><a href="turnToAuthorManage.htm"><i class="icon icon-pencil"></i> <span>权限管理</span></a></li>
				<li><a href=""><i class="icon icon-th"></i> <span>爬虫管理</span></a></li>
				<li class="submenu">
					<a href="#"><i class="icon icon-file"></i> <span>网站信息维护</span> <span class="label">6</span></a>
					<ul>
						<li><a href="showInformList.htm">举报管理</a></li>
						<li><a href="#">公告管理</a></li>
						<li><a href="turnToLogManage.htm">日志管理</a></li>
						<li><a href="turnToDictionaryManage.htm">数据字典维护</a></li>
						<li><a href="sensitiveWorlList.htm">敏感词汇管理</a></li>
						<li><a href="turnToFriendLinkManage.htm">友情链接管理</a></li>
					</ul>
				</li>
			</ul>
		
		</div>
		
		<div id="style-switcher">
			<i class="icon-arrow-left icon-white"></i>
			<span>Style:</span>
			<a href="#grey" style="background-color: #555555;border-color: #aaaaaa;"></a>
			<a href="#blue" style="background-color: #2D2F57;"></a>
			<a href="#red" style="background-color: #673232;"></a>
		</div>
		<div id="content">
			<div id="content-header">
				<h1>课程管理</h1>
			</div>
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a>
				<a href="#">课程管理</a>
				<a href="#" class="current">申请中的课程</a>
			</div>
			<div class="container-fluid">
				<div class="page">
		<div class="page-container">
			<div class="container">
				<div class="row">
					<div class="span12">						
						<h4 class="header">申请中的课程</h4>
						
						<table class="table table-striped sortable" >
							<thead>
								<tr>
									<th>课程标题</th>
								
									<th>课程简介</th>
									<th>课程类型</th>	
									<th>申请时间</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${courseList}" var="courseList">
								<tr>
									<td style="text-align:center;"><c:out value="${courseList.courseTitle}"/></td>
									
									<td style="text-align:center;"><c:out value="${courseList.courseIntro}"/></td>
									<td style="text-align:center;"><c:out value="${courseList.type}"/></td>
									<td style="text-align:center;"><c:out value="${courseList.applyDate}"/></td>
									<td style="text-align:center;"><span class="label label-success">申请中</span></td>
									<td style="text-align:center;">
											<a class="btn success" href="turnToLessonManage.htm?courseId=${courseList.courseId}">审核</a>
									</td>
								</tr>
								</c:forEach>							
							</tbody>
						</table>
						<div class="pagination pagination-centered">
						<ul>
						<li><sicd:page curPage="${curPage}" url="${url}" totalPage="${totalPage}" /></li>
						</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
				
				<div class="row-fluid">
					<div id="footer" class="span12">
						2012 &copy; Unicorn Admin. Brought to you by <a href="https://wrapbootstrap.com/user/diablo9983">diablo9983</a>
					</div>
				</div>
			
			
			
			
			</div>
		</div>
		
</body>
</html>