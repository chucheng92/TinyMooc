<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>


<footer class="footer container2">
    <div align="center">
        <div>
            <a href="https://github.com/Lemonjing/TinyMooc/blob/master/README.md" target="_blank">关于萌课网</a>&nbsp;|&nbsp;
            <a href="#">萌课达人</a>&nbsp;|&nbsp;
            <a href="#">联系我们</a>&nbsp;|&nbsp;
            <a href="#">友情链接</a>&nbsp;|&nbsp;
            <a href="#">意见反馈</a>
        </div>
            <span class="copyright">©2015 TinyMooc.COM &nbsp;All Rights Reserved.&nbsp;<a href="#">闽ICP备15018990号-1</a></span>
            <br/>
    </div>
            <div class="friend-links">
            友情链接:
            <a href="https://cloud.seu.edu.cn/contest/" target="_blank" class="mrs">云计算创新大赛</a>
            | <a href="http://news.qq.com/" target="_blank" class="mrs">腾讯新闻</a>
            | <a href="http://www.qq.com/" target="_blank" class="mrs">QQ</a>
            | <a href="http://v.qq.com/" target="_blank" class="mrs">腾讯视频</a>
            | <a href="https://github.com/" target="_blank" class="mrs">
            GitHub</a> | <a href="http://maven.apache.org/" target="_blank" class="mrs">Maven</a>
            | <a href="http://www.qcloud.com/" target="_blank" class="mrs">腾讯云</a>
            | <a href="http://www.xmu.edu.cn/" target="_blank" class="mrs">厦门大学</a>
            |
            <br/>
             <br/>
            <span id=span_dt_dt></span>
            <script language=javascript>
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
            </script>
            </div>

</footer>


</body>
</html>