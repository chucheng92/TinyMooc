<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增课时 - 萌课网</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">
<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v3.css"/>">

<script type="text/javascript" src="<c:url value="/resource/js/xheditor/xheditor-1.1.9-zh-cn.min.js"/>"></script>
<script type="text/javascript">
$(function(){
$("a#img").click(function(){
	 $(this).addClass("active");
	 $("a#video").removeClass("active");
     $("#videoSelect").removeAttr("required");
	 $("#content-control-group").css("display","block");
	 $("#media-control-group").css("display","none");
	 $("#lesson-form").removeAttr("enctype");
	 $("#lesson-form").attr("action","createLesson.htm");	
});
$("a#video").click(function(){
	 $(this).addClass("active");
	 $("a#img").removeClass("active");
	 $("#content-control-group").css("display","none");
	 $("#media-control-group").css("display","block");
	 $("#lesson-form").attr({ action: "uploadAll.htm", enctype: "multipart/form-data" });;	
  });
});
</script>

</head>
<body class="flats-theme">
<jsp:include page="/jsp/include/head2.jsp"></jsp:include>
<section class="container ">  
  <div id="course-header"  class="flat course-header course-small-header">
  <div class="imageblock clearfix">
    <div class="imageblock-image">
      <a href=""><img src="" alt="cs50" width="48" heiht="48" /></a>
    </div>
    <div class="imageblock-content">
      <div class="action-bar">
  
  </div>
      <h1 class="mbm"><a href="">${course.courseTitle}</a></h1>
      <div style="margin-left: -5px;"><div class="clearfix mtm">
</div>
</div>
    </div>
  </div>
</div>

  <div class="light-page page-small lesson-form-page" style="">
    <div class="page-head"><h2>添加第${lessons+1}课时</h2></div>
    <div class="page-body clearfix">
      <div class="page-body-main">
         <form id="lesson-form" class="form-horizontal" method="post" data-widget="validator-bootstrap"  data-auto-submit="false" action="uploadAll.htm" enctype="multipart/form-data">
          <div class="control-group">
            <label class="control-label">课时类型</label>
            <div class="controls">
              <div class="btn-group" id="lesson-method-btn-group">
                <a class="btn btn-small" id="img">图文</a>
                <a class="btn btn-small active" id="video">视频</a>
              </div>
              <input type="hidden" name="lessonNum" value="${lessons+1}" id="lesson-method-field" />

            </div>
          </div>
          <div class="control-group" id="media-control-group">
            <label class="control-label">视频地址</label>
            <div class="controls media-controls">
               <input id="videoSelect" type="file" name="url" required="required">
            </div>
          </div>

          <div class="control-group">
            <label class="control-label">标题</label>
            <div class="controls">
              <input type="text" name="courseTitle" value="" data-display="标题" required />
              <input type="hidden" name="courseId" value="${course.courseId}">
            </div>
          </div>

          <div class="control-group" id="content-control-group" style="display: none;">
            <label class="control-label">正文</label>
            <div class="controls">
              <a id="editor-save-images" class="fr"></a>
              <textarea class="xheditors" id="content" name="content" rows="18"  style="width:100%;height:360px;"></textarea>
            </div>
          </div>

             <div class="control-group">
            <label class="control-label">摘要</label>
            <div class="controls controls-state-folded">
            </div>
            <div class="controls controls-state-unfolded">
              <textarea class="aa" name="courseIntro" rows="3" style="width:100%;" required></textarea>
            </div>
          </div>

          <div class="control-group">
            <div class="controls">
              <button class="btn btn-link fr">取消</button>
              <button class="btn btn-success" id="save" type="submit">保存</button>
            </div>
          </div>
         </form>
      </div>
      <div class="page-body-side">
      </div>
    </div>
  </div>
</section>


<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

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