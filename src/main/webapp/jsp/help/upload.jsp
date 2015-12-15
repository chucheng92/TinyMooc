<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/jquery-1.8.3.min.js"/>"></script>
<title>资源上传</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#submit").click(function() {
			$.ajax({
				type : "post",
				url : "uploadAll.htm",
				data : $("#uploadEvery").serialize(),
				success : function(data) {
					if (data == "ok") {
						alert("上传成功");
						parent.window.location.reload(true);
					} else {
						parent.$.fancybox.close();
					}
				}
			});

		});
	});
</script>
</head>
<body align="center">

	<h2>上传资源</h2>

	<div class="pageContent">
		<form id="uploadEvery" method="post"
			action="uploadAll.htm?courseId=${courseId}"
			enctype="multipart/form-data">

			<div class="pageFormContent nowrap" layoutH="97">
				<input type="hidden" name="fileUrl" /> <input type="file"
					name="fileUrl" />
				<div class="divider"></div>

			</div>
			<!-- <div class="field">
				<label class="field-label">资源名:</label>
				<div class="item">
					<input name="resourceName" type="text" maxlength="63" value=""
						class="basic-input" />
				</div>
			</div>
			<div class="field">
				<label class="field-label">资源介绍:</label>
				<div class="item baseline-item">
					<textarea name="resourceIntroduce" type="text" rows="7" cols="40"
						value="" class="basic-textarea"></textarea>

				</div>
			</div> -->
			<div class="formBar">
				<ul>

					<div>
						<button id="submit" type="submit">提交</button>




						<button type="button" class="close">取消</button>

					</div>
				</ul>
			</div>

		</form>
	</div>

</body>
</html>
