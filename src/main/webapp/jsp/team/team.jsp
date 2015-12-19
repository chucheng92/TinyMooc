<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />"/>
    <link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">
    <script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
    <link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
    <link rel="stylesheet" href="<c:url value="/resource/css/site_v2.css"/>">
    <link rel="stylesheet" href="<c:url value="/resource/css/site_v3.css"/>">
    <script type="text/javascript" src="<c:url value="/resource/js/ga.js"/>"></script>
    <title>萌课网 - 小组</title>

    <style type="text/css">
        .course-cards {
            letter-spacing: -3px;
            margin-right: -23px;
            zoom: 1;
        }

        .course-cards li {
            width: 200px;
            display: inline-block;
            *display: inline;
            *zoom: 1;
            vertical-align: top;
            letter-spacing: 0;
            margin-right: 19px;
            margin-bottom: 20px;
            *margin-right: 18px;
        }

        .group-cells li {
            width: 50%;
            display: inline-block;
            *display: inline;
            *zoom: 1;
            vertical-align: top;
            margin: 0 0;
            padding: 0 0;
            border-top: 1px solid #efefef;
        }

        .group-cells .group-cell {
            margin: 20px 20px 20px 0;
        }

        .group-cells .pic {
            float: left;
            padding-right: 10px;
        }

        .group-cells .info {
            overflow: hidden;
        }

        .smallpic-grids .grid {
            width: 68px;
        }

        .clearFloat {
            　　visibility: hidden;
            　　clear: both;
            　　display: block;
            　　height: 0px;
            　　content: "." 　　
        }

        　　
    </style>

    <script type="text/javascript">
        $("a.on").live('click', function () {
            c = $(this).html()+'被点击';
            alert(c);
            b = $(this).html();
            if (b == "全部") {
                $("#groups-video").css("display", "block");
                $("#groups-art").css("display", "block");
                $("#groups-favorite").css("display", "block");
                $("#groups-computer").css("display", "block");
                $("#groups-literature").css("display", "block");
                $("#groups-job").css("display", "block");
                $("#groups-comic").css("display", "block");
                $("#groups-openSubject").css("display", "block");
                $("#groups-other").css("display","block");
            }
        });


        $("a.lyl").live('click', function () {
                    a = $(this).html();
                    //alert(a);
                    if (a == "摄影") {
                        alert(a);
                        $("#groups-video").css("display", "block");
                        $("#groups-art").css("display", "none");
                        $("#groups-favorite").css("display", "none");
                        $("#groups-computer").css("display", "none");
                        $("#groups-literature").css("display", "none");
                        $("#groups-job").css("display", "none");
                        $("#groups-comic").css("display", "none");
                        $("#groups-openSubject").css("display", "none");
                        $("#groups-other").css("display", "none");
                    }
                    if (a == "艺术") {
                        alert(a);
                        $("#groups-video").css("display", "none");
                        $("#groups-art").css("display", "block");
                        $("#groups-favorite").css("display", "none");
                        $("#groups-computer").css("display", "none");
                        $("#groups-literature").css("display", "none");
                        $("#groups-job").css("display", "none");
                        $("#groups-comic").css("display", "none");
                        $("#groups-openSubject").css("display", "none");
                        $("#groups-other").css("display", "none");
                    }
                    if (a == "兴趣") {
                        alert(a);
                        $("#groups-video").css("display", "none");
                        $("#groups-art").css("display", "none");
                        $("#groups-favorite").css("display", "block");
                        $("#groups-computer").css("display", "none");
                        $("#groups-literature").css("display", "none");
                        $("#groups-job").css("display", "none");
                        $("#groups-comic").css("display", "none");
                        $("#groups-openSubject").css("display", "none");
                        $("#groups-other").css("display", "none");
                    }
                    if (a == "计算机") {
                        alert(a);
                        $("#groups-video").css("display", "none");
                        $("#groups-art").css("display", "none");
                        $("#groups-favorite").css("display", "none");
                        $("#groups-computer").css("display", "block");
                        $("#groups-literature").css("display", "none");
                        $("#groups-job").css("display", "none");
                        $("#groups-comic").css("display", "none");
                        $("#groups-openSubject").css("display", "none");
                        $("#groups-other").css("display", "none");
                    }
                    if (a == "文学") {
                        alert(a);
                        $("#groups-video").css("display", "none");
                        $("#groups-art").css("display", "none");
                        $("#groups-favorite").css("display", "none");
                        $("#groups-computer").css("display", "none");
                        $("#groups-literature").css("display", "block");
                        $("#groups-job").css("display", "none");
                        $("#groups-comic").css("display", "none");
                        $("#groups-openSubject").css("display", "none");
                        $("#groups-other").css("display", "none");
                    }
                    if (a == "求职") {
                        alert(a);
                        $("#groups-video").css("display", "none");
                        $("#groups-art").css("display", "none");
                        $("#groups-favorite").css("display", "none");
                        $("#groups-computer").css("display", "none");
                        $("#groups-literature").css("display", "none");
                        $("#groups-job").css("display", "block");
                        $("#groups-comic").css("display", "none");
                        $("#groups-openSubject").css("display", "none");
                        $("#groups-other").css("display", "none");
                    }
                    if (a == "动漫") {
                        alert(a);
                        $("#groups-video").css("display", "none");
                        $("#groups-art").css("display", "none");
                        $("#groups-favorite").css("display", "none");
                        $("#groups-computer").css("display", "none");
                        $("#groups-literature").css("display", "none");
                        $("#groups-job").css("display", "none");
                        $("#groups-comic").css("display", "block");
                        $("#groups-openSubject").css("display", "none");
                        $("#groups-other").css("display", "none");
                    }
                    if (a == "公开课") {
                        alert(a);
                        $("#groups-video").css("display", "none");
                        $("#groups-art").css("display", "none");
                        $("#groups-favorite").css("display", "none");
                        $("#groups-computer").css("display", "none");
                        $("#groups-literature").css("display", "none");
                        $("#groups-job").css("display", "none");
                        $("#groups-comic").css("display", "none");
                        $("#groups-openSubject").css("display", "block");
                        $("#groups-other").css("display", "none");
                    }
                    if (a == "其他") {
                        alert(a);
                        $("#groups-video").css("display", "none");
                        $("#groups-art").css("display", "none");
                        $("#groups-favorite").css("display", "none");
                        $("#groups-literature").css("display", "none");
                        $("#groups-computer").css("display", "none");
                        $("#groups-job").css("display", "none");
                        $("#groups-comic").css("display", "none");
                        $("#groups-openSubject").css("display", "none");
                        $("#groups-other").css("display", "block");
                    }
                }
        );
    </script>

</head>
<body class="flats-theme">

<c:if test="${empty user.userId}">
    <jsp:include page="/jsp/include/head1.jsp"></jsp:include>
</c:if>
<c:if test="${!empty user.userId}">
    <jsp:include page="/jsp/include/head2.jsp"></jsp:include>
</c:if>


<section class="container channel">

    <div class="channel-main">
        <div class="flat">
            <h2>活跃小组</h2>
            <ul class="grids smallpic-grids">
                <c:forEach items="${hotTeams}" var="team" begin="0" end="6">
                    <li class="grid">
                        <a href="teamHomePage.htm?teamId=${team.teamId}" title="${team.teamName}"><img
                                src="${team.headImage.imageSmall}" alt="${team.teamName}"></a>

                        <div class="mvs"><a href="teamHomePage.htm?teamId=${team.teamId}"
                                            title="${team.teamName}">${team.teamName}</a></div>
                    </li>
                </c:forEach>
            </ul>
            <div style='visibility:hidden;clear: both;display: block;height: 0px;overflow:hidden'></div>
        </div>
        <div class="flat">
            <div class="pills" id="group-nav">
                <a href="#" class="on">全部</a>
                <c:forEach items="${dictionaries}" var="dic">
                    <a href="#" data-target="#groups-photography" class="lyl">${dic.dicValue}</a>
                </c:forEach>
            </div>


            <div id="groups">
                <div id="groups-video" class="groups-panel">
                    <h2>摄影</h2>

                    <div class="mbl">
                        <ul class="group-cells">
                            <c:forEach items="${hotTeams}" var="team">
                                <c:if test="${team.type=='摄影'}">
                                    <li style="float:left">
                                        <div class="group-cell">
                                            <div class="pic"><a href="teamHomePage.htm?teamId=${team.teamId}"><img
                                                    src="${team.headImage.imageSmall}" alt="${team.teamName}"></a></div>
                                            <div class="metas">
                                                <div class="title">
                                                    <a href="teamHomePage.htm?teamId=${team.teamId}">${team.teamName}</a>
                                                </div>
                                                <div class="summary">${fn:substring(team.teamIntro,0,30)}</div>
                                            </div>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                        <div style='visibility:hidden;clear: both;display: block;height: 0px;overflow:hidden'></div>
                    </div>
                </div>
                <div id="groups-art" class="groups-panel">
                    <h2>艺术</h2>

                    <div class="mbl">
                        <ul class="group-cells">
                            <c:forEach items="${hotTeams}" var="team">
                                <c:if test="${team.type=='艺术'}">
                                    <li style="float:left">
                                        <div class="group-cell">
                                            <div class="pic"><a href="teamHomePage.htm?teamId=${team.teamId}"><img
                                                    src="${team.headImage.imageSmall}" alt="${team.teamName}"></a></div>
                                            <div class="metas">
                                                <div class="title">
                                                    <a href="teamHomePage.htm?teamId=${team.teamId}">${team.teamName}</a>
                                                </div>
                                                <div class="summary">${fn:substring(team.teamIntro,0,30)}</div>
                                            </div>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>

                        </ul>
                        <div style='visibility:hidden;clear: both;display: block;height: 0px;overflow:hidden'></div>
                    </div>
                </div>
                <div id="groups-favorite" class="groups-panel" style="display: block;">
                    <h2>兴趣</h2>

                    <div class="mbl">
                        <ul class="group-cells">
                            <c:forEach items="${hotTeams}" var="team">
                                <c:if test="${team.type=='兴趣'}">
                                    <li style="float:left">
                                        <div class="group-cell">
                                            <div class="pic"><a href="teamHomePage.htm?teamId=${team.teamId}"><img
                                                    src="${team.headImage.imageSmall}" alt="${team.teamName}"></a></div>
                                            <div class="metas">
                                                <div class="title">
                                                    <a href="teamHomePage.htm?teamId=${team.teamId}">${team.teamName}</a>
                                                </div>
                                                <div class="summary">${fn:substring(team.teamIntro,0,30)}</div>
                                            </div>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                        <div style='visibility:hidden;clear: both;display: block;height: 0px;overflow:hidden'></div>
                    </div>
                </div>

                <div id="groups-computer" class="groups-panel">
                    <h2>计算机</h2>

                    <div class="mbl">
                        <ul class="group-cells"><c:forEach items="${hotTeams}" var="team">
                            <c:if test="${team.type=='计算机'}">
                                <li style="float:left">
                                    <div class="group-cell">
                                        <div class="pic"><a href="teamHomePage.htm?teamId=${team.teamId}"><img
                                                src="${team.headImage.imageSmall}" alt="${team.teamName}"></a></div>
                                        <div class="metas">
                                            <div class="title">
                                                <a href="teamHomePage.htm?teamId=${team.teamId}">${team.teamName}</a>
                                            </div>
                                            <div class="summary">${fn:substring(team.teamIntro,0,30)}</div>
                                        </div>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach></ul>
                        <div style='visibility:hidden;clear: both;display: block;height: 0px;overflow:hidden'></div>
                    </div>
                </div>
                <div id="groups-literature" class="groups-panel">
                    <h2>文学</h2>

                    <div class="mbl">
                        <ul class="group-cells"><c:forEach items="${hotTeams}" var="team">
                            <c:if test="${team.type=='文学'}">
                                <li style="float:left">
                                    <div class="group-cell">
                                        <div class="pic"><a href="teamHomePage.htm?teamId=${team.teamId}"><img
                                                src="${team.headImage.imageSmall}" alt="${team.teamName}"></a></div>
                                        <div class="metas">
                                            <div class="title">
                                                <a href="teamHomePage.htm?teamId=${team.teamId}">${team.teamName}</a>
                                            </div>
                                            <div class="summary">${fn:substring(team.teamIntro,0,30)}</div>
                                        </div>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                        </ul>
                        <div style='visibility:hidden;clear: both;display: block;height: 0px;overflow:hidden'></div>
                    </div>
                </div>
                <div id="groups-job" class="groups-panel">
                    <h2>求职</h2>

                    <div class="mbl">
                        <ul class="group-cells">
                            <c:forEach items="${hotTeams}" var="team">
                                <c:if test="${team.type=='求职'}">
                                    <li style="float:left">
                                        <div class="group-cell">
                                            <div class="pic"><a href="teamHomePage.htm?teamId=${team.teamId}"><img
                                                    src="${team.headImage.imageSmall}" alt="${team.teamName}"></a></div>
                                            <div class="metas">
                                                <div class="title">
                                                    <a href="teamHomePage.htm?teamId=${team.teamId}">${team.teamName}</a>
                                                </div>
                                                <div class="summary">${fn:substring(team.teamIntro,0,30)}</div>
                                            </div>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                        <div style='visibility:hidden;clear: both;display: block;height: 0px;overflow:hidden'></div>
                    </div>
                </div>
                <div id="groups-comic" class="groups-panel">
                    <h2>动漫</h2>

                    <div class="mbl">
                        <ul class="group-cells"><c:forEach items="${hotTeams}" var="team">
                            <c:if test="${team.type=='动漫'}">
                                <li style="float:left">
                                    <div class="group-cell">
                                        <div class="pic"><a href="teamHomePage.htm?teamId=${team.teamId}"><img
                                                src="${team.headImage.imageSmall}" alt="${team.teamName}"></a></div>
                                        <div class="metas">
                                            <div class="title">
                                                <a href="teamHomePage.htm?teamId=${team.teamId}">${team.teamName}</a>
                                            </div>
                                            <div class="summary">${fn:substring(team.teamIntro,0,30)}</div>
                                        </div>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                        </ul>
                        <div style='visibility:hidden;clear: both;display: block;height: 0px;overflow:hidden'></div>
                    </div>
                </div>
                <div id="groups-openSubject" class="groups-panel">
                    <h2>公开课</h2>

                    <div class="mbl">
                        <ul class="group-cells"><c:forEach items="${hotTeams}" var="team">
                            <c:if test="${team.type=='公开课'}">
                                <li style="float:left">
                                    <div class="group-cell">
                                        <div class="pic"><a href="teamHomePage.htm?teamId=${team.teamId}"><img
                                                src="${team.headImage.imageSmall}" alt="${team.teamName}"></a></div>
                                        <div class="metas">
                                            <div class="title">
                                                <a href="teamHomePage.htm?teamId=${team.teamId}">${team.teamName}</a>
                                            </div>
                                            <div class="summary">${fn:substring(team.teamIntro,0,30)}</div>
                                        </div>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                        </ul>
                        <div style='visibility:hidden;clear: both;display: block;height: 0px;overflow:hidden'></div>
                    </div>
                </div>

                <div id="groups-other" class="groups-panel">
                    <h2>其他</h2>

                    <div class="mbl">
                        <ul class="group-cells"><c:forEach items="${hotTeams}" var="team">
                            <c:if test="${team.type=='其他'}">
                                <li style="float:left">
                                    <div class="group-cell">
                                        <div class="pic"><a href="teamHomePage.htm?teamId=${team.teamId}"><img
                                                src="${team.headImage.imageSmall}" alt="${team.teamName}"></a></div>
                                        <div class="metas">
                                            <div class="title">
                                                <a href="teamHomePage.htm?teamId=${team.teamId}">${team.teamName}</a>
                                            </div>
                                            <div class="summary">${fn:substring(team.teamIntro,0,30)}</div>
                                        </div>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                        </ul>
                        <div style='visibility:hidden;clear: both;display: block;height: 0px;overflow:hidden'></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- 我的小组 --%>
    <div class="channel-side">
        <div class="flat">
            <h3>我的小组</h3>
            <c:if test="${empty userTeam1 && empty userTeam2}">
                <div class="empty">你还没有参加任何小组！</div>
            </c:if>

            <c:if test="${!empty userTeam1}">
                <div class="gray">我管理的小组</div>

                <ul class="grids smallpic-grids">
                    <c:forEach items="${userTeam1}" var="userteam">
                        <%--<c:if test="${userteam.userPosition=='组长'}">--%>
                            <li class="grid">
                                <a href="teamHomePage.htm?teamId=${userteam.team.teamId}" title=""><img
                                        src="${userteam.team.headImage.imageSmall}"
                                        alt="${userteam.team.teamName}"/></a>

                                <div class="mvs">
                                    <a href="teamHomePage.htm?teamId=${userteam.team.teamId}"
                                       title="${userteam.team.teamName}">
                                        <c:out value="${userteam.team.teamName}"></c:out>
                                    </a></div>
                            </li>
                        <%--</c:if>--%>
                    </c:forEach>
                </ul>
            </c:if>

            <c:if test="${!empty userTeam2}">
                <div class="gray">我加入的小组</div>

                <ul class="grids smallpic-grids">
                    <c:forEach items="${userTeam2}" var="userteam2">
                        <c:if test="${userteam2.userPosition=='组员'}">
                            <li class="grid">
                                <a href="teamHomePage.htm?teamId=${userteam2.team.teamId}" title=""><img
                                        src="${userteam2.team.headImage.imageSmall}" alt="${userteam2.team.teamName}"/></a>

                                <div class="mvs">
                                    <a href="teamHomePage.htm?teamId=${userteam2.team.teamId}"
                                       title="${userteam2.team.teamName}">
                                        <c:out value="${userteam2.team.teamName}"></c:out>
                                    </a></div>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>

            </c:if>

            <div class="mvs"><a href="createGuidePage.htm" class="">» 申请创建小组</a></div>
        </div>

        <div class="flat">
            <h3>最近热门话题</h3>
            <c:if test="${empty discusses}">
                最近无热门话题
            </c:if>
            <c:if test="${!empty discusses}">
                <ul class="text-list">
                    <c:forEach items="${discusses}" var="discuss">
                        <li><a href="#">${discuss.topic}</a></li>
                    </c:forEach>
                </ul>
            </c:if>
        </div>
    </div>

</section>

<jsp:include page="/jsp/include/foot.jsp"></jsp:include>
</body>
</html>