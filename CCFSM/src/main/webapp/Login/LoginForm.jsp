<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>로그인</title>
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
				<h2>로그인 페이지</h2>
				<span style="color: red; font-size: 1.2em;"> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
				</span>
				<%
				if (session.getAttribute("UserId") == null) { // 로그인 상태 확인
					// 로그아웃 상태
				%>
				<script>
					function validateForm(form) {
						if (!form.user_id.value) {
							alert("아이디를 입력하세요.");
							return false;
						}
						if (form.user_pw.value == "") {
							alert("패스워드를 입력하세요.");
							return false;
						}
					}
				</script>
				<form action="LoginProcess.jsp" method="post" name="loginFrm"
					onsubmit="return validateForm(this);">
					아이디 : <input type="text" name="user_id" /><br /> 패스워드 : <input
						type="password" name="user_pw" /><br /> <input type="submit"
						value="로그인하기" />
				</form>
				<%
				} else { // 로그인된 상태
				%>
				<%=session.getAttribute("UserName")%>
				회원님, 로그인하셨습니다.<br /> <a href="Logout.jsp">[로그아웃]</a>
				<%
				}
				%>
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