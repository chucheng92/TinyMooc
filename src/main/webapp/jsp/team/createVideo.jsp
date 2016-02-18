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
  <title> 分享 - 产品经理小组 - 萌课网</title>
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


<header class="header" id="header">

  <div class="container">
    <a class="logo" href="<c:url value="/jsp/homePage/homePage.jsp"/>"><img src="<c:url value="/pic/logo.png" />" width="80"
				height="26"><em></em></a>

			<ul class="header-nav">
				<li class="item"><a href="<c:url value="/jsp/homePage/homePage.jsp"/>" class="trigger">首页</a></li>
				<li class="item course"><a href="#" class="trigger" id="course">课程<span
						class="down-triangle"></span></a>
					<div class="menus">
						<ul class="clearfix">
							<li><a href="">摄影</a></li>
							<li><a href="">编程</a></li>
							<li><a href="">兴趣</a></li>
							<li><a href="">电脑</a></li>
							<li><a href="">语言</a></li>
							<li><a href="">生活</a></li>
							<li><a href="">职场</a></li>
							<li><a href="">文化</a></li>
							<li><a href="">音乐</a></li>
						</ul>
					</div></li>
				<li class="item"><a href="<c:url value="/jsp/team/team.jsp"/>" class="trigger">小组</a></li>
			</ul>

			<form class="search-form" action="#" method="get">
				<input type="text" class="search-input" value="" name="q"
					placeholder="想学什么?搜搜看..."> <input type="submit"
					class="search-btn" value="">
			</form>

    <div class="user-status-bar">
          <div class="status-item-wrapper">
        <a href="" class="status-item notification-remind"></a>
        <a href="" class="remind-number" id="notification-remind-number" style="display:none;">0</a>
      </div>
      <div class="status-item-wrapper">
        <a href="" class="status-item message-remind"></a>
        <a href="" class="remind-number" id="message-remind-number" style="display:none;">0</a>
      </div>
      <div class="status-item-wrapper" id="user-nav-item-wrapper">
        <a href="#" class="status-item user-nav-item" id="user"><img src="" alt="fanfanle" class="avatar" /><span class="nickname">fanfanle</span></a>
        <div class="user-nav-menus">
        <a href="">个人主页</a>
          <a href="">好友邀请</a>
          <a href="">任务中心</a>
          <a href="">账户设置</a>
          <div class="menu-divider"></div>
          <a href="">退出</a>
        </div>
      </div>
        </div>
  
  </div>
</header>


<section class="container discussion-form-container">
  <div class="container-padding clearfix">
    <div class="fsm pbm"><a href="team.jsp">小组</a> &raquo;
  <a href="teamHome.jsp" id="group-url">产品经理</a> &raquo;
          <span>分享</span></div>    
    <h1>分享视频</h1>
    
    <form id="group-share-form" class="dform discussion-form share-form" method="post" novalidate>
      <div class="normal-main">
        <div class="mod">
          
          
          <div class="item" id="shareform-title-item" style="display:none;">
            <label class="item-label required" for="groupshare_title">标题</label>
            <input type="text" id="groupshare_title" name="groupshare[title]" required="required"    class="item-input" />
          </div>
          
          <div class="item share-preview" id="shareform-preview" style="display:none;">
            <div class="close"><a href="javascript:;" id="shareform-preview-close" title="重选">X</a></div>
            <div class="url"></div>
            <div class="thumb"></div>
          </div>
          
          <div class="item" id="shareform-url-item">
            <label class="item-label required" for="groupshare_webUrl">链接地址</label>
            <input type="text" id="groupshare_webUrl" name="groupshare[webUrl]" required="required"    class="item-input" />
                          <div class="hint">输入视频网站播放页面的网址(支持 优酷/土豆/酷6/新浪视频 )</div>
                        
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
  <div class="fl footer-links">
    <span class="copyright">©2011 HOWZHI.COM <a href="http://www.miibeian.gov.cn/">浙ICP备1102461-7</a> </span>
    <br>
    <a href="http://www.howzhi.com/info/about">关于好知</a>
    <a href="http://www.howzhi.com/daren/">好知达人</a>
    <a href="http://www.howzhi.com/info/contact">联系我们</a>
    <a href="http://www.howzhi.com/info/links">友情链接</a>
    <a href="http://www.howzhi.com/group/feedback/">意见反馈</a>
  </div>
  <div class="fr tar about">
    关注我们：
    <a href="http://weibo.com/howzhicom" title="好知网(新浪微博)" target="_blank">新浪</a>
    <a href="http://t.qq.com/howzhicom" title="好知网(腾讯微博)" target="_blank">腾讯</a>
    <a href="http://site.douban.com/124522/" title="豆瓣小站" target="_blank">豆瓣</a>
    <a href="http://page.renren.com/600915196" title="人人网" class="noborder" target="_blank">人人</a>
  </div>  
</footer>

<a href="javascript:;" class="go-top" id="go-top" style="display:none;"></a>




<script>
var __seajs_debug = 0;
var __seajs_assets_version = '169';

seajs.use('/bundles/topxiaweb/js/app.js?169', function(app) {
	app.context = {};

		app.context.user = {
		id : 1359470,
		nickname : 'fanfanle',
		login : true
	};
	
  app.bootstrap();
  app.load('groupsharecreate', {shareType:'video'});});

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>

<div style="display:none;">
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F4d17172b485f74c1bd66be85d5fe26cc' type='text/javascript'%3E%3C/script%3E"));
</script>
</div>


<div id="login-dialog-trigger" data-ajax-url="/login/dialog" style="display:none" />

</body>
</html>
