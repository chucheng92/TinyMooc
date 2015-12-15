<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>修改密码 - ${user.userName}的帐号 - 萌课网</title>
  <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
  <link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">
  <script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
  <link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
  <link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
  <link rel="stylesheet" href="<c:url value="/resource/css/site_v2.css"/>">
  <link rel="stylesheet" href="<c:url value="/resource/css/site_v3.css"/>">
  <script type="text/javascript" src="<c:url value="/resource/js/ga.js"/>"></script>
  <link rel="stylesheet" href="<c:url value="/resource/css/scojs.css"/>">
<script type="text/javascript" src="<c:url value="/resource/js/sco.message.js"/>"></script>
  
</head>
<body class="flats-theme">

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

<script type="text/javascript">
  $("#save").live('click',(function(){
	  //alert("a");
     $("#form1").submit();
     
	  }));
</script>

<section class="container clearfix">
  <div id="me" class="me clearfix">
    <div class="main">
      <div class="wrap"><div class="main-head">
  <h2>帐户设置</h2>
</div>

    <div class="mod">

  <div class="tabs clearfix">
  <ul>
    <li ><a href="goAccount.htm">个人资料</a></li>
    <li><a href="goAccountAvatar.htm">更新头像</a></li>
    <li class="on"><a href="goAccountPassword.htm">修改密码</a></li>
    <li><a href="queryLabel.htm?type=user">添加标签</a></li>
  </ul>
</div>  
      
    <form id="form1" class="form account-profile-form" method="post" action="revisePassword.htm">
    
      <p>
         <label for="form_oldPassword" class="required" required="required">当前密码:</label>
         <input type="password" id="form_oldPassword" name="oldPassword" />
      </p>
        
       <p>
         <label for="form_newPassword" class="required" required="required">新密码:</label>
         <input type="password" id="form_newPassword" name="newPassword" />
       </p>
    
       <p>
          <label for="form_newPasswordConfirm" class="required" required="required">确认密码:</label>
          <input type="password" id="form_newPasswordConfirm" name="newPasswordConfirm"  />
       </p>
    
       <p class="actions">
          
          <button id="save"  class="btn btn-success">保存</button>
       </p>
  
  </form>
</div>
</div>
    </div>
    <div class="side">

      <div class="avatar-mod clearfix">
        <a href="user.jsp" class="avatar"><img src="<c:url value="${user.headImage.imageMid}"/>" /></a>
        <div class="infos">
          <div class="nickname"><a>${user.userName}</a></div>
          <div class="icons">
              <a class="user-level user-level-6" title="努力升级吧!" href="" target="_blank">${level.lv}级</a>
            <a class="user-level user-level-6">${level.title}</a>
          </div>
        </div>
      </div>

      <div class="stats-mod">
          <ul class="user-stats clearfix">
            <li><a href=""><strong>240</strong>学分</a></li>
            <li><a href=""><strong>2</strong>金币</a></li>
          </ul>
      </div>

      <jsp:include page="/jsp/include/leftside.jsp"></jsp:include> 
    </div>
  </div>
</section>

<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body>
</html>