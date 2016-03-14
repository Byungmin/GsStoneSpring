<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--  template frame div  -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<!-- table frame div -->
	<div class="table-responsive">
		<h2>고객 문의 관리</h2>
		<br>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>연락처</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>1,001</td>
					<td>Lorem</td>
					<td>ipsum</td>
					<td>123</td>
					<td>1313</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<form name="pageInfo" id="pageInfo">
	<input type="hidden" name="pageNo" value="1" />
</form>
<script>
	$(document).ready(function(){
	console.log("customerPage");
	var url = "/admin/openCustomerQna.gs";
	var formData = $("#pageInfo").serializeArray();
	console.log(formData);
		$.post(url,formData,
			function(data){
			
		}).fail(function(){
			
		});
	});

</script>
