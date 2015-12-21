<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sicd" uri="/sicd-tags"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>私信列表</title>
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
      <div class="wrap">
<div class="main-head">

  <div class="fr">
    <a href="goPrivateMail.htm">« 返回私信箱</a>
    <span class="gray mhs">|</span>
    <a href="" onclick="return confirm(&#39;真的要删除整个私信会话吗？&#39;);">全部删除</a>
  </div>
  <h2>
                    与${sender.userName}的会话<span class="mls">(共有${num}条)</span>
         
  </h2>

</div>


<div class="mod">
  <ul class="msg-list mbl">
  <c:forEach items="${list}" var="reply">
  
        <li class="msg-row">
      <div class="imageblock clearfix">
        <div class="imageblock-image"><a href="http://www.howzhi.com/u/1359470/"><img src="<c:url value="${reply.userBySenderId.headImage.imageMid}"/>" class="img"></a></div>
        <div class="imageblock-content">
          <div class="mbs"><a href="#" class="fr mls">回复</a><span class="time fr"><fmt:formatDate value="${reply.sendDate}" pattern="yyyy/MM/dd:HH:mm:ss"/></span><a href="#">${reply.userBySenderId.userName} TO ${reply.userByReceiverId.userName}</a></div>
          <div class="editor-content">${reply.content}</div>
        </div>
      </div>
    </li>
    </c:forEach>
    </ul>
  
  <a id="latest-message" name="latest-message">&nbsp;</a>
	<sicd:page curPage="${curPage}" url="${url}" totalPage="${totalPage}" />
  <form id="message-reply-form" method="post" action="sendReplyMail.htm?userName=${sender.userName}">
    <textarea id="messagereply_message" name="context" required="required" class="input-xxlarge" rows="3" maxlength="1000"></textarea>
    <p class="messageReplyBtns">
      <button type="submit" class="btn btn-success">回复</button>
    </p>
  </form>

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