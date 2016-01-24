<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]><html class="ie ie6"><![endif]-->
<!--[if IE 7]><html class="ie ie7"><![endif]-->
<!--[if IE 8 ]><html class="ie8"><![endif]-->
<!--[if !IE]><!--><html><!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title> 头部背景图片设置 - 起风了的小组管理 - 好知网</title>
  
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
    <a href="http://www.howzhi.com/me/" class="logo"><img src="/bundles/topxiaweb/img/base/logo.png?169" width="55" height="26" /><em>好知</em></a>

    <ul class="header-nav">
      <li class="item"><a href="http://www.howzhi.com/me/" class="trigger">首页</a></li>
      <li class="item">
        <a href="http://www.howzhi.com/courses" class="trigger">课程<span class="down-triangle"></span></a>
        <div class="menus">
          <ul class="clearfix">
            <li><a href="http://www.howzhi.com/channel/photography">摄影</a></li>
            <li><a href="http://www.howzhi.com/channel/programme">编程</a></li>
            <li><a href="http://www.howzhi.com/channel/interest">兴趣</a></li>
            <li><a href="http://www.howzhi.com/channel/computer">电脑</a></li>
            <li><a href="http://www.howzhi.com/channel/language">语言</a></li>
            <li><a href="http://www.howzhi.com/channel/life">生活</a></li>
            <li><a href="http://www.howzhi.com/channel/career">职场</a></li>
            <li><a href="http://www.howzhi.com/channel/culture">文化</a></li>
            <li><a href="http://www.howzhi.com/channel/openclass">音乐</a></li>
          </ul>
        </div>
      </li>
      <li class="item"><a href="http://www.howzhi.com/groups/explore" class="trigger">小组</a></li>
    </ul>

    <form class="search-form" action="http://www.howzhi.com/search" method="get">
      <input type="text" class="search-input" value="" name="q" placeholder="想学什么?搜搜看..." />
      <input type="submit" class="search-btn" value="" />
    </form>

    <div class="user-status-bar">
          <div class="status-item-wrapper">
        <a href="http://www.howzhi.com/notification/" class="status-item notification-remind"></a>
        <a href="http://www.howzhi.com/notification/" class="remind-number" id="notification-remind-number" style="display:none;">0</a>
      </div>
      <div class="status-item-wrapper">
        <a href="http://www.howzhi.com/message/" class="status-item message-remind"></a>
        <a href="http://www.howzhi.com/message/" class="remind-number" id="message-remind-number" style="display:none;">0</a>
      </div>
      <div class="status-item-wrapper" id="user-nav-item-wrapper">
        <a href="#" class="status-item user-nav-item"><img src="http://f1.howzhi.com/avatar/2013/09-06/194036468712785711.jpg" alt="fanfanle" class="avatar" /><span class="nickname">fanfanle</span></a>
        <div class="user-nav-menus">
        <a href="http://www.howzhi.com/u/1359470/">个人主页</a>
          <a href="http://www.howzhi.com/friend/invite">好友邀请</a>
          <a href="http://www.howzhi.com/task/">任务中心</a>
          <a href="http://www.howzhi.com/account/">账户设置</a>
                    <div class="menu-divider"></div>
          <a href="http://www.howzhi.com/signout">退出</a>
        </div>
      </div>
        </div>
  
  </div>
</header>





<section class="container">
  <div class="group-header" style="background-image:url(http://f1.howzhi.com/group-icon/2013/09-06/195614e31cce643735.jpg)">

  <div class="head">
    <div class="icon"><img src="http://f1.howzhi.com/default/group-8.jpg"  alt="起风了"  /></div>
    <div class="infos">
      <h1>起风了</h1>
      <span>2个成员</span>
    </div>
  </div>
  
  <ul class="hnav">
     <li><a href="">小组首页</a></li>
    <li><a href="">讨论区</a></li>
    <li class=""><a href="">成员</a></li>
    <li class="this"><a href="this">管理</a></li>
        
  </ul>

</div>  
<div class="container-padding clearfix">
    
 <div class="mod">
  <div class="tab-nav clearfix">
  <ul>
    <li><a href="admin.jsp">基本设置</a></li>
    <li><a href="picture.jsp">图标设置</a></li>
    <li><a href="category.jsp">话题分类设置</a></li>
    <li class="this"><a href="background.jsp">头部背景图片设置</a></li>
  </ul>
</div>  
      
  <form class="form" method="post" enctype="multipart/form-data" />
    <p>
      <label>&nbsp;</label>
      <div>从你的电脑上选择图片: <br /><input type="file" name="pic" class="file" /></div>
      <div class="hint">头部背景图片宽高为978*150，系统会自动裁剪图片大小。</div>
      <div class="hint">支持jpg, png, gif格式的图片，文件大小最大为512KB。</div>
    </p>
    
    <p class="actions">
      <button type="submit" class="btn btn-success">上传</button>
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