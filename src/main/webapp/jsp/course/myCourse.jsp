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

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>

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


<body class="archive category category-gnews category-3">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>


<div class="movedown"></div>

<div class="wrapper">
    <div class="left">

        <header>
            <div class="movedown"></div>
            <div class="side">

                <jsp:include page="/jsp/include/leftside.jsp"></jsp:include>

            </div>
        </header>

        <div class="garlic"></div>

    </div>

    <div class="right-container">
        <div class="right-top-banner gnews-banner-major">
            <div></div>
        </div>
        <div class="right-top"></div>
        <div class="right">


            <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">
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

            </article>

            <div class="movedown2"></div>

        </div> <!-- end .right -->
        <div class="right-bottom"></div>

        <div class="movedown"></div>

    </div> <!-- end .right-container -->

    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</div>


</body>
</html>