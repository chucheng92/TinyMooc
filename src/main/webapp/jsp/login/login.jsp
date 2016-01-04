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
                    <input class="form-control" id="login_username" type="text" name="userEmail" value="" required placeholder='邮箱' />
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label" for="login_password">密码</label>
                <div class="controls">
                    <label class="fa-label">
                        <i class="fa fa-unlock-alt"></i>
                    </label>
                    <input class="form-control" id="login_password" type="password" name="userPassword" required placeholder='密码'/>
                </div>
            </div>

            <div class="form-group">
                <div class="controls">
            <span class="checkbox mtm ">
              <label> <input type="checkbox" name="_remember_me" checked="checked"> 记住密码 </label>
              <a class="pull-right active" href="goFindPassword.htm">忘记密码</a>
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
            <input type="hidden" name="_target_path" value="http://www.howzhi.com/me/">
            <input type="hidden" name="_csrf_token" value="9fb724d7cc584fd68a590f79d82f0be6ad62837a">
        </form>
    </div>
    <div class="login-box register">
        <h1>
            注册萌课账号
            <a href="javascript:;" class="pull-right js-trun" >登录<i class="fa fa-arrow-circle-o-right"></i>
            </a>
        </h1>
        <form id="register-form" class="form-vertical" method="post" action="register.htm">

            <div class="form-group mb40">
                <label class="control-label required" for="register_emailOrMobile">常用手机号或邮箱</label>
                <div class="controls">
                    <label class="fa-label">
                        　　<i class="hz-icon icon-demo25"></i>
                    </label>
                    <input type="text" id="register_emailOrMobile" name="emailOrMobile" required="required"
                           class="form-control" data-url="/register/email_or_mobile/check"
                           placeholder="常用手机号或邮箱">
                    <p class="help-block"></p>
                </div>
            </div>

            <div class="form-group mb40">
                <label class="control-label required" for="register_nickname">昵称</label>
                <div class="controls">
                    <label class="fa-label">
                        <i class="hz-icon icon-person"></i>
                    </label>
                    <input type="text" id="register_nickname" name="nickname" required="required" class="form-control"
                           data-url="/register/nickname/check" placeholder="请输入昵称">
                </div>
            </div>
            <div class="form-group mb40">
                <label class="control-label required" for="register_password">密码</label>
                <div class="controls">
                    <label class="fa-label">
                        <i class="hz-icon icon-lock"></i>
                    </label>
                    <input type="password" id="register_password" name="password" required="required" class="form-control"
                           placeholder="密码">
                </div>
            </div>


            <div class="form-group mb40 hidden email_mobile_msg">
                <label class="control-label required" for="sms_code">短信验证码</label>
                <div class="controls row">
                    <div class="col-xs-6">
                        <input type="text" class="form-control ident" id="sms_code" name="sms_code" placeholder="短信验证码"
                               required="required"  data-url="/edu_cloud/sms_check/sms_registration">
                    </div>
                    <div class="col-xs-6">
                        <a href="#modal" data-toggle="modal" class="btn ident btn-primary btn-lg  form-control  js-sms-send disabled"
                           data-url="/register/captcha/modal"
                           data-sms-url="/edu_cloud/sms_send">
                            <span id="js-time-left"></span>
                            <span id="js-fetch-btn-text">获取短信验证码</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="form-group mb40 agren">
                <div class="controls">
                    <label><input type="checkbox" id="user_terms" checked="checked"> 我已阅读并同意<a href="/userterms" target="_blank">《服务协议》</a>
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="controls">
                    <button type="submit" id="register-btn " data-submiting-text="正在提交" class="login-btn btn-primary btn">注册
                    </button>
                </div>
            </div>
            <input type="hidden" name="captcha_enabled" value="0"/>
            <input type="hidden" name="_csrf_token" value="9fb724d7cc584fd68a590f79d82f0be6ad62837a">
        </form>
        <div class="social">
            快捷登录：

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
<%--<body class="lily-theme" style="background: url(/resource/pic/login_bg.png) no-repeat top center">--%>
<%--<jsp:include page="/jsp/include/head1.jsp"></jsp:include>--%>

<%--<section class="container signin">--%>
  <%--<div class="container-padding clearfix">--%>
  <%--<h1>登录萌课网</h1>--%>
  <%--<div class="normal-main">--%>
    <%--<form id="signin-form" class="form signin-form" method="post" action="login.htm" name="form1">--%>
        <%--<p>--%>
      <%--<label for="signin_username">邮箱</label>--%>
      <%--<input id="signin_username" tabIndex="1" name="userEmail" value="" type="text" onblur="checkReg()">--%>
      <%--<span id="email"></span>--%>
    <%--</p>--%>
    <%--<p>--%>
      <%--<label for="signin_password">密码</label>--%>
      <%--<input id="signin_password" tabIndex="2" name="userPassword" type="password" onblur="checkPwd()">--%>
      <%--<span id="pwd"></span>--%>
    <%--</p>--%>
    <%--<p class="actions reset-labels reset-inputs">--%>
    <%----%>
      <%--<input id="signin_remeberme" tabIndex="3" name="autoLogin" type="checkbox"><label for="signin_remeberme">下次自动登录</label>--%>
      <%--<a class="ml15" href="goFindPassword.htm">忘记密码了</a><br>--%>
      <%--<span style="color: red">${note}</span>--%>
    <%--</p>--%>
    <%--<p class="actions">--%>
     <%----%>
     <%--<button class="btn btn-success" tabIndex="4" type="submit">登录</button>--%>
    <%--</p>--%>
  <%--</form>--%>
  <%--</div>--%>
  <%----%>
  <%--<div class="normal-side">--%>
    <%--<p>还没有萌课帐号？ <a href="goRegisterPage.htm">立即注册</a></p>--%>
    <%--<!-- <div class="connect-for-sign">--%>
      <%----%>
    <%--</div> -->--%>
  <%--</div>--%>
  <%--</div>--%>
<%--</section>--%>
<%--<div style="margin-bottom:20%"></div>--%>
<%--<jsp:include page="/jsp/include/foot.jsp"></jsp:include>--%>

<%--</body>--%>
</html>