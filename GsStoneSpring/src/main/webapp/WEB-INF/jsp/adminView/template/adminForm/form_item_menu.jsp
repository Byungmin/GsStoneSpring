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
		<table class="table table-bordered" id="result">
			<colgroup>
				<col width="5%" />
				<col width="*" />
				<col width="20%" />
				<col width="15%" />
				<col width="20%" />
				<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th>no</th>
					<th>상품명</th>
					<th>상품가격</th>
					<th>상품규격</th>
					<th>작성일</th>
					<th>작성자</th>
				</tr>
			</thead>
		
		</table>
			<button id="menuBtn" class="btn btn-primary btn-sm">메뉴 추가하기</button>
		<br />
			
			<div id="writeBox" style="display: none;">
				<h4 class="sub-header">메뉴 추가</h4>
		
				<form id="frmItem" name="frmItem" action="/admin/insertItem.gs" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="exampleInputName2">상품명</label> <input type="text"
							class="form-control" id="TITLE" name="TITLE">
					</div>
					<div class="form-group">
						<label for="exampleInputName2">상품가격</label> <input type="text"
							class="form-control" id="PRICE" name="PRICE">
					</div>
					<div class="form-group">
						<label for="exampleInputName2">상품규격</label> <input type="text"
							class="form-control" id="SIZE" name="SIZE">
					</div>
		
					<div class="form-group">
						<label for="companyIntroduce">상품설명</label>
						<textarea class="form-control" id="CONTENTS" rows="5" name="CONTENTS"></textarea>
					</div>
					
					<div id="fileDiv" class="form-group">
					<label for="inputImgFile">상품 사진</label>
						<p><input type="file" id="file" name="file_0" class="filestyle">
						 <a href="#this" id="delete" name="delete">삭제</a></p>
					</div>
					<div class="form-group">
						<button id="addFile" class="btn btn-primary btn-sm">파일추가</button>
					</div>
		
					<p id="msg" style="color: red;"></p>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-sm">작성하기</button>
						<button type="reset" class="btn btn-primary btn-sm">다시 작성</button>
					</div>
					<input type="hidden" name="CREA_ID" value="${sessionScope.sessionMap.emp_id}">
				</form>
			</div>
		

		<br />

	</div>
</div>
<script>
	$(document).ready(function(){
		
		$("button[type='submit']").on("click",function(e){
			console.log("click");
			e.preventDefault();
			if($("#TITLE").val()==null||$("#TITLE").val()==""){
				$("#msg").text("상품명을 입력하세요");
			}else if($("#PRICE").val()==null||$("#PRICE").val()==""){
				$("#msg").text("상품가격을 입력하세요");
			}else if($("#SIZE").val()==null||$("#SIZE").val()==""){
				$("#msg").text("상품규격을 입력하세요");
			}else if($("#CONTENTS").val()==null||$("#CONTENTS").val()==""){
				$("#msg").text("상품설명을 입력하세요");
			}
			
			else{
				$("#frmItem").submit();
			}
		});
		
		
		//메뉴 추가하기
			$("#menuBtn").on("click",function(){
				$("#writeBox").attr("style", "visibility:visible");
			});
		
		//메뉴 리스트 가지고 오기
			$.ajax({
				type:"POST",
				url:"/admin/getItemList.gs",
				success:displayResult,
				error:function(data){
				}
			});		
		
		function displayResult(data){
			
			var output = "<tbody>";
			for (var i = 0; i < data.length; i++) {
				var date = new Date(data[i].CREA_DTM);
				var dateForm = date.getFullYear() + " / " + (date.getMonth() + 1) + " / " + date.getDate();
				
				output += "<tr>";
				output += "<td>" + data[i].IDX + "</td>";
				output += "<td><a href='/admin/main.gs?page=/adminForm/form_Detail_item_menu&IDX="+data[i].IDX+"'>" + data[i].TITLE + "</></td>";
				output += "<td>" + data[i].PRICE + "</td>";
				output += "<td>" + data[i].SIZE + "</td>";
				output += "<td>" + dateForm + "</td>";
				output += "<td>" + data[i].CREA_ID + "</td>";
				output += "</tr>";
			}
			output += "</tbody>";
			$("#result").append(output);
		}
		
		
		//메뉴 추가하기 버튼	
			$("#submitBtn").on("click",function(){
				console.log("click");
				$("#frmItem").submit(function(e){
					e.preventDefault();
					location.reload();
				});
			});
			
	//첨부파일 추가 삭제			
		var gfv_count = 1;
			$("#addFile").on("click", function(e){ //파일 추가 버튼
	            e.preventDefault();
	            fn_addFile();
	        });
			 $("a[name='delete']").on("click", function(e){ //삭제 버튼
	                e.preventDefault();
	                fn_deleteFile($(this));
	        });
		 
		function fn_addFile(){
		          var str = "<p><input type='file' class='filestyle' name='file_"+(gfv_count++)+"'> <a href='#this' name='delete'>삭제</a></p>";
		          $("#fileDiv").append(str);
		          $("a[name='delete']").on("click", function(e){ //삭제 버튼
		              e.preventDefault();
		              fn_deleteFile($(this));
		          });
		      }
		function fn_deleteFile(obj){
		          obj.parent().remove();
		      }
		
	});//ready

</script>

