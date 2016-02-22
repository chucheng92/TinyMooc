<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]><html class="ie ie6"><![endif]-->
<!--[if IE 7]><html class="ie ie7"><![endif]-->
<!--[if IE 8 ]><html class="ie8"><![endif]-->
<!--[if !IE]><!--><html><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${userTeam2.team.teamName} - 萌课网</title>
    <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>

    <style type="text/css">
        .why-gnosh-movies2{
            background: url("http://files.bbs.tl.changyou.com/data/attachment/forum/201512/28/170611h1f45gf51i2z4ram.png") top left no-repeat;
            height:50px;
            width:1100px;
            margin-bottom: 30px;
            margin-top: -10px;
            margin-left: 0px;
        }
    </style>
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
<body>

<c:if test="${empty user.userId}">
    <jsp:include page="/jsp/include/head1.jsp"></jsp:include>
</c:if>
<c:if test="${!empty user.userId}">
    <jsp:include page="/jsp/include/head2.jsp"></jsp:include>
</c:if>

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
                    <c:if test="${userTeam.userPosition=='组长'}">
                        <a href="manageTeam.htm?teamId=${userTeam2.team.teamId}">管理</a>
                    </c:if>
                </div>
            </div>

            <div class="why-gnosh-movies2">
            </div>

            <div class="container-padding clearfix">
                <div class="normal-main">
                    <div class="mod last-discuss clearfix">

                        <div class="fr">
                            <a href="createDiscussPage.htm?teamId=${userTeam2.team.teamId}" class="btn-s1"><span>发话题</span></a>
                        </div>
                        <c:if test="${discussNum==0}">
                            <h3>本小组暂时还没有话题</h3>
                        </c:if>
                        <c:if test="${discussNum>0}">
                            <h2><span>(共${discussNum}话题)</span></h2>

                            <div class="group-discuss-categories">
                                <a href="discuss" class="this">全部</a>
                            </div>

                            <div class="discuss-list2">
                                <ul>
                                    <c:forEach items="${discusses}" var="dis">
                                        <li>
                                            <div class="imageblock clearfix">
                                                <div class="imageblock-image"><img src="${dis.user.headImage.imageSmall}">
                                                </div>
                                                <div class="imageblock-content">

                                                    <p class="title">
                                                        <c:if test="${dis.top==1}">
                                                            <span class="stick-flag mrs">[置顶]</span>
                                                        </c:if>
                                                        <a href="discussDetailPage.htm?discussId=${dis.discussId}"><span style="color:rgb(102, 194, 160)">${dis.topic}</span></a>
                                                        <c:if test="${dis.essence=='精华'}">
                                                            <img src='<c:url value="/resource/pic/elite-s.png"></c:url>' width="16" height="14" title="精华贴" />
                                                        </c:if>
                                                    </p>
                                                    <p class="metas">
                                                        by <a href="goPersonal.htm?userId=${dis.user.userId}" class="show-user-card " title="${dis.user.userName}">${dis.user.userName}</a>
                                                        <span class="mhm">浏览量：${dis.scanNum}</span>

                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>

                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

    </div>


    <div id="course-side">
        <c:if test="${empty userTeam1.userPosition}">
            <div class="mod joingroup-mod">
                <span class="gray">加入小组后才能发言哦！</span>
                <a href="takePartInTeam.htm?teamId=${userTeam2.team.teamId}" class="swbtn"><span>加入小组</span></a>
            </div>
        </c:if>
        <c:if test="${!empty userTeam1.user}">
            <div class="flat">
                <h3>我的信息</h3>

                <div class="owner-block imageblock clearfix">
                    <div class="imageblock-image"><a href="" class="show-user-card"><img
                            src="${userTeam1.user.headImage.imageSmall}" alt="${userTeam1.user.userName}"></a>
                    </div>
                    <div class="imageblock-content">
                        <div class="userName"><a href="" class="show-user-card "
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

        <div class="flat">
            <h2>最近加入</h2>
            <ul class="grids smallpic-grids">
                <c:forEach items="${userTeams}" var="newUser">
                    <li class="grid">
                        <img src="${newUser.user.headImage.imageSmall}">
                        <div><a href="goPersonal.htm?userId=${newUser.user.userId}" class="show-user-card " data-uid=""
                                title="${newUser.user.userName}">${newUser.user.userName}</a></div>
                    </li>
                </c:forEach>
            </ul>


            <p class="fr mtm  mbl"><a href="#"> » 更多成员</a></p>
        </div>

        <c:if test="${userTeam1.userPosition=='成员'}">
            <div class="mod">
                <div class="ptl">
                    <p>&raquo; <a href="">退出小组</a></p>
                </div>
            </div>
        </c:if>
        <c:if test="${userTeam1.userPosition=='组长'}">

        </c:if>
    </div>

</section>

<div class="wrapper">
    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>
</div>

</body>
</html>