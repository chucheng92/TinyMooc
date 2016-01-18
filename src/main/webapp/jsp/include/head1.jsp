<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
<script type="text/javascript">
$(function(){

	$("#course").mouseover(function(){

			$("#menu").css("display","block");

		});
	$(".item.course").mouseleave(function(){

		$("#menu").css("display","none");
	});
});
</script>
</head>

<body>
<header class="header" id="header">

		<div class="container">
			<a class="logo" href="/index.jsp"><img src="<c:url value="/resource/pic/logo.png" />" width="80"
				height="26"><em></em></a>

			<ul class="header-nav">
				<li class="item"><a href="/turnToHomePage.htm" class="trigger">首页</a></li>
                <li class="item"><a href="/myTinyMooc.htm" class="trigger">我的萌课</a></li>
				<li class="item course"><a href="goCourseHome.htm" class="trigger" id="course">课程<span class="down-triangle"></span></a>
					<div class="menus" id="menu">
						<ul class="clearfix">
                            <li><a href="goMajorHome.htm?type=摄影">摄影</a></li>
                            <li><a href="goMajorHome.htm?type=艺术">艺术</a></li>
                            <li><a href="goMajorHome.htm?type=兴趣">兴趣</a></li>
							<li><a href="goMajorHome.htm?type=计算机">计算机</a></li>
							<li><a href="goMajorHome.htm?type=文学">文学</a></li>
							<li><a href="goMajorHome.htm?type=求职">求职</a></li>
							<li><a href="goMajorHome.htm?type=动漫">动漫</a></li>
                            <li><a href="goMajorHome.htm?type=音乐">音乐</a></li>
							<li><a href="goMajorHome.htm?type=其他">其他</a></li>
						</ul>
					</div>
                </li>
				<li class="item"><a href="teamPage.htm" class="trigger">小组</a></li>
			</ul>

			<form class="search-form" action="MulsearchByKey.htm" method="post">
				<input type="text" class="search-input" value="" name="keyWord"
					placeholder="想学什么?搜搜看...">
                <input type="submit" class="search-btn" value="">
			</form>

			<div class="user-status-bar">
				<a href="goLoginPage.htm" class="status-item  sign-status-item" id="signin-status-item">登录</a> <a href="goRegisterPage.htm" class="status-item sign-status-item" id="signup-status-item">注册</a>
			</div>

		</div>
	</header>

</body>
</html>