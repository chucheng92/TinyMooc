<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>写私信 - 萌课网</title>
<script type="text/javascript" src="<c:url value="/resource/js/sendMail.js"/>"></script>
</head>
<body class="flats-theme">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

<section class="container clearfix" style="margin-top: 60px;">
  <div id="me" class="me clearfix">
    <div class="main">
      <div class="wrap">
    <div class="main-head">
      <a href="goPrivateMail.htm" class="fr">« 返回私信箱</a>
      <h2>写私信</h2>
    </div>

    <div class="mod">
	<%--<div class="alert alert-error" id="name"></div>改用scojs错误提示--%>

      <form class="form-horizontal" method="post" id="message-form" action="sendMail.htm" name="form1">
        <div class="control-group">
          <label class="control-label required" for="message_receivers">收件人:</label>
          <div class="controls">
            <input type="text" id="message_receivers" value="请填写对方的用户名" name="userName" required="required" class="input input-xlarge" onblur="checkReg()">
            
          </div>
        </div>

        <div class="control-group">
          <label class="control-label required" for="message_message">内容:</label>
          <div class="controls">
            <textarea id="message_message" name="context" required="required" rows="8" class="input input-xxlarge" maxlength="1000"></textarea>
          </div>
        </div>

        <div class="control-group">
          
          <div class="controls">
            <button type="submit" class="btn btn-success" onclick="validate()">发送</button>
          </div>
        </div>

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