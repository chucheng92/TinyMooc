<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>萌课网 - 注册</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<script type="text/javascript" src="<c:url value="/resource/js/register.js"/>"></script>
</head>
<body class="lily-theme">

<jsp:include page="/jsp/include/head1.jsp"></jsp:include>

<section class="container signup">
  <div class="container-padding clearfix">
  <h1>欢迎加入萌课网</h1>
  <div class="normal-main">
  <form id="signup-form" class="form signin-form" method="post" action="userRegister.htm" name="form1">

    <p>
      <label for="signup_username" class="required">邮箱</label>
      <input type="text" id="signup_username" name="userEmail" required="required" onblur="checkReg(0)">
      <span id="email"></span>
    </p>
    <p>
      <label for="signup_nickname" class="required">昵称</label>
      <input type="text" id="signup_nickname" name="userName" required="required" onblur="checkReg(1)">
      <span class="help-inline" id="name"></span>
    </p>
    <p>
      <label class="required">性别</label>
      </p><div id="signup_gender" class="reset-labels reset-inputs"><input type="radio" id="signup_gender_0" name="userGender" required="required" value="男" checked="checked"><label for="signup_gender_0" class="required">男</label><input type="radio" id="signup_gender_1" name="userGender" required="required" value="女"><label for="signup_gender_1" class="required">女</label></div>
    <p></p>
    <p>
      <label for="signup_password" class="required">设置密码</label>
      <input type="password" id="signup_password" name="userPassword" required="required" onblur="checkPwd()">
      <span class="help-inline" id="pwd"></span>
    </p>
    <p>
      <label for="signup_repassword" class="required">确认密码</label>
      <input type="password" id="signup_repassword" name="txtRpewd" required="required" onblur="checkRpwd()">
      <span class="help-inline" id="Rpwd"></span>
    </p>

    <p class="actions">
      <button type="submit" class="btn btn-success" onclick="validate()" id="loginOK">注册</button>
    </p>
  </form>
  </div>

  <div class="normal-side">
    <p>已拥有萌课网帐号？ <a href="goLoginPage.htm">直接登录</a></p>
    <div class="connect-for-sign">

    </div>

  </div>
  </div>
</section>

<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body></html>