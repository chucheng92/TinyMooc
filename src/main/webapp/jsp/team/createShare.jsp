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
  <title> 分享 - ${team.teamName} - 好知网</title>
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

<section class="container discussion-form-container">
  <div class="container-padding clearfix">
    <div class="fsm pbm"><a href="team.jsp">小组</a> &raquo;
  <a href="" id="group-url">产品经理</a> &raquo;
          <span>分享</span></div>    
    <h1>分享链接</h1>
    
    <form id="group-share-form" class="dform discussion-form share-form" method="post" novalidate>
      <div class="normal-main">
        <div class="mod">
          
          
          <div class="item" id="shareform-title-item" style="display:none;">
            <label class="item-label required" for="groupshare_title">标题</label>
            <input type="text" id="topic" name="topic" required="required"  class="item-input" />
          </div>
          
          <div class="item share-preview" id="shareform-preview" style="display:none;">
            <div class="close"><a href="javascript:;" id="shareform-preview-close" title="重选">X</a></div>
            <div class="url"></div>
            <div class="thumb"></div>
          </div>
          
          <div class="item" id="shareform-url-item">
            <label class="item-label required" for="groupshare_webUrl">链接地址</label>
            <input type="text" id="groupshare_webUrl" name="groupshare[webUrl]" required="required"    class="item-input" />
                          <div class="hint">输入网址</div>
                        
            <div class="processerror mvs" id="shareform-processerror" style="display:none;"></div>
          </div>
          
          <div class="item" id="shareform-processing-item" style="display:none;">
            <div class="processing">正在分析数据，请稍候！</div>
          </div>
          <div class="item" id="shareform-addlink-item">
            <button type="button" class="btn btn-success" id="shareform-addlink">添加链接</button>
          </div>
          
          <div class="item" id="shareform-note-item" style="display:none;">
            <label class="item-label">描述<em>(可不填)</em></label>
            <textarea id="groupshare_note" name="groupshare[note]" required="required"    class="item-input"></textarea>
          </div>
          
          <div class="item" id="shareform-submit-item" style="display:none;">
            <input type="hidden" id="groupshare_type" name="groupshare[type]" /><input type="hidden" id="groupshare_providerName" name="groupshare[providerName]" /><input type="hidden" id="groupshare_url" name="groupshare[url]" /><input type="hidden" id="groupshare_thumbnailUrl" name="groupshare[thumbnailUrl]" /><input type="hidden" id="groupshare__token" name="groupshare[_token]" value="fb962ee3ec4f42c4fd27dad411af6f2e905c8bde" />
            <button type="submit" class="btn btn-success">分享</button>
            <a href="javascript:;" id="shareform-reset">重选</a>
          </div>
        </div>
      </div>
      
      <div class="normal-side"></div>
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
</html>
