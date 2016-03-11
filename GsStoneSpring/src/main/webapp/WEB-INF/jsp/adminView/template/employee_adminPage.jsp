<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--  template frame div  -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<!-- table frame div -->
	<div class="table-responsive">
		<h2>직원 관리</h2>
		<br>
		<button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='/admin/main.gs?page=/adminForm/form_employee'">직원 추가</button>
		<br> <br>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>직원 ID</th>
					<th>이름</th>
					<th>연락처</th>
					<th>주소</th>
					<th>권한</th>
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
				<tr>
					<td>1,002</td>
					<td>amet</td>
					<td>consectetur</td>
					<td>adipiscing</td>
					<td>elit</td>
				</tr>
				<tr>
					<td>1,003</td>
					<td>Integer</td>
					<td>nec</td>
					<td>odio</td>
					<td>Praesent</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>


