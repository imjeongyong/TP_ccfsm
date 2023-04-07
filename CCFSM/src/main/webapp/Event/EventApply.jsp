<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행사 신청</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Resources/Style.css">
<jsp:include page="/Frame/Header.jsp" />
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
		<article style="overflow: auto;">
			<h1 class="display-6 m-2 p-2 bg-danger-subtle"
				style="text-align: center;">행사 신청</h1>

			<div class="m-2 p-2">
				<form action="../event/apply.do" method="post">

					<div class="mb-3">
						<!-- 이벤트 인덱스 -->
						<input type="hidden" class="form-control" name="idx" value="${edto.idx }">
						<!-- 회원 id -->
						<input type="hidden" class="form-control" name="userid" value="${mdto.id }">
					</div>
					<div class="mb-3">
						<label for="event_detail" class="form-label">행사 소개</label>
						<textarea class="form-control" id="event_detail" name="content" readonly>${edto.content }</textarea>
					</div>

					<div class="mb-3">
						<label for="start_time" class="form-label">행사 시작시간</label> 
						<input type="datetime-local" class="form-control" name="start_date" value="${edto.start_date }" readonly>
					</div>

					<div class="mb-3">
						<label for="end_time" class="form-label">행사 종료시간</label>
						<input type="datetime-local" class="form-control" name="end_date" value="${edto.end_date }" readonly>
					</div>

					<div class="mb-3">
						<label for="organization" class="form-label">신청 기관</label> 
						<input type="text" class="form-control" name="center_name" required>
					</div>

					<div class="mb-3">
						<label for="num_of_applicants" class="form-label">신청 인원</label>
						<input type="number" class="form-control" name="applicant_num" required>
					</div>

					<div class="mb-3">
						<label for="contact_info" class="form-label">연락처</label>
						<input type="tel" class="form-control" name="contect_info" required>
					</div>

					<button type="submit" class="btn btn-primary">전송</button>

				</form>
			</div>

		</article>
	</div>
	<footer>
		<jsp:include page="/Frame/Footer.jsp" />
	</footer>
</body>
</html>