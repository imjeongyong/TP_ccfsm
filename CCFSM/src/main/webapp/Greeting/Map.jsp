<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오시는 길</title>
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
				<jsp:include page="../Navigator/Greeting.jsp" />
			</nav>
			<article>
				<h3>오시는길</h3>
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