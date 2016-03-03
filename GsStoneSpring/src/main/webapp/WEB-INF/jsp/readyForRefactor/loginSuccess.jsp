<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href="./css/reset.css" rel="stylesheet" type="text/css">
<link href="./css/login.css" rel="stylesheet" type="text/css">
<title>StaffLogin</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('button').click(function(){
			window.opener.location.reload();
			window.close();
		});
	});
</script>
<style type="text/css">
	#loginWrap{
		text-align: center;
	}
</style>
<%
	String id = (String)session.getAttribute("id");
%>
</head>
<body>
	<div id="loginWrap">
		<h3>로그인 성공</h3>
			<p><%=id %></p>
			<p>환영합니다.</p>
			<br>
		<button id="login">확인</button>
	</div>
</body>
</html>