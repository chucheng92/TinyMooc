<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的关注 - 萌课网</title>
</head>
<body class="flats-theme">


<jsp:include page="/jsp/include/head2.jsp"></jsp:include>


<section class="container clearfix" style="margin-top: 60px;">
  <div id="me" class="me clearfix">
    <div class="main">
      <div class="wrap">
<div class="mod">
    
<div class="tab-bar">
  <ul class="clearfix">
      <li class="active"><a href="myAttention.htm">关注的人</a></li>
      <li><a href="myFans.htm">粉丝</a></li>
     
  </ul>
</div></div>

<div class="mod">
    <div class="thin-tab mbm" id="friend-groups-nav">
        <a href="" class="on">全部</a>
     </div>
	

	<p class="mbm">
    	<span class="gray">共${sum}人</span>
    	 	</p>

 	<ul class="friend-list list vlist mbl" id="friend-list">
 	<c:forEach items="${list}" var="list">
   <li class="item lightitem item-border">
        	<div class="imageblock clearfix mvm">
        	<div class="imageblock-image"><img src="<c:url value="${list.userByAttentionedUserId.headImage.imageMid}"/>">
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
                 	 已关注
                  	 </p>
                  	 </c:if>
                  	<p class="extra">
                  	 <a href="delAttention1.htm?userBid=${list.userByAttentionedUserId.userId}&type=0" class="unfollow-opt">取消关注</a>
                  	</p>
                </div>
                <p>
                	<span class="fr counter"></span>
                	<span class="fsm"><a href="" class="show-user-card " data-uid="1359470" >${list.userByAttentionedUserId.userName}</a></span>
            	</p>
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

         <jsp:include page="/jsp/include/leftside.jsp"></jsp:include>

    </div>
  </div>
</section>

<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body></html>