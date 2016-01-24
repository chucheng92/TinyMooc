<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sicd" uri="/sicd-tags"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>私信列表</title>
</head>
<body class="flats-theme">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

<section class="container clearfix"style="margin-top: 60px;">
  <div id="me" class="me clearfix">
    <div class="main">
      <div class="wrap">
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
        <div class="imageblock-image"><a href="http://www.howzhi.com/u/1359470/"><img src="<c:url value="${reply.userBySenderId.headImage.imageMid}"/>" class="img"></a></div>
        <div class="imageblock-content">
          <div class="mbs"><a href="#" class="fr mls">回复</a><span class="time fr"><fmt:formatDate value="${reply.sendDate}" pattern="yyyy/MM/dd:HH:mm:ss"/></span><a href="#">${reply.userBySenderId.userName} TO ${reply.userByReceiverId.userName}</a></div>
          <div class="editor-content">${reply.content}</div>
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

</div>
    </div>
     <div class="side">

      <div class="avatar-mod clearfix">
        <a href="goPersonal.htm?userId=${user.userId}" class="avatar"><img src="<c:url value="${user.headImage.imageMid}"/>" /></a>
        <div class="infos">
          <div class="nickname"><a href="/u/1359470/" title="fanfanle">${user.userName}</a></div>
          <div class="icons">
            <a class="user-level user-level-6"  href="/help/#help_user_level" target="_blank">${level.lv}级</a>
			<a class="user-level user-level-6"  href="">${level.title}</a>
          </div>
        </div>
      </div>

      <div class="stats-mod">
          <ul class="user-stats clearfix">
            <li><a href="/me/point"><strong>${user.credit}</strong>学分</a></li>
            <li><a href="/me/coin"><strong>${user.gold}</strong>金币</a></li>
          </ul>
      </div>

         <jsp:include page="/jsp/include/leftside.jsp"></jsp:include>

     </div>
  </div>
</section>




<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body></html>