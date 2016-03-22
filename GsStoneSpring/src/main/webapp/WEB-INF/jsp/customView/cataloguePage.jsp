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
		
		<!-- Large modal -->
		
		<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" id="imgClose" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">사진 확대</h4>
		      </div>
		      <div class="modal-body">
		      <!-- 확대사진 -->
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 이하 카탈로그 출력 -->
		<div class="page-header">
			<h3>카탈로그</h3>
		</div>
			<div id="catalogueList">
			<br>
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
				var output="";
					for(var i=0;i<data.length;i++){
						output += "<li><a href='/item.gs?IDX="+data[i].idx+"'>"+data[i].title+"</a></li>"; 
					}
				$("#dropdownUl").append(output);
			}
			
			var url = "/customer/getCatalogues.gs";
			$.post(url,displayCatalogues);
			function displayCatalogues(data){
				var output = "";
				for(var i=0;i<data.length;i++){
					output += "<div class='col-xs-6 col-sm-3 placeholder'>";
					output += "<a href='#' name='clickImg' data-toggle='modal' data-target='.bs-example-modal-lg'><img src='/resources/upload/"+data[i].img.STORED_FILE_NAME+"' width='200' height='200' class='img-responsive'"
								+"alt='저장된 사진이 없습니다.'></a>";
					output += "<h4>"+data[i].TITLE+"</h4>";
					output += "</div>"
				}
				$("#catalogueList").append(output);

				$("a[name='clickImg']").on("click",function(e){
					e.preventDefault();
					clickImg($(this));
				});
			}
			
			function clickImg(obj){
				var getImgName = obj[0].innerHTML;
				$(".modal-body").append(getImgName);
				$(".modal-body img").attr("width","100%");
			}
			$("#imgClose").on("click",function(){
				$(".modal-body").empty();
			});
			
		});
	
	</script>
</body>
</html>