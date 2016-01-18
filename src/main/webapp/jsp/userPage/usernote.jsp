<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>笔记</title>
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
<body class="lily-theme">



<jsp:include page="/jsp/include/head2.jsp"></jsp:include>





<section class="content container">

  <div class="container-padding clearfix">
    <div class="UIImageBlock upage-top clearfix">
    		<div class="UIImageBlock_Image">
    				<img src="<c:url value="${user1.headImage.imageMid}"/>" alt="" class="img" width="100" height="100">
  			</div>
    		<div class="UIImageBlock_Content">
    			<div class="head">
            		<div class=""><h2>${user1.nickname}</h2></div>
   		 		</div>
   		 		<c:if test="${empty user1.signature}">
    			<div class="mood">
                	<a href=""> ^.^ <span class="fsn">设置签名档</span></a>
              	</div>
     		</c:if>
     		<c:if test="${!empty user1.signature}">
    			<div class="mood">
                 	<span class="fsn">${user1.signature}</span>
              	</div>
     		</c:if>
    
    		</div>
    		
    <div class="nav clearfix">
      <a href="goPersonnal.htm?userId=${user1.userId}" >主页</a>
      <a href="goPersonalTeam.htm?userId=${user1.userId}">小组</a>
      <a href="goPersonalAtt.htm?userId=${user1.userId}" >好友</a>
      <a href="goPersonalNote.htm?userId=${user1.userId}" class="on">笔记</a>
    </div>
  </div>
<div class="mod">

						<ul class="course-notes-list">
						<c:forEach items="${notelist}" var="notelist">
						<c:if test="${!empty notelist.notes}">
							<li class="">
								<div class="course-notes">
									<div class="course-info clearfix">
										<a href=""><img src=""  class="picture" /></a>
										<a href="">${notelist.course.courseTitle}</a> 
										<a href="javascript:;" class="toggle">+ 展开</a> 
									</div>

									<ul class="node-rows note-list" style="display: none;">
										<c:forEach items="${notelist.notes}" var="notes">
										<c:if test="${user1.userId!=user.userId}">
										<c:if test="${notes.public_=='是'}">
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
																<c:if test="${user1.userId==user.userId}">
																<a href="deleteNote.htm?noteId=${notes.noteId}" class="btn btn-small fr mhs delete-btn">删除</a>
																<a href=""class="btn btn-small fr mhs">编辑</a>
																</c:if>
																<a href=""class="btn btn-mini active">公开笔记</a>
																
															</div>

														</div>
													</div>
													<div class="metas">
														by <a href=""
															class="show-user-card " data-uid="1359524"
															>${user.nickname}</a> 
															 <span class="mhs digg-rate" id="note-13164-digg-rate" style="display: none;"></span> 
															 <span class="mhs time">${notes.addDate}</span>
													</div>
												</div>
											</div>
										</li>
										</c:if>
										<c:if test="${notes.public_=='否'}">
										<li class="node-row">
										<div class="imageblock">
												<div class="imageblock-content">
													<div>
														<a href="" class="title">${notelist.course.courseTitle}的笔记</a>
													</div>
												<div class="editor-content">
													<p>笔记作者没有将此笔记公开！</p>
												</div>
												</div>
												</div>
												</li>
										</c:if>
										</c:if>
								<c:if test="${user1.userId==user.userId}">
									
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
															>${user.nickname}</a> 
															 <span class="mhs digg-rate" id="note-13164-digg-rate" style="display: none;"></span> 
															 <span class="mhs time">${notes.addDate}</span>
													</div>
												</div>
											</div>
										</li>
										
										</c:if>
									</c:forEach>
									</ul>

								</div>
							</li>
							</c:if>
						</c:forEach>
						</ul>
					</div>




 </div>

    

</section>
<jsp:include page="/jsp/include/foot.jsp"></jsp:include>


</body>
</html>