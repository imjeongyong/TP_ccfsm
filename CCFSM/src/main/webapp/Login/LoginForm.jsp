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
    function validateForm(form) {
        if (!form.user_id.value) {
            // 모달창 코드 시작
            var modal = document.createElement('div');
            modal.classList.add('modal', 'fade');
            modal.id = 'myModal';
            modal.setAttribute('tabindex', '-1');
            modal.setAttribute('aria-labelledby', 'myModalLabel');
            modal.setAttribute('aria-hidden', 'true');
            modal.innerHTML = '<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><h4 class="modal-title" id="myModalLabel">로그인 오류</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></div><div class="modal-body"><p>아이디를 입력하세요.</p></div><div class="modal-footer"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button></div></div></div>';
            document.body.appendChild(modal);
            var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
                keyboard: false
            });
            myModal.show();
            // 모달창 코드 끝
            return false;
        }
        if (form.user_pw.value == "") {
            // 모달창 코드 시작
            var modal = document.createElement('div');
            modal.classList.add('modal', 'fade');
            modal.id = 'myModal';
            modal.setAttribute('tabindex', '-1');
            modal.setAttribute('aria-labelledby', 'myModalLabel');
            modal.setAttribute('aria-hidden', 'true');
            modal.innerHTML = '<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><h4 class="modal-title" id="myModalLabel">로그인 오류</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></div><div class="modal-body"><p>패스워드를 입력하세요.</p></div><div class="modal-footer"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button></div></div></div>';
            document.body.appendChild(modal);
            var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
                keyboard: false
            });
            myModal.show();
            // 모달창 코드 끝
            return false;
        }
    }
</script>
</head>
<body>
	<jsp:include page="/Frame/HeadNav.jsp" />
	<header class="bg"
		style="background-image: url('${pageContext.request.contextPath}/Resources/Images/img1.jpg'); background-size: cover;">
		<div class="container">
			<!-- 헤더 내용 -->
		</div>
	</header>
	<div class="container">
		<aside>
			<jsp:include page="/Navigator/LoginMenu.jsp" />
		</aside>
		<article>
			<div class="container">
				<form class="login-form mt-5" action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
					<div class="login-title">회원 로그인</div>
						<span style="color: red; font-size: 1.2em;"> 
						<%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
						</span>
					<div class="mb-3">
						<label for="username" class="form-label">아이디</label> 
						<input type="text" class="form-control" name="user_id" aria-describedby="usernameHelp">
					<div id="usernameHelp" class="form-text">아이디를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">비밀번호</label> 
						<input type="password" class="form-control" name="user_pw">
					</div>
					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input" id="remember">
						<label class="form-check-label" for="remember">로그인 유지하기</label>
					</div>
					<button type="submit" class="btn btn-warning">로그인</button>
				</form>
			</div>
		</article>
	</div>
	<jsp:include page="/Frame/Footer.jsp" />
</body>
</html>