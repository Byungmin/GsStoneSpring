<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--  template frame div  -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<!-- table frame div -->
	<div class="table-responsive">
		<h2>제품소개 관리</h2>
		<h3 class="sub-header">카탈로그 관리하기</h3>

		<br />
		
		<h4 class="sub-header">카탈로그 추가</h4>
		<form id="frmCatalogueInsert" name="frmCatalogueInsert" action="/admin/insertCatalogue.gs" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="inputImgFile">사진</label> <input type="file"
					id="exampleInputFile" name="oriFileName" onchange="readURl(this);">
			</div>
			<div id="UploadedImgPosition"><!-- 미리보기 -->
				
			</div>
			
			<div class="form-group">
				<label for="exampleInputName2">카탈로그 설명</label> <input type="text"
					class="form-control" id="title" name="TITLE" placeholder="설명하기">
			</div>
			
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-sm">작성하기</button>
				<button type="reset" class="btn btn-primary btn-sm">다시 작성</button>
			</div>
			<input type="hidden" name="CREA_ID" value="${sessionScope.sessionMap.emp_id}">
		</form>

		<br />

		<h4 class="sub-header">카탈로그 리스트</h4>
		<div class="row placeholders" id="catalogueList">
				<!-- 카탈로그 리스트 출력 위치 -->		
		</div>

	</div>
</div>

<script>
$(document).ready(function(){
	
	$("button[type='submit']").on("click",function(e){
		e.preventDefault();
		var title = $("#title");
		if(title.val()==null||title.val()==""){
			title.attr("placeholder","카탈로그 설명은 필수 입력입니다.");
		}else{
			$("#frmCatalogueInsert").submit();
		}
	});
	
	
	//카탈로그 리스트 가져오기
	$.ajax({
		type : "POST",
		url : "/admin/openCatalogue.gs",
		success : displayResult,
		error : function(data) {
		}
	});
	
	function displayResult(data) {
		var output = "";
		console.log(data);
		for(var i=0;i<data.length;i++){
			output += "<div class='col-xs-6 col-sm-3 placeholder'>";
			output += "<img src='/resources/upload/"+(data[i].imgFile != null?data[i].imgFile.STORED_FILE_NAME:"")+"' width='200' height='200' class='img-responsive'"
						+"alt='저장된 사진이 없습니다.'>";
			output += "<h4>"+data[i].TITLE+"</h4>";
			output += "<span class='text-muted'>";
			output += "<a href='/admin/main.gs?page=/adminForm/form_Update_catalogue&IDX="+data[i].IDX+"' class='btn btn-primary btn-sm'>수정</a>";
			output += "</span></div>"
		}
		$("#catalogueList").append(output);
	}
	
	
	
	
	
	//reset Button
	//미리보기 사라지게 만들기
	$("button[type='reset']").on("click",function(){
		$("#UploadedImgPosition").empty();
	});
	
	//안됨

});	
function readURl(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			var imgTag = "<img id='UploadedImg' src='' width='200' height='200'>";
			$("#UploadedImgPosition").append(imgTag);
			$("#UploadedImg").attr("src",e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
	
</script>

