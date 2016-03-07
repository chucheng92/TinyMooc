<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="<c:url value="/resource/js/jquery.flot.pie.min.js"/>"></script>
<script src="<c:url value="/resource/js/unicorn.js"/>"></script>
<script src="<c:url value="/resource/js/unicorn.charts.js"/>"></script>
<title>报表管理 - 萌课网</title>
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
                <li class="btn btn-inverse"><a title="" href="#"><i class="icon icon-user"></i> <span class="text">Herriyi</span></a></li>
                <li class="btn btn-inverse dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Messages</span> <span class="label label-important">5</span></a>
                </li>
                <li class="btn btn-inverse"><a title="" href="login.html"><i class="icon icon-share-alt"></i> <span class="text">注销</span></a></li>
            </ul>
        </div>
            
		<div id="sidebar">
			<a href="#" class="visible-phone"><i class="icon icon-home"></i>报表管理</a>
			<ul>
				<li><a href="<c:url value="/jsp/admin/index.jsp"/>"><i class="icon icon-th-list"></i><span>统计信息</span></a></li>
				<li class="submenu">
					<a href="#"><i class="icon icon-th-list"></i> <span>规则管理</span> <span class="label">3</span></a>
					<ul>
						<li><a href="">积分管理</a></li>
						<li><a href="">等级管理</a></li>
						<li><a href="">金币管理</a></li>
					</ul>
				</li>
				<li><a href=""><i class="icon icon-tint"></i> <span>课程审核</span></a></li>
				<li><a href=""><i class="icon icon-pencil"></i> <span>权限管理</span></a></li>
				<li><a href=""><i class="icon icon-th"></i> <span>爬虫管理</span></a></li>
				<li class="active"><a href=""><i class="icon icon-th-list"></i> <span>报表管理</span></a></li>
				<li class="submenu">
					<a href="#"><i class="icon icon-file"></i> <span>网站信息维护</span> <span class="label">5</span></a>
					<ul>
						<li><a href="<c:url value="/jsp/admin/reportManage.jsp"/>">举报管理</a></li>
						<li><a href="<c:url value="/jsp/admin/boardManage.jsp"/>">公告管理</a></li>
						<li><a href="<c:url value="/jsp/admin/logManage.jsp"/>">日志管理</a></li>
						<li><a href="<c:url value="/jsp/admin/dateDictionManage.jsp"/>">数据字典维护</a></li>
						<li><a href="#">敏感词汇管理</a></li>
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
				<h1>报表管理</h1>
				
			</div>
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a>
				<a href="#" class="current">报表管理</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box widget-plain">
							<div class="widget-content center">
								<ul class="stats-plain">
									<li>										
										<h4>36094</h4>
										<span>Total Visits</span>
									</li>
									<li>										
										<h4>1433</h4>
										<span>Users Registered</span>
									</li>
									<li>										
										<h4>8650</h4>
										<span>Completed Orders</span>
									</li>
									<li>										
										<h4>29</h4>
										<span>Pending Orders</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-signal"></i>
								</span>
								<h5>Line chart</h5>
							</div>
							<div class="widget-content">
								<div class="chart"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-signal"></i>
								</span>
								<h5>Bar chart</h5>
							</div>
							<div class="widget-content">
								<div class="bars"></div>
							</div>
						</div>
					</div>
					<div class="span6">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-signal"></i>
								</span>
								<h5>Pie chart</h5>
							</div>
							<div class="widget-content">
								<div class="pie"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span4">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-eye-open"></i>
								</span>
								<h5>Browsers</h5>
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Browser</th>
											<th>Visits</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Chrome</td>
											<td>8775</td>
										</tr>
										<tr>
											<td>Firefox</td>
											<td>5692</td>
										</tr>
										<tr>
											<td>Internet Explorer</td>
											<td>4030</td>
										</tr>
										<tr>
											<td>Opera</td>
											<td>1674</td>
										</tr>
										<tr>
											<td>Safari</td>
											<td>1166</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="span4">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-arrow-right"></i>
								</span>
								<h5>Refferers</h5>
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Site</th>
											<th>Visits</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><a href="#">http://google.com</a></td>
											<td>12679</td>
										</tr>
										<tr>
											<td><a href="#">http://bing.com</a></td>
											<td>11444</td>
										</tr>
										<tr>
											<td><a href="#">http://yahoo.com</a></td>
											<td>8595</td>
										</tr>
										<tr>
											<td><a href="#">http://www.something.com</a></td>
											<td>4445</td>
										</tr>
										<tr>
											<td><a href="#">http://else.com</a></td>
											<td>2094</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="span4">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-file"></i>
								</span>
								<h5>Most Visited Pages</h5>
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Page</th>
											<th>Visits</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><a href="#">Shopping cart</a></td>
											<td>9440</td>
										</tr>
										<tr>
											<td><a href="#">Blog</a></td>
											<td>6974</td>
										</tr>
										<tr>
											<td><a href="#">jQuery UI tips</a></td>
											<td>5377</td>
										</tr>
										<tr>
											<td><a href="#">100+ Free Icon Sets</a></td>
											<td>4990</td>
										</tr>
										<tr>
											<td><a href="#">How to use a Google Web Tools</a></td>
											<td>4834</td>
										</tr>
									</tbody>
								</table>
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