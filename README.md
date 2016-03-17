
[![](http://7xlkoc.com1.z0.glb.clouddn.com/LOGO_BIG.png)](http://www.tinymood.com)

[![Developers' website](https://img.shields.io/travis/biezhi/blade.svg?style=flat-square)](http://www.tinymood.com)
[![maven-central](https://img.shields.io/maven-central/v/com.bladejava/blade-core.svg?style=flat-square)](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22com.bladejava%22)
[![License](https://img.shields.io/badge/license-Apache%202-4EB1BA.svg?style=flat-square)](https://www.apache.org/licenses/LICENSE-2.0.html)
[![@不能卖萌心塞塞 on weibo](http://7xlkoc.com1.z0.glb.clouddn.com/weibo.png)](http://weibo.com/u/1662536394)

## 萌课(`tinymooc`)是什么?

`tinymooc` 中文名萌课,是一个轻量级Web网站。它拥有简洁的代码,优雅的设计。
萌课网目前打算实现微课程的点播和直播服务，依托于腾讯云强大的云计算服务给用户带去更好的微课学习体验。

如果你喜欢,欢迎 [Star and Fork](https://github.com/lemonjing/tinymooc), 谢谢!

## 部分页面展示

### 个人课程学习情况
![](http://7xlkoc.com1.z0.glb.clouddn.com/tiny%2Fmooc1.jpg)

### 课程分类
![](http://7xlkoc.com1.z0.glb.clouddn.com/tiny%2Fmooc2.jpg)

### 课程和课时
![](http://7xlkoc.com1.z0.glb.clouddn.com/tiny%2Fmooc3.jpg)

### 课程播放（接入腾讯云视频服务）
![](http://7xlkoc.com1.z0.glb.clouddn.com/tiny%2Fmooc4.jpg)

### 推荐页面
![](http://7xlkoc.com1.z0.glb.clouddn.com/tiny%2Fmooc5.jpg)

## 特性

* [x] 轻量级。代码简洁,结构清晰
* [x] 操作简单,界面美观
* [x] 小组,话题,讨论,留言,根本停不下来
* [x] 腾讯云支持的高效视频管理和点播服务
* [x] 多种配置文件支持(当前支持properties、json和硬编码)
* [x] 内置Jetty服务,模板引擎支持
* [x] 支持JDK1.6或者更高版本

## 概述

* 简洁的：Kiss原则实现,操作简单,maven管理。萌课目标让用户在一天内爱上并使用。
* 强大的：`tinymooc` 依托腾讯强大的云计算服务

## 快速入门

开始之前,首先 [Download或Clone本工程](https://github.com/lemonjing/tinymooc) ：

`Maven` 配置：
使用maven3.1,并加入tomcat插件
项目已经启用Jetty部署，tomcat的话可以参考以下配置

``` sh
<plugin>
	<groupId>org.apache.tomcat.maven</groupId>
	<artifactId>tomcat7-maven-plugin</artifactId>
	<version>2.2</version>
	<configuration>
	<url>http://localhost:8888/manager/text</url>
	<username>admin</username>
	<password>admin</password>
	<server>tomcat7</server>
	<path>/microlecture</path>
	</configuration>
</plugin>
```

加入用户组到 `tomcat-users.xml`文件：

``` sh
<role rolename="admin-gui"/>
<role rolename="admin-script"/>
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<role rolename="manager-jmx"/>
<role rolename="manager-status"/>
<user username="admin" password="admin" roles="manager-gui,manager-script,manager-jmx,manager-status,admin-script,admin-gui"/>
```

运行项目，然后用浏览器打开 http://localhost:8888/tinymooc 这样就可以看到萌课了！

OK，这一切看起来多么的简单，欢迎查看我的其他项目和相关更新:

+ [JavaSE工程](https://github.com/Lemonjing/myjavase)
+ [Leetcode题解](https://github.com/Lemonjing/leetcode)
+ [版本查询](LAST_VERSION.md)
+ [更新日志](UPDATE_LOG.md)

## 计划

- 1. 开发萌课用户管理
- 2. 接入腾讯云视频点播服务
- 3. 接入腾讯云视频直播服务
- 4. 优化并发能力和更好的UI呈现

## 更新日志

[更新日志](https://github.com/Lemonjing/TinyMooc/blob/master/UPDATE_LOG.md)

### 联系我

- WebSite: [http://www.tinymood.com][1]
- Mail: 932191671@qq.com
- Linux交流群: [257265338][2]
- 开源技术小组: [521087632][3]

作者 [微博@Campanulaceae][4]     
2015 年 11月 15日

## 开源协议

```
Copyright 2015 lemonjing

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

[1]: http://www.tinymood.com   
[2]: http://jq.qq.com/?_wv=1027&k=ZKsbKb
[3]: http://jq.qq.com/?_wv=1027&k=26Y8BYN
[4]: http://weibo.com/u/1662536394
