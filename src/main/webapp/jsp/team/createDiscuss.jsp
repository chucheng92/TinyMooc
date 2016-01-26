<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]><html class="ie ie6"><![endif]-->
<!--[if IE 7]><html class="ie ie7"><![endif]-->
<!--[if IE 8 ]><html class="ie8"><![endif]-->
<!--[if !IE]><!--><html><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> 发言 -${team.teamName}- 萌课网</title>
    <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>
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

        });

    </script>

</head>


<body class="archive category category-gnews category-3">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

<script type="text/javascript">
    $(document).ready(function(){

        var message='<%=request.getAttribute("message")%>';
        var message2='Welcome back!';

        if(message==null||message=='null'){

        }else{
            $.scojs_message(message, $.scojs_message.TYPE_OK);
        }
    });
</script>


<div class="movedown"></div>

<div class="wrapper">

    <div class="middle-container">
        <div class="right-top-banner gnews-banner-team">
            <div></div>
        </div>
        <div class="middle-top"></div>
        <div class="middle">


            <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">

                <div class="container-padding clearfix">
                    <div class="turnmiddle">

                    <div class="fsm pbm"><a href="/groups/">小组</a> &raquo;
                        <a href="/group/pm365/" id="group-url">${team.teamName}</a> &raquo;
                        <span>发表新话题</span></div>

                    <form id="group-post-form" class="dform discussion-form" method="post" novalidate action="createDiscuss.htm">
                        <div class="normal-main">
                            <div class="mod">


                                <div class="item">
                                    <label class="item-label required" for="discuss_title">主题:</label>
                                    <input type="text" id="topic" name="topic" required="required"    class="item-input" />
                                    <input type="hidden" name="teamId" value="${team.teamId}"/>
                                </div>


                                <div class="item">
                                    <div id="editor-save-images" class="fr"></div>
                                    <label class="item-label required" for="discuss_content">内容:</label>
                                    <textarea class="xheditors" id="content" name="content" required="required"></textarea>
                                </div>

                                <div class="item clearfix">
                                    <button type="submit" class="btn btn-success fr">发表</button>
                                    <a href="discuss.jsp" class="btn">取消</a>
                                </div>

                            </div>
                        </div>
                    </form>

                </div>
                </div>
            </article>


            <div class="movedown2"></div>

        </div> <!-- end .right -->
        <div class="middle-bottom"></div>

        <div class="movedown"></div>

    </div> <!-- end .right-container -->

    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</div>

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