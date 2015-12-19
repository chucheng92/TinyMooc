<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>${userTeam2.team.teamName}的小组成员
 - 好知网</title>
 <link rel="Shortcut Icon" href="<c:url value="/pic/icon.ico" />" />
  <link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.css"/>" media="screen">
  <script type="text/javascript" src="<c:url value="/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v3.css"/>">
<script type="text/javascript" src="<c:url value="/js/ga.js"/>"></script>
 


</head>
<body class="lily-theme">


<jsp:include page="/jsp/include/head2.jsp"></jsp:include>





<section class="container">
  <div class="group-header" style="background-image:url(<c:url value="/pic/imagehead/group-header.jpg"></c:url>)">

  <div class="head">
    <div class="icon"><img src="${userTeam2.team.headImage.imageSmall}"  alt="${userTeam2.team.teamName}"  /></div>
    <div class="infos">
      <h1>${userTeam2.team.teamName}</h1>
      <span>${memberNum}个成员</span>
    </div>
  </div>
  
  <ul class="hnav">
    <li><a href="teamHomePage.htm?teamId=${userTeam2.team.teamId}">小组首页</a></li>
    <li><a href="discussPage.htm?teamId=${userTeam2.team.teamId}">讨论区</a></li>  
    <li  class="this"><a href="membersAdminPage.htm?teamId=${userTeam2.team.teamId}">成员</a></li>
    <c:if test="${userTeam.userPosition=='组长'}">
    <li><a href="manageTeam.htm?teamId=${userTeam2.team.teamId}">管理</a></li>  
    </c:if>    
  </ul>

</div>  
<div class="container-padding clearfix">
   <div class="normal-main"> 
     <div class="mod member-grid">
      <h2>组长</h2>
      <ul class="grids smallpic-grids user-grids">
        <li class="grid"><a href=""><img src="" alt="${userTeam2.user.nickname}"></a>
        <p><a href="" title="${userTeam2.user.nickname}">${userTeam2.user.nickname}</a></p></li>
       </ul>
    </div>
  <c:if test="${!empty userTeams2}">
    <div class="mod member-grid">
      <h2>申请者</h2>
      <ul class="grids smallpic-grids user-grids">
      <c:forEach items="${userTeams2}" var="ut">       
       <li class="grid">
        <a href=""><img src="" alt="${ut.user.nickname}"></a>
        <p><a href="#" title="herriyi">${ut.user.nickname}</a></p>
        <c:if test="${userTeam.userPosition=='组长'}">
        <p>
          <a href="addApplyUser.htm?userTeamId=${ut.userTeamId}" class="opt" title="把${ut.user.nickname}加入小组">加</a>
          <a href="kickOutTeam.htm?userTeamId=${ut.userTeamId}" class="opt" title="把${ut.user.nickname}移除列表">除</a>
        </p>
        </c:if>
       </li>
       </c:forEach>
      </ul>
    </div>
  </c:if>  
   <c:if test="${memberNum>1}">
  <div class="mod member-grid">
    <h2>成员</h2>
    <ul class="grids smallpic-grids user-grids">
    <c:forEach items="${userTeams}" var="uts">
       <c:if test="${uts.userPosition=='组员'}">
       <li class="grid">
        <a href=""><img src="${uts.user.headImage.imageMid}" alt="${uts.user.nickname}"></a>
        <p><a href="#" title="${uts.user.nickname}">${uts.user.nickname}</a></p>
         <c:if test="${userTeam.userPosition=='组长'}">
        <p>
          <a href="kickOutTeam.htm?userTeamId=${uts.userTeamId}" class="opt" title="把${uts.user.nickname}踢出小组">踢</a>
          <a href="banTeamUser.htm?userTeamId=${uts.userTeamId}" class="opt" title="把${uts.user.nickname}封禁">黑</a>
        </p>
        </c:if>
        </li>
        </c:if>
     </c:forEach>   
       </ul>    
      </div>
  </c:if>
  
</div>
    <div class="normal-side">
   <div class="mod">
    <h2>添加和移除</h2>
    <p class="stext">把用户添加进小组，点击头像旁边的"<b>加</b>"。</p>
    <p class="stext">把用户移除小组申请列表，点击头像旁边的"<b>除</b>"。</p>
  </div> 
    
  <div class="mod">
    <h2>踢人和封禁</h2>
    <p class="stext">把成员踢出小组，点击头像旁边的"<b>踢</b>"，踢出去的用户以后可以再次加入小组。</p>
    <p class="stext">永久禁止一个成员加入本小组，点击头像旁边的"<b>黑</b>"。</p>
  </div>
    
</div>
      </div>
  </section>


<jsp:include page="/jsp/include/foot1.jsp"></jsp:include>


</body>
</html>