<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>

<%--<section class="container homepage">--%>
<%--<div class="flat clearfix">--%>
    <%--<h2>音乐专享</h2>--%>
    <%--<h3>学累了，听会歌吧，小萌建议大家要劳逸结合哦</h3>--%>
    <%--<div align="center">--%>
        <%--<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=85% height=52--%>
                <%--src="http://music.163.com/outchain/player?type=2&id=28315582&auto=0&height=32"></iframe>--%>
    <%--</div>--%>
<%--</div>--%>
<%--</section>--%>


<footer class="footer container">
    <div style="padding: 0px 20%;">
        <div class="fl footer-links">
            <a href="https://github.com/Lemonjing/TinyMooc/blob/master/README.md" target="_blank">关于萌课网</a>
            <a href="#">萌课达人</a>
            <a href="#">联系我们</a>
            <a href="#">友情链接</a>
            <a href="#">意见反馈</a>
            <br>
            <span class="copyright">©2015 TinyMooc.COM &nbsp;All Rights Reserved.&nbsp;<a href="#">闽ICP备15018990号-1</a></span>
            <br>
            <SPAN id=span_dt_dt></SPAN>
            <SCRIPT language=javascript>
                function show_date_time() {
                    window.setTimeout("show_date_time()", 1000);
                    BirthDay = new Date("8/15/2015 11:30:00");//这个日期是可以修改的
                    today = new Date();
                    timeold = (today.getTime() - BirthDay.getTime());
                    sectimeold = timeold / 1000
                    secondsold = Math.floor(sectimeold);
                    msPerDay = 24 * 60 * 60 * 1000
                    e_daysold = timeold / msPerDay
                    daysold = Math.floor(e_daysold);
                    e_hrsold = (e_daysold - daysold) * 24;
                    hrsold = Math.floor(e_hrsold);
                    e_minsold = (e_hrsold - hrsold) * 60;
                    minsold = Math.floor((e_hrsold - hrsold) * 60);
                    seconds = Math.floor((e_minsold - minsold) * 60);
                    span_dt_dt.innerHTML = "萌课网已萌萌哒运行" + daysold + "天" + hrsold + "小时" + minsold + "分" + seconds + "秒";
                }
                show_date_time();
            </SCRIPT>
        </div>
    </div>
</footer>
</body>
</html>