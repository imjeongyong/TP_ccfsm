<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단표</title>
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
				<h2>식단표 상세보기</h2>
				<table border="1" width="90%">
					<colgroup>
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col width="*" />
					</colgroup>

					<!-- 게시글 정보 -->
					<tr>
						<td>번호</td>
						<td>${dto.idx }</td>
						<td>작성자</td>
						<td>${dto.userid }</td>
					</tr>
					<tr>
						<td>작성일</td>
						<td>${dto.postdate }</td>
						<td>조회수</td>
						<td>${dto.visitcount }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3" height="100">${dto.content }</td>
					</tr>

					<!-- 첨부파일 -->
					<tr>
						<td>첨부파일</td>
						<td><c:if test="${not empty dto.ofile }">
				${dto.ofile }
				<a
									href="../menuboard/download.do?ofile=${dto.ofile}&sfile=${dto.sfile }&idx=${dto.idx }">[다운로드]</a>
							</c:if></td>
						<td>다운로드수</td>
						<td>${dto.downcount }</td>
					</tr>
					<!-- 하단 메뉴(버튼) -->
					<tr>
						<td colspan="4" align="center">
						<c:set var="isAdmin" value="admin" /> 
						<c:if test="${sessionScope.UserId eq isAdmin }">
								<button type="button"
									onclick="location.href='../menuboard/edit.do?idx=${param.idx }';">
									수정하기</button>
								<button type="button"
									onclick="location.href='../menuboard/delete.do?idx=${param.idx}';">
									삭제하기</button>
						</c:if>
						<button type="button"
							onclick="location.href='../menuboard/list.do';">목록 바로가기</button>
						</td>
					</tr>
				</table>
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