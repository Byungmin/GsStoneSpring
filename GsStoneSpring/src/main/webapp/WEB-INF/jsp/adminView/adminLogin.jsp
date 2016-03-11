
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
				<li><a href="/customer.gs">문의하기</a></li>
				<li><a href="/login.gs">직원페이지</a></li>
			</ul>
		</div>
		
		<div id="intro_text"> 
			<h1>직원 로그인</h1>
			<div id="boardTableWrap">
			<c:choose>
				<c:when test="${not empty sessionScope.sessionMap}">
					<table>
					<tr><td>I D :</td><td>${sessionScope.sessionMap.emp_id }</td></tr>
					<tr><td>이름 :</td><td>${sessionScope.sessionMap.emp_name }</td></tr>
					<tr><td></td><td><button id="openAdminPage">관리자페이지 이동</button> <button id="logout">로그아웃</button></td></tr>
				</table>
				</c:when>
				
				<c:otherwise>
					<form id="loginfr">
						<table>
							<tr><td>I  D</td><td><input type="text" name=emp_id class="inputstyle"></input></td></tr>
							<tr><td>비밀번호</td><td><input type="password" name="passwd" class="inputstyle"></input></td></tr>
							<tr><td></td><td><button id="loginBtn">로그인</button></td></tr>
						</table>
					</form>
				
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div><!-- wrap 끝 -->
	</div>
	<!-- footer -->
		<jsp:include page="../include/footer.jsp" />
	<!-- footer 끝 -->
	
	<%@ include file="/WEB-INF/jsp/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#loginBtn").on("click",function(e){
				e.preventDefault();
				var comSubmit = new ComSubmit("loginfr");
				comSubmit.setUrl("<c:url value='/loginIdCheck.gs'/>");
				comSubmit.submit();
			});
			
			$("#logout").on("click",function(e){
				e.preventDefault();
				$(location).attr('href','/logOut.gs');
			});
			
			$("#openAdminPage").on("click",function(e){
				e.preventDefault();
				$(location).attr('href','/admin/main.gs');
			});
			
		});
	</script>
</body>
</html>