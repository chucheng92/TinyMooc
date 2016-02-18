<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
=======
<%@ include file="/resource/jspf/commons.jspf" %>
>>>>>>> refs/remotes/origin/dev
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />"/>
    <script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resource/js/ga.js"/>"></script>
    <title>萌课网 - 小组</title>

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>

    <link rel="pingback" href="http://www.gnosh.co.uk/xmlrpc.php" />
    <link rel="shortcut icon" href="http://www.gnosh.co.uk/wp-content/themes/gnosh/favicon.ico" />


    <!-- Make the HTML5 elements work in IE. -->
    <!--[if IE]>
    <script type="text/javascript" src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The mountain of stuff WP puts in -->
    <link rel="alternate" type="application/rss+xml" title="G&#039;nosh - Gourmet made easy &raquo; G&#039;News Category Feed" href="http://www.gnosh.co.uk/category/gnews/feed/" />
    <script type="text/javascript">
        window._wpemojiSettings = {"baseUrl":"http:\/\/s.w.org\/images\/core\/emoji\/72x72\/","ext":".png","source":{"concatemoji":"http:\/\/www.gnosh.co.uk\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.4.1"}};
        !function(a,b,c){function d(a){var c,d=b.createElement("canvas"),e=d.getContext&&d.getContext("2d");return e&&e.fillText?(e.textBaseline="top",e.font="600 32px Arial","flag"===a?(e.fillText(String.fromCharCode(55356,56806,55356,56826),0,0),d.toDataURL().length>3e3):"diversity"===a?(e.fillText(String.fromCharCode(55356,57221),0,0),c=e.getImageData(16,16,1,1).data.toString(),e.fillText(String.fromCharCode(55356,57221,55356,57343),0,0),c!==e.getImageData(16,16,1,1).data.toString()):("simple"===a?e.fillText(String.fromCharCode(55357,56835),0,0):e.fillText(String.fromCharCode(55356,57135),0,0),0!==e.getImageData(16,16,1,1).data[0])):!1}function e(a){var c=b.createElement("script");c.src=a,c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var f,g;c.supports={simple:d("simple"),flag:d("flag"),unicode8:d("unicode8"),diversity:d("diversity")},c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.simple&&c.supports.flag&&c.supports.unicode8&&c.supports.diversity||(g=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",g,!1),a.addEventListener("load",g,!1)):(a.attachEvent("onload",g),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),f=c.source||{},f.concatemoji?e(f.concatemoji):f.wpemoji&&f.twemoji&&(e(f.twemoji),e(f.wpemoji)))}(window,document,window._wpemojiSettings);
    </script>
    <style type="text/css">
        img.wp-smiley,
        img.emoji {
            display: inline !important;
            border: none !important;
            box-shadow: none !important;
            height: 1em !important;
            width: 1em !important;
            margin: 0 .07em !important;
            vertical-align: -0.1em !important;
            background: none !important;
            padding: 0 !important;
        }
        #footer {
            font-weight: normal;
            text-align: center;
        }
    </style>
    <link rel='https://api.w.org/' href='http://www.gnosh.co.uk/wp-json/' />
    <link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://www.gnosh.co.uk/xmlrpc.php?rsd" />
    <link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://www.gnosh.co.uk/wp-includes/wlwmanifest.xml" />

    <link href="http://fast.fonts.com/cssapi/bfe6ca8b-d36b-4009-a944-3c1f5bcd40c3.css" rel="stylesheet" type="text/css" />

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
                    if (a == "音乐") {
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

    <!-- GOOGLE ANALYTICS -->
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-28918139-1']);
        _gaq.push(['_trackPageview']);
        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>

    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-29176033-1']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>

    <link rel="stylesheet" href="http://www.gnosh.co.uk/wp-content/themes/gnosh/js/jquery.fancybox.css?v=2.0.6" type="text/css" media="screen" />
    <style type="text/css">
        .dsq-global-toolbar-left { display: none; }
    </style>
    <!--[if IE]>
    <style type="text/css">
        .social { margin-top: 0; }
    </style>
    <![endif]-->

</head>
<body class="archive category category-gnews category-3">
<<<<<<< HEAD

=======
<script type="text/javascript">
    $(document).ready(function () {
        var message='<%=request.getParameter("message")%>';
        if(message==null || message=='null'){
        }else{
            $.scojs_message(message, $.scojs_message.TYPE_OK);
        }
    });
</script>
>>>>>>> refs/remotes/origin/dev
<c:if test="${empty user.userId}">
    <jsp:include page="/jsp/include/head1.jsp"></jsp:include>
</c:if>
<c:if test="${!empty user.userId}">
    <jsp:include page="/jsp/include/head2.jsp"></jsp:include>
</c:if>

<div class="movedown">
</div>

<div class="wrapper">

<div class="left">

    <header>
        <div class="movedown"></div>
        <div class="logo" ></div>

        <nav>
            <ul>
                <li id="menu-item-4" class="menu-item menu-item-type-taxonomy menu-item-object-category current-menu-item menu-item-4 gnews-menu"><a href="turnToHomePage.htm"></a></li>
                    <ul class="sub-menu">

                        <c:if test="${empty userTeam1 && empty userTeam2}">
                            <div class="empty">你还没有参加任何小组！</div>
                        </c:if>

                        <c:if test="${!empty userTeam1}">
                            <div class="gray">我管理的小组</div>

                            <ul class="grids smallpic-grids">
                                <c:forEach items="${userTeam1}" var="team">
                                    <li class="grid">
                                       <img src="${team.team.headImage.imageSmall}" alt="${team.team.teamName}"/>
                                        <a href="teamHomePage.htm?teamId=${team.team.teamId}" title="${team.team.teamName}">${team.team.teamName}</a>
                                    </li>
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

                    </ul>
                </li>
            </ul>
        </nav>
    </header>


    <div class="garlic"></div>


</div>
<div class="right-container">
    <div class="right-top-banner gnews-banner">
        <div></div>
    </div>
    <div class="right-top"></div>
    <div class="right">

        <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">
            <h1>活跃小组</h1>

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
            <hr class="custom-hr">
        </article>

        <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">
            <h1>全部</h1>

            <c:forEach items="${dictionaries}" var="dic">
                <a href="#" data-target="#groups-photography" class="lyl">${dic.dicValue}</a>
            </c:forEach>

            <div id="groups-video" class="groups-panel">
                <p>摄影</p>

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
                <p>艺术</p>

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
                <p>兴趣</p>

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
                <p>计算机</p>

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
                <p>文学</p>

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
                <p>求职</p>

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
                <p>动漫</p>

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
                <p>音乐</p>

                <div class="mbl">
                    <ul class="group-cells"><c:forEach items="${hotTeams}" var="team">
                        <c:if test="${team.type=='音乐'}">
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
                <p>其他</p>

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

        </article>


    </div> <!-- end .right -->
    <div class="right-bottom"></div>

    <div class="movedown"></div>
</div> <!-- end .right-container -->

<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</div>



<!-- JavaScript -->
<!-- <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script> -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="http://www.gnosh.co.uk/wp-content/themes/gnosh/js/jquery-1.7.2.min.js"><\/script>')</script>
<script src="http://www.gnosh.co.uk/wp-content/themes/gnosh/js/scripts.js"></script>

<script type='text/javascript' src='http://www.gnosh.co.uk/wp-includes/js/wp-embed.min.js?ver=4.4.1'></script>

<!-- 29 queries. 0.161 seconds. -->

<script>
    $('.popup').click(function(event) {
        var width  = 575,
                height = 400,
                left   = ($(window).width()  - width)  / 2,
                top    = ($(window).height() - height) / 2,
                url    = this.href,
                opts   = 'status=1' +
                        ',width='  + width  +
                        ',height=' + height +
                        ',top='    + top    +
                        ',left='   + left;

        window.open(url, 'twitter', opts);

        return false;
    });
</script>

<script type="text/javascript" src="http://www.gnosh.co.uk/wp-content/themes/gnosh/js/jquery.fancybox.pack.js?v=2.0.6"></script>

<script type="text/javascript">
    $(document).ready(function() {

        $(".fancybox").fancybox({
            prevEffect : 'none',
            nextEffect : 'none',
            helpers: {
                title : {
                    type : 'inside'
                }
            }
        });

    });
</script>
</body>
</html>