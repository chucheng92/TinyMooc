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


<script type="text/javascript">
	$(function() {
		$(".btn.save").click(function() {
			$("#form1").submit();
		});

		$("a.btn.alter").click(
				function() {
					var level = $(this).parent().parent().children("td")
							.eq(0).html();
					var id = $(this).parent().parent().children("td").eq(4)
							.children("input.aid").val();
					//alert(content+"||"+id);
					var title = $(this).parent().parent().children("td")
							.eq(3).html();
					var condition = $(this).parent().parent().children("td")
					.eq(5).html();
					var type = $(this).parent().parent().children("td")
					.eq(8).html();
					$("#level").val(level);
					$("#announcementIdTemp").val(id);
					$("#title").val(title);
					$("#condition").val(condition);
					$("#type").val(type);
				});

		$("#saveChange").click(function() {
			$("#form2").submit();
		});

		$("button.btn.btn-danger").click(
				function() {
					if (confirm("是否真的要删除？")) {
						var id = $(this).parent().parent().children("td").eq(4)
								.children("input.aid").val();
						//alert(id);
						location.href = "deletLevel.htm?levelId="
								+ id;
					} else {
						return false;
					}
				});
	});
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
<title>等级管理 - 萌课网</title>

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
			<a href="" class="visible-phone"><i class="icon icon-home"></i>统计信息</a>
			<ul>
				<li><a href="goAdminHome.htm"><i class="icon icon-home"></i><span>统计信息</span></a></li>
				<li class="submenu open active">
					<a href="#"><i class="icon icon-th-list"></i> <span>规则管理</span> <span class="label">2</span></a>
					<ul>
						<li><a href="turnToCreditAndGold.htm">积分金币管理</a></li>
						<li><a href="turnToLevelManage.htm">等级管理</a></li>
					</ul>
				</li>
				<li class="submenu">
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
				<h1>等级管理</h1>
			</div>
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a>
				<a href="#">规则管理</a>
				<a href="#" class="current">等级管理</a>
			</div>
		<div class="container-fluid">
		
			<div class="page">
		<div class="page-container">
			<div class="container">
				<div class="row">
					<div class="span12">
						<a href="#newAnnounment" data-toggle="modal"
							class="btn pull-right">添加规则</a>
						<h4 class="header">等级管理</h4>
						<table class="table table-striped sortable">
							<thead>
								<tr>
									<th>等级</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>标题</th>
									<th>&nbsp;</th>
									<th>条件</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>类型</th>
									<th>&nbsp;</th>
									
									<th>&nbsp;</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${levelList}" var="levelList">
									<tr>
										<td style="text-align:center;"><c:out value="${levelList.lv}"></c:out></td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td style="text-align:center;"><c:out value="${levelList.title}"></c:out></td>
										<td><input type="hidden"
											value="${levelList.levelId}" class="aid"></td>
										<td style="text-align:center;"><c:out value="${levelList.lvCondition}"></c:out></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><c:out value="${levelList.type}"></c:out></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td style="text-align:center;"><a href="#alterAnnouncement" data-toggle="modal"
											class="btn alter">修改</a>
											<button class="btn btn-danger">删除</button></td>

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

			<!-- ------------------------添加公告------------------------------------ -->
			<div id="newAnnounment" class="modal hide fade">
				<div class="modal-header">
					<button type="button" data-dismiss="modal" aria-hidden="true"
						class="close">&times;</button>
					<h3>添加规则</h3>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="form1" action="addLevel.htm" method="post" >
					<div class="control-group">
						<label for="level" class="control-label">等级：</label>
						<div class="controls">
							<input  name="level" type="text" />
						</div>
					</div>
					<div class="control-group">
						<label for="title" class="control-label">标题 ：</label>
						<div class="controls">
							<input  name="title" type="text" />
						</div>
					</div>
					<div class="control-group">
						<label for="condition" class="control-label">条件 ：</label>
						<div class="controls">
							<input  name="condition" type="text" />
						</div>
					</div>
					<div class="control-group">
						<label for="type" class="control-label">类型：</label>
						<div class="controls">
							<input  name="type" type="text" />
						</div>
					</div>					
					</form>
				</div>
				<div class="modal-footer">
					<a href="#" data-dismiss="modal" class="btn">返回</a>
					<button data-dismiss="modal" class="btn save" id="saveAnnouncement">保存</button>
				</div>
			</div>
			<!-- -------------------修改公告 ---------------------------- -->
			<div id="alterAnnouncement" class="modal hide fade">
				<div class="modal-header">
					<button type="button" data-dismiss="modal" aria-hidden="true"
						class="close">&times;</button>
					<h3>修改规则</h3>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="form2"action="alterLevel.htm" method="post" >
					<input type="hidden" name="levelId" id="announcementIdTemp" />
					<div class="control-group">
						<label for="level" class="control-label">等级：</label>
						<div class="controls">
							<input  name="level" type="text" id="level"/>
						</div>
					</div>
					<div class="control-group">
						<label for="title" class="control-label">标题 ：</label>
						<div class="controls">
							<input  name="title" type="text" id="title"/>
						</div>
					</div>
					<div class="control-group">
						<label for="condition" class="control-label">条件 ：</label>
						<div class="controls">
							<input  name="condition" type="text" id="condition" />
						</div>
					</div>
					<div class="control-group">
						<label for="type" class="control-label">类型：</label>
						<div class="controls">
							<input  name="type" type="text" id="type" />
						</div>
					</div>		
					</form>
				</div>
				<div class="modal-footer">
					<a href="#" data-dismiss="modal" class="btn">返回</a>
					<button data-dismiss="modal" class="btn" id="saveChange">保存</button>
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