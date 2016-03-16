<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resource/jspf/commons.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${userTeam2.team.teamName}的小组成员 - 萌课网</title>

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>
    <style type="text/css">
        .why-gnosh-movies2 {
            background: url("http://files.bbs.tl.changyou.com/data/attachment/forum/201512/28/170611h1f45gf51i2z4ram.png") top left no-repeat;
            height: 50px;
            width: 1100px;
            margin-bottom: 30px;
            margin-top: -10px;
            margin-left: 0px;
        }
    </style>
</head>
<body>


<jsp:include page="/jsp/include/head2.jsp"></jsp:include>


<section class="container course" style="margin-top: 60px;">

    <div id="course-main">
        <div id="course-header" class="flat course-header course-large-header">

            <div class="imagblock clearfix">
                <div class="imageblock-image posrel">
                    <img src="<c:url value="${userTeam2.team.headImage.imageLarge}"/>" width=190 height=140/>

                </div>
                <div class="imageblock-content">
                    <div class="clearfix">
                        <h1 class="pull-left">小组名：${userTeam2.team.teamName}</h1>
                    </div>

                    <ul class="course-metas">
                        <li>
                            <span>一共<font color="red">${memberNum}</font>个成员</span>
                        </li>
                    </ul>

                </div>
            </div>

            <div class="UIImageBlock_Content_1">
                <div class="nav clearfix">
                    <a href="teamHomePage.htm?teamId=${userTeam2.team.teamId}">小组首页</a>
                    <a href="discussPage.htm?teamId=${userTeam2.team.teamId}">讨论区</a>
                    <a href="membersAdminPage.htm?teamId=${userTeam2.team.teamId}">成员</a>
                    <c:if test="${userTeam1.userPosition=='组长'}">
                        <a href="manageTeam.htm?teamId=${userTeam2.team.teamId}">管理</a>
                    </c:if>
                </div>
            </div>

            <div class="why-gnosh-movies2">
            </div>

            <div class="course-summary-metas mtl">
                <div class="normal-main">
                    <div class="mod1">
                        <div class="group-about">
                            <p>${userTeam2.team.teamIntro}</p>

                            <p class="create-info clearfix">
                                <c:if test="${! empty userTeam2.userPosition}">
                            <span class="fr">
                            你是${userTeam1.userPosition}
                            </span>
                                </c:if>
                        <span class="mr10">创建于<fmt:formatDate value="${userTeam2.team.applyDate}"
                                                              pattern="yyyy年MM月dd日 "/></span>
                                &nbsp;&nbsp;&nbsp;
                        <span>组长：<a href="#" class="show-user-card "
                                    title="${userTeam2.user.userName}">${userTeam2.user.userName}</a></span>
                            </p>

                            <p>建设度：${userTeam2.contribution}&nbsp;&nbsp;&nbsp;
                                小组等级：${level2.lv}&nbsp;&nbsp;&nbsp;
                                小组称号：${level2.title}
                            </p>

                            <div class="tags">
                                小组标签：
                                <c:if test="${empty labelList}"><b>暂时没有标签</b></c:if>
                                <c:if test="${!empty labelList}">
                                    <c:forEach items="${labelList}" var="label">
                                        <a href="" class="tag">${label.label.labelName}</a>
                                    </c:forEach>
                                </c:if>
                            </div>

                        </div>
                    </div>

                    <div class="why-gnosh-movies2">
                    </div>

                    <div class="container-padding clearfix">
                        <div class="normal-main">
                            <div class="mod member-grid">
                                <h2>组长</h2>
                                <ul class="grids smallpic-grids user-grids">
                                    <li class="grid"><a href=""><img src="${userTeam2.user.headImage.imageSmall}" alt="${userTeam2.user.userName}"></a>

                                        <p><a href="" title="${userTeam2.user.userName}">${userTeam2.user.userName}</a>
                                        </p></li>
                                </ul>
                            </div>
                            <c:if test="${!empty userTeams2}">
                                <div class="mod member-grid">
                                    <h2>申请者</h2>
                                    <ul class="grids smallpic-grids user-grids">
                                        <c:forEach items="${userTeams2}" var="ut">
                                            <li class="grid">
                                                <a href=""><img src="${ut.user.headImage.imageSmall}" alt="${ut.user.userName}"></a>

                                                <p><a href="#" title="herriyi">${ut.user.userName}</a></p>
                                                <c:if test="${userTeam.userPosition=='组长'}">
                                                    <p>
                                                        <a href="addApplyUser.htm?userTeamId=${ut.userTeamId}"
                                                           class="opt" title="把${ut.user.userName}加入小组">加</a>
                                                        <a href="kickOutTeam.htm?userTeamId=${ut.userTeamId}"
                                                           class="opt" title="把${ut.user.userName}移除列表">除</a>
                                                    </p>
                                                </c:if>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:if>
                            <c:if test="${memberNum>1}">
                                <div class="mod member-grid">
                                    <h2>成员</h2>
                                    <ul class="grids smallpic-grids user-grids">
                                        <c:forEach items="${userTeams}" var="uts">
                                            <c:if test="${uts.userPosition=='组员'}">
                                                <li class="grid">
                                                    <a href=""><img src="${uts.user.headImage.imageSmall}"
                                                                    alt="${uts.user.userName}"></a>

                                                    <p><a href="#" title="${uts.user.userName}">${uts.user.userName}</a>
                                                    </p>
                                                    <c:if test="${userTeam1.userPosition=='组长'}">
                                                        <p>
                                                            <a href="kickOutTeam.htm?userTeamId=${uts.userTeamId}"
                                                               class="opt" title="把${uts.user.userName}踢出小组">踢</a>
                                                            <a href="banTeamUser.htm?userTeamId=${uts.userTeamId}"
                                                               class="opt" title="把${uts.user.userName}封禁">黑</a>
                                                        </p>
                                                    </c:if>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:if>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
<%----%>
    <c:if test="${!empty userTeam1.user}">
        <div class="flat" style="margin-top: 5%">
            <h3>我的信息</h3>

            <div class="owner-block imageblock clearfix">
                <img src="${userTeam1.user.headImage.imageSmall}" alt="${userTeam1.user.userName}">
            </div>
            <div class="imageblock-content">
                <div class="userName"><a href="#" class="show-user-card "
                                         title="${userTeam1.user.userName}">${userTeam1.user.userName}</a>
                </div>
                <div>
                    <p>金币总数：${userTeam1.user.gold}</p>

                    <p>组内贡献：${userTeam1.contribution}</p>

                    <p>组内等级：${level1.lv}</p>

                    <p>组内称号：${level1.title}</p>

                    <p>个人说明：${userTeam1.user.intro}</p>

                    <p class="text-info">
                        <button type="button" class="btn btn-info btn-small">贡献</button>
                        （1金币=1贡献度）
                    </p>
                </div>
            </div>
            <div class="construct" style="display: none;" align="center">
                <div>
                    <p>
                        <input type="text" style="width: 40px;margin-top: 10px" maxlength="6" id="gold">
                        <button class="btn btn-success btn-small">兑换</button>
                        <input type="hidden" value="${userTeam1.user.gold}" id="goldNum">
                        <input type="hidden" value="${userTeam1.team.teamId}" id="teamId">
                    </p>
                </div>
            </div>
        </div>
        </div>
    </c:if>
    <%----%>
<c:if test="${userTeam1.userPosition=='组长'}">
    <div id="course-side">
        <div class="membercol">
            <div class="mod">
                <h2>添加和移除</h2>

                <p class="stext">把用户添加进小组，点击头像旁边的"<b>加</b>"。</p>

                <p class="stext">把用户移除小组申请列表，点击头像旁边的"<b>除</b>"。</p>
            </div>

            <div class="mod">
                <h2>踢人和封禁</h2>

                <p class="stext">把成员踢出小组，点击头像旁边的"<b>踢</b>"，踢出去的用户以后可以再次加入小组。</p>

                <p class="stext">永久禁止一个成员加入本小组，点击头像旁边的"<b>黑</b>"。</p>
            </div>
        </div>
    </div>
</c:if>

</section>

<div class="wrapper">
    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>
</div>

</body>
</html>