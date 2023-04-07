<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험관 행사 입력</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Resources/Style.css">
<jsp:include page="/Frame/Header.jsp" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" />

</head>
<body>
	<jsp:include page="/Frame/HeadNav.jsp" />
	<header>
		<img src="${pageContext.request.contextPath}/Resources/Images/img1.jpg" style="height: 100%; width: 100%">
	</header>
	<div class="container">
		<aside>
			<jsp:include page="/Navigator/Event.jsp" />
		</aside>
		<article>
			<h1 class="display-6 m-2 p-2 bg-danger-subtle" style="text-align: center;">
				체험관 행사 등록
			</h1>

			<div class="m-2 p-2">
				<form action="../event/input.do" method="post">
					<div class="mb-3">
						<label for="title" class="form-label">행사 이름</label> 
						<input type="text" class="form-control" id="title" name="title" required>
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">행사 소개</label> 
						<input type="text" class="form-control" id="content" name="content" required>
					</div>
					<div class="mb-3">
						<label for="start_date" class="form-label">행사 시작</label> 
						<input type="datetime-local" class="form-control" id="start_date" name="start_date" required>
					</div>
					<div class="mb-3">
						<label for="end_date" class="form-label">행사 종료</label> 
						<input type="datetime-local" class="form-control" id="end_date" name="end_date" required>
					</div>
					<div class="mb-3">
						<label for="capa" class="form-label">정원</label> 
						<input type="number" class="form-control" id="capa" name="capa" required>
					</div>
					<button type="submit" class="btn btn-warning">입력완료</button>
				</form>
			</div>

		</article>
	</div>
	<footer>
		<jsp:include page="/Frame/Footer.jsp" />
	</footer>
</body>
</html>