<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험관 소개</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Resources/layout.css">
<jsp:include page="/Frame/Header1.jsp" />
</head>
<body>

	<div class="container">
		<header>
			<jsp:include page="/Frame/MenuTab.jsp" />
		</header>
		<section>
			<nav>
				<h3>사이드바 페이지 인클루드</h3>
			</nav>
			<article>
				<h3>체험관 소개글~~~~~~</h3>
			</article>
			<aside>
				<h3>칸 떼우기 사진</h3>
			</aside>
		</section>
		<footer>
			<h3>푸터</h3>
		</footer>
	</div>

</body>
</html>