<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/include/bootstrap-basic-header.jspf"%>
<title>GSSONTE</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/home-header.jspf"%>


	<!-- Begin page content -->
	<div class="container">
		<div class="page-header">
			<h1>제품소개</h1>
		</div>

		<div class="dropdown">
			<button id="dLabel"  class="btn btn-default btn-lg" type="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
				제품 리스트<span class="caret"></span>
			</button>
			<ul id="dropdownUl" class="dropdown-menu" aria-labelledby="dLabel">
				<li><a href="/cataloguePage.gs">카타로그</a></li>
				<li role="separator" class="divider"></li>
				<!-- 제품리스트 공간 -->
			</ul>
			<span><strong>&nbsp&nbsp제품을 선택 하세요.</strong></span>
		</div>
		
		<!-- 이하 선택한 제품 소개글 출력 -->
		<div class="page-header">
			<h3>상세 설명</h3>
		</div>
		<div>
			<div class="page-header">
			<label style="font-size: 17px;">제품명 : </label> <label id="itemName"  style="font-size: 17px;"></label><br>
			<label style="font-size: 17px;">규 격 : </label> <label id="itemSize" style="font-size: 17px;"></label><br>
			<label style="font-size: 17px;">가 격 : </label> <label id="itemPrice" style="font-size: 17px;"></label>
			<br><br>
			<p id="itemContext"  style="font-size: 17px;"></p>
			</div>
			<br>
			
			<!-- 사진위치 -->
			<div id="img"></div>
			
			<input type="hidden" id="paramIDX" value="${param.IDX}">
		</div>
	</div>

	<%@ include file="/WEB-INF/jsp/include/home-footer.jspf"%>
	<%@ include file="/WEB-INF/jsp/include/bootstrap-basic-body.jspf"%>
	
	<script>
		$(document).ready(function(){
			
			//제품 리스트 드롭다운
			$.ajax({
				type:'POST',
				url:"/customer/getItemList.gs",
				success:itemList,
				error:function(data){console.log(data)}
			});
			
			function itemList(data){
				console.log(data);
				var output="";
					for(var i=0;i<data.length;i++){
						output += "<li><a href='/item.gs?IDX="+data[i].idx+"'>"+data[i].title+"</a></li>"; 
					}
				$("#dropdownUl").append(output);
			}
			
			var paramIDX = $("#paramIDX").val();
			
			if(paramIDX!=null&&paramIDX!=""){
				var url = "/customer/getItemDetail.gs";
				var param = {"IDX" : paramIDX};
				$.post(url, param, getItemDetailData)	
			}
			
			function getItemDetailData(data){
				console.log(data);
				$("#itemName").text(data.TITLE);
				$("#itemSize").text(data.SIZE);
				$("#itemPrice").text(data.PRICE);
				
				var contexts = data.CONTENTS;
				var line = /\r\n/g;
				 var space = /\s/g;
				contexts = contexts.replace(line,"<br>");
				contexts = contexts.replace(space, "&nbsp");
				
				$("#itemContext").html(contexts);
				
				var itemFile = data.itemFile;
				var imgput = "";
				for(var i=0;i<itemFile.length;i++){
					imgput += "<img src='/resources/upload/"+itemFile[i].STORED_FILE_NAME+"' alt='이미지가 없습니다.' class='img-thumbnail' width='350'>";
				}
				$("#img").append(imgput);
			}
		});
	
	</script>
</body>
</html>