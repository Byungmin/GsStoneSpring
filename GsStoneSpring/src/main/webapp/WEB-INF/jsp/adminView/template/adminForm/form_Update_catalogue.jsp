<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--  template frame div  -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<!-- table frame div -->
	<div class="table-responsive">
		<h2>제품소개 관리</h2>
		<h3 class="sub-header">카탈로그 관리하기 </h3>

		<br />
		<h4 class="sub-header">카탈로그 수정 및 삭제</h4>



		<form id="frmCatalogueUpdate" name="frmCatalogueUpdate"
			action="/admin/catalogueUpdate.gs" method="post"
			enctype="multipart/form-data">

			<div class="form-group">
				<label for="exampleInputName2">카탈로그 번호</label> : <label>${param.IDX}</label><br />
				<label for="exampleInputName2">작성자</label> : <label id="CREA_ID"></label><br />
				<label for="exampleInputName2">작성시간</label> : <label id="CREA_DTM"></label>
			</div>
			<div id="fileDiv" class="form-group">
				<label for="inputImgFile">기존 카타로그 사진</label><br />
				<!-- 기존 사진 공간 -->
			</div>
			
			<div class="form-group">
				<label for="exampleInputName2">카탈로그 설명</label> <input type="text"
					class="form-control" id="title" name="TITLE" value="">
			</div>
			
			<br>
			
			<div class="form-group">
				<label for="inputImgFile">사진 변경</label> <input type="file"
					id="exampleInputFile" name="file_" onchange="readURl(this);">
					<p><b>미 선택시 기존 사진 이용</b></p>
			</div>
			<div id="UploadedImgPosition">
				<!-- 선택 사진 미리보기 -->
			</div>

			<br>


			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-sm">수정 하기</button>
				<button type="reset" class="btn btn-primary btn-sm">다시 작성</button>
				<button type="reset" class="btn btn-primary btn-sm">삭제</button>
			</div>
			<input type="hidden" name="CREA_ID"
				value="${sessionScope.sessionMap.emp_id}">
			<input type="hidden" name="IDX"
				value="${param.IDX}">
			
		</form>
		<br />
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var getCatalogueDetailUrl = "/admin/getCatalogueDetail.gs";
		var getCatalogueDetailParam ={"IDX" : "${param.IDX}"}; 
		
		$.ajax({
			type:"POST",
			url : getCatalogueDetailUrl,
			data : getCatalogueDetailParam,
			success : displayResult,
			error : function(data) {
			}
		});
		
		function displayResult(data){
			console.log(data);
			var date = new Date(data.CREA_DTM);
			var dateForm = date.getFullYear() + "년 " + (date.getMonth() + 1) + "월 " + date.getDate() + "일 (" + date.getHours() + "시 "
					+ date.getMinutes() + "분 " + date.getSeconds() + "초)";
			
			$("#CREA_ID").text(data.CREA_ID);
			$("#CREA_DTM").text(dateForm);
			$("#title").attr("value",data.TITLE);
			var imgFile = "<img src='/resources/upload/"+data.fileList[0].STORED_FILE_NAME+"' style='width:200px;height:200px;'>"
							+"<input type='hidden' name='IDX_"+data.fileList[0].IDX+"' value='"+data.fileList[0].IDX+"'>";
			$("#fileDiv").append(imgFile);
			$("#exampleInputFile").attr("name","file_"+data.fileList[0].IDX+"");
		}
		
		
		//reset Button
		//미리보기 사라지게 만들기
		$("button[type='reset']").on("click",function(){
			$("#UploadedImgPosition").empty();
		});
		
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
