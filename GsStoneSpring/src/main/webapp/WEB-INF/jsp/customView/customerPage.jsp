<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/include/bootstrap-basic-header.jspf"%>
<title>GSSONTE</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/home-header.jspf"%>


	<!-- Begin page content -->
	<div class="container">
		<div class="page-header">
			<h1>고객센터</h1>
		</div>

		<!-- 이하 고객 문의 작성 form -->
		<div class="center-block" style="max-width: 600px;">
		<blockquote><p>문의 하기</p></blockquote>
		
		<form id="customerfr" name="customerfr" class="form-horizontal" enctype="multipart/form-data">
				<div class="form-group">
				    <label for="inputName" class="col-sm-2 control-label">이름</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="CREA_ID" name="CREA_ID">
					    </div>
  				</div><!-- 이름 -->
				
				
				<div class="form-group">
				    <label for="inputContact" class="col-sm-2 control-label">연락처</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="customerContact" name="customerContact">
					    </div>
  				</div><!-- 연락처 -->
				
				
				<div class="form-group">
				    <label for="inputContact" class="col-sm-2 control-label">제목</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="TITLE" name="TITLE">
					    </div>
  				</div><!-- 제목 -->
				
				
				<div class="form-group">
				    <label for="inputContact" class="col-sm-2 control-label">내용</label>
					    <div class="col-sm-10">
					      <textarea rows="6" name="CONTENTS" class="form-control"></textarea>
					    </div>
  				</div><!-- 제목 -->
				
				
				<div class="form-group" id="fileDiv">
				    <label for="exampleInputFile" class="col-sm-2 control-label">첨부파일</label>
				   		<p><input type="file" id="file" name="file_0" style="display: inline;"><a href="#this" class="btn btn-primary btn-sm" id="delete" name="delete">삭제</a></p>
				</div>
			</form>
			<label class="col-sm-2 control-label"></label><p id="msg" style="color: red; font-weight: bold;" ></p><br>
		<label class="col-sm-2 control-label"></label><button class="btn btn-primary" id="addFile">파일 추가</button><br><br>
		<label class="col-sm-2 control-label"></label><button id="customerBtn" class="btn btn-primary">전송 하기</button>
														<button type="reset" class="btn btn-primary">다시쓰기</button>
		
			
			
			
		</div>
		
		<div class="page-header"></div>
	</div>
	
 	<script src="/js/common.js"></script>
	<form id="commonForm" name="commonForm"></form>
	<%@ include file="/WEB-INF/jsp/include/home-footer.jspf"%>
	<%@ include file="/WEB-INF/jsp/include/bootstrap-basic-body.jspf"%>
	
	<script type="text/javascript">
	 var gfv_count = 1;
		$(document).ready(function(){
			$("#customerBtn").on("click", function(e){
				e.preventDefault();
				if($("#CREA_ID").val()==null||$("#CREA_ID").val()==""||$("#customerContact").val()==null||$("#customerContact").val()==""){$("#msg").text("이름과 연락처는 필수 입력 사항입니다."); return false;}
				else{
				alert("접수되었습니다.");
				var comSubmit = new ComSubmit("customerfr");
				comSubmit.setUrl("<c:url value='/qna/insertQna.gs'/>");
				comSubmit.submit();
				}
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
            var str = "<label class='col-sm-2 control-label'></label><p><input type='file' style='display: inline;' name='file_"+(gfv_count++)+"'><a href='#this' class='btn btn-primary btn-sm' name='delete'>삭제</a></p>";
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