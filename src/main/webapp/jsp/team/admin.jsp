<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="sicd" uri="/sicd-tags"%>
<!DOCTYPE HTML>
<!--[if lt IE 7]><html class="ie ie6"><![endif]-->
<!--[if IE 7]><html class="ie ie7"><![endif]-->
<!--[if IE 8 ]><html class="ie8"><![endif]-->
<!--[if !IE]><!--><html><!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title> 基本信息设置 - 起风了的小组管理 - 好知网</title>
  <link rel="Shortcut Icon" href="<c:url value="/pic/icon.ico" />" />
  <link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.css"/>" media="screen">
  <script type="text/javascript" src="<c:url value="/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/css/components.css"/>">
   <link rel="stylesheet" href="<c:url value="/css/site.css"/>">
  <link rel="stylesheet" href="<c:url value="/css/site_v2.css"/>">
  <link rel="stylesheet" href="<c:url value="/css/site_v3.css"/>">
    <script type="text/javascript" src="<c:url value="/js/label.js"/>"></script>
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


<header class="header" id="header">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>


<section class="container">
  <div class="group-header" style="background-image:url(<c:url value="/pic/imagehead/group-header.jpg"></c:url>)">

  <div class="head">
    <div class="icon"><img src=""  alt="${userTeam2.team.teamName}"  /></div>
    <div class="infos">
      <h1>${userTeam2.team.teamName}</h1>
      <span>${memberNum}个成员</span>
    </div>
  </div>
  
  <ul class="hnav">
    <li><a href="teamHomePage.htm?teamId=${userTeam2.team.teamId}">小组首页</a></li>
    <li><a href="discussPage.htm?teamId=${userTeam2.team.teamId}">讨论区</a></li>  
    <li><a href="membersAdminPage.htm?teamId=${userTeam2.team.teamId}">成员</a></li>
    <c:if test="${userTeam.userPosition=='组长'}">
    <li class="this"><a href="manageTeam.htm?teamId=${userTeam2.team.teamId}">管理</a></li>  
    </c:if>   
  </ul>

</div> 
 <div class="container-padding clearfix">
  <div class="mod">
  <div class="tab-nav clearfix">
  <ul>
    <li class="this"><a href="admin.jsp">基本设置</a></li>
    <li><a href="goteampicture.htm?teamId=${userTeam2.team.teamId}">图标设置</a></li>
  </ul>
</div>
      
    <form id="group-base-form" class="form group-base-form" method="post" action="updateTeamInfo.htm">
      
      <p>
        <label for="groupbase_name" class="required">小组名称:</label>
        
                  <input type="text" id="teamName" name="teamName" required="required"    class="wide" value="${userTeam2.team.teamName}" />
                
      </p>
      <p>
        <label for="groupbase_about" class="required">小组介绍:</label>
        <textarea id="teamIntro" name="teamIntro" required="required"    class="wide low mceEditor">${userTeam2.team.teamIntro}</textarea>
      </p>
       <input type="hidden" name="teamId" value="${userTeam2.team.teamId}"/> 
       
      
        <p><label for="groupbase_about" class="required">标签:</label></p>
        <div class="mod">
    	<div class="addLabels" style=" height:200px; width:400px;float:left;" align="left"> 		
			<div class="keywords">
			<sicd:label previousLabels="${previousLabels}" hotLabels="${labels}"/>
			</div>
			<br>
				<button  class="btn btn-success" type="submit" value="" id="checkl" >保存</button>		
		</div> 
  	</div>
           
    </form>
    </div>
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