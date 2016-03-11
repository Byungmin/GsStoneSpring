<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--  template frame div  -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<!-- table frame div -->
	<div class="table-responsive">
		<h2>제품소개 관리</h2>
		<br />
		<p>카탈로그 메인 사진 :</p>
		<button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='/admin/main.gs?page=/adminForm/form_item_catalogue'">카탈로그 관리</button>
		<p>카탈로그 수 :</p>
		<button type="button" class="btn btn-primary btn-sm"  onclick="window.location.href='/admin/main.gs?page=/adminForm/form_item_menu'">메뉴 관리</button>
		<p>상세 제품 소개 메뉴 수 :</p>

		<br />

		<h3 class="sub-header">카탈로그 미리보기</h3>
		<div class="row placeholders">
			<div class="col-xs-6 col-sm-3 placeholder">
				<img
					src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
					width="200" height="200" class="img-responsive"
					alt="Generic placeholder thumbnail">
				<h4>Label</h4>
				<span class="text-muted">Something else</span>
			</div>
			<div class="col-xs-6 col-sm-3 placeholder">
				<img
					src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
					width="200" height="200" class="img-responsive"
					alt="Generic placeholder thumbnail">
				<h4>Label</h4>
				<span class="text-muted">Something else</span>
			</div>
			<div class="col-xs-6 col-sm-3 placeholder">
				<img
					src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
					width="200" height="200" class="img-responsive"
					alt="Generic placeholder thumbnail">
				<h4>Label</h4>
				<span class="text-muted">Something else</span>
			</div>
			<div class="col-xs-6 col-sm-3 placeholder">
				<img src="./temp/Chrysanthemum.jpg" width="200" height="200"
					class="img-responsive" alt="Generic placeholder thumbnail">
				<h4>Label</h4>
				<span class="text-muted">Something else</span>
			</div>
		</div>


		<h3 class="sub-header">메뉴 미리보기</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>메뉴명</th>
					<th>품번</th>
					<th>제품명</th>
					<th>규격</th>
					<th>가격</th>
					<th>사진1</th>
					<th>사진2</th>
					<th>사진3</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>1,001</td>
					<td>Lorem</td>
					<td>ipsum</td>
					<td>123</td>
					<td>1313</td>
					<td>ipsum</td>
					<td>123</td>
					<td>1313</td>
				</tr>
				<tr>
					<td>1,002</td>
					<td>amet</td>
					<td>ipsum</td>
					<td>123</td>
					<td>1313</td>
					<td>consectetur</td>
					<td>adipiscing</td>
					<td>elit</td>
				</tr>
				<tr>
					<td>1,003</td>
					<td>Integer</td>
					<td>nec</td>
					<td>ipsum</td>
					<td>123</td>
					<td>1313</td>
					<td>odio</td>
					<td>Praesent</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>



