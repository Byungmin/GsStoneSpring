<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--  template frame div  -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<!-- table frame div -->
	<div class="table-responsive">
		<h2>회사 소개 관리</h2>
		<h3 class="sub-header">회사 소개 수정하기</h3>

		<form id="frmIntro" name="frmIntro" action="/admin/insertIntro.gs" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="InputName">작성자</label> <input type="text" name="id"
					class="form-control" id="writer" value="${sessionScope.sessionMap.emp_id}" readonly="readonly">
			</div>

			<div class="form-group">
				<label for="companyIntroduce">소개글</label>
				<textarea class="form-control" rows="10" name="context"></textarea>
			</div>
			
			<div class="form-group">
				<label for="inputImgFile">사진 파일</label> 
				<input type="file" id="exampleInputFile" name="picture">
			</div>

			<button type="submit" class="btn btn-primary btn-sm">작성하기</button>
			<button type="reset" class="btn btn-primary btn-sm">다시 작성</button>
		</form>
	</div>
</div>

<script>
	$("button[type='submit']").on("click",function(e){
		e.preventDefault();
		var textArea = $("textarea[name='context']");
		if(textArea.val()==null||textArea.val()==""){
			textArea.attr("placeholder","내용을 입력 하세요");
		}else{
			$("#frmIntro").submit();
		}
	});
</script>

