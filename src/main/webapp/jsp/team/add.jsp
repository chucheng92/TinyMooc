<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--[if lt IE 7]><html class="ie ie6"><![endif]-->
<!--[if IE 7]><html class="ie ie7"><![endif]-->
<!--[if IE 8 ]><html class="ie8"><![endif]-->
<!--[if !IE]><!--><html><!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>话题分类设置 - 起风了的小组管理 - 好知网</title>
  <link rel="Shortcut Icon" href="<c:url value="/pic/icon.ico" />" />
 <link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.css"/>" media="screen">
   
  <script type="text/javascript" src="<c:url value="/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v3.css"/>">
<script type="text/javascript" src="<c:url value="/js/ga.js"/>"></script>
 
 <script type="text/javascript">
$(function(){

	$("#course").mouseover(function(){

			$(".menus").css("display","block");

		});
	$(".item.course").mouseleave(function(){

		$(".menus").css("display","none");

	});
	$("#user").mouseover(function(){

		$(".user-nav-menus").css("display","block");

	});
	$(".status-item-wrapper").mouseleave(function(){

		$(".user-nav-menus").css("display","none");

	});
	
});

</script>
</head>
<body class="lily-theme">


<header class="header" id="header">

  <div class="container">
    <a class="logo" href="<c:url value="/jsp/homePage/homePage.jsp"/>"><img src="<c:url value="/pic/logo.png" />" width="80"
				height="26"><em></em></a>

			<ul class="header-nav">
				<li class="item"><a href="<c:url value="/jsp/homePage/homePage.jsp"/>" class="trigger">首页</a></li>
				<li class="item course"><a href="#" class="trigger" id="course">课程<span
						class="down-triangle"></span></a>
					<div class="menus">
						<ul class="clearfix">
							<li><a href="">摄影</a></li>
							<li><a href="">编程</a></li>
							<li><a href="">兴趣</a></li>
							<li><a href="">电脑</a></li>
							<li><a href="">语言</a></li>
							<li><a href="">生活</a></li>
							<li><a href="">职场</a></li>
							<li><a href="">文化</a></li>
							<li><a href="">音乐</a></li>
						</ul>
					</div></li>
				<li class="item"><a href="<c:url value="/jsp/team/team.jsp"/>" class="trigger">小组</a></li>
			</ul>

			<form class="search-form" action="#" method="get">
				<input type="text" class="search-input" value="" name="q"
					placeholder="想学什么?搜搜看..."> <input type="submit"
					class="search-btn" value="">
			</form>

    <div class="user-status-bar">
          <div class="status-item-wrapper">
        <a href="" class="status-item notification-remind"></a>
        <a href="" class="remind-number" id="notification-remind-number" style="display:none;">0</a>
      </div>
      <div class="status-item-wrapper">
        <a href="" class="status-item message-remind"></a>
        <a href="" class="remind-number" id="message-remind-number" style="display:none;">0</a>
      </div>
      <div class="status-item-wrapper" id="user-nav-item-wrapper">
        <a href="#" class="status-item user-nav-item" id="user"><img src="" alt="fanfanle" class="avatar" /><span class="nickname">fanfanle</span></a>
        <div class="user-nav-menus">
        <a href="">个人主页</a>
          <a href="">好友邀请</a>
          <a href="">任务中心</a>
          <a href="">账户设置</a>
          <div class="menu-divider"></div>
          <a href="">退出</a>
        </div>
      </div>
        </div>
  
  </div>
</header>





<section class="container">
  <div class="group-header" style="background-image:url()">

  <div class="head">
    <div class="icon"><img src=""  alt="起风了"  /></div>
    <div class="infos">
      <h1>起风了</h1>
      <span>2个成员</span>
    </div>
  </div>
  
  <ul class="hnav">
    <li><a href="teamHome.jsp">小组首页</a></li>
    <li><a href="discuss.jsp">讨论区</a></li>
    <li><a href="members.jsp">成员</a></li>
    <li class="this"><a href="admin.jsp">管理</a></li>
        
  </ul>

</div>  <div class="container-padding clearfix">
      <div class="tab-nav clearfix">
  <ul>
    <li><a href="admin.jsp">基本设置</a></li>
    <li><a href="picture.jsp">图标设置</a></li>
    <li class="this"><a href="category.jsp">话题分类设置</a></li>
    <li><a href="background.jsp">头部背景图片设置</a></li>
  </ul>
</div>  
  <div class="mod">
        
    <h2>新增话题分类</h2>
    
    <form id="group-category-form" class="form" method="post" novalidate>
      <p>
        <label for="discussioncategory_name" class="required">话题名称</label>
        <input type="text" id="discussioncategory_name" name="discussioncategory[name]" required="required" />
      </p>
      <p>
        <label for="discussioncategory_seq" class="required">序号</label>
        <input type="text" id="discussioncategory_seq" name="discussioncategory[seq]" required="required" value="0" />
        <span class="hint">请输入0-100之间的数字，数字越大排序越靠前</span>
      </p>
      <p class="actions">
        <input type="hidden" id="discussioncategory__token" name="discussioncategory[_token]" value="" />
        <button type="submit" class="btn btn-success">提交</button>
      </p>
    </form>
  
  </div>
  
  
  </div>
  </section>

<footer class="footer container">
  <div style="padding: 0px 28px;">
    <div class="fl footer-links">
      <a href="">关于微课程</a>
      <a href="">微课程达人</a>
      <a href="">联系我们</a>
      <a href="">友情链接</a>
      <a href="">意见反馈</a>
      <br>
      <span class="copyright">©2013 MicroCourses.COM <a href="#">陕ICP备1102461-7</a> </span>
    </div>
  </div>
</footer>

</body>
</html>