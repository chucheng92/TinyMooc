<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>编辑讨论</title>
<link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.css"/>" media="screen">
<script type="text/javascript" src="<c:url value="/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
 <script type="text/javascript" src="<c:url value="/js/xheditor/xheditor-1.1.6-zh-cn.js"/>"></script>
<script type="text/javascript" >
$().ready(function(){
	$("button#close").click(function(){
		parent.$.fancybox.close();
		parent.window.location.reload(true);
	});
});
</script>
<script type="text/javascript">
$(function(){
 $("#update").click(function(){
     // alert("aaaaaaa");
     $("#form").submit();
	 });	
});
</script>
</head>
<body>
			
<div style="margin-right:auto;margin-left:auto;width:950px;">
		<div class="p10" id="editDiv">		
		<form action="updateDiscuss.htm" id="form" method="post">	
		<p><span><span class="t">主题：</span><input class="text required" id="topic" maxlength="500" name="topic" style="width:60%;" type="text" value="${discuss.topic}"/></span></p>
		<p><span><span class="t">内容：</span><textarea class="xheditors" id="content" name="content" required="required" style="width:60%;" rows="15">${text.content}</textarea></p>
			<input type="hidden" value="${discuss.discussId}" name="discussId">													        
		</form>
		<p class="loginP"><input type="button" class="btn btn-success" value="提交" id="update"></p>			
		</div>
	</div>
<!-- 主区域   end -->
</body>
<script type="text/javascript">
jQuery(function($){
	if($('textarea.xheditors').length!=0){
		$('textarea.xheditors').xheditor({
			upLinkUrl:"uploadFile.htm",
			upLinkExt:"zip,rar,txt,doc,docx,pdf,ppt,pptx,pps,ppsx,xlsx,xls,7z",
			upImgUrl:"uploadPic.htm",
			upImgExt:"jpg,jpeg,gif,png", tools:'simple',
			forcePtag:false,
			html5Upload:false,  
			emotMark:true
				});
		}
	});
	</script>
</html>		
		

