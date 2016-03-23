<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- header and sideBar -->
<%@ include file="/WEB-INF/jsp/include/bootstrap-includ-header.jspf" %>
<%@ include file="/WEB-INF/jsp/include/admin-includ-header.jspf" %>


	<!-- variable jsp template  -->
	<c:if test="${empty sessionScope.sessionMap}">
		<jsp:forward page="/login.gs"></jsp:forward>
	</c:if>
	
	<!-- request page file name for move -->
	<!-- default page is overview.jsp -->
	<c:choose>
	<c:when test="${not empty page}">
		<jsp:include page="./template/${page}.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="./template/overview.jsp"></jsp:include>
	</c:otherwise>
	</c:choose>
	


<!-- script and /body, /html -->
<%@ include file="/WEB-INF/jsp/include/admin-includ-body.jspf" %>
<%@ include file="/WEB-INF/jsp/include/bootstrap-includ-body.jspf" %>    
</html>