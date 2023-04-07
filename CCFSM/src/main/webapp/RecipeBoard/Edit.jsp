<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 게시글 수정하기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Resources/Style.css">
<jsp:include page="/Frame/Header.jsp" />
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
<style>
.write-form {
	width: 75%;
}
</style>
</head>
<body>
	<jsp:include page="/Frame/HeadNav.jsp" />
	<header>
		<img src="${pageContext.request.contextPath}/Resources/Images/img1.jpg" style="height: 100%; width: 100%">
	</header>
	<div class="container">
		<aside>
			<jsp:include page="/Navigator/Board.jsp" />
		</aside>
		<article>
			<h1 class="display-6 m-2 p-2 bg-danger-subtle" style="text-align: center;">레시피 게시글 수정하기</h1>
			<form name="writeFrm" method="post" enctype="multipart/form-data"
				action="../recipeboard/edit.do" onsubmit="return validateForm(this);">
				<input type="hidden" name="idx" value="${dto.idx }" /> 
				<input type="hidden" name="prevOfile" value="${dto.ofile }" /> 
				<input type="hidden" name="prevSfile" value="${dto.sfile }" />
				<div class="row justify-content-center">
					<div class="col-md-8">
						<div class="mb-3">
							<input type="hidden" name="userid"
								value="${sessionScope.UserId }" class="form-control">
						</div>
						<div class="mb-3">
							<label for="title" class="form-label">제목</label> 
							<input type="text" name="title" class="form-control" id="title"
								value="${dto.title }">
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">내용</label>
							<textarea name="content" class="form-control" id="content"
								rows="5" required>${dto.content }</textarea>
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">첨부 파일</label>
							<input type="file" name="ofile" class="form-control" id="ofile">
						</div>
						<div class="mb-3 text-center">
							<button type="submit" class="btn btn-warning">작성 완료</button>
							<button type="reset" class="btn btn-warning">RESET</button>
							<button type="button" class="btn btn-warning"
								onclick="location.href='../menuboard/list.do';">목록 바로가기</button>
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