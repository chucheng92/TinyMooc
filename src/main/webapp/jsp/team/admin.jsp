<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf" %>
<%@ taglib prefix="sicd" uri="/sicd-tags"%>
<!DOCTYPE HTML>
<!--[if lt IE 7]><html class="ie ie6"><![endif]-->
<!--[if IE 7]><html class="ie ie7"><![endif]-->
<!--[if IE 8 ]><html class="ie8"><![endif]-->
<!--[if !IE]><!--><html><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> 小组设置  - 萌课网</title>
    <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>

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


<div class="movedown"></div>

<div class="wrapper">

    <div class="middle-container">
        <div class="right-top-banner gnews-banner-team">
            <div></div>
        </div>
        <div class="middle-top"></div>
        <div class="middle">


            <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">
                <div class="group-header" style="background-image:url(<c:url value="/resource/pic/imagehead/group-header.jpg"></c:url>)">

                    <div class="head">
                        <div class="icon"><img src="${userTeam2.team.headImage.imageSmall}"  alt="${userTeam2.team.teamName}"  /></div>
                        <div class="infos">
                            <h1>${userTeam2.team.teamName}</h1>
                            <span>${memberNum}个成员</span>
                        </div>
                    </div>

                    <ul class="hnav">
                        <li><a href="teamHomePage.htm?teamId=${userTeam2.team.teamId}">小组首页</a></li>
                        <li><a href="discussPage.htm?teamId=${userTeam2.team.teamId}">讨论区</a></li>
                        <li><a href="membersAdminPage.htm?teamId=${userTeam2.team.teamId}">成员</a></li>
                        <c:if test="${userTeam.userPosition=='组长'}">
                            <li class="this"><a href="manageTeam.htm?teamId=${userTeam2.team.teamId}">管理</a></li>
                        </c:if>
                    </ul>

                </div>
                <div class="container-padding clearfix">
                    <div class="mod">
                        <div class="tab-nav clearfix">
                            <ul>
                                <li class="this"><a href="manageTeam.htm?teamId=${userTeam2.team.teamId}">基本设置</a></li>
                                <li><a href="goTeamPicture.htm?teamId=${userTeam2.team.teamId}">图标设置</a></li>
                            </ul>
                        </div>

                        <form id="group-base-form" class="form group-base-form" method="post" action="updateTeamInfo.htm">

                            <p>
                                <label for="teamName" class="required">小组名称:</label>

                                <input type="text" id="teamName" name="teamName" required="required" class="wide" value="${userTeam2.team.teamName}" />

                            </p>
                            <p>
                                <label for="teamIntro" class="required">小组介绍:</label>
                                <textarea id="teamIntro" name="teamIntro" required="required" class="wide low mceEditor">${userTeam2.team.teamIntro}</textarea>
                            </p>
                            <input type="hidden" name="teamId" value="${userTeam2.team.teamId}"/>


                            <p><label  for="teamTag" class="required">标签:</label></p>
                            <input type="text" id="teamTag" name="teamTag" required="required" class="wide" value="" />
                            <p> 小提示：多个标签请以英文逗号分隔</p>

                            <div class="mod">
                                <div class="addLabels">
                                    <div class="keywords">
                                        <sicd:label previousLabels="${previousLabels}" hotLabels="${labels}"/>
                                    </div>
                                    <br>
                                    <button  class="btn btn-success" type="submit" value="" id="checkl" >保存</button>
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

</body>
</html>