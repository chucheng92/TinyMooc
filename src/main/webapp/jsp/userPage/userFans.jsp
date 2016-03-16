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
    <title>粉丝 - 萌课网</title>
    <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />

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
                            <a href="goPersonalAttention.htm?userId=${user1.userId}" class="on">好友</a>
                            <a href="goPersonalNote.htm?userId=${user1.userId}">笔记</a>
                        </div>
                    </div>
                </div>

                <hr class="custom-hr">

                <div class="normal-main1">
                    <div class="tabs clearfix mtl mbm">
                        <ul>
                            <li ><a href="goPersonalAttention.htm?userId=${user1.userId}">关注的人</a></li>
                            <li class="on"><a href="goPersonalFans.htm?userId=${user1.userId}">粉丝</a></li>
                        </ul>
                    </div>

                    <p class="mbm">
                        <span class="gray">共有${sum}个粉丝</span>
                    </p>

                    <ul class="friend-list list vlist mbl" id="friend-list">
                        <c:forEach items="${list}" var="fans">

                            <div class="imageblock clearfix mvm">
                                <li >
                                    <div class="imageblock-image"><img src="${fans.userByUserId.headImage.imageMid}" title="${fans.userByUserId.userName}"></div><div style="clear:both;"></div>
                                </li>
                                <li>
                                    <a href="goPersonal.htm?userId=${fans.userByUserId.userId}" class="show-user-card"  title="${fans.userByUserId.userName}"> <span class="fsm">${fans.userByUserId.userName}</span></a>
                                </li>
                            </div>

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
