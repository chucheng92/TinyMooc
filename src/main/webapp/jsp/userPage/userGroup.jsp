<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小组 - 萌课网</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>

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
                            <a href="goPersonalTeam.htm?userId=${user1.userId}"class="on" >小组</a>
                            <a href="goPersonalAttention.htm?userId=${user1.userId}">好友</a>
                            <a href="goPersonalNote.htm?userId=${user1.userId}">笔记</a>
                        </div>
                    </div>
                </div>

                <hr class="custom-hr">

                <div class="mod mtl discuss-list2">
                    <h3>参加的小组</h3>
                    <div class="metas">
                        <ul class="grids smallpic-grids">
                            <c:forEach items="${userTeam}" var="team">
                                <li class="grid"><img src="<c:url value="${team.team.headImage.imageSmall}"/>" style="width: 70px;height: 70px;"/><p><a href="teamHomePage.htm?teamId=${team.team.teamId}" title="查看该小组">${team.team.teamName}</a></p></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

                <div class="mod">
                    <h3>发表的话题</h3>

                    <div class="discuss-list2">
                        <ul>
                            <c:forEach items="${discussList}" var="discuss">
                                <li>
                                    <div class="imageblock clearfix">
                                        <div class="imageblock-image"><img src="<c:url value="${discuss.user.headImage.imageSmall }"/>"></div>
                                        <div class="imageblock-content">
                                            <p class="title"><a href="">${discuss.topic}</a>
                                            <p class="metas"><a href="teamHomePage.htm?teamId=${discuss.team.teamId}" title="查看该小组" class="mrm">${discuss.team.teamName}</a>
                                                by <a href="goPersonal.htm?userId=${discuss.user.userId}" class="show-user-card " title="查看该用户">${discuss.user.userName}</a>
                                                <span class="mhm">${discuss.scanNum}次查看</span></p>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>

                    </div>
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
