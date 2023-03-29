<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="bg-black">
		<div align="right">
			<a href="${pageContext.request.contextPath}/Index.jsp"
				class="link-light link-offset-2 link-underline-opacity-0">HOME |
			</a>
			<%
			if (session.getAttribute("UserId") == null) {
			%>
			<a href="${pageContext.request.contextPath}/Login/LoginForm.jsp"
				class="link-light link-offset-2 link-underline-opacity-0">LOGIN
				| </a>
			<%
			} else {
			%>
			<a href="${pageContext.request.contextPath}/Login/Logout.jsp"
				class="link-light link-offset-2 link-underline-opacity-0">LOGOUT
				| </a>
			<%
			}
			%>
			<a href="${pageContext.request.contextPath}/Login/JoinForm.jsp"
				class="link-light link-offset-2 link-underline-opacity-0">JOIN |
			</a> <a href="#"
				class="link-light link-offset-2 link-underline-opacity-0">SITEMAP
			</a>
		</div>
	</div>
</body>
</html>