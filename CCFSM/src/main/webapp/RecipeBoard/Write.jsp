<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 작성</title>
<script type="text/javascript">
	function validateForm(form) {
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.content.value == "") {
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
	}
</script>
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
				<jsp:include page="/Navigator/Board.jsp" />
			</nav>
			<article>
				<h2>레시피 작성하기</h2>
				<form name="writeForm" method="post" enctype="multipart/form-data"
					action="../recipeboard/write.do"
					onsubmit="return validateForm(this);">

					<table border="1" width="90%">
						<tr>
							<td>작성자</td>
							<td><input type="hidden" name="userid"
								value="${sessionScope.UserId }" style="width: 90%;" /></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" style="width: 90%;" /></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="content"
									style="width: 90%; height: 100px;"></textarea></td>
						</tr>
						<tr>
							<td>첨부 파일</td>
							<td><input type="file" name="ofile" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button type="submit">작성 완료</button>
								<button type="reset">RESET</button>
								<button type="button"
									onclick="location.href='../recipeboard/list.do';">목록
									바로가기</button>
							</td>
						</tr>
					</table>

				</form>
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