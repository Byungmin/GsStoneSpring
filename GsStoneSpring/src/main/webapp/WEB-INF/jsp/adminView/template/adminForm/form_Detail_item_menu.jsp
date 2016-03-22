<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--  template frame div  -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<!-- table frame div -->
	<div class="table-responsive">
		<h2>제품소개 관리</h2>
		<h3 class="sub-header">메뉴 관리하기</h3>

		<br />
		<h4 class="sub-header">메뉴 상세 보기</h4>
			
			<div id="writeBox">
		
				<form id="frmItemUpdate" name="frmItemUpdate" action="/admin/updateItem.gs" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="exampleInputName2">작성자</label> : <label id="CREA_ID"></label><br />
						<label for="exampleInputName2">작성시간</label> : <label id="CREA_DTM"></label>
					</div>
					
					<div class="form-group">
						<label for="exampleInputName2">상품명</label> <input type="text" 
							class="form-control" id="TITLE" name="TITLE" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputName2">상품가격</label> <input type="text"
							class="form-control" id="PRICE" name="PRICE" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputName2">상품규격</label> <input type="text"
							class="form-control" id="SIZE" name="SIZE" readonly="readonly">
					</div>
		
					<div class="form-group">
						<label for="companyIntroduce">상품설명</label>
						<textarea class="form-control" rows="5" id="CONTENTS" name="CONTENTS" readonly="readonly"></textarea>
					</div>
					<div id="fileDiv" class="form-group">
					<label for="inputImgFile">상품 사진</label>
						<!-- 미리보기 사진 공간 -->
					</div>
					
					<div id="fileUpdate" class="form-group" style="display:none;">
						<!-- 파일 추가 및 수정 공간 -->
						<p><input type='file' class='filestyle' name='file_0'><a href='#this' name='delete' class='btn btn-primary btn-xs'>삭제</a></p>
					</div>
					<div class="form-group" style="visibility:hidden;">
						<button id="addFile" class="btn btn-primary btn-sm">파일추가</button>
					</div>
		
					<div class="form-group">
						<button id="update" class="btn btn-primary btn-sm">수정하기</button>
						<button type="submit" class="btn btn-primary btn-sm" style="visibility:hidden;">변경내용 저장 하기</button>
						<button type="reset" class="btn btn-primary btn-sm" style="visibility:hidden;">다시 작성</button>
						<a href="/admin/deleteItem.gs?IDX=${param.IDX}" class="btn btn-primary btn-sm" style="visibility:hidden;">글 삭제</a>
					</div>
					<input type="hidden" name="CREA_ID" value="${sessionScope.sessionMap.emp_id}">
					<input type="hidden" id="IDX" name="IDX" value="${param.IDX}">
				</form>
			</div>
		

		<br />

	</div>
</div>
<script>
	$(document).ready(function(){
		
		$("#update").on("click",function(e){
			e.preventDefault();
			console.log("clickUpdateBtn");
			$(".form-group input").attr("readOnly",false);
			$(".form-group textarea").attr("readOnly",false);
			$(".form-group button").attr("style", "visibility:visible;");
			$(".form-group a").attr("style", "visibility:visible;");
			$("#fileUpdate").attr("style", "display: block;");
			$(".form-group #update").attr("disabled", "disabled");
			$("#fileDiv a").attr("style", "display: block;");
		});
		
		
		var getDetailItemUrl = "/admin/getItemDetail.gs";
		var getDetailItemParam ={"IDX" : "${param.IDX}"}; 
		
		$.ajax({
			type:"POST",
			url : getDetailItemUrl,
			data : getDetailItemParam,
			success : displayResult,
			error : function(data) {
			}
		});
		
		function displayResult(data){
			var date = new Date(data.CREA_DTM);
			var dateForm = date.getFullYear() + "년 " + (date.getMonth() + 1) + "월 " + date.getDate() + "일 (" + date.getHours() + "시 "
					+ date.getMinutes() + "분 " + date.getSeconds() + "초)";
			
			$("#CREA_ID").text(data.CREA_ID);
			$("#CREA_DTM").text(dateForm);
			$("#TITLE").attr("value",data.TITLE);
			$("#PRICE").attr("value",data.PRICE);
			$("#SIZE").attr("value",data.SIZE);
			$("#CONTENTS").text(data.CONTENTS);
			
			
			var imgFile = "<table><tr>";
			for(var i=0;i<data.fileList.length;i++){
				imgFile += "<td><img src='/resources/upload/"+data.fileList[i].STORED_FILE_NAME+"' style='width:200px;height:200px;'>"
					+"<p class='text-center'><b>"+data.fileList[i].ORIGINAL_FILE_NAME+"</b></p>"
					+"<p class='text-center'>("+data.fileList[i].FILE_SIZE+"kb)&nbsp&nbsp<a href='/admin/deletePicture.gs?BOARD_IDX="+${param.IDX}+"&IDX="+data.fileList[i].IDX+"' class='btn btn-primary btn-xs' style='display: none;'>삭제</a></p>"
					+"</td><input type='hidden' name=''><td>&nbsp&nbsp</td>";
					if((i+1)%3==0){imgFile +="</tr><tr>";}
			}
			imgFile += "</tr></table>";
			$("#fileDiv").append(imgFile);
		}
		
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
		          var str = "<p><input type='file' class='filestyle' name='file_"+(gfv_count++)+"'><a href='#this' name='delete' class='btn btn-primary btn-xs'>삭제</a></p>";
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
