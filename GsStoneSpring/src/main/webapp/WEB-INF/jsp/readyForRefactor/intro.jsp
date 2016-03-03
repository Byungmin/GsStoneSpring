
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="../css/view.css" rel="stylesheet" type="text/css">

<title>GS STONE&BRICK</title>
<style type="text/css">
.view_intro_pic{
	margin:0 auto;
	width: auto;
	max-width : 600px; 
	height: auto;
	max-height: 400px;
}
.view_intro_text{
	margin:0 auto;
	width: auto;
	max-width : 600px; 
	height: auto;
	font-size: 1.4em;
	line-height: 1.7em;
}
</style>
</head>

<body>
	<!-- header -->
		<jsp:include page="../include/header.jsp" />
	<!-- header끝 -->
	
	<div id="wrap">
		<div id="viewbody">
		<div id="view_side">
			<ul class="view_side_intro">
				<li><h1>회사소개</h1></li>
				<li><br></li>
				<li><a href="../GsStone/welcome.gs">인사말</a></li>
			</ul>
		</div>
		
		<div id="intro_text">
			<div class="view_intro_pic"><img src="../upload/" width=100%, height=100%></div>
			<br>
			
			<div class="view_intro_text"><h3>인사말</h3><br><br><h3 style="text-align:right;">GS STONE&BRICK 대표</h3></div>
			
		</div>
	</div>
			
	
	</div><!-- wrap 끝 -->
	
	<!-- footer -->
		<jsp:include page="../include/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>