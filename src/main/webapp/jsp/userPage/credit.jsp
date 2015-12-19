<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>学分 - 萌课网</title>
  <link rel="Shortcut Icon" href="<c:url value="/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.css"/>" media="screen">

<script type="text/javascript" src="<c:url value="/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v3.css"/>">
<script type="text/javascript" src="<c:url value="/js/ga.js"/>"></script>
</head>
<body class="flats-theme">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>


<section class="container clearfix">
  <div id="me" class="me clearfix">
    <div class="main">
      <div class="wrap">  <div class="main-head">
    <span class="fr">
      <span class="mrs">级别：<a class="user-level user-level-7" title="升级!" href="/help/help_user_level" target="_blank">7 级</a>
</span>
      总学分：250
    </span>
    <h2>我的学分记录</h2>
  </div>

  <div class="mod">
      <table class="datagrid" id="teaching-datagrid">
        <thead>
          <tr>
            <th>时间</th>
            <th>名称</th>
            <th>学分</th>
          </tr>
        </thead>
        <tbody>  
           <tr>
            <td>2013-09-06 19:39</td>
            <td>学习课时</td>
            <td>+5</td>
          </tr>
          
        </tbody>
      </table>
      <div class="mtl fr"><a href="/help/help">查看学分规则</a></div>
      <div class="pagination mvl"><ul>
      <li class="disabled"><a href="">上一页</a></li>
  
                            <li class="active"><a href="#">1</a></li>
                        <li><a href="/me/point?page=2">2</a></li>
                        <li><a href="/me/point?page=3">3</a></li>
                    
      <li><a href="/me/point?page=2">下一页</a></li>
  </ul>
</div>
  </div>

</div>
    </div>
    <div class="side">

      <div class="avatar-mod clearfix">
        <a href="" class="avatar"><img src="/microlecture/pic/imagehead/saber.jpg" /></a>
        <div class="infos">
          <div class="nickname"><a href="" title="fanfanle">fanfanle</a></div>
          <div class="icons">
            <a class="user-level user-level-7" title="升级!" href="/help/helplevel" target="_blank">7 级</a>

          </div>
        </div>
      </div>

      <div class="stats-mod">
          <ul class="user-stats clearfix">
            <li><a href="/me/point"><strong>250</strong>学分</a></li>
            <li><a href="/me/coin"><strong>2</strong>金币</a></li>
          </ul>
      </div>

      <div class="menu-mod clearfix">
        <ul class="menus">
          <li ><a href="/me/"><i class="feature-icon feature-icon-home"></i>我的首页</a></li>
          <li ><a href="/me/feed"><i class="feature-icon feature-icon-feed"></i>好友动态<span id="feed-counter" class="counter"></span></a></li>
          <li ><a href="/me/learn"><i class="feature-icon feature-icon-learn"></i>学习计划</a></li>
          <li ><a href="/me/teach"><i class="feature-icon feature-icon-teach"></i>创建课程</a></li>
          <li ><a href="/me/note"><i class="feature-icon feature-icon-note"></i>笔记</a></li>
          <li ><a href="/me/question"><i class="feature-icon feature-icon-faq"></i>微挑战</a></li>
          <li ><a href="/me/group/discussion"><i class="feature-icon feature-icon-group"></i>小组<span id="group-counter" class="counter"></span></a></li>
          <li ><a href="/task/"><i class="feature-icon feature-icon-task"></i>任务</a></li>
          <li ><a href="/me/course/favorite"><i class="feature-icon feature-icon-favorite"></i>收藏夹</a></li>
        </ul>

        <div class="divider"></div>

        <ul class="menus">
          <li ><a href="/me/following"><i class="feature-icon feature-icon-friend"></i>好友</a></li>
          <li ><a href="/notification/"><i class="feature-icon feature-icon-notification"></i>通知</a></li>
          <li ><a href="/message/"><i class="feature-icon feature-icon-message"></i>私信</a></li>
        </ul>

        <div class="divider"></div>

        <ul class="menus">
          <li ><a href="/me/coin"><i class="feature-icon feature-icon-coin"></i>金币</a></li>
          <li ><a href="/account/"><i class="feature-icon feature-icon-setting"></i>账户设置</a></li>
        </ul>
      </div>

    </div>
  </div>
</section>

<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body>
</html>