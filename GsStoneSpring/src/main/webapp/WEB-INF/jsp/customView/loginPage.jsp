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
  				
  				<div class="form-group">
  					<label for="inputContact" class="col-sm-2 control-label"> </label>
  					<button type="submit" class="btn btn-primary">로그인 하기</button>
  				</div>
			</form>
		</div>
		<div class="page-header"></div>
		<p class="lead">이곳은 직원을 위한 공간입니다.</p>
	</div>
	
	<%@ include file="/WEB-INF/jsp/include/home-footer.jspf"%>
	<%@ include file="/WEB-INF/jsp/include/bootstrap-basic-body.jspf"%>
	
<script>
	$(document).ready(function(){
		$("button[type='submit']").on("click",function(e){
			e.preventDefault();
			$("#loginfr").attr({action:"/loginIdCheck.gs", method:"post"}).submit();
		});
		
	});
</script>
</body>
</html>