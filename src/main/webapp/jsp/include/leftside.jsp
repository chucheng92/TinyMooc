<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div class="wrapper">
    <div class="left">
        <header>

            <div class="avatar-mod clearfix">
                <a href="goPersonal.htm?userId=${user.userId}" class="avatar"><img src="<c:url value="${user.headImage.imageMid}"/>"/></a>

                <div class="infos">
                    <div class="nickname"><a href="goPersonal.htm?userId=${user.userId}" title="fanfanle">${user.userName}</a></div>
                    <div class="icons">
                        <a class="user-level user-level-6"  href="#" target="_blank">${level.lv}级</a>
                        <a class="user-level user-level-6"  href="#">${level.title}</a>
                    </div>
                </div>
            </div>

            <div class="stats-mod">
                <ul class="user-stats clearfix">
                    <li><a href="#"><strong>${user.credit}</strong>学分</a></li>
                    <li><a href="#"><strong>${user.gold}</strong>金币</a></li>
                </ul>
            </div>


            <nav>
                <ul>
                    <li id="menu-item-4" class="menu-item menu-item-type-taxonomy menu-item-object-category current-menu-item menu-item-4 gnews-menu-major-board"><a href="turnToHomePage.htm"></a></li>
                    <ul class="sub-menu">
                        <li id="menu-item-1271" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-1273"><a href="myTinyMooc.htm"><span>我的萌课</span></a></li>
                        <li id="menu-item-1273" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-1273"><a href="courseList.htm"><span>课程管理</span></a></li>
                        <li id="menu-item-1270" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-1270"><a href="goNote.htm"><span>笔记</span></a></li>
                        <li id="menu-item-1274" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-1274"><a href="teamPage.htm"><span>小组</span></a></li>
                        <li id="menu-item-1272" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-1272"><a href="myFavorite.htm"><span>收藏夹</span></a></li>
                        <li id="menu-item-1275" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-1275"><a href="myAttention.htm"><span>好友</span></a></li>
                        <li id="menu-item-1276" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-1276"><a href="goPrivateMail.htm"><span>私信</span></a></li>
                        <li id="menu-item-1277" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-1277"><a href="turnToHelpPage.htm"><span>金币</span></a></li>
                        <li id="menu-item-1278" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-1278"><a href="account.htm"><span>账户设置</span></a></li>
                    </ul>
                    </li>
                </ul>
            </nav>
        </header>
    </div>
    </div>
</body><html>