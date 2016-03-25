<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/include/bootstrap-basic-header.jspf"%>
<title>GSSONTE</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/home-header.jspf"%>


	<!-- Begin page content -->
	<div class="container">
		<div class="page-header">
			<h1>회사소개</h1>
		</div>

		<!-- 이하 선택한 제품 소개글 출력 -->
		<div class="page-header">
			<img id="introImg" src="" alt="이미지가 없습니다." class="img-thumbnail center-block" width="450"><br><br>
		</div>
		<div class="center-block" style="max-width: 600px;">
		<blockquote><p>인사말</p></blockquote>
			<div id="itroContext" class="text-left">
				<!-- 인사말 공간 -->		
				
			
			</div>
			<blockquote class="blockquote-reverse">GS stone&brick 대표</blockquote>
		</div>
		<div class="page-header"></div>
	</div>

	<%@ include file="/WEB-INF/jsp/include/home-footer.jspf"%>
	<%@ include file="/WEB-INF/jsp/include/bootstrap-basic-body.jspf"%>
	<script>
	$(document).ready(function(){
		$.ajax({
			type:'post',
			url:"/customer/getIntro.gs",
			success:displayData,
			error:function(){}
		});
		
		function displayData(data){
			$("#introImg").attr("src","/resources/upload/"+data.picture);
			var contexts = data.context;
			var line = /\r\n/g;
			 var space = /\s/g;
			contexts = contexts.replace(line,"<br>");
			contexts = contexts.replace(space, "&nbsp");
			$("#itroContext").html(contexts);
		}
		
	});	
	</script>
</body>
</html>