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
	function checkPassword() {
		const password = document.getElementById("passwordInput").value;

		if (password === "0000") {
			window.location.href = "../Index.jsp";
			document.getElementById("passwordModal").modal("hide");
		} else {
			alert("비밀번호가 틀렸습니다.");
		}
	}
</script>
</head>
<body>


	<a href="../Index.jsp" data-bs-toggle="modal"
		data-bs-target="#passwordModal">인덱스 모달</a>

	<div class="modal fade" id="passwordModal" tabindex="-1"
		aria-labelledby="passwordModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="passwordModalLabel">비밀번호 확인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<label for="passwordInput" class="form-label">비밀번호:</label> <input
						type="password" class="form-control" id="passwordInput">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						onclick="checkPassword()">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>