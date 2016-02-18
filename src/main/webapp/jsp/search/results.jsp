<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="<c:url value="/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.css"/>" media="screen">
<link rel="stylesheet" href="<c:url value="/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v3.css"/>">
<script type="text/javascript" src="<c:url value="/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<script src="<c:url value="/bootstrap/js/bootstrap.js"/>"></script>	
<script type="text/javascript" src="<c:url value="/js/ga.js"/>"></script>
<title>微课程-小组</title>
<style type="text/css">


.course-cards{
    letter-spacing:-3px;
    margin-right:-23px;
    zoom:1;
}
.course-cards li{
    width:200px;
    display:inline-block;
    *display:inline;
    *zoom:1;
    vertical-align:top;
    letter-spacing:0;
    margin-right:19px;
    margin-bottom:20px;
    *margin-right:18px;
}



.group-cells li {
    width: 50%;
    display: inline-block;
    *display:inline;
    *zoom:1;
    vertical-align:top;
    margin: 0 0;
    padding: 0 0;
    border-top: 1px solid #efefef;
}

.group-cells .group-cell {
    margin: 20px 20px 20px 0;
}

.group-cells .pic {
    float: left;
    padding-right: 10px;
}

.group-cells .info {
    overflow: hidden;
}

.smallpic-grids .grid {
    width: 68px;
}
.clearFloat{
　　visibility: hidden;
　　clear: both;
　　display: block;
　　height: 0px;
　　content: "."
　　}　　
</style>
</head>
<body class="lily-theme">

<c:if test="${empty user.userId}">
	<jsp:include page="/jsp/include/head.jsp"></jsp:include>
	</c:if>
	<c:if test="${!empty user.userId}">
		<jsp:include page="/jsp/include/head2.jsp"></jsp:include>
	</c:if>

<section class="content container" id="search">
  <div class="container-padding clearfix">

    <div class="normal-main">
    

	<div class="tabbable">
		<!-- Only required for left/right tabs -->
		<ul class="nav nav-tabs">
		    <c:if test="${!empty users}">
			<li><a href="#tab1" data-toggle="tab">用户</a></li>
			</c:if>
			  <c:if test="${!empty userTeams}">
			<li><a href="#tab2" data-toggle="tab">小组</a></li>
			</c:if>
			  <c:if test="${!empty userCourses}">
			<li><a href="#tab3" data-toggle="tab">课程</a></li>
			</c:if>
			  <c:if test="${!empty discusses}">
			<li><a href="#tab4" data-toggle="tab">讨论</a></li>
			</c:if>
		</ul>
		<div class="tab-content">

			<div class="tab-pane" id="tab1">	
			<table class="table table-condensed">
			  <tr>
			  <th>用户名</th>
			  <th>用户介绍</th>
			  </tr>

               <c:forEach items="${users}" var="user">
                    <tr>  
					<td><a href="goPersonnal.htm?userId=${user.userId}">${user.userName}</a></td>					
					<td><c:out value="${user.intro}"></c:out></td>					
					</tr>
				</c:forEach>
            </table>			
			</div>
			<div class="tab-pane" id="tab2">
			<table class="table table-condensed">
			  <tr>
			  <th>小组</th>
			  <th>小组介绍</th>
			  <th>创建人</th>
			  <th>创建时间</th>
			  </tr>
               <c:forEach items="${userTeams}" var="userTeam">
                    <tr>  
					<td><a href="teamHomePage.htm?teamId=${userTeam.team.teamId}">${userTeam.team.teamName}</a>
					<td><c:out value="${userTeam.team.teamIntro}"></c:out></td>						
					<td><c:out value="${userTeam.user.userName}"></c:out></td>	
					<td><fmt:formatDate value="${userTeam.team.applyDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>					
					</tr>
				</c:forEach>
             </table>								 								
			</div>
		<div class="tab-pane" id="tab3">
			<table class="table table-condensed">
			  <tr>
			  <th>课程</th>
			  <th>课程介绍</th>
			  <th>创建人</th>
			  <th>创建时间</th>
			  </tr>
               <c:forEach items="${userCourses}" var="userCourse">
                    <tr>  
					<td><a href="courseDetailPage.htm?courseId=${userCourse.course.courseId}">${userCourse.course.courseTitle}</a></td>					
					<td><c:out value="${userCourse.course.courseIntro}"></c:out></td>
					<td><c:out value="${userCourse.user.userName}"></c:out></td>	
					<td><fmt:formatDate value="${userCourse.course.applyDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>					
					</tr>
				</c:forEach>
             </table>								 								
			</div>
			<div class="tab-pane" id="tab4">
			<table class="table table-condensed">
			  <tr>
			  <th>讨论</th>			  		
			  <th>创建人</th>
			  <th>创建时间</th>
			  </tr>
               <c:forEach items="${discusses}" var="discuss">
                    <tr>  
					<td><a href="discussDetailPage.htm?discussId=${discuss.discussId}">${discuss.topic}</a></td>					
					<td><c:out value="${discuss.user.userName}"></c:out></td>	
					<td><fmt:formatDate value="${discuss.publishDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>					
					</tr>
				</c:forEach>
             </table>								 								
			</div>
		</div>
	</div>









    	  <!--   <ul class="list vlist">
  	      	 <li class="item lightitem item-border">                                                          
                 <div class="search-course-item imageblock clearfix pvl">
	             <a href="http://www.howzhi.com/course/pingpang/" class="imageblock-image" target="_blank">
	             <img src="./搜索  体育 - 好知网_files/091110ea5c7b189121.jpg">
	             </a>
	             <div class="imageblock-content">
		         <div class="fsm mbs">[课程] 
			      <a href="http://www.howzhi.com/course/pingpang/" target="_blank"> 唐建军乒乓球教学</a>        	     
		         </div>

		         <div class="mbs"> 唐建军为北京<span class="highlight">体育</span>大学副教授，主攻方向为乒乓球教学与训练理论及其方法。在本课程中，唐教授从基本的握拍方式开始，系统地讲解了乒乓球的相关技巧，让初学者轻松掌握乒乓球。... </div>
		         <div class="gray">
			      by <a href="http://www.howzhi.com/u/91/" target="_blank">三尺青锋</a>
			      <span class="mhs">|</span>
			      <a href="http://www.howzhi.com/learn/balls">球类</a>
			      <span class="mhs">|</span>
			      <a href="http://www.howzhi.com/course/pingpang/" target="_blank">8课时</a>
			      <span class="mhs">|</span>
			      <a href="http://www.howzhi.com/course/pingpang/members" target="_blank">91人学习</a>
			      <span class="mhs">|</span>
			       7471查看
		       </div>
	          </div>
             </div>
  	          </li>  	      	     
           </ul>-->
          </div>
    	      	
    </div>

 

</section>

<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body>
</html>