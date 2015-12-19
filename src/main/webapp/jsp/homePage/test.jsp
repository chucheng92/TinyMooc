<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" href="<c:url value="/css/zzsc.css"/>" rel="stylesheet" />
<script type="text/javascript" src="<c:url value="/js/jquery.min.js"/>"></script>
<script type="text /javascript" src="<c:url value="/js/zzsc.js"/>"></script>
</head>
<body>
<h1>第一课时评分</h1>

<c:if test="${a!='0.0'}">
<div id="xzw_starSys">
	<div id="xzw_starBox">
		<ul class="star" id="star1">
			<li><a href="javascript:void(0)" title="很差" class="one-star"></a></li>
			<li><a href="javascript:void(0)" title="较差" class="two-stars"></a></li>
			<li><a href="javascript:void(0)" title="还行" class="three-stars"></a></li>
			<li><a href="javascript:void(0)" title="推荐" class="four-stars"></a></li>
			<li><a href="javascript:void(0)" title="力荐" class="five-stars"></a></li>
		</ul>
		<div class="current-rating" id="showb1">
			<input type="hidden" name="grade" value="" id="score1">
			<input type="hidden" name="a" value="${a}" id="aa">
		</div>
	</div>
</div>
<span>${a}</span>
</c:if>
<c:if test="${a=='0.0'}">

<span>还没有人评分，快去评分吧</span>
</c:if>
<br>
<div id="xzw_starSys">
	<div id="xzw_starBox">
		<ul class="star" id="star">
			<li><a href="javascript:void(0)" title="很差" class="one-star"></a></li>
			<li><a href="javascript:void(0)" title="较差" class="two-stars"></a></li>
			<li><a href="javascript:void(0)" title="还行" class="three-stars"></a></li>
			<li><a href="javascript:void(0)" title="推荐" class="four-stars"></a></li>
			<li><a href="javascript:void(0)" title="力荐" class="five-stars"></a></li>
		</ul>
		<div class="current-rating" id="showb">
			<input type="hidden" name="grade" id="score">
			<input type="hidden" name="course" id="courseId" value="1">
		</div>
	</div>
</div>
</body>
</html>