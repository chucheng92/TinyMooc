<%--
  Created by IntelliJ IDEA.
  User: 哓哓
  Date: 2015/12/11 0014
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">
    <script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
    <script type="text/javascript" >
        $().ready(function(){
            $('button#close').click(function(e){
                e.preventDefault();
                parent.$.fancybox.close();
                parent.window.location.reload(true);
            });
        });
    </script>
</head>
<body>
<div>
    <p>success!!!</p>
    <p class="loginP"><button class="button"  onclick="javascript:history.go(-1)">返回</button></p>
    <p class="loginP"><button class="button" id="close">关闭</button></p>
</div>
</body>
</html>
