<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> FOR VIP MEMBERS! </h1>
	<c:if test="${not empty pageContext.request.userPrincipal}">
		<p> Session On </p>
	</c:if>
	<c:if test="${empty pageContext.request.userPrincipal}">
		<p> 너....로그인을 안했구나? </p>
	</c:if>
	<p> HELLO ${pageContext.request.userPrincipal.name} </p>
	<a href="${pageContext.request.contextPath}/member/logout">Log Out</a>
</body>
</html>