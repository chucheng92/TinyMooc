<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${userTeam2.team.teamName} - 萌课网</title>
    <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />"/>
    <link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">
    <script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
    <link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
    <link rel="stylesheet" href="<c:url value="/resource/css/site_v2.css"/>">
    <link rel="stylesheet" href="<c:url value="/resource/css/site_v3.css"/>">
    <script type="text/javascript" src="<c:url value="/resource/js/ga.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/resource/css/scojs.css"/>">
    <script type="text/javascript" src="<c:url value="/resource/js/sco.message.js"/>"></script>


    <script type="text/javascript">
        $(document).ready(function () {
            var message = "${requestScope.message}";
            if (message == null || message == 'null' || message == "") {

            } else {
                $.scojs_message(message, $.scojs_message.TYPE_OK);
            }
        });
    </script>

    <script type="text/javascript">
        $(function () {
            $(".btn.btn-info.btn-small").click(function () {
                var a = $(".btn.btn-info.btn-small").html()
                if (a == "贡献") {
                    $(".construct").css("display", "block");
                    $(".btn.btn-info.btn-small").html("取消");
                }
                if (a == "取消") {
                    $(".construct").css("display", "none");
                    $(".btn.btn-info.btn-small").html("贡献");
                }
            });

            $(".btn.btn-success.btn-small").click(function () {
                //alert("aaaaaa");
                var goldNum = $("#goldNum").val();
                var gold = $("#gold").val();
                var teamId = $("#teamId").val();
                if (gold <= 0 || gold == "") {
                    alert("请输入正确的数量！（至少1个）");
                    return false;
                }
                if (gold > goldNum) {
                    alert("您的金币总数不足!请重新输入");
                    return false;
                }
                if (gold <= goldNum && gold > 0) {
                    //alert(gold+"个金币");
                    location.href = "constructTeam.htm?teamId=" + teamId + "&gold=" + gold;
                }
            });


        });
    </script>
</head>

<c:if test="${empty user}" >
    <jsp:include page="/jsp/include/head1.jsp"></jsp:include>
    <body class="loginInfo">
    <h1>&nbsp;&nbsp;温馨提示: 请登录后再查看小组信息哦(●'◡'●)</h1>
    <div style='visibility:hidden; clear: both; display: block; height: 40px; overflow:hidden'></div>
    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>
    </body>
</c:if>

<c:if test="${!empty user}">
<body class="lily-theme">
<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

<section class="container">
    <div class="group-header"
         style="background-image:url(<c:url value="/resource/pic/imagehead/group-header.jpg"></c:url>)">

        <div class="head">
            <div class="icon"><img src="<c:url value="${userTeam2.team.headImage.imageSmall}"/>"/></div>
            <div class="infos">
                <h1>${userTeam2.team.teamName}</h1>
                <span>${memberNum}个成员</span>
            </div>
        </div>

        <ul class="hnav">
            <li class="this"><a href="teamHomePage.htm?teamId=${userTeam2.team.teamId}">小组首页</a></li>
            <li><a href="discussPage.htm?teamId=${userTeam2.team.teamId}">讨论区</a></li>
            <li><a href="membersAdminPage.htm?teamId=${userTeam2.team.teamId}">成员</a></li>
            <c:if test="${userTeam.userPosition=='组长'}">
                <li><a href="manageTeam.htm?teamId=${userTeam2.team.teamId}">管理</a></li>
            </c:if>
        </ul>

    </div>
    <div class="container-padding clearfix">
        <div class="normal-main">
            <div class="mod">
                <div class="group-about">
                    <p>${userTeam2.team.teamIntro}</p>

                    <p class="create-info clearfix">
                        <c:if test="${! empty userTeam2.userPosition}">
                            <span class="fr">
                            你是${userTeam2.userPosition}
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

            <div class="mod last-discuss clearfix">
                <c:if test="${! empty userTeam1.userPosition}">
                    <div class="fr">
                        <a href="creatediscuss.jsp" class="btn-s1"><span>发话题</span></a>
                    </div>
                </c:if>
                <c:if test="${discussNum==0}">
                    <h3>本小组暂时还没有话题</h3>
                </c:if>
                <c:if test="${discussNum>0}">
                    <h3>最近的讨论<span>(共${discussNum}话题)</span></h3>

                    <div class="group-discuss-categories">
                        <a href="" class="this">全部</a>
                    </div>

                    <div class="discuss-list2">
                        <ul>
                            <c:forEach items="${discusses}" var="dis">
                                <li>
                                    <div class="imageblock clearfix">
                                        <div class="imageblock-image"><a href="" class="show-user-card"><img src=""></a>
                                        </div>
                                        <div class="imageblock-content">

                                            <p class="title">
                                                <c:if test="${dis.top==1}">
                                                    <span class="stick-flag mrs">[置顶]</span>
                                                </c:if>
                                                <a href="discussDetailPage.htm?discussId=${dis.discussId}">${dis.topic}</a>
                                                <c:if test="${dis.essence=='精华'}">
                                                    <img src='<c:url value="/resource/pic/elite-s.png"></c:url>'
                                                         width="16" height="14" title="精华贴"/>
                                                </c:if>
                                            </p>

                                            <p class="metas">
                                                by <a href="" class="show-user-card "
                                                      title="${dis.user.userName}">${dis.user.userName}</a>
                                                <span class="mhm">${dis.scanNum}</span>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <p class="fr mtm"><a href=""> » 更多话题</a></p>
                </c:if>
            </div>

        </div>
        <div class="normal-side">

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
                                src="${userTeam1.user.headImage.imageMid}" alt="${userTeam1.user.userName}"></a>
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
                            <a href="#" class="show-user-card" data-uid=""><img
                                    src="${newUser.user.headImage.imageMid}"></a>

                            <div><a href="#" class="show-user-card " data-uid=""
                                    title="${newUser.user.userName}">${newUser.user.userName}</a></div>
                        </li>
                    </c:forEach>
                </ul>


                <p class="fr mtm  mbl"><a href=""> » 更多成员</a></p>
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
    </div>
</section>
<jsp:include page="/jsp/include/foot.jsp"></jsp:include>
</body>
</c:if>

</html>