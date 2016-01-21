<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小组 - 萌课网</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
</head>
<body class="lily-theme">


<jsp:include page="/jsp/include/head2.jsp"></jsp:include>


<section class="content container" style="margin-top: 60px;">
  <div class="container-padding clearfix">
        <div class="UIImageBlock upage-top clearfix">
    		<div class="UIImageBlock_Image">
    				<img src="<c:url value="${user1.headImage.imageMid}"/>" alt="" class="img" width="100" height="100">
  			</div>
    		<div class="UIImageBlock_Content">
    			<div class="head">
            		<div class=""><h2>${user1.userName}</h2></div>
   		 		</div>
                <c:if test="${empty user1.intro}">
                    <div class="mood">
                        <a href=""> ^.^ <span class="fsn">设置个人说明</span></a>
                    </div>
                </c:if>
                <c:if test="${!empty user1.intro}">
                    <div class="mood">
                        <span class="fsn">${user1.intro}</span>
                    </div>
                </c:if>
    		</div>
    		
    <div class="nav clearfix">
        <a href="goPersonal.htm?userId=${user1.userId}">主页</a>
      <a href="goPersonalTeam.htm?userId=${user1.userId}" class="on">小组</a>
      <a href="goPersonalAttention.htm?userId=${user1.userId}" >好友</a>
      <a href="goPersonalNote.htm?userId=${user1.userId}">笔记</a>
    </div>
  </div>

    
    <div class="mod mtl discuss-list2">
      <h3>参加的小组</h3>
        <div class="metas">
              <ul class="grids smallpic-grids">
              	<c:forEach items="${userTeam}" var="team">
                  <li class="grid"><img src="<c:url value="${team.team.headImage.imageSmall}"/>" style="width: 70px;height: 70px;"/><p><a href="teamHomePage.htm?teamId=${team.team.teamId}" title="查看该小组">${team.team.teamName}</a></p></li>
                </c:forEach>
                </ul>
        </div>
     </div>
    
     <div class="mod">
      <h3>发表的话题</h3>
      
	<div class="discuss-list2">
  			<ul>
  			<c:forEach items="${discussList}" var="discuss">
                <li>
      				<div class="imageblock clearfix">
        				<div class="imageblock-image"><img src="<c:url value="${discuss.user.headImage.imageSmall }"/>"></div>
        					<div class="imageblock-content">
          						<p class="title"><a href="">${discuss.topic}</a>
          				<p class="metas"><a href="teamHomePage.htm?teamId=${discuss.team.teamId}" title="查看该小组" class="mrm">${discuss.team.teamName}</a>
          				by <a href="goPersonal.htm?userId=${discuss.user.userId}" class="show-user-card " title="查看该用户">${discuss.user.userName}</a>
            					<span class="mhm">${discuss.scanNum}次查看</span></p>
        					</div>
      				</div>
    			</li>
    			</c:forEach>
      		</ul>

	</div>          
</div>
    
</div>
</section>

<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body>
</html>