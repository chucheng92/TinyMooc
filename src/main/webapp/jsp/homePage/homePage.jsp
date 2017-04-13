<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />

    <script type="text/javascript" src="<c:url value="/resource/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
    <%--<link rel="stylesheet" type="text/css" href="/resource/bootstrap/css/bootstrap.css"/>--%>
    <link rel="stylesheet" type="text/css" href="/resource/css/site_v2.css"/>


    <%-- 本页面为用户未登录时主页 --%>

    <title>萌课网-首页</title>

    <!-- Make the HTML5 elements work in IE. -->
    <!--[if IE]>
    <script type="text/javascript" src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/site.css"/>
    <link href="<%=request.getContextPath()%>/resource/css/fonts.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        $(function(){

            $("#course").mouseover(function(){

                $("#menu").css("display","block");

            });
            $(".item.course").mouseleave(function(){

                $("#menu").css("display","none");
            });
        });

    </script>

    <style>

        #home .news h1 , #news .news article h2 {
            font-weight: normal;
        }

        #footer {
            font-weight: normal;
            text-align: center;
        }

        #flavours .text p {
            padding-right: 50px;
        }

        #home .better_shared {
            z-index: 1000 !important;
        }

        #share .beetroot {
            height: 411px !important;;
        }

        #news .news article p {
            margin-bottom: 1em;
        }

        .whats-your-gnosh{
            background: url("http://files.bbs.tl.changyou.com/data/attachment/forum/201512/21/213915rgplghygcgrg4yjr.png") top left no-repeat;
            height:1046px;
            width:1100px;
            margin-top: -92px;
            margin-left: -66px;
        }

        .why-gnosh-movies1{
            background: url("http://files.bbs.tl.changyou.com/data/attachment/forum/201512/28/170611h1f45gf51i2z4ram.png") top left no-repeat;
            height:120px;
            width:1100px;
            margin-top: 130px;
            margin-left: 0px;
        }

        .why-gnosh-movies{
            background: url("http://files.bbs.tl.changyou.com/data/attachment/forum/201512/28/170611h1f45gf51i2z4ram.png") top left no-repeat;
            height:120px;
            width:1100px;
            margin-top: 50px;
            margin-left: 0px;
        }

        .flavours-original:hover{

            z-index: 1021;
        }

        .flavours-tapas:hover{

            z-index: 1021;
        }

        .flavours-mm:hover{

            z-index: 1021;
        }
    </style>

    <style type="text/css">
        #share #dsq-comments p { width: 100%; position: static; }

        #contact .food { top: -246px; }

            /* #share .feed { z-index: 1050; } */
        #wrapperLayer{position:fixed;top:0;bottom:0;right:0;z-index:3000;}
        #wrapperLayer img{margin: auto;left: 0;right: 0;position: fixed;top: 0;bottom: 0;/*max-width: 100%;max-height: 100%;*/}
        #darkenLayer{position:fixed;top:0;bottom:0;right:0;z-index:2999;width:100%;height:100%;background:url("http://www.gnosh.co.uk/wp-content/themes/gnosh/images/trans-grey.png");}
        .close-btn-popup{position: fixed;z-index: 3001;width: 780px;font-size: 21px;height: 580px;left: 0;right: 0;top: 0;bottom: 0;margin: auto;margin-right: auto;text-align: right;padding: 10px;}
        .close-btn{text-decoration: none;color: white;position: relative;z-index: 1;position: relative;z-index: 1;font-family: "Calvert MT","Calvert MT W01",arial,sans-serif;}
        .arrow-lt-flav{z-index:20;background: url("<%=request.getContextPath()%>/resource/img/arrow-left.png");position: absolute;
            top:558px;margin-left: -31px;padding-left:38px;padding-top: 50px;}
        .arrow-rt-flav{z-index:20;background: url("<%=request.getContextPath()%>/resource/img/arrow-right.png");position: absolute;
            top:560px;margin-left: 524px;padding-left:38px;padding-top: 50px;}
        .find-out-lnk{position: absolute;bottom: 0;right: 0;margin-bottom: 15px;width: 186px;height: 34px;margin-right: 28px;}
        .flav-photos-tapas{position: absolute;margin-left: -350px;margin-top: 404px;display:none;}
        .flav-photos-originals{position: absolute;margin-left: -350px;margin-top: 404px;display:none;}
        .flav-photos-dippables{position: absolute;margin-left: -350px;margin-top: 404px;display:none;}
        .flav-photos-mm{position: absolute;margin-left: -350px;margin-top: 404px;display:inline-block;}
        .flav-slide{list-style: none;position: absolute;margin-top: 340px;width: 500px;margin-left: 500px;}
        .flav-slide .text_wrap h2{text-align:center;color: #652D16;font-size: 19px;line-height: 22px;margin-bottom: 9px;font-weight: normal;width:400px;}
        .flav-slide .text_wrap p{text-align:center;color: #554E4E;font-size: 24px;line-height: 30px;margin-bottom: 10px;width:400px;}
        .flav-slide-pics{position: absolute;margin-left: 0px;margin-top: 50px;}
        .flav-slide li{display:none;}
        .flav-slide .display-slide{display:inline-block;}
        .flav-slide .text_wrap{position: absolute;margin-top: 388px;}
        .no-list{list-style:none;}
        #flav_orig_slide{display:none;}
        #flav_dipp_slide{display:none;}
        #flav_tap_slide{display:none;}
    </style>
    <!-- End Ben Addition -->

</head>


<body>
<div class="wrapper">
    <header id="header">
        <h1><a href="http://119.29.231.159:8080/tinymooc/turnToHomePage.htm" target="_blank"></a></h1>
        <nav>
            <div class="pages">
                <ul class="header-nav">

                    <li class="item">
                        <a href="http://119.29.231.159:8080/tinymooc/turnToHomePage.htm" target="_blank" class="scroll">首页</a>
                    </li>

                    <li class="item course">
                        <a href="goCourseHome.htm" class="scroll" data-offset="30" id="course">课程
                            <span class="down-triangle"></span>
                        </a>
                        <div class="menus" id="menu" style="display: none;">
                            <ul class="clearfix">
                                <li><a href="goMajorHome.htm?type=摄影">摄影</a></li>
                                <li><a href="goMajorHome.htm?type=艺术">艺术</a></li>
                                <li><a href="goMajorHome.htm?type=兴趣">兴趣</a></li>
                                <li><a href="goMajorHome.htm?type=计算机">计算机</a></li>
                                <li><a href="goMajorHome.htm?type=文学">文学</a></li>
                                <li><a href="goMajorHome.htm?type=求职">求职</a></li>
                                <li><a href="goMajorHome.htm?type=动漫">动漫</a></li>
                                <li><a href="goMajorHome.htm?type=音乐">音乐</a></li>
                                <li><a href="goMajorHome.htm?type=其他">其他</a></li>
                            </ul>
                        </div>
                    </li>

                    <li class="item">
                        <a href="teamPage.htm" class="" data-offset="-40">小组</a>
                    </li>
                </ul>

                <form class="search-form" action="MulsearchByKey.htm" method="post">
                    <input type="text" class="search-input" value name="keyWord" placeholder="想学什么？搜搜看...">
                    <input type="submit" class="search-btn" value>
                </form>


            </div>

            <div class="social">
                <div class="rightmove">
                    <a href="goLoginPage.htm" target="_blank" >登录</a>
                    <a href="goRegisterPage.htm" target="_blank">注册</a>
                </div>
            </div>
        </nav>
    </header>



<section id="home">
    <!-- All replaced with images in the CSS -->
    <a data-offset="100" class="scroll why_the_apos hoverable">Why the apostrophe and more about us&hellip;</a>
    <!--<p class="gourmet_dips">Gourmet dips without the fuss</p>-->
    <a class="product_award1" target="_blank" >Product Awards</a>
    <a class="product_award2" target="_blank" >Product Awards</a>
    <a class="product_award3" >Quality Food Awards</a>
    <!--<a href="#contact" data-offset="-150" class="share_thoughts hoverable scroll">Share your thoughts with us</a>-->
    <span class="better_shared">Some things are better shared</span>
    <a class="scroll whats_your_gnosh hoverable" data-offset-minus="60">What&#8217;s your G&#8217;nosh?</a>
    <a class="where_to_gnosh hoverable">Where to G&#8217;NOSH?</a>
    <span class="tomato_dip"></span>
    <span class="garlic"></span>
    <span class="pepper"></span>
    <span class="basil"></span>
    <a href="#" class="keep_up"></a>

    <!-- Twitter box -->
    <div class="twitter">
        <ul id="tweets">
        </ul>
        <div class="extras">
            <p> FOLLOW TINYMOOC!
            </p>
        </div>
    </div>


    <article class="news"><h1 style="font-size: 18px;text-transform:none;"></h1>
        <time datetime="2012-05-31">15/12/21</time>
        <p>让我们把学习回归到最质朴、最纯净的状态，满足人类对未知世界的求知欲。</br>
            宇宙那么大，我们没弄懂的事情还多着呢。<br/> -- 萌课网</p>

    </article>


</section><!-- end #home -->

<section id="flavours">
    <div class="whats-your-gnosh">



        <a class="flavours-original"></a>
        <!--<a href="#" class="flavours-dippables"></a>-->
        <a class="flavours-tapas"></a>
        <a class="flavours-mm"></a>

        <a href="#" class="arrow-lt-flav"></a>
        <a href="#" class="arrow-rt-flav"></a>

        <ul id="flav_mm_slide" class="flav-slide">
            <li class="display-slide">
                <img src="http://files.bbs.tl.changyou.com/data/attachment/forum/201512/29/215028j60su9u6kkpesyez.png" class="flav-slide-pics" />
						<span class="text_wrap">
						<h2>I am in TINYMOOC.</h2>
						<p>我们有精心制作的视频课程<br />
                        </p>
						</span>
            </li>

            <li>
                <img src="http://files.bbs.tl.changyou.com/data/attachment/forum/201512/28/155616lfv2dbodztbfd1ob.png" class="flav-slide-pics" />
						<span class="text_wrap">
						<h2>I am in TINYMOOC.</h2>
						<p>我们有实时交互的学习资料<br />
                        </p>
						</span>
            </li>

            <li>
                <img src="http://files.bbs.tl.changyou.com/data/attachment/forum/201512/29/215112qy4hc96xoiqboxpo.png" class="flav-slide-pics" />
						<span class="text_wrap">
						<h2>I am in TINYMOOC.</h2>
						<p>我们有循序渐进的学习计划<br />
                        </p>
						</span>
            </li>

            <li>
                <img src="http://files.bbs.tl.changyou.com/data/attachment/forum/201512/29/215106bh54d3kr58ukkdoz.png" class="flav-slide-pics" />
						<span class="text_wrap">
						<h2>I am in TINYMOOC.</h2>
						<p>我们有互帮互助的问答社区 <br />
                        </p>
						</span>
            </li>
        </ul>
    </div>

</section>

<section id="why-gnosh">
    <div class="why-gnosh-movies1">
    </div>

    <div class="flat clearfix">
        <h2><strong>课程频道</strong></h2>
        <ul class="cells channel-cells">
            <li class="cell"><a href="goCourseHome.htm"><i
                    class="channel-icon channel-icon-photography"></i>全部</a></li>
            <li class="cell"><a href="goMajorHome.htm?type=摄影"><i
                    class="channel-icon channel-icon-photography"></i>摄影</a></li>
            <li class="cell"><a href="goMajorHome.htm?type=艺术"><i
                    class="channel-icon channel-icon-programme"></i>艺术</a></li>
            <li class="cell"><a href="goMajorHome.htm?type=兴趣"><i
                    class="channel-icon channel-icon-interest"></i>兴趣</a></li>
            <li class="cell"><a href="goMajorHome.htm?type=计算机"><i
                    class="channel-icon channel-icon-computer"></i>计算机</a></li>
            <li class="cell"><a href="goMajorHome.htm?type=文学"><i
                    class="channel-icon channel-icon-language"></i>文学</a></li>
            <li class="cell"><a href="goMajorHome.htm?type=求职"><i
                    class="channel-icon channel-icon-life"></i>求职</a></li>
            <li class="cell"><a href="goMajorHome.htm?type=动漫"><i
                    class="channel-icon channel-icon-career"></i>动漫</a></li>
            <li class="cell"><a href="goMajorHome.htm?type=音乐"><i
                    class="channel-icon channel-icon-culture"></i>音乐</a></li>
            <li class="cell"><a href="goMajorHome.htm?type=其他"><i
                    class="channel-icon channel-icon-openclass"></i>其他</a></li>
        </ul>
    </div>

    <div class="flat clearfix">
        <h2><strong>热门课程 | 瞧瞧大家都在学啥&nbsp;(～￣▽￣)～</strong></h2>
        <ul class="cells cells-middle">
            <c:forEach items="${hotCourseList}" var="hotCourse">
                <li class="cell">
                    <div class="course-item">
                        <div class="thumb">
                            <a href="courseDetailPage.htm?courseId=${hotCourse.course.courseId}"><img src="${hotCourse.course.logoUrl}"/></a>
                        </div>
                        <p class="title">
                            <a href="courseDetailPage.htm?courseId=${hotCourse.course.courseId}"><span class="video" title="视频课程"></span>${hotCourse.course.courseTitle}</a>
                        </p>
                        <div class="summary">${hotCourse.course.courseIntro}</div>
                        <p class="metas clearfix">
                            <span title="查看次数" style="float: right;"><i class="icon-signal"></i>${hotCourse.course.scanNum}</span>
							<span class="fl by">by
								<a href="goPersonal.htm?userId=${hotCourse.user.userId}" class="show-user-card" title="查看该用户">${hotCourse.user.userName}</a>
							</span>
                        </p>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>

    <div class="why-gnosh-movies">
    </div>

    <div class="flat clearfix">
        <h2><strong>最新课程 | 哇塞，又有新课开放了，赶紧学起来&nbsp;(～￣▽￣)～</strong></h2>
        <ul class="cells cells-middle">
            <c:forEach items="${newCourseList}" var="newCourse" varStatus="iter">
                <li class="cell">
                    <div class="course-item">
                        <div class="thumb">
                            <a href="courseDetailPage.htm?courseId=${newCourse.course.courseId}"><img src="${newCourse.course.logoUrl}"/></a>
                        </div>
                        <p class="title">
                            <a href="courseDetailPage.htm?courseId=${newCourse.course.courseId}"><span class="video" title="视频课程"></span>${newCourse.course.courseTitle}</a>
                        </p>
                        <div class="summary">${newCourse.course.courseIntro}</div>
                        <p class="metas clearfix">
                            <span title="查看次数" style="float: right;"><i class="icon-signal"></i>${newCourse.course.scanNum}</span>
							<span class="fl by">by
								<a href="#" class="show-user-card" title="">${newCourse.user.userName}</a>
							</span>
                        </p>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>

    <!-- 话题、小组 -->
    <div class="why-gnosh-movies">
    </div>

    <div class="flat clearfix">
        <h2><strong>话题、小组&nbsp;╰(￣▽￣)╭</strong></h2>
        <div class="flat-main">
            <h3>最新话题</h3>
            <div class="discuss-list2">
                <ul>
                    <c:forEach items="${discussList}" var="discuss">
                        <li>
                            <div class="imageblock clearfix">
                                <div class="imageblock-image">
                                    <img src="${discuss.user.headImage.imageSmall}" title="${discuss.user.userName}">
                                </div>
                                <div class="imageblock-content">

                                    <p class="title">
                                        <a href="discussDetailPage.htm?discussId=${discuss.discussId}"><span style="color: rgb(102, 194, 160)">${discuss.topic}</span></a>
                                    </p>
                                    <p class="metas">
                                        <a href="teamHomePage.htm?teamId=${discuss.team.teamId}" title="来自『${discuss.team.teamName}』小组"
                                           class="mrm">${discuss.team.teamName}</a> by <a
                                            href="goPersonal.htm?userId=${discuss.user.userId}"
                                            class="show-user-card"  title="${discuss.user.userName}">${discuss.user.userName}</a><span
                                            class="mhm">${discuss.scanNum}次查看</span>
                                        <span class="mls">${discuss.publishDate}</span>
                                    </p>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="discuss-list2" style="margin-top:15px;">
                <h3>推荐小组 </h3>
                <div class="metas">
                    <ul class="grids smallpic-grids">
                        <c:forEach items="${teamList}" var="team">
                            <li class="grid"><img src="<c:url value="${team.headImage.imageSmall}"/>" title="${team.teamName}" class="thumb">
                                <p>
                                    <a href="teamHomePage.htm?teamId=${team.teamId}" title="${team.teamName}">${team.teamName}</a>
                                </p>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 推荐小组 -->
    </div>

</section>

    <jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</div><!-- end .wrapper -->

</body>
</html>