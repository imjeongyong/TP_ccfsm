<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>식단표 게시글 수정하기</h2>
	<form name="writeFrm" method="post" enctype="multipart/form-data"
		action="../menuboard/edit.do" onsubmit="return validateForm(this);">
		<input type="hidden" name="idx" value="${dto.idx }" /> <input
			type="hidden" name="prevOfile" value="${dto.ofile }" /> <input
			type="hidden" name="prevSfile" value="${dto.sfile }" />

		<table border="1" width="90%">
			<tr>
				<td>작성자</td>
				<td><input type="hidden" name="userid" value="${dto.userid }"
					style="width: 150px;" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width: 90%"
					value="${dto.title }" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" style="width: 90%; height: 100px;">${dto.content } </textarea>
				</td>
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
						onclick="location.href='../menuboard/list.do';">목록 바로가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>