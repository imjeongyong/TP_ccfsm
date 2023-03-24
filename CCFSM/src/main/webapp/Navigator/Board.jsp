<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Resources/navStyle.css">
</head>
<body>
	<div class="nav">
		게시판<br />
		<a href="${pageContext.request.contextPath}/menuboard/list.do">식단표 게시판</a><br />
		<a href="${pageContext.request.contextPath}/recipeboard/list.do">레시피 게시판</a>
	</div>
</body>
</html>