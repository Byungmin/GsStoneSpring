<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--  template frame div  -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<!-- table frame div -->
	<div class="table-responsive">
		<h2>제품소개 관리</h2>
		<h3 class="sub-header">카탈로그 관리하기</h3>

		<br />
		
		<h4 class="sub-header">카탈로그 추가</h4><!-- 수정이랑 같이 쓰기 -->
		<form>
			<div class="form-group">
				<label for="exampleInputName2">카탈로그 설명</label> <input type="text"
					class="form-control" id="tag" placeholder="설명하기">
			</div>
			
			<div class="form-group">
				<label for="inputImgFile">사진 파일</label> <input type="file"
					id="exampleInputFile">
				<p class="help-block">Example block-level help text here.</p>
			</div>
			
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-sm">작성하기</button>
				<button type="reset" class="btn btn-primary btn-sm">다시 작성</button>
			</div>
		</form>

		<br />

		<h4 class="sub-header">카탈로그 수정</h4>
		<div class="row placeholders">
			<div class="col-xs-6 col-sm-3 placeholder">
				<img
					src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
					width="200" height="200" class="img-responsive"
					alt="Generic placeholder thumbnail">
				<h4>Label</h4>
				<span class="text-muted"><button type="button" class="btn btn-primary btn-sm">수정</button><!-- from_item_catalogue_update.jsp -->
					<button type="button" class="btn btn-primary btn-sm">삭제</button><!-- 삭제 alert -->
				</span>
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

	</div>
</div>


