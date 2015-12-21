<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的粉丝</title>
<link rel="Shortcut Icon" href="<c:url value="/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.css"/>" media="screen">

<script type="text/javascript" src="<c:url value="/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v3.css"/>">
<script type="text/javascript" src="<c:url value="/js/ga.js"/>"></script>
<script type="text/javascript">
function del(){
	window.location=""
	
}
</script>
</head>
<body class="flats-theme">


<jsp:include page="/jsp/include/head2.jsp"></jsp:include>


<section class="container clearfix">
  <div id="me" class="me clearfix">
    <div class="main">
      <div class="wrap">
<div class="mod">
  
<div class="tab-bar">
  <ul class="clearfix">
      <li><a href="myAttention.htm">关注的人</a></li>
      <li class="active"><a href="#">粉丝</a></li>
  </ul>
</div></div>

<div class="mod">

  <p class="mbm">
    <span class="gray">共${sum}人</span>
  </p>

  <ul class="friend-list list vlist mbl" id="friend-list">
  <c:forEach items="${list}" var="list">
     <li class="item lightitem item-border">
        <div class="imageblock clearfix mvm">
          <div class="imageblock-image"><a href="" class="show-user-card" data-uid="1360073"><img src="<c:url value="${list.userByUserId.headImage.imageMid}"/>"></a>
			</div>
          <div class="imageblock-content">
            <div class="user-relation">
             <c:if test="${list.attentionEach=='互粉'}">
                 	<p>
                 	 相互关注
                  	 </p>
                  	 </c:if>
                  	 <c:if test="${empty list.attentionEach}">
                 	<p>
                        <a href="addAttention1.htm?userBid=${list.userByUserId.userId}" class="follow-opt">关注</a>
                     </p>
                  	 </c:if>
                    <c:if test="${list.attentionEach=='互粉'}">
              <p class="extra">
                <a href="delAttention1.htm?type=1&userBid=${list.userByUserId.userId}" class="unfollow-opt">取消关注</a>
               </p>
                </c:if>
            </div>
            <p> <span class="fr counter"></span>  <span class="fsm"><a href="" class="show-user-card " data-uid="1360073" title="fatherfox">${list.userByUserId.nickname}</a></span></p>
            <p class="gray">${list.userByUserId.signature}</p>
          </div>
        </div>
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
          <div class="nickname"><a href="/u/1359470/" title="fanfanle">${userName}</a></div>
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
          <li class="active"><a href="myAttention.htm"><i class="feature-icon feature-icon-friend"></i>好友</a></li>
          <li ><a href="goPrivateMail.htm"><i class="feature-icon feature-icon-message"></i>私信</a></li>
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

<jsp:include page="/jsp/include/foot1.jsp"></jsp:include>

</body></html>