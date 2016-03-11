<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/bootstrap-includ-header.jspf" %>

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

				<c:choose>
					<c:when test="${not empty null}">
						<p>안빈화면</p>
					</c:when>
					<c:otherwise>
						<div class="col-xs-6 col-sm-3 placeholder">
							<img
								src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
								width="400" height="400" class="img-responsive"
								alt="Generic placeholder thumbnail">
							<h4>빈화면</h4>
							<span class="text-muted">게시중인 회사 소개글이 없습니다.</span>
						</div>
					</c:otherwise>
				</c:choose>

			</div>

		</div>
		<h3 class="sub-header">지난 회사소개 글</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>null</th>
					<th>null</th>
					<th>첨부파일</th>
				</tr>
			</thead>


			<c:choose>
				<c:when test="${not empty test.test1}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tbody>
						<tr>
							<td colspan="5"><p class="text-center">지난 회사소개 글이 없습니다. ${test.test1}</p></td>
						</tr>
					</tbody>
				</c:otherwise>
			</c:choose>
		</table>
			
			<button id="test">ajax실험</button>
	</div>
</div>

<script>
	$(document).ready(function(){
		console.log("intro_adminPage");
		
		$.ajax({
			type:"POST",
			url:"/admin/openIntro.gs",
			success:function(data){
				console.log(data);
			}			
		});
		
	});

</script>

