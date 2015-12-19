<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录-萌课网</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">
<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v3.css"/>">
<script type="text/javascript" src="<c:url value="/resource/js/login.js"/>"></script>
</head>
<body class="lily-theme">
<jsp:include page="/jsp/include/head1.jsp"></jsp:include>

<section class="container signin">
  <div class="container-padding clearfix">
  <h1>登录萌课网</h1>
  <div class="normal-main">
    <form id="signin-form" class="form signin-form" method="post" action="login.htm" name="form1">
        <p>
      <label for="signin_username">邮箱</label>
      <input id="signin_username" tabIndex="1" name="userEmail" value="" type="text" onblur="checkReg()">
      <span id="email"></span>
    </p>
    <p>
      <label for="signin_password">密码</label>
      <input id="signin_password" tabIndex="2" name="userPassword" type="password" onblur="checkPwd()">
      <span id="pwd"></span>
    </p>
    <p class="actions reset-labels reset-inputs">
    
      <input id="signin_remeberme" tabIndex="3" name="autoLogin" type="checkbox"><label for="signin_remeberme">下次自动登录</label>
      <a class="ml15" href="goFindPassword.htm">忘记密码了</a><br>
      <span style="color: red">${note}</span>
    </p>
    <p class="actions">
     
     <button class="btn btn-success" tabIndex="4" type="submit">登录</button>
    </p>
  </form>
  </div>
  
  <div class="normal-side">
    <p>还没有萌课帐号？ <a href="goRegisterPage.htm">立即注册</a></p>
    <!-- <div class="connect-for-sign">
      
    </div> -->
  </div>
  </div>
</section>

<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body></html>