
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href="./css/reset.css" rel="stylesheet" type="text/css">
<link href="./css/view.css" rel="stylesheet" type="text/css">
<title>GS STONE&BRICK</title>
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
			<h1>제품 카탈로그</h1>
			<div class="cataloguemain"></div>	
			<div class="cataloguelist">
				<ul>
					<li>
						<table id="catalogList">
						</table>
					</li>
					
				</ul>
			</div>
			
		</div>
	</div>
			
	
	</div><!-- wrap 끝 -->
	
	<!-- footer -->
		<jsp:include page="../include/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>