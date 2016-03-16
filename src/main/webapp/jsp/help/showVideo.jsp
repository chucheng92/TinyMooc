<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="style/css"
	href="<c:url value="/acornmediaplayer/acornmediaplayer.base.css"/>" />
<link rel="stylesheet" type="style/css"
	href="<c:url value="/acornmediaplayer/themes/darkglass/acorn.darkglass.css"/>" />
<script type="text/javascript"
	src="<c:url value="/acornmediaplayer/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/acornmediaplayer/jquery-ui-1.8.7.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/acornmediaplayer/jquery.acornmediaplayer.js"/>"></script>
<title>观看视频</title>
</head>
<body>


	<%-- <h3>视频播放</h3>
	<div>视频内容：课程名</div>
	<div>
		<embed src="<c:url value='/resource/video/${video.videoUrl}'/>"
			autostart="false" loop="false" width="500" height="300">
		</embed>
	</div> --%>
	<video width="600" height="400" controls="controls"> 
	<source src="<c:url value='/resource/video/${video.videoUrl}'/>" type="video/mp4" /> 
	
	Your browser does not support the video tag. 
	</video>
</body>
</html>