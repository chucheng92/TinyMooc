<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="sicd" uri="/sicd-tags"%> 
<%@ include file="/resource/jspf/commons.jspf"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>我的收藏夹 - 萌课网</title>
  <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
<script type="text/javascript">
  $(function(){
       $("a.url").click(function(){
           var url=$(this).parent().find("input.hidurl").val().substr(22);
           //url=url.replace("&","%26");
          // url=url.replace("?","%3F");	
           //alert(url);
           location.href=url;
           });	
       $("a.deletefa").click(function(){
           var favoriteId=$(this).parent().find("input.favoriteId").val();
           if (confirm("是否真的要删除？")) {
				//alert(favoriteId);
				location.href = "deleteFavotite.htm?favoriteId=" +favoriteId;
			} else {
				return false;
			}           
           });
       
	  });
</script>
</head>
<body class="flats-theme" style="margin-top: 60px">

<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

<section class="container clearfix">
  <div id="me" class="me clearfix">
    <div class="main">
      <div class="wrap">

         

 <div class="mod">    
     <table class="datagrid">
        <thead>
          <th colspan="2">名称</th>
          <th colspan="2">URL</th>
        </thead>
        <tbody>
        <c:forEach items="${favorites}" var="fa">
           <tr>
            <td class="favorite-name">${fa.favoriteName}</td>
            <td class="favorite-url"></td>
            <td class="favorite-url">
            <input type="hidden" value="${fa.url}" class="hidurl">
            <a href="#" class="url">${fn:substring(fa.url,0,40)}...</a>           
            </td>
            <td class="tac">
            <input type="hidden" value="${fa.favoriteId}" class="favoriteId">
            <a href="#" class="deletefa">取消收藏</a>
            </td>
          </tr>
        </c:forEach>
         </tbody>
      </table>
      	<div class="pagination pagination-centered">
			<ul>
               <li>
                 <sicd:page curPage="${curPage}" url="${url}" totalPage="${totalPage}" />
                 </li>
			   </ul>
		</div>
  </div>

</div>
    </div>
    <div class="side">

      <div class="avatar-mod clearfix">
        <a href="user.jsp" class="avatar"><img src="<c:url value="${user.headImage.imageMid}"/>" /></a>
        <div class="infos">
          <div class="nickname"><a href="user.jsp" title="fanfanle">${user.userName}</a></div>
          <div class="icons">
            <a class="user-level user-level-6" title="努力升级吧!" href="turnToHelpPage.htm" target="_blank">${level.lv}级</a>
            <a class="user-level user-level-6">${level.title}</a>

          </div>
        </div>
      </div>

      <div class="stats-mod">
          <ul class="user-stats clearfix">
            <li><a href="/me/point"><strong>${user.credit}</strong>学分</a></li>
            <li><a href="/me/coin"><strong>${user.gold}</strong>金币</a></li>
          </ul>
      </div>

      <div class="menu-mod clearfix">
         <ul class="menus">
          <li ><a href=myTinyMooc.htm"><i class="feature-icon feature-icon-home"></i>我的萌课</a></li>
          <li ><a href="courseList.htm"><i class="feature-icon feature-icon-teach"></i>课程管理</a></li>
          <li ><a href="goNote.htm"><i class="feature-icon feature-icon-note"></i>笔记</a></li>
          <%--<li ><a href="challenge.htm"><i class="feature-icon feature-icon-faq"></i>微挑战</a></li>--%>
          <%--<li ><a href="rank.htm"><i class="feature-icon feature-icon-faq"></i>微排行</a></li>--%>
          <%--<li ><a href="myrank.htm"><i class="feature-icon feature-icon-faq"></i>我的排行</a></li>--%>
          <li ><a href="teamPage.htm"><i class="feature-icon feature-icon-group"></i>小组</a></li>
          <%--<li ><a href="shop.htm"><i class="feature-icon feature-icon-faq"></i>商城</a></li>--%>
          <%--<li ><a href="myprop.htm"><i class="feature-icon feature-icon-faq"></i>我的道具</a></li>--%>
          <li ><a href="myFavorite.htm"><i class="feature-icon feature-icon-favorite"></i>收藏夹</a></li>
        </ul>

        <div class="divider"></div>

        <ul class="menus">
          <li ><a href="myAttention.htm"><i class="feature-icon feature-icon-friend"></i>好友</a></li>
          <li ><a href="goPrivateMail.htm"><i class="feature-icon feature-icon-message"></i>私信</a></li>
        </ul>

        <div class="divider"></div>

        <ul class="menus">
          <li ><a href="turnToHelpPage.htm"><i class="feature-icon feature-icon-coin"></i>金币</a></li>
          <li ><a href="account.htm"><i class="feature-icon feature-icon-setting"></i>账户设置</a></li>
        </ul>
      </div> 


    </div>
  </div>
  
</section>


<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body>
</html>