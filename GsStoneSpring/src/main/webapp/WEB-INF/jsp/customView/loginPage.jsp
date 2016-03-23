<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/include/bootstrap-basic-header.jspf"%>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<title>GSSONTE</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/home-header.jspf"%>


	<!-- Begin page content -->
	<div class="container">
		<div class="page-header">
			<h1>직원 페이지</h1>
		</div>

		<!-- 이하 고객 문의 작성 form -->
		<div class="center-block" style="max-width: 600px;">
		<blockquote><p>로그인</p></blockquote>
		
			<form id="loginfr" class="form-horizontal" action="" method="">
				<c:choose>
					<c:when test="${not empty sessionScope.sessionMap}">
						<p class="lead">${sessionScope.sessionMap.emp_id} 로그인 중</p>
					</c:when>
					<c:otherwise>
						<div class="form-group">
						    <label for="inputName" class="col-sm-2 control-label">ID</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="emp_id" name="emp_id">
							    </div>
		  				</div>
						
						
						<div class="form-group">
						    <label for="inputContact" class="col-sm-2 control-label">비밀번호</label>
							    <div class="col-sm-10">
							      <input type="password" class="form-control" id="passwd" name="passwd">
							    </div>
		  				</div>
					</c:otherwise>
				</c:choose>
				
				
  				
  				<div class="form-group">
  					<label for="inputContact" class="col-sm-2 control-label"> </label>
  					<c:choose>
  						<c:when test="${not empty sessionScope.sessionMap}">
  							<a href="/admin/main.gs" class="btn btn-primary">관리자 페이지로 이동</a>
  							<a href="/logOut.gs" class="btn btn-primary">로그아웃</a>	
  						</c:when>
  						<c:otherwise>
  							<button type="submit" class="btn btn-primary">로그인 하기</button>
  						</c:otherwise>
  					</c:choose>
  					
  				</div>
			</form>
		</div>
		<div class="page-header"><p id="msg"></p></div>
		<p class="lead">이곳은 직원을 위한 공간입니다.</p>
	</div>
	
	<%@ include file="/WEB-INF/jsp/include/home-footer.jspf"%>
	<%@ include file="/WEB-INF/jsp/include/bootstrap-basic-body.jspf"%>
	
<script>
	$(document).ready(function(){
		//ID only number
		$("#emp_id").keyup(function(){
			$(this).val($(this).val().replace(/[^0-9]/g,""));
			});
		
		$("button[type='submit']").on("click",function(e){
			e.preventDefault();
			if($("#emp_id").val()==null||$("#emp_id").val()==""||$("#passwd").val()==null||$("#passwd").val()==""){$("#msg").text("ID또는 비밀번호를 입력해 주세요."); return false;}
			
			$("#loginfr").attr({action:"/loginIdCheck.gs", method:"post"}).submit();
		});
		
	});
</script>
</body>
</html>