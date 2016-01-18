<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录-微课程</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">
<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v2.css"/>">
<script type="text/javascript" src="<c:url value="/resource/js/ga.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/css/scojs.css"/>">
<script type="text/javascript" src="<c:url value="/resource/js/sco.message.js"/>"></script>
</head>

<body class="loginInfo">
<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

 <script type="text/javascript">
 $(document).ready(function(){
	   
	   var message='<%=request.getAttribute("message")%>';
	   var message2='Welcome back!';
	  
	  if(message==null||message=='null'){
		  
	  }else{
		  $.scojs_message(message, $.scojs_message.TYPE_OK);
	  }
	});
</script>

<section class="container homepage">

    <div id="lessoncontent" class="flat lesson-flat">

      <h1><span class="lesson-index"></span><span class="lesson-title">创建课程</span></h1>

      <div class="lesson-toolbar  mbm">
  <div class="lesson-toolbar-inner">
    <div class="lesson-toolbar-main">
      <div class="lesson-toolbar-main-inner clearfix">
     </div>
    </div>
  </div>
</div>
      <div class="editor-content">
                <h2>第一步：创建课程</h2>
<p>1、创建课程的入口仍然在首页——点击“创建课程”按钮</p>

<h2>第二步：添加课程信息</h2>
<p>1、添加课程标题（标题不宜过长，否则在首页显示会不完整）</p>
<p>2、添加课时简介（课时简介为课程的整体摘要，并非课程正文）</p>
<p>3、选择分类（按造课程内容选择对应的分类）</p>
<p>4、课程创建完成后，在课程页面右边有一个课程发布引导，可以根据引导来完善课程。
其中未完成的步骤会显示灰色，已完成步骤会变成绿色。</p>
<h2>第三步：等待审核通过</h2>
<p>1、完成</p>
      </div>
      <div class="around-nav tar">
      </div>
    </div>
</section>

<jsp:include page="/jsp/include/foot.jsp"></jsp:include>


</body>
</html>