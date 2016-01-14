<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录-萌课网</title>
    <link rel="stylesheet" type="text/css" href="/resource/css/site.css"/>
    <link rel="stylesheet" type="text/css" href="/resource/css/site_v2.css"/>
    <script type="text/javascript" src="/resource/bootstrap/js/jquery-1.8.3.min.js"></script>
    <link  rel="stylesheet"href="/resource/css/login/bootstrap.css?2.6.12.4.2"/>
    <link rel="stylesheet" media="screen" href="/resource/css/login/common.css?2.6.12.4.2"/>
    <link rel="stylesheet" media="screen" href="/resource/css/login/font-awesome.min.css?2.6.12.4.2"/>
    <link rel="stylesheet" media="screen" href="/resource/css/login/es-icon.css?2.6.12.4.2"/>
    <link rel="stylesheet" type="text/css" href="/resource/css/login/main.css?2.6.12.4.2"/>
    <link rel="stylesheet" type="text/css" href="/resource/css/login/howzhi.css?2.6.12.4.2"/>
    <link rel="stylesheet" type="text/css" href="/resource/css/login/iconfont.css?2.6.12.4.2"/>

    <script type="text/javascript" src="<c:url value="/resource/js/login.js"/>"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var message = "${requestScope.message}";
            if (message == null || message == 'null' || message == "") {

            } else {
                $.scojs_message(message, $.scojs_message.TYPE_OK);
            }
        });
    </script>

</head>
<body class="index">
<jsp:include page="/jsp/include/head1.jsp"></jsp:include>
<div class="login">
    <div class="login-box">

        <h1>
            登录萌课
            <a href="/goRegisterPage.htm" class="pull-right js-trun">注册<i class="fa fa-arrow-circle-o-right"></i>
            </a>
        </h1>
        <form id="login-form" class="form-vertical" method="post" action="login.htm" >


            <div class="form-group">
                <label class="control-label" for="login_username">帐号</label>
                <div class="controls">
                    <label class="fa-label">
                        <i class="fa fa-user"></i>
                    </label>
                    <input class="form-control" id="login_username" type="text" name="userEmail" value="" placeholder='邮箱' />
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label" for="login_password">密码</label>
                <div class="controls">
                    <label class="fa-label">
                        <i class="fa fa-unlock-alt"></i>
                    </label>
                    <input class="form-control" id="login_password" type="password" name="userPassword" placeholder='密码'/>
                </div>
            </div>

            <div class="form-group">
                <div class="controls">
            <span class="checkbox mtm ">
              <label> <input id="signin_remeberme" tabIndex="3" name="autoLogin" type="checkbox"> 下次自动登录 </label>
              <a class="pull-right active" href="goFindPassword.htm">忘记密码</a>
                <br/>
                <span style="color: red">${note}</span>
            </span>
                </div>
                <input class="login-btn btn-primary btn" type="submit" value="登录" />
                <div class="social">
                    快捷登录

                    <a href="/login/bind/weibo?_target_path=http%3A%2F%2Fwww.howzhi.com%2Fme%2F" class="social-login-btn">
                        <i class="hz-icon icon-weibo"></i>
                    </a>
                    <a href="/login/bind/qq?_target_path=http%3A%2F%2Fwww.howzhi.com%2Fme%2F" class="social-login-btn">
                        <i class="hz-icon icon-qq"></i>
                    </a>
                    <a href="/login/bind/renren?_target_path=http%3A%2F%2Fwww.howzhi.com%2Fme%2F" class="social-login-btn">
                        <i class="hz-icon icon-renren"></i>
                    </a>
                    <a href="/login/bind/douban?_target_path=http%3A%2F%2Fwww.howzhi.com%2Fme%2F" class="social-login-btn">
                        <i class="hz-icon icon-gongnengyedouban"></i>
                    </a>
                    <a href="/login/bind/weixinweb?_target_path=http%3A%2F%2Fwww.howzhi.com%2Fme%2F" class="social-login-btn">
                        <i class="hz-icon icon-weixin"></i>
                    </a>

                </div>
            </div>
        </form>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <div class="row">
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
<div class="friendlinks">
    <div class="container">
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

</body>
</html>