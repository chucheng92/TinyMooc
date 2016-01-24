<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="sicd" uri="/sicd-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resource/js/label.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">
<title>Test</title>
</head>
<body>
<div class="addLabels" style=" height:200px; width:400px;float:left;" align="left"> 
						<form action="editLabel.htm" method="post" id="labelForm">
							<div class="keywords">
								<sicd:label previousLabels="${previousLabels}" hotLabels="${labels}"/>
								
								<input type="hidden" value="user" name="objectType">
							</div>
							<input  type="submit" value="保存" id="checkl" style="width:80px; heigth:30px; background:#87CEFA">
							
							<input type="button" value="取消" id="cancelll" style="width:80px; heigth:30px; background:#87CEFA">
						</form>
					</div> 
</body>
</html>