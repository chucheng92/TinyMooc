<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>密码重置 - 萌课网</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">
<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
<script type="text/javascript" src="<c:url value="/resource/js/login.js"/>"></script>
</head>
<body class="lily-theme">

<jsp:include page="/jsp/include/head1.jsp"></jsp:include>
<section class="container signup">
	<div class="container-padding clearfix">
  		<h1>请输入您的新密码</h1>
 	 </div>
	<div class="normal-main">
  <form id="signup-form" class="form signin-form" method="post" action="goChangePassword.htm" name="form1">
      
    <p>
      <label for="signup_username" class="required">新密码</label>
      <input type="text" id="signup_username" name="userPassword" required="required" onblur="checkPwd1()">
      <span id="pwd"></span>
    </p>
     <p class="actions">
     <input type="hidden" name="userEmail" value="${userEmail}">
      <button type="submit" class="btn btn-success"  id="loginOK">确认</button>
    </p>
    </form>
    </div>
</section>

<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body></html>