<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--  template frame div  -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<!-- table frame div -->
	<div class="table-responsive">
		<h2>제품소개 관리</h2>
		<br />
		<h4 class="sub-header">카탈로그</h4>
		<label>총 카톨로그 수</label> : <label id="countAllCatal"></label>개<br>
		<label>최근 카탈로그 등록/수정 일</label> : <label id="latlytUpdateCatal"></label><br>
		<label>게시중인 카탈로그 수</label> : <label id="showingCatal"></label>개<br>
		<label>지운 카탈로그 수</label> : <label id="deletedCatal"></label>개<br>
		<button type="button" class="btn btn-primary btn-sm"
			onclick="window.location.href='/admin/main.gs?page=/adminForm/form_item_catalogue'">카탈로그
			관리</button>

		<br> <br>

		<h4 class="sub-header">메뉴</h4>
		<label>총 제품 수</label> : <label id="countAllMenuItem"></label>개<br>
		<label>최근 메뉴 등록/수정 일</label> : <label id="latlyInsertMenu"></label><br>
		<label>게시중인 메뉴 수</label> : <label id="showingMenu"></label>개<br>
		<label>지운 메뉴 수</label> : <label id="deletedMenu"></label>개<br>
		<button type="button" class="btn btn-primary btn-sm"
			onclick="window.location.href='/admin/main.gs?page=/adminForm/form_item_menu'">메뉴
			관리</button>

		<br />
	</div>
</div>

<script>
	$(document).ready(function(){
		$.ajax({
			type:'post',
			url:"/admin/getItemAdminPageData.gs",
			success:displayResult,
			error:function(e){}
		});
		
		function displayResult(data){
			$("#countAllCatal").text(data.countAllCatal);
			$("#latlytUpdateCatal").text(dateForm(data.latlyUpdateCatal));
			$("#showingCatal").text(data.showingCatal);
			$("#deletedCatal").text(data.deletedCatal);
			$("#countAllMenuItem").text(data.countAllMenuItem);
			$("#latlyInsertMenu").text(dateForm(data.latlyUpdateMenu));
			$("#showingMenu").text(data.showingMenu);
			$("#deletedMenu").text(data.deletedMenu);
		}
		
		//날짜 포멧
		function dateForm(obj){
			var date = new Date(obj);
			var dateForm = date.getFullYear() + "년 " + (date.getMonth() + 1) + "월 " + date.getDate() + "일 (" + date.getHours() + "시 "
					+ date.getMinutes() + "분 " + date.getSeconds() + "초)";
			return dateForm;
		}
	});
	

</script>

