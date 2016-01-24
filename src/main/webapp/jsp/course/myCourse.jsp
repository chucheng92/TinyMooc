<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="sicd" uri="/sicd-tags"%> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>我的课程 - 萌课网</title>
  <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">

<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v3.css"/>">
<link rel="stylesheet" type="text/css"href="<c:url value="/resource/js/fancybox/jquery.fancybox-1.3.4.css"/>"/>
<script type="text/javascript" src="<c:url value="/resource/js/fancybox/jquery.fancybox-1.3.4.pack.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resource/js/ga.js"/>"></script>

<script type="text/javascript" >
$().ready(function(){
	$('.manage').click(function(e){
		var courseId=$(this).parent().children(".cid").val();		
	   	e.preventDefault();
	   	$.fancybox( 
	   	{href:'manageCoursePage.htm?courseId='+courseId,   		
		   	title:'管理课程',type:'iframe',
	   		onComplete: function() {
	    		   parent.$("#fancybox-title").css({'top':'-15px', 'bottom':'auto'});
	    		 }
	   	},{
	   		    hideOnOverlayClick:false,
	   		    width:750,
	    		height:400,
	    		autoScale:true,
	    		scrolling:'no'
	   	}		 
	   	 );
	    });
});
</script>

</head>
<body class="flats-theme">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

<section class="container clearfix" style="margin-top: 60px;">
  <div id="me" class="me clearfix">
    <div class="main">
      <div class="wrap">

         

 <div class="mod">    
     <table class="datagrid">
        <thead>
          <th colspan="2">课程</th>
          <th>简介</th>
          <th colspan="2">状态</th>
        </thead>
        <tbody>
        <c:if test="${empty myCreatedCourseList}">您还没有创建课程</c:if>
        <c:if test="${!empty myCreatedCourseList}">
        <c:forEach items="${myCreatedCourseList}" var="myCourse">
           <tr>
            <td class="favorite-name">
             <a href="courseDetailPage.htm?courseId=${myCourse.course.courseId}">${myCourse.course.courseTitle}</a>
            </td>
            <td class="favorite-url"></td>
            <td class="favorite-url">
              ${fn:substring(myCourse.course.courseIntro,0,40)}
            </td>
            
            <td class="tac" style="text-align: left;">
              ${myCourse.course.courseState}
            </td>          
            <td class="tac">
            <input type="hidden" value="${myCourse.course.courseId}" class="cid">
            <c:if test="${myCourse.course.courseState=='批准'}">
                    <a href="#" class="manage">管理</a>
             </c:if>
            </td>
           
          </tr>
        </c:forEach>
        </c:if>
         </tbody>
      </table>
      	<div class="pagination pagination-centered">
			<ul>
               <li>
                 <sicd:page curPage="${curPage}" url="${url}" totalPage="${totalPage}" />
                 </li>
			   </ul>
		</div>
  </div>

</div>
    </div>
    <div class="side">

      <div class="avatar-mod clearfix">
        <a href="user.jsp" class="avatar"><img src="<c:url value="${user.headImage.imageMid}"/>" /></a>
        <div class="infos">
          <div class="nickname"><a href="user.jsp" title="fanfanle">${user.userName}</a></div>
          <div class="icons">
            <a class="user-level user-level-6" title="努力升级吧!" href="turnToHelpPage.htm" target="_blank">${requestScope.myLevel.lv}级</a>
            <a class="user-level user-level-6">${requestScope.myLevel.title}</a>

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
          <li ><a href="myTinyMooc.htm"><i class="feature-icon feature-icon-home"></i>我的萌课</a></li>
          <li class="active"><a href="courseList.htm"><i class="feature-icon feature-icon-teach"></i>课程管理</a></li>
          <li ><a href="goNote.htm"><i class="feature-icon feature-icon-note"></i>笔记</a></li>
          <%--<li ><a href="challenge.htm"><i class="feature-icon feature-icon-faq"></i>微挑战</a></li>--%>
          <%--<li ><a href="rank.htm"><i class="feature-icon feature-icon-faq"></i>微排行</a></li>--%>
          <%--<li ><a href="myrank.htm"><i class="feature-icon feature-icon-faq"></i>我的排行</a></li>--%>
          <li ><a href="teamPage.htm"><i class="feature-icon feature-icon-group"></i>小组</a></li>
          <%--<li ><a href="shop.htm"><i class="feature-icon feature-icon-faq"></i>商城</a></li>--%>
          <%--<li ><a href="myprop.htm"><i class="feature-icon feature-icon-faq"></i>我的道具</a></li>--%>
          <li ><a href="myFavotite.htm"><i class="feature-icon feature-icon-favorite"></i>收藏夹</a></li>
        </ul>

        <div class="divider"></div>

        <ul class="menus">
          <li ><a href="myAttention.htm"><i class="feature-icon feature-icon-friend"></i>好友</a></li>
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


<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body>
</html>