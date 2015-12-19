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
  <title> 发言 -${team.teamName}- 好知网</title>
  <link rel="Shortcut Icon" href="<c:url value="/pic/icon.ico" />" />
  <link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.css"/>" media="screen">
  <script type="text/javascript" src="<c:url value="/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v3.css"/>">
<script type="text/javascript" src="<c:url value="/js/ga.js"/>"></script>
 <script type="text/javascript" src="<c:url value="/js/xheditor/xheditor-1.1.6-zh-cn.js"/>"></script>
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

<section class="container discussion-form-container">

  <div class="container-padding clearfix">
  
  <div class="fsm pbm"><a href="/groups/">小组</a> &raquo;
  <a href="/group/pm365/" id="group-url">${team.teamName}</a> &raquo;
  <span>发表新话题</span></div>  
  
  <form id="group-post-form" class="dform discussion-form" method="post" novalidate action="createDiscuss.htm">
  <div class="normal-main">
    <div class="mod">
    
      
      <div class="item">
        <label class="item-label required" for="discuss_title">主题:</label>
        <input type="text" id="topic" name="topic" required="required"    class="item-input" />
        <input type="hidden" name="teamId" value="${team.teamId}"/> 
      </div>
      
            
      <div class="item">
        <div id="editor-save-images" class="fr"></div>
        <label class="item-label required" for="discuss_content">内容:</label>       
        <textarea class="xheditors" id="content" name="content" required="required"></textarea>
      </div>
      
      <div class="item clearfix">
        <button type="submit" class="btn btn-success fr">发表</button>
        <a href="discuss.jsp" class="btn">取消</a>
      </div>
    
    </div>
  </div>  
  </form>
  
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