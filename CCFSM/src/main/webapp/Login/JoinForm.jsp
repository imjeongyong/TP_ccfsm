<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Resources/Style.css">
<jsp:include page="/Frame/Header.jsp" />
<script>
	function validateForm() {
		// 아이디 검사
		var username = document.forms["signupForm"]["user_id"].value;
		if (username == null || username == ""
				|| !/^[a-zA-Z0-9]{4,16}$/.test(username)) {
			alert("아이디는 영문자와 숫자, 4자 이상 16자 이하로 입력해주세요.");
			return false;
		}
		// 비밀번호 검사
		var password = document.forms["signupForm"]["user_pw"].value;
		var confirmPassword = document.forms["signupForm"]["user_pw_confirm"].value;
		if (password == null || password == "" || password != confirmPassword) {
			alert("비밀번호를 확인해 주세요.");
			return false;
		}
		// 이름 검사
		var name = document.forms["signupForm"]["user_name"].value;
		if (name == null || name == "" || !/^[a-zA-Z가-힣]+$/.test(name)) {
			alert("이름은 영문자 또는 한글만 입력해주세요.");
			return false;
		}
	}
</script>

<%
String isSuccess = (String) request.getAttribute("JoinSuccess");
if (isSuccess != null && isSuccess.equals("ok")) {
%>
<script>
    alert("아이디 생성 완료!");
    location.href="LoginForm.jsp";
</script>
<%
}
%>
</head>
<body>
	<jsp:include page="/Frame/HeadNav.jsp" />
	<header>
		<img src="${pageContext.request.contextPath}/Resources/Images/img1.jpg" style="height: 100%; width: 100%">
	</header>
	<div class="container">
		<aside>
			<jsp:include page="/Navigator/LoginMenu.jsp" />
		</aside>
		<article>
			<div class="container">
				<div class="join-form mt-5">
					<div class="row">
						<div class="col-md-6 offset-md-3">
							<h1 class="text-center join-title">회원가입</h1>
							<form name="signupForm" action="JoinProcess.jsp"
								onsubmit="return validateForm()" method="post">
								<div class="mb-3">
									<label for="username" class="form-label">아이디</label> 
									<input type="text" class="form-control" name="user_id" required>
								</div>
								<div class="mb-3">
									<label for="password" class="form-label">비밀번호</label> 
									<input type="password" class="form-control" name="user_pw" required>
								</div>
								<div class="mb-3">
									<label for="confirmPassword" class="form-label">비밀번호 확인</label>
									<input type="password" class="form-control"
										name="user_pw_confirm" required>
								</div>
								<div class="mb-3">
									<label for="email" class="form-label">이메일 주소</label> 
									<input type="email" class="form-control" name="user_email" required>
								</div>
								<div class="mb-3">
									<label for="name" class="form-label">이름</label> 
									<input type="text" class="form-control" name="user_name" required>
								</div>
								<div class="mb-3">
								<span style="color: red; font-size: 1.2em;"> 
									<%=request.getAttribute("JoinErrMsg") == null ? "" : request.getAttribute("JoinErrMsg")%>
								</span>
								</div>
								<div class="d-grid gap-2">
									<button type="submit" class="btn btn-warning">가입하기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</article>
	</div>
	<footer>
		<jsp:include page="/Frame/Footer.jsp" />
	</footer>
</body>
</html>