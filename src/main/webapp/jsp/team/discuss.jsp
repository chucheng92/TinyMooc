<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]><html class="ie ie6"><![endif]-->
<!--[if IE 7]><html class="ie ie7"><![endif]-->
<!--[if IE 8 ]><html class="ie8"><![endif]-->
<!--[if !IE]><!--><html><!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>${userTeam2.team.teamName} - 好知网</title>
  <link rel="Shortcut Icon" href="<c:url value="/pic/icon.ico" />" />
  <link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.css"/>" media="screen">
  <script type="text/javascript" src="<c:url value="/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v3.css"/>">
<script type="text/javascript" src="<c:url value="/js/ga.js"/>"></script>
 
 <script type="text/javascript">
$(function(){

	$("#course").mouseover(function(){

			$(".menus").css("display","block");

		});
	$(".item.course").mouseleave(function(){

		$(".menus").css("display","none");

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
    <li  class="this"><a href="discussPage.htm?teamId=${userTeam2.team.teamId}">讨论区</a></li>  
    <li><a href="membersAdminPage.htm?teamId=${userTeam2.team.teamId}">成员</a></li>
    <c:if test="${userTeam.userPosition=='组长'}">
    <li><a href="manageTeam.htm?teamId=${userTeam2.team.teamId}">管理</a></li>  
    </c:if>   
  </ul>

</div>  
<div class="container-padding clearfix">
        <div class="normal-main"> 
         <div class="mod last-discuss clearfix">

              <div class="fr">
                 <a href="createDiscussPage.htm?teamId=${userTeam2.team.teamId}" class="btn-s1"><span>发话题</span></a>
              </div>
          <c:if test="${discussNum==0}">
            <h3>本小组暂时还没有话题</h3>
         </c:if>
         <c:if test="${discussNum>0}">
               <h2><span>(共${discussNum}话题)</span></h2>
    
                <div class="group-discuss-categories">
                      <a href="discuss" class="this">全部</a>
                </div>
        
       <div class="discuss-list2">
            <ul>
            <c:forEach items="${discusses}" var="dis">
                <li>
                      <div class="imageblock clearfix">
                          <div class="imageblock-image"><a href="" class="show-user-card"><img src=""></a>
                          </div>
                           <div class="imageblock-content">
         
                                 <p class="title">
                                 <c:if test="${dis.top==1}">
                                 <span class="stick-flag mrs">[置顶]</span>
                                 </c:if>
                                          <a href="discussDetailPage.htm?discussId=${dis.discussId}">${dis.topic}</a>
                                          <c:if test="${dis.essence=='精华'}">
                                          <img src='<c:url value="/pic/elite-s.png"></c:url>' width="16" height="14" title="精华贴" />
                                          </c:if>  
                                           </p>
                                           <p class="metas">
                                              by <a href="" class="show-user-card " title="${dis.user.nickname}">${dis.user.nickname}</a>
                                            <span class="mhm">${dis.scanNum}</span>
                                                
                                    </p>
                               </div>
                              </div>
                           </li>
                           </c:forEach>
                    </ul>

                </div> 
                </c:if>
           </div>
</div>
    <div class="normal-side">  </div>
      </div>
  </section>

<footer class="footer container">
  <div style="padding: 0px 28px;">
    <div class="fl footer-links">
      <a href="">关于微课程</a>
      <a href="">微课程达人</a>
      <a href="">联系我们</a>
      <a href="">友情链接</a>
      <a href="">意见反馈</a>
      <br>
      <span class="copyright">©2013 MicroCourses.COM <a href="#">陕ICP备1102461-7</a> </span>
    </div>
  </div>
</footer>

</body>
</html>