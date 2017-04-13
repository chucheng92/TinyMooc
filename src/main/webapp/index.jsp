<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>萌课网 - 学习是为了探索这个世界的本质</title>
    <meta name="author" content="hd.bilibili.com" />
    <meta name="description" content="tinymooc 学习是为了探索这个世界的本质。" />
    <meta name="keywords"  content="学习是为了探索这个世界的本质。" />
    <meta name="Resource-type" content="Document" />
    <link rel="Shortcut Icon" href="/resource/pic/icon.ico"/>
    <link rel="stylesheet" href="http://static.hdslb.com/images/jquery-ui/custom/jquery-ui.css" type="text/css" />
    <link rel="stylesheet" href="http://static.hdslb.com/css/core-v5/page-core.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="http://i0.hdslb.com/u_user/activities/garakowa/css/blzh.css" />
    <link rel="stylesheet" type="text/css" href="http://i0.hdslb.com/u_user/activities/garakowa/css/blzh2.css" />
</head>
<body>
<div class="wrapper">
    <div class="bg">
        <img src="http://i0.hdslb.com/u_user/activities/garakowa/imgs/bg.jpg" alt="bg" />
        <div class="mask"></div>
    </div>
    <div class="banner">
        <div class="title">
            <div class="group">
                <div class="item">2015年12月25日</div>
                <div class="item">萌课网2正式公测&nbsp;<a href="http://119.29.231.159:8080/tinymooc/turnToHomePage.htm" target="_blank">进入萌课</a></div>
            </div>
        </div>
        <div class="logo">
            <img src="http://i1.hdslb.com/u_user/activities/garakowa/imgs/logo.png" alt="logo" />
        </div>
    </div>
    <div class="content">
        <div class="summary">
            <p>
                无数的七彩光霞，闪耀漂浮在无重力的空间——知识之海。<br />
                在那里，有复数的世界、有交错的时间、还有许多人们。<br />
                一片汪洋，在即将迷失在风暴海时，萌课出现。<br />
                萌课网，尝试将现代科学知识系统化和趣味化。<br />
                目标是通过简单易懂，诙谐有趣的文字，<br />
                让用户能够一次性地接触系统化的结构知识，<br />
                轻松建立起自己的知识体系。<br />
                当前有许多形式的在线慕课学习网站。<br />
                唯一能区分的地方在于理念。<br />
                萌课网的理念是——学习是为了探索这个世界的本质。<br />
                让我们把学习回归到最质朴、最纯净的状态，<br />
                满足人类对未知世界的求知欲。<br />
                宇宙那么大，我们没弄懂的事情还多着呢。<br />
            </p>
        </div>
        <div class="staff">
            <p>
                STAFF　<br />
                设计 / Designer：Saber <br />
                视觉／Front-end：Lily<br />
                程序媛／Coder：Jessica<br />
                程序猿／Coder：Miracle<br />
                测试／Testing：Lolita <br />
            </p>
        </div>
    </div>
    <div class="menu">
        <div class="label active" data-type="index"> 首页 </div>
        <div class="label" data-type="summary"> 萌课简介 </div>
        <div class="label" data-type="info"> 公测活动 </div>
        <div class="label" data-type="staff"> STAFF&amp;团队 </div>
        <div class="buy" data-type="staff"> <a href="http://119.29.231.159:8080/tinymooc/turnToHomePage.htm" target="_blank">萌课首页</a>&nbsp;| </div>
    </div>
</div>
<div class="l-footer">
    <div class="copyright">©Project Campanulaceae</div>
    <div class="menu">
        <div class="label active" data-type="index"> |&nbsp;首页&nbsp;| </div>
        <div class="label" data-type="summary"> 萌课简介&nbsp;| </div>
        <div class="label" data-type="info"> 公测活动&nbsp;| </div>
        <div class="label" data-type="staff"> STAFF&amp;团队&nbsp;| </div>
        <div class="buy" data-type="staff"> <a href="http://119.29.231.159:8080/tinymooc/turnToHomePage.htm" target="_blank">萌课首页</a>&nbsp;| </div>
    </div>
    <div class = "menu">
        <div>©2015 TinyMooc.COM &nbsp;All Rights Reserved.&nbsp;<a href="#">闽ICP备15018990号-1</a></div>
        <br />
        <div><SPAN id=span_dt_dt></SPAN></div>
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
    <br />
</div>

<script type="text/javascript" src="http://static.hdslb.com/js/jquery.min.js"></script>
<script type="text/javascript" src="http://static.hdslb.com/js/core-v5/base.core.js"></script>
<script type="text/javascript" src="http://static.hdslb.com/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="http://static.hdslb.com/js/swfobject.js"></script>
<script type="text/javascript" src="http://static.hdslb.com/js/core-v5/page.arc.js"></script>
<script type="text/javascript" src="http://static.hdslb.com/js/video.min.js"></script>
<script type="text/javascript" src="http://static.hdslb.com/js/core-v5/page.core.js"></script>
<script type="text/javascript" src="http://static.hdslb.com/js/core-v5/page.index.js"></script>
<!--<script type="text/javascript" src="http://static.hdslb.com/js/base.core.v3.js"></script>
<script type="text/javascript" src="http://static.hdslb.com/js/page.arc.js"></script> -->
<script type="text/javascript">
    $(function() {
        $(".menu .label").click(function() {
            var claxx = $(this).data("type");
            $(".menu .label").removeClass("active");
            $(this).addClass("active");
            if (claxx !== "index") {
                $(".content>div").hide();
                $(".content ."+claxx).show();
                var opacity = $(".mask").css("opacity");
                console.log(opacity);
                if (opacity == 0) {
                    $(".mask").css("opacity", 0.5);
                    var opacity = $(".mask").css("opacity");
                }
            } else {
                $(".content>div").hide();
                $(".mask").css("opacity", 0);
            }
        });
    });
</script>

</body>
</html>