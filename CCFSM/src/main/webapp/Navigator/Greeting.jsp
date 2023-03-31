<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.sidebar ul.nav li:hover {
	background-color: #ffc1071a;
}

.sidebar ul.nav li.nav-item a {
	color: black;
}
</style>
</head>
<body>
	<div id="sidebarMenu" class="collapse d-lg-block bg-light sidebar">
		<div class="position-sticky">
			<h3 class="text-center mt-3 mb-4 bg-warning">센터 소개</h3>
			<ul class="nav flex-column" style="">
				<li class="nav-item"><a class="nav-link"
					style="text-align: right"
					href="${pageContext.request.contextPath}/Greeting/Greeting.jsp">인사말</a></li>
				<li class="nav-item"><a class="nav-link"
					style="text-align: right"
					href="${pageContext.request.contextPath}/Greeting/Map.jsp">오시는 길</a></li>
			</ul>
		</div>
	</div>
</body>
</html>