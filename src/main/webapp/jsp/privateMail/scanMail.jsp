<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sicd" uri="/sicd-tags"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>

    <title>私信列表</title>
</head>


<body class="archive category category-gnews category-3">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>


<div class="movedown"></div>

<div class="wrapper">
    <div class="left">
        <header>
            <div class="movedown"></div>
            <div class="side">

                <jsp:include page="/jsp/include/leftside.jsp"></jsp:include>

            </div>
        </header>

        <div class="garlic"></div>

    </div>

    <div class="right-container">
        <div class="right-top-banner gnews-banner-major">
            <div></div>
        </div>
        <div class="right-top"></div>
        <div class="right">


            <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">
                <div class="main-head">

                    <div class="fr">
                        <a href="goPrivateMail.htm">« 返回私信箱</a>
                        <span class="gray mhs">|</span>
                        <a href="" onclick="return confirm(&#39;真的要删除整个私信会话吗？&#39;);">全部删除</a>
                    </div>
                    <h2>
                        与${sender.userName}的会话<span class="mls">(共有${num}条)</span>

                    </h2>

                </div>


                <div class="mod">
                    <ul class="msg-list mbl">
                        <c:forEach items="${list}" var="reply">

                            <li class="msg-row">
                                <div class="imageblock clearfix">
                                    <div class="imageblock-image"><img src="<c:url value="${reply.userBySenderId.headImage.imageSmall}"/>" class="img"></div>
                                    <div class="imageblock-content">
                                        <div class="mbs"><a href="#" class="fr mls">回复</a><span class="time fr"><fmt:formatDate value="${reply.sendDate}" pattern="yyyy/MM/dd:HH:mm:ss"/></span><a href="#">${reply.userBySenderId.userName} TO ${reply.userByReceiverId.userName}</a></div>
                                        <div class="editor-content" style="color: #000">${reply.content}</div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>

                    <a id="latest-message" name="latest-message">&nbsp;</a>
                    <sicd:page curPage="${curPage}" url="${url}" totalPage="${totalPage}" />
                    <form id="message-reply-form" method="post" action="sendReplyMail.htm?userName=${sender.userName}">
                        <textarea id="messagereply_message" name="context" required="required" class="input-xxlarge" rows="3" maxlength="1000"></textarea>
                        <p class="messageReplyBtns">
                            <button type="submit" class="btn btn-success">回复</button>
                        </p>
                    </form>

                </div>

            </article>

            <div class="movedown2"></div>

        </div> <!-- end .right -->
        <div class="right-bottom"></div>

        <div class="movedown"></div>

    </div> <!-- end .right-container -->

    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</div>

</body></html>