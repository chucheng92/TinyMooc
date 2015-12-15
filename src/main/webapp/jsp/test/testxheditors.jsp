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
<div id="id_video_container" style="width:100%;height:360px;"></div>
<script src="http://qzonestyle.gtimg.cn/open/qcloud/video/h5/h5connect.js"></script>
<script type="text/javascript">
    (function(){
        var option ={"auto_play":"0","file_id":"14651978969256119883","app_id":"1251419256","width":0,"height":360};
        /*调用播放器进行播放*/
        new qcVideo.Player(
                /*代码中的id_video_container将会作为播放器放置的容器使用,可自行替换*/
                "id_video_container",
                option
        );
    })()
</script>

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