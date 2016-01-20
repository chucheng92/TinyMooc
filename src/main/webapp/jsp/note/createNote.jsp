<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>写笔记 - 萌课网</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/resource/css/bdsstyle.css"/>">
<script type="text/javascript" src="<c:url value="/resource/js/xheditor/xheditor-1.1.9-zh-cn.min.js"/>"></script>
<script type="text/javascript">
	$(function(){

		$("#note-open-btn").click(function(){

			$("#note-popup-composer").css("visibility","visible")

			});

		$("#chacha").click(function(){

			$("#note-popup-composer").css("visibility","hidden")

			});

		});


</script>


</head>
<body class="flats-theme">
<jsp:include page="/jsp/include/head2.jsp"></jsp:include>
	

	<section class="container course">
		
		<div id="course-main">
			<div id="course-header"
				class="flat course-header course-small-header">
				<div class="imageblock clearfix">
					<div class="imageblock-image">
						<a href=""><img
							src=""width="48" heiht="48"></a>
					</div>
					<div class="imageblock-content">

						<h1 class="mbm">
							<a href="http://www.howzhi.com/course/4631/">突破平面:深度剖析PS</a>
						</h1>

						<div style="margin-left: -5px;">
							<div class="clearfix mtm">

								<div class="pills" style="margin-bottom: 0px">
									<a href="http://www.howzhi.com/course/4631/">课时</a><a
										href="http://www.howzhi.com/course/4631/notes">笔记(2)</a> <a
										href="http://www.howzhi.com/course/4631/members">学员(231)</a>
								</div>



							</div>
						</div>

					</div>
				</div>
			</div>

			<div id="lessoncontent" class="flat lesson-flat">

				<h1>
					<span class="lesson-index">L1</span><span class="lesson-title">像素（1）</span>
				</h1>

				<div class="lesson-toolbar  mbm">
					<div class="lesson-toolbar-inner">
						<div class="lesson-toolbar-main">
							<div class="lesson-toolbar-main-inner clearfix">
								<div class="btn-group fl">
									<a class="btn btn-small  active"
										href="./第1课 像素（1） - 突破平面 深度剖析PS - 好知网_files/第1课 像素（1） - 突破平面 深度剖析PS - 好知网.htm">课时</a><a
										class="btn btn-small "
										href="http://www.howzhi.com/course/4631/lesson/49296/notes">笔记(2)</a>
								</div>


								<div class="btn-group fr posrel">
									<button id="comment-open-btn" class="btn btn-small" title="写评论">
										<i class="icon-comment"></i> 评论
									</button>
									<button id="comment-open-btn" class="btn btn-small" title="写评论">
										<i class="icon-comment"></i> 提问
									</button>
									<button id="note-open-btn" class="btn btn-small" title="写笔记"
										data-open-url="/course/4631/lesson/49296?openNote=1">
										<i class="icon-pencil"></i> 写笔记
									</button>
									<span class="float-new posabs" style="top: -12px; right: 0;"></span>
								</div>



							</div>
						</div>
					</div>
				</div>
				<div class="editor-content">
					<div class="media-player" id="lesson-media-player"
						data-media="{&quot;swf_url&quot;:&quot;http:\/\/static.video.qq.com\/TPout.swf?vid=j0115pacn28&amp;auto=1&quot;}">
						<object width="600" height="450" id="_3733662963"
							name="_3733662963"
							data="http://static.video.qq.com/TPout.swf?vid=j0115pacn28&auto=1"
							type="application/x-shockwave-flash">
							<param name="allowfullscreen" value="true">
							<param name="allowscriptaccess" value="always">
							<param name="quality" value="high">
							<param name="wmode" value="opaque">
						</object>
					</div>
					<div class="gray fsn">
						小提示：如无法播放此课程视频，请<a
							href="http://www.howzhi.com/group/feedback/discuss/1827"
							target="_blank" class="thin fsn">查看帮助</a>或<a target="_blank"
							href="http://wpa.qq.com/msgrd?v=3&uin=2485597828&site=qq&menu=yes"
							class="thin fsn">联系客服</a>。
					</div>

				</div>


				<div class="around-nav tar">

					<a href="http://www.howzhi.com/course/4631/lesson/49297"
						class="next" title="下一课『像素（2）』">下一课『像素（2）』</a>

				</div>

			</div>

			<div class="btn-toolbar mbl clearfix" id="lesson-user-actions">
				<span class="pull-right"> <a href="javascript:"
					id="set-learned-btn" class="btn btn-success"
					data-ajax-url="/course/4631/lesson/49296/setlearned"
					data-ajax-type="post" tabindex="-1"><i class="glyphicon-ok"></i>
						学过了</a> <a href="javascript:" id="cancel-learned-btn"
					class="btn btn-success disabled"
					data-ajax-url="/course/4631/lesson/49296/cancellearned"
					style="display: none;"><i class="glyphicon-ok"></i> 已学</a>
				</span>

				<div class="pull-left">

					<div id="bdshare" class="bdshare_b" style="line-height: 12px;"
						data="{&quot;wbuid&quot;:&quot;2169640904&quot;,&quot;url&quot;:&quot;http://www.howzhi.com/course/4631/&quot;,&quot;text&quot;:&quot;突破平面:深度剖析PS&quot;,&quot;desc&quot;:&quot;&amp;amp;lt;Photoshop 核心功能与平面设计&amp;amp;gt;教学课程，由国内Photoshop软件专家周珂令完整讲解，周珂令老师总结多年的工作与教学经验，抓住初学者在学习Photoshop中的最难理解的核心问题，为大家开设专题讲座...&quot;,&quot;comment&quot;:&quot;&amp;amp;lt;Photoshop 核心功能与平面设计&amp;amp;gt;教学课程，由国内Photoshop软件专家周珂令完整讲解，周珂令老师总结多年的工作与教学经验，抓住初学者在学习Photoshop中的最难理解的核心问题，为大家开设专题讲座...&quot;,&quot;pic&quot;:&quot;http://f1.howzhi.com/ci/2013/08-22/14501023d250366903.jpg&quot;}">
						<img src="">
					</div>
				</div>
				<div data-toggle="spamreport" data-key="lesson-49296"
					data-anchor="#lessoncontent" class="btn btn-small fl mll">
					<a data-toggle="reportbtn" href="javascript:;"
						class="minor-link reply-opt mhs fr" tabindex="-1">举报</a>
				</div>

			</div>
			

			
			<div class="flat">
				<h2>相关课程</h2>
				<ul class="course-cards" id="course-looking-panel">
					<li>
						<div class="course-item">
							<div class="thumb">
								<a href=""><img src=""alt="Photoshop CS 高手之路（完整版）"></a>
							</div>
							<p class="title">
								<a href="http://www.howzhi.com/course/2593/"
									>Photoshop CS 高手之路（完整版）</a>
							</p>
							<p class="metas clearfix">
								<span class="fr learn" title="学员人数">1132</span> <span
									class="fr view mrm" title="查看次数">25201</span> <span
									class="fl by">by <a
									href=""
									class="show-user-card " data-uid="7231" title="零度">零度</a></span>
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div id="course-cover">
			<div class="dialog" id="note-popup-composer"
				style="visibility:hidden;">
				<div class="wrap">
					<div class="title">
						<a href="javascript:;" class="close clost-it dialog-close" data-role="cancel" id="chacha">x</a> <span class="text">笔记：像素（1）</span>
					</div>

					<div class="content">
						<form action="" method="post" id="note-form" novalidate="">
							<div class="phs pvs">
								<div class="error" style="display: none"></div>
								<div class="mbs">
								
									 <textarea class="xheditors" id="content" name="content" required="required"></textarea>
											
									
								</div>
								<div class="clearfix">
									<div class="fl">
										<select id="note_status" name="note[status]"
											required="required"><option value="1"
												selected="selected">公开笔记</option>
											<option value="0">私有笔记</option></select>
									</div>
									<div class="fr">
										
										<button type="submit" class="btn btn-success"
										id="note-submit-btn">保存</button>
									</div>
								</div>
								<input type="hidden" id="" name="userCourseId" value=""> 
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div id="course-side">

			<div class="flat lesson-summary-flat">
				<h2>课时简介</h2>
				<p>像素（1）</p>
			</div>
			<div class="flat lesson-nav" id="lesson-window-list"
				style="display: block;">
				<a href="javascript:;" class="fr fsn more-items">+ 展开</a> <a href="javascript:;"class="fr fsn less-items" style="display: none;">- 收起</a>
				<h2>课时列表</h2>
				<ul>

					<li class=" current"><span class="lesson-index">L1</span> <span
						class="lesson-title"> <a href="">像素（1）</a>
					</span></li>
					
				</ul>
				<div class="clearfix window-list-bottom">
					<span class="fl">共12课时</span>
					<div class="fr">
						<a href="javascript:;" class="prev-page btn btn-mini disabled">&lt;</a>
						<a href="javascript:;" class="next-page btn btn-mini">&gt;</a>
					</div>
				</div>
			</div>

			<div class="flat" data-role="adv" data-model="text"
				data-type="course" data-position="side_top" data-typeid="4631"
				data-limit="5" style="">
				<h2>推荐书目</h2>
				<ul class="text-list">
					
					<li><a href="http://www.howzhi.com/recommendbook/40"
						target="_blank">Photoshop修色圣典（第5版）</a></li>
				</ul>
			</div>

			<div class="flat">
				<h3>课程创建人</h3>

				<div class="course-author-block imageblock clearfix">
					<div class="imageblock-image">
						<a href="" class="show-user-card"data-uid="7800"><img src=""></a>
					</div>
					<div class="imageblock-content">

						<a href="javascript:;" id="follow-course-author-7800"
							class="btn btn-small action-ajax fr"><i
							class="icon-plus"></i> 关注TA</a> 
							<a href="javascript:;"id="unfollow-course-author-7800"class="btn btn-small disabled action-ajax fr"style="display: none;" ><i
							class="icon-plus"></i> 已关注</a>


						<div class="nickname">
							<a href="http://www.howzhi.com/u/tutu/" class="show-user-card "
								data-uid="7800" title="图图">图图</a>
						</div>
						<div>
							<a href="http://www.howzhi.com/u/tutu/library?tab=created"
								class="stats"><em>28</em> 课程</a> <a
								href="http://www.howzhi.com/u/tutu/fans" class="stats"> <em>433</em>
								粉丝
							</a>
						</div>
					</div>



				</div>
			</div>

			<div class="flat">
				<h3>12人学过</h3>
				<a href="" title="大饼油条脆麻花">
				<img src=""alt="大饼油条脆麻花的头像" width="24" height="24"></a> 
			</div>

			<div class="flat clearfix">
				<h2>课程最新笔记</h2>
				<ul class="text-list">
					<li><a href="">像素（1）的笔记</a>
						<div class="gray"></div></li>
				</ul>

			</div>
			<div class="flat">
				<h3>相关小组</h3>
				<ul class="grids smallpic-grids">
					<li class="grid"><a
						href=""><img src="" class="thumb"></a>
						<p>
							<a href="">Photoshop照片后期处理学习交流</a>
						</p></li>
					
				</ul>

			</div>

			<div class="flat latest-topics clearfix">
				<h2>相关小组最新话题</h2>
				<ul class="text-list">
					<li><a href="http://www.howzhi.com/group/snap/discuss/13801">西湖暮色</a></li>
					
				</ul>
			</div>
		</div>
	</section>
	<div class="modal" id="question-popup-composer" style="display: none;">
		<div class="modal-header">
			<a href="javascript:;" class="close dialog-close" data-role="cancel">×</a>
			<h3 data-role="title">不懂就问</h3>
		</div>
		<div class="modal-body" data-role="body">

			<form class="text-add-form question-add-form" id="" method="post"
				action="" novalidate="">
				<div class="form-panel">

					<textarea id="question_title" name="question[title]"
						required="required" class="title-field"></textarea>
					<textarea id="question_content" name="question[content]"
						required="required" class="content-field" style="display: none;"></textarea>
					<div class="btns clearfix">
						<input type="hidden" id="question_holderKind"
							name="question[holderKind]" value="course"><input
							type="hidden" id="question_holderId" name="question[holderId]"
							value="4631"><input type="hidden" id="question_lessonId"
							name="question[lessonId]" value="49296"><input
							type="hidden" id="question__token" name="question[_token]"
							value="0a8bd94f9580b0a988bf39661c5135f74ecde485"> <a
							href="javascript:;" class="fr show-question-form-content-field">添加问题详细描述</a>
						<button type="submit" class="btn btn-success">添加问题</button>
					</div>
				</div>
				<div class="tac fsm success-panel pvl phl" style="display: none;">
					您的问题已添加，您可以<a href="http://www.howzhi.com/course/4631/questions"
						class="show-form-panel">查看问题</a>或者<a href="javascript:;"
						class="dialog-close">继续学习！</a>
				</div>

			</form>

		</div>
		<div class="modal-footer" data-role="footer"></div>

	</div>
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