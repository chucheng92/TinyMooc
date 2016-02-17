<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册成功</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">
<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
<script type="text/javascript" src="<c:url value="/resource/js/login.js"/>"></script>
</head>
<body class="loginInfo">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>
<section class="container signup" style="margin-top: 60px;">
  <div class="container-padding clearfix">
      <h1>请输入您的注册邮箱！</h1>
   </div>
  <div class="normal-main">
  <form id="signup-form" class="form signin-form" method="post" action="" name="form1">
      
    <p>
      <label for="signup_username" class="required">邮箱</label>
      <input type="text" id="signup_username" name="userEmail" required="required" onblur="checkReg1()">
      <span id="email"></span>
    </p>
     <p class="actions">
      <button type="button" class="btn btn-success" onclick="validate1()" id="loginOK">确认</button>
    </p>
    </form>
    </div>
</section>

<div style="margin-top: 30% !important; margin-left:400px !important; width:900px;">
    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>
</div>

</body></html>