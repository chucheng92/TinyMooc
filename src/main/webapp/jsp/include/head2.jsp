<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){

	$("#course").mouseover(function(){

			$("#menu").css("display","block");

		});
	$(".item.course").mouseleave(function(){

		$("#menu").css("display","none");

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
<body>
<header class="header" id="header">

  <div class="container">
    <a class="logo" href="/index.jsp"><img src="<c:url value="/resource/pic/logo.png" />" width="80"
				height="26"><em></em></a>

			<ul class="header-nav">
				<li class="item"><a href="/turnToHomePage.htm" class="trigger">首页</a></li>
				<li class="item course"><a href="goCourseHome.htm" class="trigger" id="course">课程<span
						class="down-triangle"></span></a>
					<div class="menus" id="menu">
						<ul class="clearfix">
                            <li><a href="goMajorHome.htm?type=摄影">摄影</a></li>
                            <li><a href="goMajorHome.htm?type=艺术">艺术</a></li>
                            <li><a href="goMajorHome.htm?type=兴趣">兴趣</a></li>
                            <li><a href="goMajorHome.htm?type=计算机">计算机</a></li>
                            <li><a href="goMajorHome.htm?type=文学">文学</a></li>
                            <li><a href="goMajorHome.htm?type=求职">求职</a></li>
                            <li><a href="goMajorHome.htm?type=动漫">动漫</a></li>
                            <li><a href="goMajorHome.htm?type=公开课">公开课</a></li>
                            <li><a href="goMajorHome.htm?type=其他">其他</a></li>
						</ul>
					</div></li>
				<li class="item"><a href="teamPage.htm" class="trigger">小组</a></li>
			</ul>

			<form class="search-form" action="MulsearchByKey.htm" method="post">
				<input type="text" class="search-input" value="" name="keyWord"
					placeholder="想学什么?搜搜看..."> <input type="submit"
					class="search-btn" value="">
			</form>

    <div class="user-status-bar">
          <div class="status-item-wrapper">
        <a href="" class="status-item notification-remind"></a>
        <a href="" class="remind-number" id="notification-remind-number" style="display:none;">0</a>
      </div>
      <div class="status-item-wrapper">
        <a href="goPrivateMail.htm" class="status-item message-remind"></a>
        <c:if test="${sessionScope.sumMail!=0}">
        <a href="goPrivateMail.htm" class="remind-number" id="message-remind-number" style="display:block;">${sessionScope.sumMail}</a>
        </c:if>
      </div>
      <div class="status-item-wrapper" id="user-nav-item-wrapper">
        <a href="goPersonnal.htm?userId=${sessionScope.user.userId}" class="status-item user-nav-item" id="user"><img src="<c:url value="${user.headImage.imageSmall}"/>" alt="fanfanle" class="avatar" /><span class="nickname">${sessionScope.user.userName}</span></a>
        <div class="user-nav-menus">
        <a href="goPersonnal.htm?userId=${sessionScope.user.userId}">个人主页</a>
         <a href="myTinyMooc.htm">我的萌课</a>
          <a href="account.htm">账户设置</a>
          <div class="menu-divider"></div>
          <a href="logout.htm">退出</a>
        </div>
      </div>
        </div>
  </div>
</header>
</body>
</html>