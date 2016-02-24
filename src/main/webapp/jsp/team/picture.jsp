<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title> 图标设置  - 萌课网</title>
  <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />

    
<script type="text/javascript">
$(function() {
	

	function preview1(file) {
		widthpreview = 0;
		heightpreview = 0;
		img1 = new Image(), url = img1.src = URL.createObjectURL(file);
		uri = null;
		$img1 = $(img1);
		img1.onload = function() {
			widthpreview = img1.width;
			heightpreview = img1.height;
			uri = img1.src;
			elem1 = document.querySelector("#cutimage1");
			canvas1 = elem1.getContext('2d');
			canvas1.fillStyle="#FFFFFF";
			image = new Image();
			if (elem1.width > elem1.height) {
				canvas1.clearRect(0, 0, elem1.width, elem1.height);
				canvas1.drawImage(img1, 0, 0, elem1.width,
						elem1.height);
				canvas1.save();
			} else {
				canvas1.clearRect(0, 0, elem1.width, elem1.height);
				canvas1.drawImage(img1, 0, 0, elem1.width,
						elem1.height);
				canvas1.save();
			}
			$("#cutimage1").css("top", 0).css("left", 0).width(48).height(48);
			URL.revokeObjectURL(url);
		}

	}
	function msg(){
			    e.preventDefault();
			    $.scojs_message('保存成功', $.scojs_message.TYPE_OK);
		
	}

		$('[type=file]').change(function(e) {
			$('#preview').css({
				display : 'inline',
				border : "0px"
			});
			var file = e.target.files[0];
			preview1(file);

		});

		$("#savecanvas").click(
				function() {
					elem4 = document.querySelector("#cutimage1");
					var info1 = elem4.toDataURL("image/jpg");
					var data1 = info1.replace(/\+/g,"_");//替换转码后含有的+号
					var dataAll={"data1":data1};
					$.ajaxSetup({cache:false});
					$.ajax({
						type:"post",
						url:"teamPicture.htm",
						data:"dataAll="+JSON.stringify(dataAll),
						
						success:function(data){
							location.reload();
							history.go(0);
							 window.navigate(location);
			            },
			            error : function(textStatus,e){
			                alert("提交失败");
			            }
					});
					
				});
});	
</script>
</head>
<body class="lily-theme">
<c:if test="${! empty user}">
<jsp:include page="/jsp/include/head2.jsp"></jsp:include>
</c:if>

<c:if test="${empty user}">
    <jsp:include page="/jsp/include/head1.jsp"></jsp:include>
</c:if>

<section class="container" style="margin-top: 60px;">
  <div class="group-header" style="background-image:url(<c:url value="/resource/pic/imagehead/group-header.jpg"></c:url>)">

  <div class="head">
    <div class="icon"><img src="<c:url value="${teamforpicture.headImage.imageSmall}"/>"  alt="${teamforpicture.teamName}"  /></div>
    <div class="infos">
      <h1>${teamforpicture.teamName}</h1>
      <span>${memberNum}个成员</span>
    </div>
  </div>
  
  <ul class="hnav">
    <li><a href="teamHomePage.htm?teamId=${teamforpicture.teamId}">小组首页</a></li>
    <li><a href="discussPage.htm?teamId=${teamforpicture.teamId}">讨论区</a></li>  
    <li><a href="membersAdminPage.htm?teamId=${teamforpicture.teamId}">成员</a></li>
    
    <li class="this"><a href="manageTeam.htm?teamId=${teamforpicture.teamId}">管理</a></li>  
    
  </ul>

</div>
    <div class="container-padding clearfix">
    
   <div class="mod">
   <div class="tab-nav clearfix">
       <ul>
         <li ><a href="manageTeam.htm?teamId=${teamforpicture.teamId}">基本设置</a></li>
         <li class="this"><a href="goTeamPicture.htm?teamId=${teamforpicture.teamId}">图标设置</a></li>
        </ul>
    </div>  
      
 
    <p>
      <label>
      <img src="<c:url value="${teamforpicture.headImage.imageSmall}"/>" width="48" height="48" />
      </label>
      <label id="preview" class="" style="margin-left:0px;display:none">
              <canvas id="cutimage1" width="48" height="48"> </canvas>
      </label>
      <div>从你的电脑上选择图片:<input type="file" name="pic" class="file">
            
      </div>
      
     </p>
     
      
    <p class="actions">
      <button id="savecanvas" class="btn btn-success">保存修改</button>
    </p>

</div>
  </div>
  </section>

<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body>
</html>