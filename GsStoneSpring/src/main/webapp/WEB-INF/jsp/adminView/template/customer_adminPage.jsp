<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--  template frame div  -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<!-- table frame div -->
	<div class="table-responsive">
		<h2>고객 문의 관리</h2>
		<c:choose>
			<c:when test="${not empty test}">
			</c:when>
		</c:choose>

		<br>
		<table class="table table-bordered" id="result">
			<colgroup>
				<col width="5%" />
				<col width="*" />
				<col width="15%" />
				<col width="30%" />
				<col width="15%" />
			</colgroup>

			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>연락처</th>
				</tr>
			</thead>

			<!-- ajax -->


		</table>
	</div>
</div>
<form name="pageInfo" id="pageInfo">
	<input type="hidden" name="pageNo" value="1"></input> 
</form>

<script>
	$(document).ready(
			function() {
				console.log("script start");
				//customerqna 가져오기
				$.ajax({
					type : "POST",
					url : "/admin/openCustomerQna.gs",
					success : displayResult,
					error : function(data) {
					}
				});//ajax

				//customerqna List 결과값 출력
				function displayResult(data) {
					var output = "<tbody>";
					for (var i = 0; i < data.length; i++) {
						var date = new Date(data[i].CREA_DTM);
						var dateForm = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + " " + date.getHours() + ":"
								+ date.getMinutes() + ":" + date.getSeconds();
						output += "<tr>";
						output += "<td>" + data[i].IDX + "</td>";

						output += "<td><a href='#' name='title'>" + data[i].TITLE + "</a>"
								+ "<input type='hidden' id='IDX' value='"+data[i].IDX+"' /></td>";
						output += "<td>" + data[i].CREA_ID + "</td>";
						output += "<td>" + dateForm + "</td>";
						output += "<td>" + data[i].customerContact + "</td>";
						output += "</tr>";
					}
					output += "</tbody>";
					$("#result").append(output);

					$("a[name='title']").on("click", function(e) {
						console.log("click title");
						e.preventDefault();
						fn_qnaDetail($(this));
					});
				}// displayResult

				function fn_qnaDetail(obj){
					console.log("fn_qnaDetail");
					var selectedItemIDX = obj.parent().find("#IDX").val();
					var qnaDetailUrl = "/admin/main.gs?page=/adminForm/form_customerQna&IDX="+selectedItemIDX; 
					$(location).attr("href", qnaDetailUrl);
				}
				
			});//ready
</script>

