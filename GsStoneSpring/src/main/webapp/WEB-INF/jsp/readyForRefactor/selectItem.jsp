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


#intro_text{
		padding: 20px;
}
#intro_text h1{
	color: #BD0B26;
}
.selectItemWrap{
	width: 650px;
	height: auto;
	margin-top: 15px;
	margin-left: 20px;
	padding: 10px 0;
}
.selectPic1{
	border: 2px solid #d0d0d0;
	margin: 0 auto;
	clear:both;
	width: 350px;
	height: 300px;
}
.selectInfo{
	margin: 0 auto;
	width: 500px;
}
.selectInfo table{
	border-collapse: collapse;
	text-align:center;
}
.selectInfo table td{
	height: 30px;
	font-size: 1.2em;
	color: #5D5D5D
}
.selectInfo h2{
	color: #5D5D5D;
	margin-bottom: 10px;
}
.selectInfo table tr:FIRST-CHILD{
	border-top: 2px solid #d0d0d0;	
	border-bottom: 1px solid #d0d0d0; 
}
.selectInfo table tr:last-child{
	border-top: 1px solid #d0d0d0;
	border-bottom: 1px solid #d0d0d0;
}
.selectInfo table tr:last-child td{
	padding: 10px 0;
}
.selectInfo table td:nth-child(1){
	width: 100px;
}
.selectInfo table td:nth-child(2){
	width: 400px;
	text-align: left;
}

.selectPic2n3Wrap{
	margin: 0 auto;
	clear:both;
	width: 550px;
	height: 250px;
}
.selectPic2n3Wrap .selectPic2{
	float: left;
		width: 270px;
	height: 250px;
}
.selectPic2n3Wrap .selectPic3{
	float: right;
		width: 270px;
	height: 250px;
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
		<jsp:include page="../include/itemSide.jsp" />
		</div>
		
		<div id="intro_text">
			<h1></h1>
			<div class="selectItemWrap">
				<!-- 가장 윗 사진 -->
				<div class="selectPic1"><img src="../upload/" width=100%, height=100%></div>
				<br>
				<!-- 아이템 정보 테이블 -->
				<div class="selectInfo">
				<h2>제품정보</h2>
				<table>
					<tr><td>제품명</td><td></td></tr>
					<tr><td>품번</td><td></td></tr>
					<tr><td>규격</td><td></td></tr>
					<tr><td>가격</td><td></td></tr>
					<tr><td>상세설명</td><td></td></tr>
				</table>
				</div>
				<br>
				<!-- 중간 사진 2개  -->
				<div class="selectPic2n3Wrap">
<%-- 					<div class="selectPic2"><img src="../upload/<%=selectitembean.getItemPic2()%>" width=100%, height=100%></div> --%>
<%-- 					<div class="selectPic3"><img src="../upload/<%=selectitembean.getItemPic3()%>" width=100%, height=100%></div> --%>
				</div>
				<br>
			</div>
			
		</div>
	</div>
			
	
	</div><!-- wrap 끝 -->
	
	<!-- footer -->
		<jsp:include page="../include/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>