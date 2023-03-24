<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분당구 어린이 급식지원 관리 센터</title>
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
				<h3>메인 페이지 인클루드</h3>
			</article>
			<aside>
				<h3>사<br />이<br />드<br />바<br /></h3>
			</aside>
		</section>
		<footer>
			<h3>푸터</h3>
		</footer>
	</div>
</body>
</html>