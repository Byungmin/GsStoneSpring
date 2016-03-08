<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/include/include-header.jspf" %>
<link href="./css/customer.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- header -->
		<jsp:include page="../include/header.jsp" />
	<!-- header끝 -->
	
	<div id="wrap">
		<div id="viewbody">
		<div id="view_side">
		<!-- 하드코딩 -->
			<ul class="view_side_intro">
				<li><h1>고객센터</h1></li>
				<li><br></li>
				<li><a href="../GsStone/customer.gs">문의하기</a></li>
			</ul>
		</div>
		
		<div id="intro_text">
		<h1>문의하기</h1>
			<div id="boardTableWrap">
			<form id="customerfr">
				<table>
					<tr><td>이름</td><td><input type="text" name="CREA_ID" class="inputstyle"></input></td></tr>
					<tr><td>연락처</td><td><input type="text" name="customerContact" class="inputstyle"></input></td></tr>
					<tr><td>제목</td><td><input type="text" name="TITLE" class="inputstyle"></input></td></tr>
					<tr><td>내용</td><td><textarea rows="15" cols="45" name="CONTENTS" class="textareastyle"></textarea></td></tr>
					
					
<!-- 					<tr><td>첨부파일1</td><td><input type="file" name="customerfile1" class="filestyle"></input></td></tr> -->
<!-- 					<tr><td>첨부파일2</td><td><input type="file" name="customerfile2" class="filestyle"></input></td></tr> -->
<!-- 					<tr><td>첨부파일3</td><td><input type="file" name="customerfile3" class="filestyle"></input></td></tr> -->
				</table>
			</form>
				<button id="customerBtn">문의하기</button>
			</div>
		</div>
	</div>
	</div><!-- wrap 끝 -->
	<!-- footer -->
		<jsp:include page="../include/footer.jsp" />
	<!-- footer 끝 -->
<%@ include file="/WEB-INF/jsp/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#customerBtn").on("click", function(e){
				e.preventDefault();
				var comSubmit = new ComSubmit("customerfr");
				comSubmit.setUrl("<c:url value='/qna/insertQna.gs'/>");
				comSubmit.submit();
			});
		});
	</script>
</body>
</html>