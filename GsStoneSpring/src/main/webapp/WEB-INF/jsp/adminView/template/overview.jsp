<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<h2 class="page-header">GSSTONE 홈페이지 설정</h2>
	<h4 class="sub-header">홈페이지 기본 정보</h4>
	<div class="table-responsive">

		<table class="table table-bordered" id="mainInfo">
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>

			<tr>
				<td>도메인 주소</td>
				<td><a href="http://www.gsstone.net">http://www.gsstone.net</a></td>
			</tr>
			<tr>
				<td>로그인 ID</td>
				<td>${sessionScope.sessionMap.emp_id}</td>
			</tr>
			<tr>
				<td>총 방문자</td>
				<td><b id="allEnterCount"></b>&nbsp회</td>
			</tr>
			<tr>
				<td>금일 방문자</td>
				<td><b id="todayEnterCount"></b>&nbsp회</td>
			</tr>

			<tr>
				<td>저장된 회사 소개 글 수</td>
				<td><b id="countAllIntro"></b>&nbsp개</td>
			</tr>
			<tr>
				<td>고객 문의 글 수</td>
				<td><b id="countAllQna"></b>&nbsp개</td>
			</tr>
			<tr>
				<td>총 카탈로그 수</td>
				<td><b id="countAllCatal"></b>&nbsp개</td>
			</tr>
			<tr>
				<td>총 메뉴 리스트</td>
				<td><b id="countAllMenuItem"></b>&nbsp개</td>
			</tr>
		</table>
	</div>
</div>

<script>
	$(document).ready(function(){
		$.ajax({
			type:'post',
			url:'/admin/getMainInfo.gs',
			success:displayResult,
			error:function(data){}
		});
		
		function displayResult(data){
			$("#allEnterCount").text(data.allEnterCount);
			$("#todayEnterCount").text(data.todayEnterCount);
			$("#countAllIntro").text(data.countAllIntro);
			$("#countAllQna").text(data.countAllQna);
			$("#countAllCatal").text(data.countAllCatal);
			$("#countAllMenuItem").text(data.countAllMenuItem);
		}
		
	});

</script>