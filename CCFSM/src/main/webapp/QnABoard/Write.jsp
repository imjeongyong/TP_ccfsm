<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 하기</title>
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
			<jsp:include page="/Navigator/Notice.jsp" />
		</aside>
		<article>
			<h1 class="display-6 m-2 p-2 bg-danger-subtle" style="text-align: center;">질문 작성</h1>
			<form name="writeForm" method="post" action="../qnaboard/write.do" onsubmit="return validateForm(this);">
				<div class="row justify-content-center">
					<div class="col-md-8">
						<div class="mb-3">
							<input type="hidden" name="userid" value="${sessionScope.UserId }" class="form-control">
						</div>
						<div class="mb-3">
							<label for="title" class="form-label">제목</label> 
							<input type="text" name="title" class="form-control" id="title" required>
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">내용</label>
							<textarea name="content" class="form-control" id="content" rows="5" required></textarea>
						<div class="mb-3">
							<label for="pass" class="form-label">비밀번호</label> 
							<input type="password" name="pass" class="form-control" id="pass" required>
						</div>
						</div>
						<div class="mb-3 text-center">
							<button type="submit" class="btn btn-warning">작성 완료</button>
							<button type="reset" class="btn btn-warning">RESET</button>
							<button type="button" class="btn btn-warning" onclick="location.href='../qnaboard/list.do';">
								목록 바로가기
							</button> 
						</div>
					</div>
				</div>
			</form>
		</article>
	</div>
	<footer>
		<jsp:include page="/Frame/Footer.jsp" />
	</footer>
</body>
</html>