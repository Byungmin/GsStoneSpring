<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/bootstrap-includ-header.jspf"%>

<!--  template frame div  -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<!-- table frame div -->
	<div class="table-responsive">
		<h2>회사 소개 관리</h2>
		<br>
		<button type="button" class="btn btn-primary btn-sm"
			onclick="window.location.href='/admin/main.gs?page=/adminForm/form_intro'">회사소개
			글 작성하기</button>
		<br>
		<h3 class="sub-header">현재 게시중</h3>
		<div class="text-center">
			<!-- 글 가운데 정렬 -->
			<div class="row placeholders">
				<div class="col-xs-9 col-sm-0 placeholder">
					<img
					 	id="introNowShowingImg"
						src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
						width="400" height="400" class="img-responsive"
						alt="저장된 사진이 없습니다.">
					<h4>
						<span id="showingDate">작성일 지정</span>
					</h4>
					<span class="text-muted"><span id="showingContext">글이
							없습니다.</span></span>
				</div>

			</div>

		</div>
		<h3 class="sub-header">지난 회사소개 글</h3>
		<form>
			<table class="table table-bordered" id="result">
			<colgroup>
				<col width="5%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="*" />
				<col width="15%" />
			</colgroup>
				<thead>
					<tr>
						<th>no</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>첨부파일</th>
						<th>글 미리보기</th>
						<th>게시중</th>
					</tr>
				</thead>
			</table>
		</form>
	</div>
</div>

<script>
	$(document)
			.ready(
					function() {
						$.ajax({
							type : "POST",
							url : "/admin/openIntro.gs",
							success : displayResult,
							error : function(data) {
							}
						});

						function displayResult(data) {
							var output = "<tbody>";
							for (var i = 0; i < data.length; i++) {
								var date = new Date(data[i].date);
								var dateForm = date.getFullYear() + " / " + (date.getMonth() + 1) + " / " + date.getDate();
								//미리보기 글자수 50자로 요약
								var contextInit = data[i].context;
								contextInit = contextInit.substr(0, 49);

								//게시중인 글 확인후 출력하기
								if (data[i].showing === 'y') {
									$("#showingDate").html(dateForm);
									$("#showingContext").html(data[i].context);
									$("#introNowShowingImg").attr("src","/resources/upload/"+data[i].picture+"");
								}

								output += "<tr>";
								output += "<td>" + data[i].num + "</td>";
								output += "<td>" + dateForm + "</td>";
								output += "<td>" + data[i].id + "</td>";
								output += "<td>" + data[i].picture + "</td>";
								output += "<td>" + contextInit + "</td>";
								output += "<td>"
										+ "<input type='button' name='showingBtn' class='btn btn-primary btn-sm' "
										+ (data[i].showing === 'n' ? " value='게시하기'"
												: "value='게시중인 글' disabled='disabled'")+">" 
												+"<input type='hidden' id='showingIDX' value='"+data[i].num+"'/>"
												+"</td>";
								output += "</tr>";
								output += "<input type='hidden' value='"+data[i].num+"' />";
							}
							output += "</tbody>";
							$("#result").append(output);
							
							$("input[name='showingBtn']").on("click", function(e) {
								e.preventDefault();
								fn_changeNowShowing($(this));
							});
						}

				

				//게시하기 클릭시
				function fn_changeNowShowing(obj) {
					var buttonIdx = obj.parent().find("#showingIDX").val();
					console.log("buttonIDX = " + buttonIdx);
					var changeNowShowingUrl = "/admin/introChangeNowShoing.gs";
					var param = {"num": buttonIdx};
					$.post(changeNowShowingUrl,param);
					location.reload();
				}

			});
</script>

