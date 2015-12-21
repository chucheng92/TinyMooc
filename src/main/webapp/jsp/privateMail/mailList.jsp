<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>私信列表 - 萌课网</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">

<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v3.css"/>">
<script type="text/javascript" src="<c:url value="/resource/js/ga.js"/>"></script>
</head>
<body class="flats-theme">


<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

<section class="container clearfix">
  <div id="me" class="me clearfix">
    <div class="main">
      <div class="wrap">    <div class="main-head">
      <a href="goSendMail.htm" class="btn btn-success btn-small fr"><span>写私信</span></a>
      <h2>私信</h2>
    </div>
    <div class="mod">
                    <div class="mbm clearfix">
        <span>共有${mailNum}个会话</span>
        </div>
        <ul class="message-thread-list mbm">
        <c:forEach items="${mailList}" var="mail">
         <li>
            <table width="100%">
              <tbody><tr>
                <td>
                    <div class="clearfix pts pbs">
                    <img src="<c:url value="${mail[0].headImage.imageMid}"/>" class="avatar">
                    <c:if test="${mail[2]=='未读'}">
                    <div class="time pls">有未读</div>
                    </c:if>
                    <div class="thread-main">
                      <div class="author">
                      	${mail[0].userName}
                      </div>
                        <a href="getDetail.htm?userId=${mail[0].userId}" class="thread-link">最新消息&nbsp;${mail[1]}</a>
                    </div>
                    </div>
                </td>
                <td class="pl5" width="10px"><a href="" onclick="return confirm(&#39;真的要删除该会话吗？&#39;);">x</a></td>
              </tr>
            </tbody></table>
          </li>
          </c:forEach>
          </ul>
      </div>
</div>
    </div>
     <div class="side">

      <div class="avatar-mod clearfix">
        <a href="goPersonnal.htm?userId=${user.userId}" class="avatar"><img src="<c:url value="${user.headImage.imageMid}"/>" /></a>
        <div class="infos">
          <div class="nickname"><a href="/u/1359470/" title="fanfanle">${user.userName}</a></div>
          <div class="icons">
            <a class="user-level user-level-6"  href="/help/#help_user_level" target="_blank">${level.lv}级</a>
			<a class="user-level user-level-6"  href="">${level.title}</a>
          </div>
        </div>
      </div>

      <div class="stats-mod">
          <ul class="user-stats clearfix">
            <li><a href="/me/point"><strong>${user.credit}</strong>学分</a></li>
            <li><a href="/me/coin"><strong>${user.gold}</strong>金币</a></li>
          </ul>
      </div>

      <div class="menu-mod clearfix">
         <ul class="menus">
          <li ><a href="turnToHomePage.htm"><i class="feature-icon feature-icon-home"></i>我的首页</a></li>
          <li ><a href="courseList.htm"><i class="feature-icon feature-icon-teach"></i>我的课程</a></li>
          <li ><a href="goNote.htm"><i class="feature-icon feature-icon-note"></i>笔记</a></li>
          <li ><a href="challenge.htm"><i class="feature-icon feature-icon-faq"></i>微挑战</a></li>
          <li ><a href="rank.htm"><i class="feature-icon feature-icon-faq"></i>微排行</a></li>
          <li ><a href="myrank.htm"><i class="feature-icon feature-icon-faq"></i>我的排行</a></li>
          <li ><a href="teamPage.htm"><i class="feature-icon feature-icon-group"></i>小组</a></li>
          <li ><a href="shop.htm"><i class="feature-icon feature-icon-faq"></i>商城</a></li>
          <li ><a href="myprop.htm"><i class="feature-icon feature-icon-faq"></i>我的道具</a></li>
          <li ><a href="myFavotite.htm"><i class="feature-icon feature-icon-favorite"></i>收藏夹</a></li>
        </ul>

        <div class="divider"></div>

        <ul class="menus">
          <li ><a href="myAttention.htm"><i class="feature-icon feature-icon-friend"></i>好友</a></li>
          <li class="active"><a href="goPrivateMail.htm"><i class="feature-icon feature-icon-message"></i>私信</a></li>
        </ul>

        <div class="divider"></div>

        <ul class="menus">
          <li ><a href="turnToHelpPage.htm"><i class="feature-icon feature-icon-coin"></i>金币</a></li>
          <li ><a href="account.htm"><i class="feature-icon feature-icon-setting"></i>账户设置</a></li>
        </ul>
      </div> 

    </div>
  </div>
</section>

<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body></html>