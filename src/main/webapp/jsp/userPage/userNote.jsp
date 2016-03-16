<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>

    <title>笔记</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
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



<body class="archive category category-gnews category-3">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

<div class="movedown"></div>

<div class="wrapper">
    <div class="left">

        <header>
            <div class="movedown"></div>
            <div class="user-side">
                <div class="mod uportrait-mod">
                    <div class="portrait">
                        <img src="<c:url value="${user1.headImage.imageLarge}"/>" alt="">
                    </div>
                </div>

                <div class="mod uinfo-mod">

                    <div class="info-item"><span class="info-item-name">昵称：</span> <strong>${user1.userName}</strong></div>

                    <c:if test="${empty user1.city}">
                        <div class="info-item"><span class="info-item-name">现居：地球村</span></div>
                    </c:if>
                    <c:if test="${!empty user1.city}">
                        <div class="info-item"><span class="info-item-name">现居：${user1.city}</span></div>
                    </c:if>

                    <div class="info-item"><span class="fr">${user1.credit}学分</span><span class="info-item-name">等级：${level.lv}级&nbsp;${level.title}</span></div>

                    <c:if test="${empty user1.intro}">
                        <div class="info-item"><span class="info-item-name">简介：</span> 还什么都没写</div>
                    </c:if>
                    <c:if test="${!empty user1.intro}">
                        <div class="info-item"><span class="info-item-name">简介：</span> ${user1.intro}</div>
                    </c:if>

                    <c:if test="${empty user1.qq}">
                        <div class="info-item"><span class="info-item-name">QQ：</span> 尚未绑定</div>
                    </c:if>
                    <c:if test="${!empty user1.qq}">
                        <div class="info-item"><span class="info-item-name">QQ：</span> ${user1.qq}</div>
                    </c:if>

                    <c:if test="${empty user1.wechat}">
                        <div class="info-item"><span class="info-item-name">微信：</span> 尚未绑定</div>
                    </c:if>
                    <c:if test="${!empty user1.wechat}">
                        <div class="info-item"><span class="info-item-name">微信：</span> ${user1.wechat}</div>
                    </c:if>

                    <c:if test="${user1.userId==user.userId}">
                        <div class="info-item"> <a href="account.htm">编辑个人资料</a> <span class="info-item-name mhs">|</span>  <a href="goAccountAvatar.htm">更新头像</a> </div>
                    </c:if>
                    <c:if test="${user1.userId!=user.userId}">
                        <div class="info-item"><a href="goSendMail.htm?userName=${user1.userName}" class="btn-n2sec">发私信</a></div>
                    </c:if>

                </div>


                <div class="mod">
                    <h3>关注</h3>

                    <div class="mini-users-panel clearfix">
                        <c:forEach items="${attentionList}" var="att">
                            <a href="goPersonal.htm?userId=${att.userByAttentionedUserId.userId}"><img src="<c:url value="${att.userByAttentionedUserId.headImage.imageMid}"/>" title="${att.userByAttentionedUserId.userName}"></a>
                        </c:forEach>
                    </div>
                </div>

                <div class="mod">
                    <h3>粉丝</h3>
                    <div class="mini-users-panel clearfix">
                        <c:forEach items="${fansList}" var="fans">
                            <a href="goPersonal.htm?userId=${fans.userByUserId.userId}"><img src="<c:url value="${fans.userByUserId.headImage.imageMid}"/>" title="${fans.userByUserId.userName}" ></a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </header>

        <div class="garlic"></div>

    </div>

    <div class="right-container">
        <div class="right-top-banner gnews-banner-mytinymooc">
            <div></div>
        </div>
        <div class="right-top"></div>
        <div class="right">


            <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">
                <div class="UIImageBlock upage-top clearfix">
                    <div class="UIImageBlock_Content">
                        <div class="head">
                            <c:if test="${user1.userId!=user.userId}">
                                <div class="fr" id="follow-user-opts">
                                    <a href="javascript:;" id="follow-user" class="btn btn-success ajax-action" style="display: inline-block;"><i class="icon-plus icon-white"></i> 关注TA</a>
                                    <a href="javascript:;" id="unfollow-user" class="btn btn-success active ajax-action" style="display: none;">已关注 | 取消 </a>
                                    <input type="hidden" name="aa" value="${isOk}" id="att">
                                    <input type="hidden" name="bb" value="${user1.userId}" id="btt">
                                </div>
                            </c:if>

                            <div class=""><h2>${user1.userName}</h2></div>
                        </div>


                        <div class="nav clearfix">
                            <a href="goPersonal.htm?userId=${user1.userId}">主页</a>
                            <a href="goPersonalTeam.htm?userId=${user1.userId}">小组</a>
                            <a href="goPersonalAttention.htm?userId=${user1.userId}">好友</a>
                            <a href="goPersonalNote.htm?userId=${user1.userId}" class="on">笔记</a>
                        </div>
                    </div>
                </div>

                <hr class="custom-hr">

                <div class="mod">

                    <ul class="course-notes-list">
                        <c:forEach items="${notelist}" var="notelist">
                            <c:if test="${!empty notelist.notes}">
                                <li class="">
                                    <div class="course-notes">
                                        <div class="course-info clearfix">
                                            <img src="/resource/img/icons/32/survey.png"  class="picture" />
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
                                                                                <p style="color:#000">${notes.noteContent}</p>
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
                                                                            >${user.userName}</a>
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
                                                                        >${user.userName}</a>
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


            </article>

            <div class="movedown2"></div>

        </div> <!-- end .right -->
        <div class="right-bottom"></div>

        <div class="movedown"></div>

    </div> <!-- end .right-container -->

    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</div>

</body>
</html>
