<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的笔记 - 萌课网</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />

<link rel="stylesheet" href="<c:url value="/resource/css/bdsstyle.css"/>">

<script type="text/javascript">
	$(function(){
		$(".course-info.clearfix").toggle(function(){
		
				$(this).next().css("display","block");
				
			},function(){

				$(this).next().css("display","none");

			});

		$(".more-btn.or").click(function(){

			$(this).parent().next().css("display","block");
			
			});
		$(".less-btn.or").click(function(){

			$(this).parent().css("display","none");
			
			});
		});


</script>
</head>
<body class="flats-theme">
	<jsp:include page="/jsp/include/head2.jsp"></jsp:include>
	
	
	<section class="container clearfix">
		<div id="me" class="me clearfix">
			<div class="main">
				<div class="wrap">
					<div class="main-head">
						<h2>我的笔记</h2>
					</div>

					<div class="mod">

						<ul class="course-notes-list" data-role="course-notes-list">
						<c:forEach items="${notelist}" var="notelist">
						<c:if test="${!empty notelist.notes}">
							<li class="">
								<div class="course-notes">
									<div class="course-info clearfix">
										<a href="">${notelist.course.courseTitle}</a> 
										<a href="javascript:;" class="toggle">+ 展开</a> 
									</div>

									<ul class="node-rows note-list" data-role="note-list"
										style="display: none;">
										<c:forEach items="${notelist.notes}" var="notes">
										<li class="node-row">
											<div class="imageblock">
											
												<div class="imageblock-content">
													<div>
														<a href="" class="title">${notelist.course.courseTitle}的笔记</a>
													</div>
													<div class="summary">
														<div class="less">
															 <a href="javascript:;" class="more-btn or" id="zhan">(展开)</a>
														</div>
														<div class="more or" style="display: none;" id="kai">
															<div class="editor-content">
																<p>${notes.noteContent}</p>
															</div>
															<a href="javascript:;" class="less-btn or" id="shou">(收起)</a>
															<div class="mvm clearfix">
																<a href="deleteNote.htm?noteId=${notes.noteId}" class="btn btn-small fr mhs delete-btn">删除</a>
																<a href=""class="btn btn-small fr mhs">编辑</a>
																<c:if test="${notes.public_=='是'}">
																<a href=""class="btn btn-mini active">公开笔记</a></c:if>
																<c:if test="${notes.public_=='否'}">
																<a href=""class="btn btn-mini active">私有笔记</a></c:if>
															</div>

														</div>
													</div>
													<div class="metas">
														by <a href=""
															class="show-user-card " data-uid="1359524"
															>${user.userName}</a>
															 <span class="mhs digg-rate" id="note-13164-digg-rate" style="display: none;"></span> 
															 <span class="mhs time">${notes.addDate}</span>
													</div>
												</div>
											</div>
										</li>
									</c:forEach>
									</ul>

								</div>
							</li>
							</c:if>
						</c:forEach>
						</ul>
					</div>

				</div>
			</div>
<div class="side">

      <div class="avatar-mod clearfix">
        <a href="goPersonnal.htm?userId=${user.userId}" class="avatar"><img src="<c:url value="${user.headImage.imageMid}"/>" /></a>
        <div class="infos">
          <div class="nickname"><a href="/u/1359470/" title="fanfanle">${userName}</a></div>
          <div class="icons">
            <a class="user-level user-level-6"  href="/help/#help_user_level" target="_blank">${level.lv}级</a>
			<a class="user-level user-level-6"  href="">${level.title}</a>
          </div>
        </div>
      </div>

      <div class="stats-mod">
          <ul class="user-stats clearfix">
            <li><a href="/me/point"><strong>${user.credit}</strong>学分</a></li>
            <li><a href="/me/coin"><strong>${user.gold}</strong>金币</a></li>
          </ul>
      </div>

       <div class="menu-mod clearfix">
         <ul class="menus">
          <li ><a href="turnToHomePage.htm"><i class="feature-icon feature-icon-home"></i>我的首页</a></li>
          <li ><a href="courseList.htm"><i class="feature-icon feature-icon-teach"></i>我的课程</a></li>
          <li class="active"><a href="goNote.htm"><i class="feature-icon feature-icon-note"></i>笔记</a></li>
          <li ><a href="challenge.htm"><i class="feature-icon feature-icon-faq"></i>微挑战</a></li>
          <li ><a href="rank.htm"><i class="feature-icon feature-icon-faq"></i>微排行</a></li>
          <li ><a href="myrank.htm"><i class="feature-icon feature-icon-faq"></i>我的排行</a></li>
          <li ><a href="teamPage.htm"><i class="feature-icon feature-icon-group"></i>小组</a></li>
          <li ><a href="shop.htm"><i class="feature-icon feature-icon-faq"></i>商城</a></li>
          <li ><a href="myprop.htm"><i class="feature-icon feature-icon-faq"></i>我的道具</a></li>
          <li ><a href="myFavotite.htm"><i class="feature-icon feature-icon-favorite"></i>收藏夹</a></li>
        </ul>

        <div class="divider"></div>

        <ul class="menus">
          <li ><a href="myAttention.htm"><i class="feature-icon feature-icon-friend"></i>好友</a></li>
          <li ><a href="goPrivateMail.htm"><i class="feature-icon feature-icon-message"></i>私信</a></li>
        </ul>

        <div class="divider"></div>

        <ul class="menus">
          <li ><a href="turnToHelpPage.htm"><i class="feature-icon feature-icon-coin"></i>金币</a></li>
          <li ><a href="account.htm"><i class="feature-icon feature-icon-setting"></i>账户设置</a></li>
        </ul>
      </div> 
    </div>
		</div>
	</section>
	
	
	<jsp:include page="/jsp/include/foot.jsp"></jsp:include>
</body>
</html>