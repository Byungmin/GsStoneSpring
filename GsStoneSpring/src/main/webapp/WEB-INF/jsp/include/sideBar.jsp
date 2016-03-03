<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
#viewbody{
	width: 1000px;
	min-height: 400px;
	height: auto;
}
.sideBar{
	float:left;
	clear:left;
	width: 250px;
	height: auto;
}
.substance{
	float:right;
	width: 740px;
	height: auto;
}

.sideBar ul{
	border-bottom: 2px solid #ccc;
}

.sideBar a{
	display: block;
	padding:12px 35px 13px 20px;
	font-size:14px;
	font-weight:bold;
	color: #666;
	border-bottom: 1px solid #eee;
}
.sideBar a:HOVER{
	color: #333;
}

</style>


			<div class="sideBar">
				<ul></ul>
				<ul>				
					<li><a href="../GsStone/adminPage.admin"><b>기본정보</b></a></li>
					<li><a href="../GsStone/intro_adminPage.admin">회사 소개 관리</a></li>
					<li><a href="../GsStone/item_adminPage.admin">제품 소개 관리</a></li>
					<li><a href="../GsStone/qna_adminPage.admin">고객 문의 관리</a></li>
					<li><a href="../GsStone/staff_adminPage.admin">직원 관리</a></li>
					<li><a href="../GsStone/client_adminPage.admin">고객 관리</a></li>
					<li><a href="../GsStone/book_adminPage.admin">장부 관리</a></li>
					<li><a href="../GsStone/logout_adminPage.admin">로그아웃</a></li>
				</ul>
			</div>


