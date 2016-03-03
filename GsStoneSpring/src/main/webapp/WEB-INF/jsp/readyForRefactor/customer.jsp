<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="../css/view.css" rel="stylesheet" type="text/css">

<title>GS STONE&BRICK</title>
<style type="text/css">
#intro_text{
		padding: 20px;
}
#intro_text h1{
	color: #BD0B26;
}
#boardTableWrap{
	margin:20px;
	width: 650px;
	min-height: 400px;
	height: auto;
}
#boardTableWrap table{
	margin-top:40px;	
	margin-left: 20px;
	border-top: 1px solid #d0d0d0;
	border-bottom: 1px solid #d0d0d0;
	padding: 20px 50px;
}
#boardTableWrap table tr{
}
#boardTableWrap table td{
	min-height: 40px;
	height: auto;
	font-size: 1.2em;
}
#boardTableWrap table td:nth-child(1){
	width: 100px;
}
#boardTableWrap table td:nth-child(2){
	width: 500px;
}
.inputstyle{
	border:1px solid #d0d0d0;
	width: 375px;
	height: 30px;
	font-size: 1.1em;
}
.textareastyle{
	border: 1px solid #d0d0d0;
}
.filestyle{
	width: 375px;
}
#customerBtn{
	background-color: #e8e8e8;
	border: 1px solid #777;
	padding: 5px 20px;
	margin: 10px 275px;
	float: right;
}

</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#customerBtn").click(function(){
			var name=$("input[name='customerName']").val();
			var contact=$("input[name='customerContact']").val();
			var subject=$("input[name='customerSubject']").val();
			if(name!="" && contact!=""&& subject!=""){
				$('#customerfr').submit();
			}else{
				alert("필수 입력 사항을 확인해 주세요. ");	
			}
		});
	});
</script>

</head>
<body>
	<!-- header -->
		<jsp:include page="../include/header.jsp" />
	<!-- header끝 -->
	
	<div id="wrap">
		<div id="viewbody">
		<div id="view_side">
			<ul class="view_side_intro">
				<li><h1>고객센터</h1></li>
				<li><br></li>
				<li><a href="../GsStone/customer.gs">문의하기</a></li>
			</ul>
		</div>
		
		<div id="intro_text">
		<h1>문의하기</h1>
			<div id="boardTableWrap">
			<form id="customerfr" action="./addCustomerQAction.admin" method="post" enctype="multipart/form-data">
				<table>
					<tr><td>이름 *</td><td><input type="text" name="customerName" class="inputstyle" placeholder="이름을 입력하세요"></input></td></tr>
					<tr><td>연락처 *</td><td><input type="text" name="customerContact" class="inputstyle" placeholder="연락받으실 연락처 또는 이메일 주소를 남겨 주세요"></input></td></tr>
					<tr><td>제목 *</td><td><input type="text" name="customerSubject" class="inputstyle"></input></td></tr>
					<tr><td>내용</td><td><textarea rows="15" cols="45" name="customerText" class="textareastyle" placeholder="문의사항 간략히 남겨주시면 연락 드리겠습니다."></textarea></td></tr>
					<tr><td></td><td> *는 필수 입력 사항입니다.<br><br>샘플 사진이나 파일을 첨부해 주시면 <br>원활한 답변이 가능합니다. (5MB이내 가능)</td></tr>
					<tr><td>첨부파일1</td><td><input type="file" name="customerfile1" class="filestyle"></input></td></tr>
					<tr><td>첨부파일2</td><td><input type="file" name="customerfile2" class="filestyle"></input></td></tr>
					<tr><td>첨부파일3</td><td><input type="file" name="customerfile3" class="filestyle"></input></td></tr>
				</table>
			</form>
				<button id="customerBtn">문의하기</button>
			</div>
		</div>
	</div>
	</div><!-- wrap 끝 -->
	
	<!-- footer -->
		<jsp:include page="../include/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>