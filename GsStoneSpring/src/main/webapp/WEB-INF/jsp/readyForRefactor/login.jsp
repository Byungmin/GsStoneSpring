<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="../css/login.css" rel="stylesheet" type="text/css">
<title>StaffLogin</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#login").click(function(){
			$('form').submit();
		});
	});
</script>

</head>
<body>
	<div id="loginWrap">
		<h3>Staff Login</h3>
		<form action="./loginAction.admin" method="post">
		<table>
			<tr><td>직원번호 :</td><td> <input type="text" name="id"></td></tr>
			<tr><td>비밀번호 :</td><td> <input type="password" name="passwd"></td></tr>
		</table>
		</form>
		<button id="login">로그인</button>
	</div>
</body>
</html>