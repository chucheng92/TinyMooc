<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/resource/css/login/howzhi.css?2.6.12.4.2"/>
    <link  rel="stylesheet"href="/resource/css/login/bootstrap.css?2.6.12.4.2"/>
    <link rel="stylesheet" type="text/css" href="/resource/css/login/main.css?2.6.12.4.2"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>测试页面</title>
</head>

    <footer class="footer2">
        <div class="container2">
            <div class="row2">
                <div class="col-md-4 ">
                    <a href="/"><img src="/resource/pic/foot-logo.png" alt="学习是为了探索世界的本质"></a>
                </div>
                <div class="col-md-4 about">
                    <span><a href="/info/about">关于我们</a></span>|
                    <span><a href="/group/feedback/discuss/15754" target="_blank">加入我们</a></span>|
                    <span><a href="/daren/" target="_blank">合作申请</a></span>|
                    <span><a href="/group/feedback">意见反馈</a></span><br/>
                    <a class="con" href="http://www.miibeian.gov.cn/" target="_blank">
                        闽ICP备15018990号-1
                    </a>
                </div>
                <div class="col-md-4">
                    关注我们：
                    <a href="http://weibo.com/u/1662536394" target="_blank">微博</a>
                    <a  class="icon-sns">微信
                        <div class="sns-popover" style='background:url(/resource/pic/wechat-small.jpg)'>
                        </div>
                    </a>
                    <a href="http://user.qzone.qq.com/932191671/" target="_blank">QQ</a>
                    <a href="https://github.com/lemonjing" target="_blank">GitHub</a>
                </div>
            </div>
        </div>
    </footer>
    <div class="friendlinks2">
        <div class="container2">
            <font>友情链接:</font>
            <a href="https://cloud.seu.edu.cn/contest/" target="_blank" class="white">云计算创新大赛</a>
            <span>|</span>
            <a href="http://news.qq.com/" target="_blank" class="white">腾讯新闻</a>
            <span>|</span>
            <a href="http://www.qq.com/" target="_blank" class="white">QQ</a>
            <span>|</span>
            <a href="http://v.qq.com/" target="_blank" class="white">腾讯视频</a>
            <span>|</span>
            <a href="https://github.com/" target="_blank" class="white">GitHub</a>
            <span>|</span>
            <a href="http://maven.apache.org/" target="_blank" class="white">Maven</a>
            <span>|</span>
            <a href="http://www.qcloud.com/" target="_blank" class="white">腾讯云</a>
            <span>|</span>
            <a href="http://www.xmu.edu.cn/" target="_blank" class="white">厦门大学</a>
            <br/>
            Powered by <a href="http://weibo.com/u/1662536394" target="_blank">@Campanulaceae</a>
            ©2015-2016 <a class="mlm" href="http://www.tinymood.com/" target="_blank">萌课网</a>&nbsp;&nbsp;All Rights Reserved.
        </div>
    </div>

    <section class="serch-enginne-course visible-lg"　role="alert">
    </section>
    <div id="login-modal" class="modal " data-url="/login/ajax"></div>
    <div id="modal" class="modal" tabindex='-1'></div>
    <div id="upload-image-modal" class="modal" tabindex="-1" aria-hidden="true" style="display: none;"></div>
    <ul class="fixed-bar">
        <li class="hz-app">
            <a class="active btn btn-primary" target="_blank" href="http://www.edusoho.com/download/mobile?client=android&code=howzhi" >
                APP
            </a>
        </li>
        <li class="hz-weixin">
            <a class="fixed-bar-icon" href="javascript:;" >
                <img src="/resource/pic/tinyqrcode.jpg" width="50px" height="50px"/>
            </a>
            <div class="weixin">
                <p class="text-center mvs t-primary hidden-xs hidden-sm">扫一扫 关注萌课微信</p>
                <img src="/resource/pic/tinyqrcode.jpg" class="img-responsive" alt="萌课网微信"/>
            </div>
        </li>
        <li class="hz-feedback">
            <a class="fixed-bar-icon" class="js-feedback" href="/feedback/user/list" >
                <i class="hz-icon icon-question "></i>
            </a>
            <a href="/feedback/user/list" target="_blank" class="js-feedback fixed-bar-text">
                问题反馈
            </a>
        </li>
        <li class="go-top">
            <a class="fixed-bar-icon" href="javascript:;">
                <i class="hz-icon icon-keyboardarrowup"></i>
            </a>
            <a class="fixed-bar-text" href="javascript:;">
                回到顶部
            </a>
        </li>
    </ul>
</html>