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
<style>
@media screen and (min-width: 993px) {
	.dropdown:hover .dropdown-menu {
		display: block !important;
	}
	.dropdown:focus .dropdown-menu {
		display: block !important;
	}
	.dropdown .dropdown-menu.show {
		display: none !important;
	}
}
</style>
<nav class="navbar navbar-expand-lg bg-body-tertiary mt-0">
	<div class="container mb-0">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/Index.jsp"> 
		<img src="${pageContext.request.contextPath}/Resources/Images/icon1.jpg"
			alt="HOME" width="40" height="34">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mx-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/Index.jsp">
						홈
					</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle"
						href="${pageContext.request.contextPath}/Greeting/Greeting.jsp"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							센터소개 
					</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/Greeting/Greeting.jsp">인사말</a>
						</li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/Greeting/Map.jsp">오시는 길</a>
						</li>
					</ul>
				</li>

				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle"
					href="${pageContext.request.contextPath}/Experience/Introduce.jsp"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						체험관 활동
					</a>
					<ul class="dropdown-menu">
						<li>
							<a class="dropdown-item"
							href="${pageContext.request.contextPath}/Event/Guide.jsp">체험관 안내</a>
						</li>
						<li>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/event/view.do">체험관 신청</a>
						</li>
					</ul>
				</li>

				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle"
					href="${pageContext.request.contextPath}/menuboard/list.do"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						식단 / 표준 레시피 
					</a>
					<ul class="dropdown-menu">
						<li>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/menuboard/list.do">식단표</a>
						</li>
						<li>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/recipeboard/list.do">표준 레시피</a>
						</li>
					</ul>
				</li>

				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle"
					href="${pageContext.request.contextPath}/noticeboard/list.do"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						알림마당 
					</a>
					<ul class="dropdown-menu">
						<li>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/noticeboard/list.do">공지사항</a>
						</li>
						<li>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/qnaboard/list.do">질문 게시판</a>
						</li>
						<li>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/photoboard/list.do">포토 갤러리</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
</html>