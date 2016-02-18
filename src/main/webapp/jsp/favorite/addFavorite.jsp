<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>添加收藏</title>
<link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">
<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<script type="text/javascript" >
$().ready(function(){
	$("button#close").click(function(){
		parent.$.fancybox.close();
		parent.window.location.reload(true);
	});
});
</script>

</head>
<body>
			
<div style="margin-right:auto;margin-left:auto;width:950px;">
		<div class="p10" id="editDiv">
		
		<form action="createFavorite.htm" id="form" method="post">						
			<p><span><span class="t">网页标题：</span><input class="text required" id="url" value="${title}" maxlength="20" name="title" style="width:60%;" type="text"/></span></p>
			<p><span><span class="t">网页链接：</span><input class="text required" id="title" value="${url}" maxlength="500" name="url" style="width:60%;" type="text"/></span></p>
			<input type="hidden" value="${objectId}" name="objectId">			
			<p class="loginP"><input type="submit" class="btn" value="保存"></p>
		</form>
		</div>
	</div>
<!-- 主区域   end -->

</body>

</html>		
		

