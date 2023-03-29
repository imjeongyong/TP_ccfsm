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
<script>
	function validateForm() {
		// 아이디 검사
		var username = document.forms["signupForm"]["username"].value;
		if (username == null || username == ""
				|| !/^[a-zA-Z0-9]{4,16}$/.test(username)) {
			alert("아이디는 영문자와 숫자, 4자 이상 16자 이하로 입력해주세요.");
			return false;
		}
		// 비밀번호 검사
		var password = document.forms["signupForm"]["password"].value;
		var confirmPassword = document.forms["signupForm"]["confirmPassword"].value;
		if (password == null || password == "" || password != confirmPassword) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return false;
		}
		// 이름 검사
		var name = document.forms["signupForm"]["name"].value;
		if (name == null || name == "" || !/^[a-zA-Z가-힣]+$/.test(name)) {
			alert("이름은 영문자 또는 한글만 입력해주세요.");
			return false;
		}
	}
</script>
</head>
<body>

	<div class="container mt-5">
		<div class="joinFrm border border-black mx-auto p-3" style="width: 60%">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<h1 class="text-center mb-4">회원가입</h1>
					<form name="signupForm" action="signup_process.jsp"
						onsubmit="return validateForm()" method="post">
						<div class="mb-3">
							<label for="username" class="form-label">아이디</label> <input
								type="text" class="form-control" id="username" name="username"
								required>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">비밀번호</label> <input
								type="password" class="form-control" id="password"
								name="password" required>
						</div>
						<div class="mb-3">
							<label for="confirmPassword" class="form-label">비밀번호 확인</label> <input
								type="password" class="form-control" id="confirmPassword"
								name="confirmPassword" required>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">이메일 주소</label> <input
								type="email" class="form-control" id="email" name="email"
								required>
						</div>
						<div class="mb-3">
							<label for="name" class="form-label">이름</label> <input
								type="text" class="form-control" id="name" name="name" required>
						</div>
						<div class="d-grid gap-2">
							<button type="submit" class="btn btn-primary">가입하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>