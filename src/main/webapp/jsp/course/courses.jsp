<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录-微课程</title>
<link rel="Shortcut Icon" href="<c:url value="/pic/icon.ico" />" />
<link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.css"/>" media="screen">

<script type="text/javascript" src="<c:url value="/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/components.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v2.css"/>">
<link rel="stylesheet" href="<c:url value="/css/site_v3.css"/>">
<script type="text/javascript" src="<c:url value="/js/ga.js"/>"></script>
</head>
<body class="flats-theme">


<jsp:include page="/jsp/include/head2.jsp"></jsp:include>





<section class="container homepage">

    <div class="flat clearfix">
        <h2>课程频道</h2>
        <ul class="cells channel-cells">
           <li class="cell"><a href=""><i class="channel-icon channel-icon-photography"></i>摄影</a></li>
           <li class="cell"><a href=""><i class="channel-icon channel-icon-programme"></i>编程</a></li>
           <li class="cell"><a href=""><i class="channel-icon channel-icon-interest"></i>兴趣</a></li>
           <li class="cell"><a href=""><i class="channel-icon channel-icon-computer"></i>电脑</a></li>
           <li class="cell"><a href=""><i class="channel-icon channel-icon-language"></i>语言</a></li>
    
      </ul>   
    </div>

   <div class="flat clearfix">
        <h2>最新课程</h2>
        <ul class="cells cells-middle">
        <li class="cell">
        <div class="course-item">
         <div class="thumb"><a href=""><img src="" alt="南京大学：普通天文学" /></a></div>
         <p class="title"><a href="" title="南京大学：普通天文学"><span class="video" title="视频课程"></span>南京大学：普通天文学</a></p>
          <div class="summary">南京大学天文学</div>
          <p class="metas clearfix">
          <span class="fr learn" title="学员人数">7</span>
         <span class="fr view mrm" title="查看次数">354</span>
          <span class="fl by">by <a href="/u/sxgl/" class="show-user-card"  title="苏醒归来">苏醒归来</a></span>
        </p>
     </div>
     </li>
    </ul>        
    <div class="pagination mvm"><ul>
      <li class="disabled"><a href="javascript:;">上一页</a></li>
  
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="/courses?page=2">2</a></li>
                        <li><a href="/courses?page=3">3</a></li>
                        <li><a href="/courses?page=4">4</a></li>
                        <li><a href="/courses?page=5">5</a></li>
                        <li><a href="/courses?page=102">...102</a></li>
            
      <li><a href="/courses?page=2">下一页</a></li>
  </ul>
</div>    </div>
    
</section>

<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body>
</html>