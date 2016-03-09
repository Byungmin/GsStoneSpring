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
			<form id="customerfr" name="customerfr" enctype="multipart/form-data">
				<table>
					<tr><td>이름</td><td><input type="text" name="CREA_ID" class="inputstyle"></input></td></tr>
					<tr><td>연락처</td><td><input type="text" name="customerContact" class="inputstyle"></input></td></tr>
					<tr><td>제목</td><td><input type="text" name="TITLE" class="inputstyle"></input></td></tr>
					<tr><td>내용</td><td><textarea rows="15" cols="45" name="CONTENTS" class="textareastyle"></textarea></td></tr>
					
					<tr><td></td><td>
						<div id="fileDiv">
						<p><input type="file" id="file" name="file_0" class="filestyle">
						<a href="#this" class="btn" id="delete" name="delete">삭제</a></p>
						</div>
					</td></tr>	
				
				</table>
				
				<a href="#this" class="btn" id="addFile">파일 추가</a>
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
	 var gfv_count = 1;
		$(document).ready(function(){
			$("#customerBtn").on("click", function(e){
				e.preventDefault();
				var comSubmit = new ComSubmit("customerfr");
				comSubmit.setUrl("<c:url value='/qna/insertQna.gs'/>");
				comSubmit.submit();
			});
			$("#addFile").on("click", function(e){ //파일 추가 버튼
                e.preventDefault();
                fn_addFile();
            });
			 $("a[name='delete']").on("click", function(e){ //삭제 버튼
	                e.preventDefault();
	                fn_deleteFile($(this));
	            });
			
		});
		
		function fn_addFile(){
            var str = "<p><input type='file' class='filestyle' name='file_"+(gfv_count++)+"'> <a href='#this' class='btn' name='delete'>삭제</a></p>";
            $("#fileDiv").append(str);
            $("a[name='delete']").on("click", function(e){ //삭제 버튼
                e.preventDefault();
                fn_deleteFile($(this));
            });
        }
		function fn_deleteFile(obj){
            obj.parent().remove();
        }
	</script>
</body>
</html>