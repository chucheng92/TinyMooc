<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
 <%@ taglib prefix="sicd" uri="/sicd-tags"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理 - 萌课网</title>
<link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/resource/bootstrap/css/bootstrap.css"/>" media="screen">

<script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resource/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/resource/css/site_v3.css"/>">
<script type="text/javascript" src="<c:url value="/resource/js/ga.js"/>"></script>
 <script type="text/javascript" src="<c:url value="/resource/js/label.js"/>"></script>
 <script type="text/javascript">
 $(function(){
	
	$("select").each(function(){
	 $(this).children("option").each(function(){
		 if($(this).text()==$("#type").val()){	          	         
	          $(this).attr({selected:"selected"});
		 }			
	        });
	    });
	});
 </script>
</head>
<body class="flats-theme">

<section class="container ">

  <div class="light-page">   
    <div class="page-body clearfix">

      <div class="page-body-main">
        <form id="course-create-form" class="form-horizontal" method="post" action="manageCourse.htm" data-widget="validator-bootstrap" data-auto-submit="false" data-auto-focus="false">
          <div class="control-group ui-form-item">
         <label class="control-label ui-label" for="course-title-field">标题</label>
      <div class="controls">
        <input id="course-title-field" class="input-with-feedback" 
        type="text" name="courseTitle" data-display="标题" required value="${course.courseTitle}"/>       
     </div>
    </div>
  
    <div class="control-group">
       <label class="control-label" for="course-summary-field">简介</label>
       <div class="controls">
      <textarea id="course-summary-field" class="input-with-feedback mceEditor" rows="5" name="courseIntro" style="width:100%;">${course.courseIntro}</textarea>     
    </div>
     </div>

     <style type="text/css">
        #course-category-control-group select {
        width: 100px;
         margin-right: 5px;
      }
     </style>

    <div class="control-group" id="course-category-control-group">
        <label class="control-label">专业</label>
       <div class="controls">
          <select name="type">
          <c:forEach items="${dataDicList}" var="data">
            <option value="${data.dicValue}">${data.dicValue}</option>
          </c:forEach> 
          </select>
          <input type="hidden" value="${course.type}" id="type">
          <input type="hidden" value="${course.courseId}" name="courseId">
       </div>
    </div> 
    
             
    <div class="control-group">
            <div class="controls">
              <button type="submit" class="btn btn-success">提交</button>
            </div>
          </div>
        </form>
      </div>
    </div>

  </div>

  
</section>


</body>
