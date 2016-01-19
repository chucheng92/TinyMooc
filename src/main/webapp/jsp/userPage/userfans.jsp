<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>粉丝 - 萌课网</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">

<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v3.css"/>">
<script type="text/javascript" src="<c:url value="/resource/js/ga.js"/>"></script>
</head>
<body class="lily-theme">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

<section class="container">
  <div class="container-padding clearfix">
    <div class="UIImageBlock upage-top clearfix">
    		<div class="UIImageBlock_Image">
    				<img src="<c:url value="${user1.headImage.imageMid}"/>" alt=""class="img" width="100" height="100">
  			</div>
    		<div class="UIImageBlock_Content">
    			<div class="head">
            		<div class=""><h2>${user1.nickname}</h2></div>
   		 		</div>
    
    		</div>
    		<c:if test="${empty user1.signature}">
    			<div class="mood">
                	<a href=""> ^.^ <span class="fsn">设置签名档</span></a>
              	</div>
     		</c:if>
     		<c:if test="${!empty user1.signature}">
    			<div class="mood">
                 	<span class="fsn">${user1.signature}</span>
              	</div>
     		</c:if>
    <div class="nav clearfix">
      <a href="goPersonnal.htm?userId=${user1.userId}" >主页</a>
      <a href="goPersonalTeam.htm?userId=${user1.userId}">小组</a>
      <a href="goPersonalAtt.htm?userId=${user1.userId}" class="on">好友</a>
      <a href="goPersonalNote.htm?userId=${user1.userId}">笔记</a>
    </div>
  </div>



    <div class="normal-main">
      <div class="tabs clearfix mtl mbm">
        <ul>
          <li ><a href="goPersonalAtt.htm?userId=${user1.userId}">关注的人</a></li>
          <li class="on"><a href="goPersonalFans.htm?userId=${user1.userId}">粉丝</a></li>
        </ul>
      </div>

      <p class="mbm">
        <span class="gray">共有${sum}个粉丝</span>
      </p>

      <ul class="friend-list list vlist mbl" id="friend-list">
      <c:forEach items="${list}" var="fans"> 
         <li class="item lightitem item-border">
            <div class="imageblock clearfix mvm">
              <div class="imageblock-image"><a href="goPersonnal.htm?userId=${fans.userByUserId.userId}" class="show-user-card" ><img src="${fans.userByUserId.headImage.imageMid}" title="${fans.userByUserId.nickname}"></a></div>
              <div class="imageblock-content">
                <p> <span class="fr counter"></span><span class="fsm"><a href="goPersonnal.htm?userId=${fans.userByUserId.userId}" class="show-user-card"  title="${fans.userByUserId.nickname}">${fans.userByUserId.nickname}</a></span></p>
                <p class="gray"></p>
              </div>
            </div>
          </li>
          </c:forEach>
     	</ul>
    </div>

    
  </div>
</section>


<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body>
</html>