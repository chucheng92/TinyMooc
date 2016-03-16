<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/resource/jspf/commons.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${currentCourse.course.courseTitle} - 萌课网</title>
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

    <script type="text/javascript">
        $(document).ready(function () {
            var stepW = 24;

            var a = $("#aa").val();

            var stars = $("#star > li");
            $("#showb1").css({"width": stepW * a / 2});
            $("#showb").css("width", 0);
            stars.each(function (i) {
                $(stars[i]).click(function (e) {
                    var n = i + 1;
                    $("#showb").css({"width": stepW * n});

                    $(this).find('a').blur();

                    var courseId = $("#courseId").val();

                    $("#score").val(n);

                    $.ajax({
                        type: "post",
                        url: "doGrade.htm",
                        data: "score=" + n + "&courseId=" + courseId,
                        success: function (msg) {
                            if (msg == "ok") {
                                alert("评价成功！");
                            }
                            if (msg == "no") {
                                $("#showb").css("width", 0);
                                alert("你已经评价过了，不能重复评价！");

                            }
                            if (msg == "go") {

                                alert("请登录后再评价");

                            }
                        }

                    });
                    return stopDefault(e);

                });
            });
        });

        function stopDefault(e) {
            if (e && e.preventDefault)
                e.preventDefault();
            else
                window.event.returnValue = false;
            return false;
        }
        ;
    </script>

    <script type="text/javascript">
        $("#start").live("click", function () {
            <c:if test="${empty user}">
            $.scojs_message("登录后才可以加入学习计划哦(づ￣3￣)づ╭❤～", $.scojs_message.TYPE_OK);
            return false;
            </c:if>
            <c:if test="${!empty user}">
            if ($("#start").html() == "学习中") {
                alert("暂不支持取消课程的学习┗( T﹏T )┛");
            }
            if ($("#start").html() == "开始学习") {
                var courseId = $("#courseId").val();
                location.href = "startStudy.htm?courseId=" + courseId;
            }
            </c:if>
        });

    </script>

    <script type="text/javascript">
        $(function () {
            // a为ok代表已经关注 no代表尚未关注
            var a = $("#att").val();
            var userId = $("#btt").val();

            if (a == "no") {
                $("#follow-user").css("display", "inline-block");
                $("#unfollow-user").css("display", "none");
            }
            if (a == "ok") {
                $("#follow-user").css("display", "none");
                $("#unfollow-user").css("display", "inline-block");
            }
            $("#follow-user").click(function () {
                $.ajax({
                    type: "post",
                    url: "addAttention.htm",
                    data: "userBid=" + userId,
                    success: function (msg) {
                        if (msg == "true") {
                            $("#follow-user").css("display", "none");
                            $("#unfollow-user").css("display", "inline-block");
                        } else if (msg == "login") {
                            alert("请登录");
                        }
                        else {
                            $("#follow-user").css("display", "none");
                            $("#unfollow-user").css("display", "inline-block");
                        }
                    }

                });
            });
            $("#unfollow-user").click(function () {
                $.ajax({
                    type: "post",
                    url: "delAttention.htm",
                    data: "userBid=" + userId,
                    success: function (msg) {
                        if (msg == "delOk") {
                            $("#follow-user").css("display", "inline-block");
                            $("#unfollow-user").css("display", "none");
                        } else {

                        }
                    }
                });
            });
        });
    </script>

    <%-- 收藏课程 --%>
    <script type="text/javascript">
        $(function () {
            // a为ok代表已经收藏 no代表尚未收藏
            var a = $("#add").val();
            var courseId = $("#cancel").val();
            var url = $("#url").val();
            if (a == "no") {
                $("#add-course").css("display", "inline-block");
                $("#cancel-course").css("display", "none");
            }
            if (a == "ok") {
                $("#add-course").css("display", "none");
                $("#cancel-course").css("display", "inline-block");
            }
            $("#add-course").click(function () {
                $.ajax({
                    type: "post",
                    url: "createFavorite.htm",
                    data: {"courseId" : courseId,"url":url},
                    success: function (msg) {
                        if (msg == "true") {
                            $("#add-course").css("display", "none");
                            $("#cancel-course").css("display", "inline-block");
                        } else if (msg == "login") {
                            alert("请登录");
                        } else {
                            $("#add-course").css("display", "none");
                            $("#cancel-course").css("display", "inline-block");
                        }
                    }
                });
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
                    <img src="${currentCourse.course.logoUrl}" alt="${currentCourse.course.courseTitle}"
                         width=190 height=140/>
                </div>
                <div class="imageblock-content">
                    <div class="clearfix">
                        <h1 class="pull-left">${currentCourse.course.courseTitle}</h1>
                    </div>
                <%--</div>--%>
                <%--<div>--%>
                    <ul class="course-metas">
                        <li>
                            <c:if test="${userGrade !='0.0'}">
                                <div id="xzw_starSys">
                                    <div id="xzw_starBox">
                                        <ul class="star" id="star1">
                                            <li><a href="javascript:void(0)" title="很差" class="one-star"></a></li>
                                            <li><a href="javascript:void(0)" title="较差" class="two-stars"></a></li>
                                            <li><a href="javascript:void(0)" title="还行" class="three-stars"></a></li>
                                            <li><a href="javascript:void(0)" title="推荐" class="four-stars"></a></li>
                                            <li><a href="javascript:void(0)" title="力荐" class="five-stars"></a></li>
                                        </ul>
                                        <div class="current-rating" id="showb1">
                                            <input type="hidden" name="grade" value="" id="score1">
                                            <input type="hidden" name="a" value="${userGrade}" id="aa">
                                        </div>
                                    </div>
                                </div>
                                <span><fmt:formatNumber type="number" value="${userGrade}" pattern="0.0"
                                                        maxFractionDigits="1"/></span>
                            </c:if>
                            <c:if test="${userGrade==0.0}">
                                <span>还没有人评分，快去评分吧</span>
                            </c:if>
                        </li>
                        <li>
                            <span>课时：</span>${lessonNum} 课
                        </li>
                        <li>
                            <span>学员：</span><a href="">${studentNum}</a> 人
                        </li>
                        <li>
                            <span>浏览：</span>${currentCourse.course.scanNum} 次
                        </li>
                    </ul>

                    <div class="action-bar">
                        <c:if test="${currentCourse.user.userId ne user.userId}">
                            <button class="btn btn-large btn-success" id="start">${currentCourseState}</button>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="course-summary-metas mtl">
                <h2>简介</h2>

                <div class="course-summary mbl">
                    ${currentCourse.course.courseIntro}
                </div>
                <h2>标签</h2>

                <div class="course-tags" id="course-tags">
                    <c:if test="${empty labelList}">
                        <b>暂时没有标签</b>
                        <c:if test="${user.userId eq currentCourse.user.userId}">
                            <a href="queryLabel.htm?type=course&courseId=${currentCourse.course.courseId}">（添加标签）</a>
                        </c:if>
                    </c:if>
                    <c:if test="${!empty labelList}">
                        <c:forEach items="${labelList}" var="label">
                            <a href="" class="tag">${label.label.labelName}</a>
                        </c:forEach>
                    </c:if>
                </div>
                <%-- 收藏课程--%>
                <c:if test="${!empty user}">
                <c:if test="${isFavorite==0}">
                    <div class="fr" id="cancel-course-opts">
                        <a href="javascript:;" id="add-course" class="btn btn-small disabled action-ajax fr" style="display: inline-block;"><i class="icon-plus"></i>收藏本课程</a>
                        <a href="javascript:;" id="cancel-course" class="btn btn-small disabled action-ajax fr" style="display: none;">已收藏</a>
                        <input type="hidden" name="aa" value="no" id="add">
                        <input type="hidden" name="bb" value="${currentCourse.course.courseId}" id="cancel">
                        <input type="hidden" name="cc" value="courseDetailPage.htm?courseId=${currentCourse.course.courseId}" id="url">
                    </div>
                    </c:if>
                    <c:if test="${isFavorite==1}">
                        <div class="fr" id="follow-user-opts">
                            <%--<a href="javascript:;" id="add-course" class="btn btn-small disabled action-ajax fr" style="display: none;"><i class="icon-plus"></i>收藏本课程</a>--%>
                            <a href="javascript:;" id="cancel-course" class="btn btn-small disabled action-ajax fr" style="display: inline-block;">已收藏</a>
                            <%--<input type="hidden" name="aa" value="ok" id="add">--%>
                            <%--<input type="hidden" name="bb" value="${currentCourse.course.courseId}" id="cancel">--%>
                        </div>
                    </c:if>
                    </c:if>
                    <%-- 收藏课程--%>
            </div>


            <div class="clearfix mvl" align="left">
                <div class="fr">
                    我的评价：

                    <div id="xzw_starSys">
                        <div id="xzw_starBox">
                            <ul class="star" id="star">
                                <li><a href="javascript:void(0)" title="很差" class="one-star"></a></li>
                                <li><a href="javascript:void(0)" title="较差" class="two-stars"></a></li>
                                <li><a href="javascript:void(0)" title="还行" class="three-stars"></a></li>
                                <li><a href="javascript:void(0)" title="推荐" class="four-stars"></a></li>
                                <li><a href="javascript:void(0)" title="力荐" class="five-stars"></a></li>
                            </ul>
                            <div class="current-rating" id="showb">
                                <input type="hidden" name="grade" id="score">
                                <input type="hidden" name="course" id="courseId"
                                       value="${currentCourse.course.courseId}">
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="why-gnosh-movies2">
            </div>

            <div>
                <div class="clearfix mtm">
                    <div class="pills" style="margin-bottom:0px">
                        <a href="" class="on">课时</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="flat">

            <div class="btn-group fr">
                <c:if test="${currentCourse.user.userId==user.userId}">
                    <a class="btn btn-small"
                       href="createLessonPage.htm?courseId=${currentCourse.course.courseId}">新增课时</a>
                </c:if>
            </div>

            <h2>课时 <span class="lessons-total">(共${lessonNum}小节)</span></h2>

            <div class="lessons">
                <ul id="status">
                    <c:if test="${lessonNum==0}">
                        <b>创建者暂时还没有添加课时</b>
                        <c:if test="${user.userId eq currentCourse.user.userId}">
                            <a href="createLessonPage.htm?courseId=${currentCourse.course.courseId}">（添加课时）</a>
                        </c:if>
                    </c:if>
                    <c:if test="${lessonNum>0}">
                        <c:forEach items="${lessonList}" var="lesson" varStatus="vs">
                            <li class="lili">
                                <span class="lesson-index">L${vs.index+1}</span>
                                <span class="lesson-title"><a
                                        href="lessonPage.htm?childrenId=${lesson.course.courseId}"
                                        target="_blank">${lesson.course.courseTitle}</a></span>
                                <span class="lesson-learned-status">
                                        ${lesson.learnState}
                                </span>

                                <div class="lesson-summary">
                                        ${fn:substring(lesson.course.courseIntro,0,50)}
                                </div>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>


    <div id="course-side">
        <div class="flat">
            <h3>课程创建人</h3>

            <div class="course-author-block imageblock clearfix">
                <div class="imageblock-image"><img
                        src="${currentCourse.user.headImage.imageMid}" alt="${currentCourse.user.userName}">
                </div>
                <div class="imageblock-content">


                    <c:if test="${currentCourse.user.userId ne user.userId}">
                    <c:if test="${isAttention==0}">
                        <div class="fr" id="follow-user-opts">
                            <a href="javascript:;" id="follow-user" class="btn btn-small disabled action-ajax fr" style="display: inline-block;"><i class="icon-plus"></i> 关注TA</a>
                            <a href="javascript:;" id="unfollow-user" class="btn btn-small disabled action-ajax fr" style="display: none;">已关注 | 取消 </a>
                            <input type="hidden" name="aa" value="no" id="att">
                            <input type="hidden" name="bb" value="${currentCourse.user.userId}" id="btt">
                        </div>
                        </c:if>
                        <c:if test="${isAttention==1}">
                            <div class="fr" id="follow-user-opts">
                                <a href="javascript:;" id="follow-user" class="btn btn-small disabled action-ajax fr" style="display: none;"><i class="icon-plus"></i> 关注TA</a>
                                <a href="javascript:;" id="unfollow-user" class="btn btn-small disabled action-ajax fr" style="display: inline-block;">已关注 | 取消 </a>
                                <input type="hidden" name="aa" value="ok" id="att">
                                <input type="hidden" name="bb" value="${currentCourse.user.userId}" id="btt">
                            </div>
                        </c:if>
                        </c:if>
                        <div class="userName"><a href="goPersonal.htm?userId=${currentCourse.user.userId}"
                                                 class="show-user-card"
                                                 title="${currentCourse.user.userName}">${currentCourse.user.userName}<span
                                class="o-ver-icn"></span></a></div>
                        <div>
                            <a href="#" class="stats">课程&nbsp;${creatorCourseNum}</a>
                            <a href="#" class="stats">粉丝&nbsp;${fansNum}</a>
                            <a href="#" class="stats">关注&nbsp;${followNum}</a>
                        </div>
                    </div>
                    <div class="mtm gray">${currentCourse.user.intro}</div>
                </div>
            </div>


            <div class="flat">
                <h2>最近加入的学员</h2>
                <ul class="grids smallpic-grids">
                    <c:if test="${empty userLearnCourseList}">
                        暂无用户学习此课程
                    </c:if>
                    <c:if test="${!empty userLearnCourseList}">
                        <c:forEach items="${userLearnCourseList}" var="course">
                            <li class="grid">
                                <img src="${course.user.headImage.imageSmall}" title="${course.user.userName}">
                                <div><a href="goPersonal.htm?userId=${course.user.userId}" class="show-user-card"
                                        title="${course.user.userName}">${course.user.userName}</a></div>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div>

            <div class="flat">
                <h2>已完成该课程的学员</h2>
                <ul class="grids smallpic-grids">
                    <c:if test="${empty userEndCourseList}">
                        <p>暂无用户学完此课程</p>
                    </c:if>
                    <c:if test="${!empty userEndCourseList}">
                        <c:forEach items="${userEndCourseList}" var="course">
                            <li class="grid">
                                <a href="" class="show-user-card"><img src="${course.user.userName}"
                                                                       alt="${course.user.headImage.imageSmall}"></a>

                                <div><a href="" class="show-user-card"
                                        title="${course.user.headImage.imageSmall}">${course.user.headImage.imageSmall}</a>
                                </div>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div>

            <div>

            </div>
        </div>
</section>

<div class="wrapper">
    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>
</div>

</body>
</html>