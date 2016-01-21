<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>粉丝 - 萌课网</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />

</head>
<body class="lily-theme">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

<section class="container" style="margin-top: 60px;">
  <div class="container-padding clearfix">
    <div class="UIImageBlock upage-top clearfix">
    		<div class="UIImageBlock_Image">
    				<img src="<c:url value="${user1.headImage.imageMid}"/>" alt=""class="img" width="100" height="100">
  			</div>
    		<div class="UIImageBlock_Content">
    			<div class="head">
            		<div class=""><h2>${user1.userName}</h2></div>
   		 		</div>
    
    		</div>
    		<c:if test="${empty user1.intro}">
    			<div class="mood">
                	<a href="account.htm"> ^.^ <span class="fsn">设置个人说明</span></a>
              	</div>
     		</c:if>
     		<c:if test="${!empty user1.intro}">
    			<div class="mood">
                 	<span class="fsn"  style="margin-left: 10px;">${user1.intro}</span>
              	</div>
     		</c:if>
    <div class="nav clearfix">
      <a href="goPersonal.htm?userId=${user1.userId}" >主页</a>
      <a href="goPersonalTeam.htm?userId=${user1.userId}">小组</a>
      <a href="goPersonalAttention.htm?userId=${user1.userId}" class="on">好友</a>
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

            <div class="imageblock clearfix mvm">
                <li >
              <div class="imageblock-image"><img src="${fans.userByUserId.headImage.imageMid}" title="${fans.userByUserId.userName}"></div><div style="clear:both;"></div>
                </li>
                <li>
                <a href="goPersonal.htm?userId=${fans.userByUserId.userId}" class="show-user-card"  title="${fans.userByUserId.userName}"> <span class="fsm">${fans.userByUserId.userName}</span></a>
                </li>
            </div>

          </c:forEach>
     	</ul>
    </div>

    
  </div>
</section>


<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body>
</html>