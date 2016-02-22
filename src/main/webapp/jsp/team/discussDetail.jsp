<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/resource/jspf/commons.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]><html class="ie ie6"><![endif]-->
<!--[if IE 7]><html class="ie ie7"><![endif]-->
<!--[if IE 8 ]><html class="ie8"><![endif]-->
<!--[if !IE]><!--><html><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> ${discuss.topic} - ${discuss.team.teamName} - 萌课网</title>
    <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
    <script type="text/javascript" src="<c:url value="/resource/js/xheditor/xheditor-1.1.9-zh-cn.min.js"/>"></script>
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

            $(".btn.btn-link").click(function(){
                var a=$(this).html();
                //alert(a);
                if(a=="回复"){
                    //alert("aaa");
                    $(this).parent().parent().children(".st").children(".frame").css("display","block");
                    $(this).html("收起");
                }else if(a=="收起"){
                    $(this).parent().parent().children(".st").children(".frame").css("display","none");
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
            $(".btn.btn-success").live("click",function(){
                $(this).parent().parent().children(".form1.reply-form").submit();
            });
        });
    </script>


    <script type="text/javascript" >
        $().ready(function(){
            $('#inform').click(function(e){
                var discussId=$("#obid").val();
                e.preventDefault();
                $.fancybox(
                        {href:'addInform.htm?discussId='+discussId,
                            title:'举报',type:'iframe',
                            onComplete: function() {
                                parent.$("#fancybox-title").css({'top':'-15px', 'bottom':'auto'});
                            }
                        },{
                            hideOnOverlayClick:false,
                            width:700,
                            height:150,
                            autoScale:true,
                            scrolling:'no'
                        }
                );
            });
        });
    </script>

    <script type="text/javascript" >
        $().ready(function(){
            $('#edit').click(function(e){
                var discussId=$("#obid").val();
                e.preventDefault();
                $.fancybox(
                        {href:'editDiscussPage.htm?discussId='+discussId,
                            title:'编辑',type:'iframe',
                            onComplete: function() {
                                parent.$("#fancybox-title").css({'top':'-15px', 'bottom':'auto'});
                            }
                        },{
                            hideOnOverlayClick:false,
                            width:700,
                            height:550,
                            autoScale:true,
                            scrolling:'no'
                        }
                );
            });
        });
    </script>

    <%-- 关注 --%>
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

</head>
<body class="flats-theme">

<c:if test="${! empty user}">
<jsp:include page="/jsp/include/head2.jsp"></jsp:include>
</c:if>

<c:if test="${empty user}">
    <jsp:include page="/jsp/include/head1.jsp"></jsp:include>
</c:if>

<section class="container">

    <div class="fsm pbm">
        <a href="teamPage.htm">小组</a> &raquo;
        <a href="">${userTeam.team.teamName}</a> &raquo;
        <a href="discussPage.htm?teamId=${userTeam.team.teamId}">讨论区</a> &raquo;
        话题
    </div>

    <div id="group-main">
        <div class="flat">
            <h1>${discuss.topic}</h1>
            <div class="said-meta mbm mtl clearfix">
        <span class="gray fl">
        <input type="hidden" id="obid" value="${discuss.discussId}">
        <a href="" class="show-user-card " title="${discuss.user.userName}">
            ${discuss.user.userName}</a>发表于<fmt:formatDate value="${discuss.publishDate}" pattern="yyyy年MM月dd日 HH时mm分"/></span>
            </div>
            <div class="said-meta mbm">
                <c:if test="${user.userId eq userTeam.user.userId}">
                    <span class="mls"><a href="" class="opt">封禁用户</a></span>
                    <c:if test="${empty discuss.essence}">
                        <span class="mls"><a id="elite-opt" href="makeEssence.htm?discussId=${discuss.discussId}" class="opt">精华</a></span>
                    </c:if>
                    <c:if test="${discuss.essence eq '精华'}">
                        <span class="mls"><a id="elite-opt" href="cancelEssence.htm?discussId=${discuss.discussId}" class="opt">取消精华</a></span>
                    </c:if>
                    <c:if test="${discuss.top==1}">
                        <span class="mls"><a id="unstick-opt" href="cancelTop.htm?discussId=${discuss.discussId}" class="opt">取消置顶</a></span>
                    </c:if>
                    <c:if test="${discuss.top==0}">
                        <span class="mls"><a id="unstick-opt" href="makeTop.htm?discussId=${discuss.discussId}" class="opt">置顶</a></span>
                    </c:if>
                    <span class="mls"><a id="delete-opt" href="deleteDiscuss.htm?discussId=${discuss.discussId}" class="opt">删除</a></span>
                </c:if>
                <c:if test="${user.userId eq discuss.user.userId}">
                    <span class="mls"><a href="" class="opt" id="edit">编辑</a></span>
                </c:if>
                <%--<c:if test="${flag eq 0}">--%>
                <%--<span class="mls"><a href="" id="favorite" class="opt">收藏</a></span>--%>
                <%--</c:if>--%>
                <%--<c:if test="${flag eq 1}">--%>
                <%--<span class="mls"><a href="" id="cancle" class="opt">已收藏</a></span>--%>
                <%--</c:if>--%>
                <span class="mls"><a href="" id="inform" class="opt" id="inform">举报</a></span>
            </div>
        </div>

        <c:if test="${commentNum eq 0}">
            <h3>暂时还没有评论</h3>
        </c:if>
        <c:if test="${commentNum>0}">
            <div class="flat">
                <h3>${commentNum} 回复</h3>
                <ul class="discuss-replies" style="border: 1px solid;border-color:#DDDDDD ">
                    <c:forEach items="${comments}" var="cm1">
                        <li class="reply" data-author="${cm1.user.userName}">
                            <div class="who">
                                <a href="" class="show-user-card"><img src="${cm1.user.headImage.imageSmall}" alt="${cm1.user.userName}"></a>
                            </div>
                            <div class="mbs">
                                <strong class="mrs"><a href="" class="show-user-card " title="${cm1.user.userName}">${cm1.user.userName}</a></strong>
                                <span class="said-meta"><fmt:formatDate value="${cm1.commentDate}" pattern="yy-MM-dd HH:mm"/></span>
                            </div>
                            <div class="said-content editor-content reply-editor-content">
                                    ${cm1.commentContent}
                            </div>
                            <p align="right">
                                <button type="button" class="btn btn-link">回复</button>
                            </p>

                            <ul class="discuss-replies" style="border: 1px solid;border-color:#DDDDDD ">
                                <c:forEach items="${comments2}" var="cm2">
                                    <c:if test="${cm2.comment.commentId eq cm1.commentId}">
                                        <li class="reply" data-author="${cm2.user.userName}">
                                            <div class="who">
                                                <a href="" class="show-user-card"><img src="${cm2.user.headImage.imageMid}" alt="${cm2.user.userName}" width="40px" height="40px"></a>
                                            </div>
                                            <div class="mbs">
                                                <strong class="mrs"><a href="" class="show-user-card " title="${cm2.user.userName}">${cm2.user.userName}</a></strong>
                                                <span class="said-meta"><fmt:formatDate value="${cm2.commentDate}" pattern="yyyy-MM-dd HH:mm"/></span>
                                            </div>
                                            <div class="said-content editor-content reply-editor-content">
                                                    ${cm2.commentContent}
                                            </div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>

                            <div class="st">
                                <div style="display: none;" class="frame">
                                    <form id="form2" class="form1 reply-form" method="post" action="createContent.htm">
                                        <p class="text">
                                            <textarea class="xheditors" id="content2" name="content" style="padding-left: 0px" required="required"></textarea>
                                            <input type="hidden" name="discussId" value="${discuss.discussId}" />
                                            <input type="hidden" name="parentId" value="${cm1.commentId}" />
                                        </p>
                                    </form>
                                    <p align="right">
                                        <button class="btn btn-success" id="inner-save">回复</button>
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

            <form id="form1" class=" form reply-form" method="post" action="createContent.htm">

                <p><textarea class="xheditors" id="content" name="content" required="required"></textarea></p>
                <input type="hidden" id="discussId" name="discussId" value="${discuss.discussId}" />
            </form>
            <p>
                <button type="submit" class="btn btn-success" id="save">发布回复</button>
            </p>
        </div>

    </div>

    <div id="group-side">
        <div class="flat">
            <h3>话题作者</h3>

            <div class="owner-block imageblock clearfix">
                <div class="imageblock-image"><a href="" class="show-user-card"><img src="${discuss.user.headImage.imageMid}" alt="${discuss.user.userName}"></a>
                </div>
                <div class="imageblock-content">
                    <c:if test="${discuss.user ne user.userId}">
                        <c:if test="${isAttention==0}">
                            <div class="fr" id="follow-user-opts">
                                <a href="javascript:;" id="follow-user" class="btn btn-small disabled action-ajax fr" style="display: inline-block;"><i class="icon-plus"></i> 关注TA</a>
                                <a href="javascript:;" id="unfollow-user" class="btn btn-small disabled action-ajax fr" style="display: none;">已关注 | 取消 </a>
                                <input type="hidden" name="aa" value="no" id="att">
                                <input type="hidden" name="bb" value="${discuss.user.userId}" id="btt">
                            </div>
                        </c:if>
                        <c:if test="${isAttention==1}">
                            <div class="fr" id="follow-user-opts">
                                <a href="javascript:;" id="follow-user" class="btn btn-small disabled action-ajax fr" style="display: none;"><i class="icon-plus"></i> 关注TA</a>
                                <a href="javascript:;" id="unfollow-user" class="btn btn-small disabled action-ajax fr" style="display: inline-block;">已关注 | 取消 </a>
                                <input type="hidden" name="aa" value="ok" id="att">
                                <input type="hidden" name="bb" value="${discuss.user.userId}" id="btt">
                            </div>
                        </c:if>
                    </c:if>

                    <div  class="nickname"><a href="" class="show-user-card " title="${discuss.user.userName}">${discuss.user.userName}</a></div>
                    <div>
                        <a href="" class="stats"><em>${courseNum}</em> 课程</a>
                        <a href="" class="stats"><em>${fansNum}</em> 粉丝</span></a>
                    </div>
                </div>
                <%--<div class="mtm gray">${discuss.user.userName}</div>--%>
            </div>
        </div>
        <div class="flat">
            <h3>同小组最新话题</h3>
            <ul class="text-list">
                <c:forEach items="${discusses}" var="dis">
                    <li><a href="">${dis.topic}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>

</section>


<footer class="footer container">
    <div style="padding: 0px 28px;">
        <div class="fl footer-links">
            <a href="">关于微课程</a>
            <a href="">微课程达人</a>
            <a href="">联系我们</a>
            <a href="">友情链接</a>
            <a href="">意见反馈</a>
            <br>
            <span class="copyright">©2013 MicroCourses.COM <a href="#">陕ICP备1102461-7</a> </span>
        </div>
    </div>
</footer>

</body>
<script type="text/javascript">
    jQuery(function($){
        if($('textarea.xheditors').length!=0){
            $('textarea.xheditors').xheditor({
                upLinkUrl:"uploadFile.htm",
                upLinkExt:"zip,rar,txt,doc,docx,pdf,ppt,pptx,pps,ppsx,xlsx,xls,7z",
                upImgUrl:"uploadPic.htm",
                upImgExt:"jpg,jpeg,gif,png", tools:'simple',
                forcePtag:false,
                html5Upload:false,
                emotMark:true
            });
        }
    });
</script>
</html>