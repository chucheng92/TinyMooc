<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>修改密码 - ${user.userName}的帐号 - 萌课网</title>
  <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/img.css"/>


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

<script type="text/javascript">
  $("#save").live('click',(function(){
	  //alert("a");
     $("#form1").submit();
     
	  }));
</script>

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
        <div class="right-top-banner gnews-banner-account">
            <div></div>
        </div>
        <div class="right-top"></div>
        <div class="right">


            <article class="post-1702 post type-post status-publish format-standard hentry category-gnews category-uncategorized tag-asparagus tag-delicious tag-eating-grilled tag-food tag-healthy tag-recipe tag-seasonal tag-variety tag-vegetables" id="post-1702">
                <div class="main-head">
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

            </article>

            <div class="movedown2"></div>

        </div> <!-- end .right -->
        <div class="right-bottom"></div>

        <div class="movedown"></div>

    </div> <!-- end .right-container -->

    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>
</div>

</body>
</html>