<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--  template frame div  -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<!-- table frame div -->
	<div class="table-responsive">
		<h2>제품소개 관리</h2>
		<h3 class="sub-header">메뉴 관리하기</h3>

		<br />
		<h4 class="sub-header">메뉴 리스트</h4>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>글번호</th>
					<th>상품명</th>
					<th>상품가격</th>
					<th>상품규격</th>
					<th>첨부파일</th>
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

		<br />

		<!-- 수정이랑 같이 쓰기 -->
		<h4 class="sub-header">메뉴 추가</h4>

		<form>
			<div class="form-group">
				<label for="exampleInputName2">상품명</label> <input type="text"
					class="form-control" id="tag">
			</div>
			<div class="form-group">
				<label for="exampleInputName2">상품가격</label> <input type="text"
					class="form-control" id="tag">
			</div>
			<div class="form-group">
				<label for="exampleInputName2">상품규격</label> <input type="text"
					class="form-control" id="tag">
			</div>

			<div class="form-group">
				<label for="companyIntroduce">상품설명</label>
				<textarea class="form-control" rows="5"></textarea>
			</div>

			<div class="form-group">
				<label for="inputImgFile">상품 사진1</label> <input type="file"
					id="exampleInputFile"> <label for="inputImgFile">상품
					사진2</label> <input type="file" id="exampleInputFile"> <label
					for="inputImgFile">상품 사진3</label> <input type="file"
					id="exampleInputFile">
				<p class="help-block">Example block-level help text here.</p>
			</div>

			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-sm">작성하기</button>
				<button type="reset" class="btn btn-primary btn-sm">다시 작성</button>
			</div>
		</form>

		<br />

	</div>
</div>


