<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>公告管理 - 萌课网</title>
<script type="text/javascript">
	$(function() {
		$("#saveAnnouncement").click(function() {
			//alert("aaa");
			$("#form1").submit();
		});

		$("a.btn.alter").click(
				function() {
					var action = $(this).parent().parent().children("td")
							.eq(0).html();
					var id = $(this).parent().parent().children("td").eq(4)
							.children("input.aid").val();
					//alert(content+"||"+id);
					var credit = $(this).parent().parent().children("td")
							.eq(3).html();
					var gold = $(this).parent().parent().children("td")
					.eq(5).html();
					var remark = $(this).parent().parent().children("td")
					.eq(8).html();
					$("#action").val(action);
					$("#announcementIdTemp").val(id);
					$("#credit").val(credit);
					$("#gold").val(gold);
					$("#remark").val(remark);
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
						location.href = "deletCreditAndGold.htm?ruleId="
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
			<a href="" class="visible-phone"><i class="icon icon-home"></i>规则管理</a>
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
				<h1>积分金币管理</h1>
			</div>
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a>
				<a href="#">规则管理</a>
				<a href="#" class="current">积分金币管理</a>
			</div>
				<div class="container-fluid">
		
			<div class="page">
		<div class="page-container">
			<div class="container">
				<div class="row">
					<div class="span12">
						<a href="#newAnnounment" data-toggle="modal"
							class="btn pull-right">添加规则</a>
						<h4 class="header">积分金币管理</h4>
						<table class="table table-striped sortable">
							<thead>
								<tr>
									<th>动作</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>积分</th>
									<th>&nbsp;</th>
									<th>金币</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>备注</th>
									<th>&nbsp;</th>
									
									<th>&nbsp;</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${rulelist}" var="rulelist">
									<tr>
										<td style="text-align:center;"><c:out value="${rulelist.action}"></c:out></td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td style="text-align:center;"><c:out value="${rulelist.credit}"></c:out></td>
										<td><input type="hidden"
											value="${rulelist.ruleId}" class="aid"></td>
										<td style="text-align:center;"><c:out value="${rulelist.gold}"></c:out></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><c:out value="${rulelist.remark}"></c:out></td>
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
					<form class="form-horizontal" id="form1" action="addCreditAndGold.htm" method="post" >
					<div class="control-group">
						<label for="action" class="control-label">Action：</label>
						<div class="controls">
							<input  name="action" type="text" />
						</div>
					</div>
					<div class="control-group">
						<label for="credit" class="control-label">积分 ：</label>
						<div class="controls">
							<input  name="credit" type="text" />
						</div>
					</div>
					<div class="control-group">
						<label for="gold" class="control-label">金币 ：</label>
						<div class="controls">
							<input  name="gold" type="text" />
						</div>
					</div>
					<div class="control-group">
						<label for="remark" class="control-label">备注 ：</label>
						<div class="controls">
							<textarea rows="3" name="content"></textarea>
						</div>
					</div>
					</form>
				</div>
				<div class="modal-footer">
					<a href="#" data-dismiss="modal" class="btn">返回</a>
					<button data-dismiss="modal" class="btn" id="saveAnnouncement">保存</button>
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
					<form class="form-horizontal" id="form2"action="alterCreditAndGold.htm" method="post" >
					<input type="hidden" name="ruleId" id="announcementIdTemp" />
					<div class="control-group">
						<label for="action" class="control-label">Action：</label>
						<div class="controls">
							<input id="action" name="action" type="text" />
						</div>
					</div>
					<div class="control-group">
						<label for="credit" class="control-label">积分 ：</label>
						<div class="controls">
							<input id="credit" name="credit" type="text" />
						</div>
					</div>
					<div class="control-group">
						<label for="gold" class="control-label">金币 ：</label>
						<div class="controls">
							<input id="gold" name="gold" type="text" />
						</div>
					</div>
					<div class="control-group">
						<label for="remark" class="control-label">备注 ：</label>
						<div class="controls">
							<textarea rows="3" name="remark" id="remark"></textarea>
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