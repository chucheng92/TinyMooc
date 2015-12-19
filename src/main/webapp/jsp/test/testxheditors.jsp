<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>xheditor编辑器测试</title>

<script type="text/javascript" src="<c:url value="/resource/js/xheditor/jquery-1.4.2.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resource/js/xheditor/xheditor-1.1.9-zh-cn.min.js"/>"></script>

</head>
<body>

<%-- xheditor测试--%>
<textarea class="xheditors" id="activeContentRichEditor" name="activityIntroduce" style="height:200px;width:61%;">Test</textarea>

<%-- 腾讯视频测试--%>
<iframe src="http://play.video.qcloud.com/iplayer.html?$appid=1251419256&$fileid=14651978969256120443&$autoplay=0&$sw=1366&$sh=768" frameborder="0" width="100%" height="720" scrolling="no"></iframe>	<!-- 页面内多处使用iframe代码，后面的JS代码只需要使用一次(作用是调整iframe的高度) -->
<script src="http://qzonestyle.gtimg.cn/open/qcloud/video/h5/fixifmheight.js" charset="utf-8"></script>

</body>
<script type="text/javascript">
    jQuery(function($){
        if($('textarea.xheditors').length!=0){
            $('textarea.xheditors').xheditor({
                upLinkUrl:"uploadFile.htm",
                upLinkExt:"zip,rar,txt,doc,docx,pdf,ppt,pptx,pps,ppsx,xlsx,xls,7z",
                upImgUrl:"uploadPic.htm",
                upImgExt:"jpg,jpeg,gif,png",
                tools:'simple',
                forcePtag:false,
                html5Upload:false,
                emotMark:true
            });
        }
    });
</script>
</html>