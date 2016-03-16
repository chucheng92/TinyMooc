<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
   <div class="avatar-mod clearfix">
        <a href="user.jsp" class="avatar"><img src="<c:url value="${user.headImage.imageMid}"/>" /></a>
        <div class="infos">
          <div class="nickname"><a href="user.jsp" title="fanfanle">${user.userName}</a></div>
          <div class="icons">
            <a class="user-level user-level-6" title="努力升级吧!" href="turnToHelpPage.htm" target="_blank">${level.lv}级</a>${level.title}

          </div>
        </div>
      </div>

      <div class="stats-mod">
          <ul class="user-stats clearfix">
            <li><a href="#"><strong>${user.credit}</strong>学分</a></li>
            <li><a href="#"><strong>${user.gold}</strong>金币</a></li>
          </ul>
      </div>
</body>
</html>