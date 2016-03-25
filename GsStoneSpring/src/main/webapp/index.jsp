<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="naver-site-verification" content="57e5dbaafd6248085299cfa9cb54134eeb206dcc"/>
<meta property="og:type" content="website">
<meta property="og:title" content="GSSTONE">
<meta property="og:description" content="중국 현지 고벽돌, 고벽돌 타일, 홍고벽돌, 청고벽돌, 모노타일 제작 공급업체">
<meta property="og:image" content="http://www.gsstone.net/resources/upload/f77e8becaf5149d980c77b0fddebffe2.png">
<meta property="og:url" content="http://www.gsstone.net/">
<meta name="description" content="중국 현지 고벽돌, 고벽돌 타일, 홍고벽돌, 청고벽돌, 모노타일 제작 공급업체">

<title>GS STONE&BRICK</title>
	<%
	//접속 게이트
		/* [하는 일]
			1.접속 카운팅 
			2.ip로그 저장 DB에 저장 
			3.차단ip차단 (1시간 동안 기준 횟수 이상 접속 ip차단)
			4.홈페이지 메인으로 이동 시킴
		*/

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//SimpleDateFormat ipsdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//년 월 일까지 저장 
		String time = sdf.format(System.currentTimeMillis());
		//시간 분 초까지 상세 저장
		//String IpConnectedTime=ipsdf.format(System.currentTimeMillis());
		
		pageContext.forward("/common/enterCounting.gs?time="+time);
		
		// 접속 IP DB저장 
		//String clientIp=request.getRemoteAddr();//접속 IP주소
		//enterdao.ipConnectedInfo(clientIp,time,IpConnectedTime);
	%>
</head>
</html>