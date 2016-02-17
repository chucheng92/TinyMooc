<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sicd" uri="/sicd-tags" %>
<%@ include file="/resource/jspf/commons.jspf" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>课程收藏 - 萌课网</title>
    <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />"/>
    <script type="text/javascript">
        $(function () {
            $("a.url").click(function () {
                var url = $(this).parent().find("input.hidurl").val().substr(22);
                //url=url.replace("&","%26");
                // url=url.replace("?","%3F");
                //alert(url);
                location.href = url;
            });
            $("a.deletefa").click(function () {
                var favoriteId = $(this).parent().find("input.favoriteId").val();
                if (confirm("是否真的要删除？")) {
                    //alert(favoriteId);
                    location.href = "deleteFavorite.htm?favoriteId=" + favoriteId;
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
    <div class="main">
        <div class="mod">
            <table class="datagrid">
                <thead>
                <th colspan="2">课程名</th>
                <th colspan="2">URL</th>
                </thead>
                <tbody>
                <c:forEach items="${favorites}" var="fa">
                    <tr>
                        <td class="favorite-name">${fa.courseName}</td>
                        <td class="favorite-url"></td>
                        <td class="favorite-url">
                            <input type="hidden" value="${fa.url}" class="hidurl">
                            <a href="${fa.url}" class="url">${fn:substring(fa.url,0,40)}...</a>
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
                        <sicd:page curPage="${curPage}" url="${url}" totalPage="${totalPage}"/>
                    </li>
                </ul>
            </div>
        </div>

</section>


<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body>
</html>