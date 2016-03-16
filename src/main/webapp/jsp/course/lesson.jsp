<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sicd" uri="/sicd-tags" %>
<%@ include file="/resource/jspf/commons.jspf" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${currentCourse.course.courseTitle}-萌课网</title>
    <link rel="stylesheet" href="<c:url value="/resource/css/bdsstyle.css"/>">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>

    <script type="text/javascript" src="<c:url value="/resource/js/xheditor/xheditor-1.1.9-zh-cn.min.js"/>"></script>

    <style type="text/css">
        .why-gnosh-movies2{
            background: url("http://files.bbs.tl.changyou.com/data/attachment/forum/201512/28/170611h1f45gf51i2z4ram.png") top left no-repeat;
            height:50px;
            width:670px;
            margin-bottom: 30px;
            margin-top: -10px;
            margin-left: 0px;
        }
    </style>

    <script type="text/javascript">
        $(function () {

            $("#note-open-btn").click(function () {

                $("#note-popup-composer").css("visibility", "visible")

            });

            $("#chacha").click(function () {

                $("#note-popup-composer").css("visibility", "hidden")

            });

            $(".btn.btn-link").click(function () {
                var a = $(this).html();
                //alert(a);
                if (a == "回复") {
                    //alert("aaa");
                    $(this).parent().parent().children(".st").children(".frame").css("display", "block");
                    $(this).html("收起");
                } else if (a == "收起") {
                    $(this).parent().parent().children(".st").children(".frame").css("display", "none");
                    $(this).html("回复");
                }
            });
            $("#save").click(function () {
                <c:if test="${empty user}">
                    alert("登陆后才可以发表回复(づ￣3￣)づ╭❤～");
                    return false;
                </c:if>
                <c:if test="${!empty user}">
                    if ($("#content").val() == "") {
                        alert("内容不能为空");
                        return false;
                    } else {
                        $("#form1").submit();
                    }
                </c:if>
            });

            $(".btn.btn-success").live("click", function () {
                //alert("aa");
                $(this).parent().parent().children(".form1.reply-form").submit();

            });
            $("#note-submit-btn").click(function (e) {
                e.preventDefault();

                var pub = $("#pub").val();
                var uC = $("#courseTimeId").val();
                var con = $("#con").val();
                $.ajax({
                    type: "post",
                    url: "goCreateNote.htm",
                    data: "courseId=" + uC + "&content=" + con + "&isPublic=" + pub,
                    success: function (msg) {
                        if (msg == "ok") {
                            alert("保存成功！");
                        }
                    }

                });
            });


            var a = $("#index").html();
            $("#lesson").children("li").each(function () {
                var b = $(this).children("span.lesson-index").html();
                if (a == b) {
                    $(this).addClass("current");
                }
            });
        });
    </script>

    <script type="text/javascript">
        function test() {
            <c:if test="${empty user}">
            alert("登陆后才可以加入学习计划哦(づ￣3￣)づ╭❤～");
            return false;
            </c:if>
            <c:if test="${!empty user}">
            var courseId = document.getElementById("courseTimeId").value;
            var a = document.getElementById("start").innerHTML;
            if (a == "开始学习") {
                window.location.href = "startLearn.htm?courseId=" + courseId;
            }
            </c:if>
        }
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
                        } else {
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
</head>

<body>
<c:if test="${empty user.userId}">
    <jsp:include page="/jsp/include/head1.jsp"></jsp:include>
</c:if>
<c:if test="${!empty user.userId}">
    <jsp:include page="/jsp/include/head2.jsp"></jsp:include>
</c:if>

<input type="hidden" id="userId1" value="${user.userId}">
<input type="hidden" id="userId" value="${currentCourse.user.userId}">
<section class="container course" style="margin-top: 60px;">

    <div id="course-main">


                <%--<div class="imageblock-image">--%>
                    <%--<a href=""><img src=""width="48" heiht="48" alt="${userCourse.course.courseTitle}"></a>--%>
                <%--</div>--%>
                <%--<div class="imageblock-content">--%>

                    <%--<h1 class="mbm">--%>
                        <%--<a href="">${userCourse.course.courseTitle}</a>--%>
                    <%--</h1>--%>

                    <%--<div style="margin-left: -5px;">--%>
                        <%--<div class="clearfix mtm">--%>

                            <%--<div class="pills" style="margin-bottom: 0px">--%>
                                <%--<a href="">学员(${students})</a>--%>
                            <%--</div>--%>
                        <%--</div>--%>
        <div>
            <h1>
                <span class="lesson-title">课程名：${lesson.courseTitle}</span>
            </h1>
            <div class="action-bar" style="float: right;margin-bottom: 5px">
                <c:if test="${userCourse.user.userId ne user.userId}">
                    <button class="btn btn-large btn-success" id="start" onclick="test()">${lessonLearnState}</button>
                </c:if>
            </div>
            <div>
                <c:if test="${lessonLearnState=='学习中'}">
                    <button id="note-open-btn" class="btn btn-small" title="写笔记"
                            data-open-url="/course/4631/lesson/49296?openNote=1">
                        <i class="icon-pencil"></i> 写笔记
                    </button>
                </c:if>
            </div>

            <div class="editor-content">
                        <iframe src="http://play.video.qcloud.com/iplayer.html?$appid=1251419256&$fileid=${requestScope.fileId}&$autoplay=0&$sw=1280&$sh=720" frameborder="0" width="100%" height="720" scrolling="no"></iframe>
                        <script src="http://qzonestyle.gtimg.cn/open/qcloud/video/h5/fixifmheight.js" charset="utf-8"></script>
                <div class="btn-toolbar mbl clearfix" id="lesson-user-actions">
				<span class="pull-right">
			
				<c:if test="${learnLessonState=='学习中'}">
                    <a href="haveLeaned.htm?courseId=${lesson.courseId}" id="set-learned-btn" class="btn btn-success">
                        <i class="glyphicon-ok"></i>学习中</a>
                </c:if>
				<c:if test="${learnLessonState=='已学'}">
                    <a href="" id="cancel-learned-btn" class="btn btn-success disabled">
                        <i class="glyphicon-ok"></i> 已学</a>
                </c:if>
				</span>
                </div>
            </div>
        </div>

        <div class="why-gnosh-movies2">
        </div>

        <c:if test="${commentNum eq 0}">
            <div class="notuntil">
                <h3>暂时还没有评论</h3>
            </div>
        </c:if>
        <c:if test="${commentNum>0}">
            <div class="flat">
                <h3>${commentNum} 回复</h3>
                <ul class="discuss-replies">
                    <c:forEach items="${singleCommentList}" var="cm1">
                        <li class="reply" data-author="${cm1.user.userName}">
                            <div class="who">
                                <img src="${cm1.user.headImage.imageSmall}"
                                                                       alt="${cm1.user.userName}">
                            </div>
                            <div class="mbs">
                                <strong class="mrs"><a href="goPersonal.htm?userId=${cm1.user.userId}" class="show-user-card "
                                                       title="${cm1.user.userName}">${cm1.user.userName}</a></strong>
                                <span class="said-meta"><fmt:formatDate value="${cm1.commentDate}"
                                                                        pattern="yyyy-MM-dd HH:mm"/></span>
                            </div>
                            <div class="said-content editor-content reply-editor-content">
                                    ${cm1.commentContent}
                            </div>
                            <p align="right">
                                <button type="button" class="btn btn-link">回复</button>
                            </p>

                            <ul class="discuss-replies">
                                <c:forEach items="${nestedCommentList}" var="cm2">
                                    <c:if test="${cm2.comment.commentId eq cm1.commentId}">
                                        <li class="reply" data-author="${cm2.user.userName}">
                                            <div class="who">
                                               <img
                                                        src="${cm2.user.headImage.imageMid}" alt="${cm2.user.userName}"
                                                        width="40px" height="40px">
                                            </div>
                                            <div class="mbs">
                                                <strong class="mrs"><a href="" class="show-user-card "
                                                                       title="${cm2.user.userName}">${cm2.user.userName}</a></strong>
                                                <span class="said-meta"><fmt:formatDate value="${cm2.commentDate}"
                                                                                        pattern="yyyy-MM-dd HH:mm"/></span>
                                            </div>
                                            <div class="said-content editor-content reply-editor-content">${cm2.commentContent}</div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>

                            <div class="st">
                                <div style="display: none;" class="frame">
                                    <form id="form2" class="form1 reply-form" method="post" action="createReply.htm">
                                        <p class="text">
                                            <textarea class="xheditors aa" name="content" style="padding-left: 0px" required="required"></textarea>
                                            <input type="hidden" name="courseTimeId" value="${lesson.courseId}"/>
                                            <input type="hidden" name="parentId" value="${cm1.commentId}"/>
                                        </p>
                                    </form>
                                    <p align="right">
                                        <button class="btn btn-success">回复</button>
                                    </p>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

        <div class="flat">
            <h3>添加一条新回复</h3>

            <form id="form1" class=" form reply-form" method="post" action="createReply.htm">

                <p><textarea class="xheditors reply" id="content" name="content" required="required"></textarea></p>
                <input type="hidden" id="courseTimeId" name="courseTimeId" value="${lesson.courseId}"/>
            </form>
            <p>
                <button type="submit" class="btn btn-success" id="save">发布回复</button>
            </p>
        </div>


    </div>

    <div id="course-cover">
        <div class="dialog" id="note-popup-composer"
             style="visibility:hidden;">
            <div class="wrap">
                <div class="title">
                    <a href="javascript:;" class="close clost-it dialog-close" data-role="cancel" id="chacha">x</a>
                    <span class="text">笔记：${lesson.courseTitle}</span>
                </div>

                <div class="content">
                    <form action="goCreateNote.htm" method="post" id="note-form">
                        <input type="hidden" value="${lesson.courseId}" name="courseId" id="userCourseId">

                        <div class="phs pvs">
                            <div class="error" style="display: none"></div>
                            <div class="mbs">

                                <textarea class="xheditors note" id="con" name="content" required="required"></textarea>


                            </div>
                            <div class="clearfix">
                                <div class="fl">
                                    <select id="pub" name="isPublic"
                                            required="required">
                                        <option value="是"
                                                selected="selected">公开笔记
                                        </option>
                                        <option value="否">私有笔记</option>
                                    </select>
                                </div>
                                <div class="fr">

                                    <button class="btn btn-success"
                                            id="note-submit-btn">保存
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="course-side">

        <div class="flat">
            <h3>课程创建人</h3>

            <div class="course-author-block imageblock clearfix">
                <div class="imageblock-image"><a href="goPersonal.htm?userId=${currentCourse.user.userId}"
                                                 class="show-user-card"><img
                        src="${currentCourse.user.headImage.imageMid}" alt="${currentCourse.user.userName}"></a>
                </div>
                <div class="imageblock-content">

                    <c:if test="${currentCourse.user.userId ne user.userId}">
                    <c:if test="${isAttention==0}">
                    <div class="fr" id="follow-user-opts">
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
                        <a href="#" class="stats">课程&nbsp;0${creatorCourseNum}</a>
                        <a href="#" class="stats">粉丝&nbsp;${fansNum}</a>
                        <a href="#" class="stats">关注&nbsp;${followNum}</a>
                    </div>
                </div>
                <div class="mtm gray">${currentCourse.user.intro}</div>
            </div>
        </div>

        <div class="flat lesson-summary-flat">
            <h2>课时简介</h2>

            <p>${lesson.courseIntro}</p>
            <br/>
            <div>
               查看：<span>${lesson.scanNum}</span>
                评论：<span>${commentNum}</span>
            </div>
        </div>
        <div class="flat lesson-nav" id="lesson-window-list" style="display: block;">
            <h2>课时列表</h2>
            <ul id="lesson">
                <c:forEach items="${lessonList}" var="les" varStatus="vs">
                    <li>
                        <span class="lesson-index">L${vs.count}</span>
                        <span class="lesson-title"><a
                                href="lessonPage.htm?childrenId=${les.courseId}" target="_blank">${les.courseTitle}</a></span>
                    </li>
                </c:forEach>
            </ul>
            <div class="clearfix window-list-bottom">
                <span class="fl">共${lessonNum}课时</span>

                <div class="fr">
                </div>
            </div>
        </div>

        <div class="flat">
            <c:if test="${learned==0}">暂无用户学过</c:if>
            <c:if test="${learned>0}">
                <h3>${learned}人学过</h3>
                <c:forEach items="${userEndCoursesList}" var="uc3">
                    <img src="${uc3.user.headImage.imageMid}"
                                                                 alt="${uc3.user.userName}的头像" width=24 height=24>
                </c:forEach>
            </c:if>
        </div>

        <div class="flat">
            <c:if test="${learning==0}">暂无用户正在学习</c:if>
            <c:if test="${learning>0}">
                <h3>${learning}人正在学习</h3>
                <c:forEach items="${userLearnCoursesList}" var="uc2">
                    <img src="${uc2.user.headImage.imageMid}"
                                                                 alt="${uc2.user.userName}的头像" width=24 height=24>
                </c:forEach>
            </c:if>
        </div>

    </div>
        </div>
</section>

<div class="wrapper">
    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>
</div>

</body>
<script type="text/javascript">
    jQuery(function ($) {
        if ($('textarea.xheditors.reply').length != 0) {
            $('textarea.xheditors.reply').xheditor({
                upLinkUrl: "uploadFile.htm",
                upLinkExt: "zip,rar,txt,doc,docx,pdf,ppt,pptx,pps,ppsx,xlsx,xls,7z",
                upImgUrl: "uploadPic.htm",
                upImgExt: "jpg,jpeg,gif,png", tools: 'simple',
                forcePtag: false,
                html5Upload: false,
                emotMark: true
            });
        }
    });
</script>
</html>