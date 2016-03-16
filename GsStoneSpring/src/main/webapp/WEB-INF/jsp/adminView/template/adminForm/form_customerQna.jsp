<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--  template frame div  -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<!-- table frame div -->
	<div class="table-responsive">
		<h2>고객 문의</h2>
		<h3 class="sub-header">
			<span id="IDX" value="${param.IDX}">${param.IDX}</span>, <label
				id="TITLE"></label>
		</h3>

		<form>
			<div class="form-group">
				<label for="InputName">문의 고객명</label> <input type="text"
					class="form-control" id="CREA_ID" value="" readonly="readonly">
				<label for="InputName">문의고객 연락처</label> <input type="text"
					class="form-control" id="customerContact" value=""
					readonly="readonly"> <label for="InputName">작성시간</label> <input
					type="text" class="form-control" id="CREA_DTM" value=""
					readonly="readonly">
			</div>

			<div class="form-group">
				<label for="companyIntroduce">문의글</label>
				<textarea class="form-control" rows="10" id="CONTENTS"
					readonly="readonly"></textarea>
			</div>

			<div class="form-group" id="fileList">
				<label for="inputImgFile">첨부파일 파일</label>
			</div>

			<button type="button" class="btn btn-primary btn-sm" id="deleteQna">삭제</button>
		</form>
	</div>
</div>

<script>
	$(document).ready(
			function() {

				//내용 가져오기
				var getIDX = $(this).find("#IDX").attr("value");
				console.log(getIDX);
				var getDetailURL = "/admin/detailCustomerQna.gs";
				var params = "IDX=" + getIDX;

				$.ajax({
					type : 'POST',
					url : getDetailURL,
					data : params,
					success : displayResult,
					error : function(data) {
					}
				});//board Ajax

				function displayResult(data) {
					var date = new Date(data.CREA_DTM);
					var dateForm = date.getFullYear() + "년 " + (date.getMonth() + 1) + "월 " + date.getDate() + "일 (" + date.getHours() + "시 "
							+ date.getMinutes() + "분 " + date.getSeconds() + "초)";
					$("#TITLE").text(data.TITLE);
					$("#CREA_ID").val(data.CREA_ID);
					$("#CONTENTS").val(data.CONTENTS);
					$("#CREA_DTM").val(dateForm);
					$("#customerContact").val(data.customerContact);

					var fileList = data.fileList;
					if (!fileList.length) {
						$("#fileList").append("<p class='help-block'>첨부파일이 없습니다.</p>");
					} else {
						var output = "<p class='help-block'>" + fileList.length + "개의 첨부파일 이 있습니다.</p>";
						for (var i = 0; i < fileList.length; i++) {
							output += "<p><a href='/common/downloadFile.gs?IDX=" + fileList[i].IDX + "' name='file'>"
									+ fileList[i].ORIGINAL_FILE_NAME + "</a> (" + fileList[i].FILE_SIZE + "kb)</p>";
						}
						$("#fileList").append(output);
					}

				}//displayResult

				$("#deleteQna").on("click", function(e) {
					e.preventDefault();
					var confrimDel = confirm("해당글을 삭제하시겠습니까?");
					if (confrimDel) {
						var deleteUrl = "/admin/deleteQna.gs";
						$.post(deleteUrl, params);
						$(location).attr("href", "/admin/main.gs?page=customer_adminPage");
					}
				});

				function fn_file(obj) {
					console.log("function fn_file");
					var selectedFileIDX = obj.parent().find("#fileIDX").val();
					var paraMap = {
						"IDX" : selectedFileIDX
					};
					var downUrl = "/common/downloadFile.gs";
					$.post(downUrl, paraMap, function(data) {
						console.log("ajax sucess");
					});
				}

			});//ready
</script>


