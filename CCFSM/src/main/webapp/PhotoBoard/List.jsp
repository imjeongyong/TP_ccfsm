<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 게시판</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Resources/Style.css">
<jsp:include page="/Frame/Header.jsp" />
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
			<jsp:include page="/Navigator/Notice.jsp" />
		</aside>
		<article class="overflow-auto">

			<h1 class="display-6 m-2 p-2 bg-danger-subtle"
				style="text-align: center;">포토갤러리</h1>

			<div class="container-fluid px-5 my-5">
				<div class="col-2">
					<div>
						<c:set var="isAdmin" value="admin" />
						<c:if test="${sessionScope.UserId eq isAdmin }">
							<button type="button" class="btn btn-warning"
								onclick="location.href='../photoboard/write.do';">글쓰기</button>
						</c:if>
					</div>
				</div>
			</div>


			<c:choose>
				<c:when test="${ empty boardLists }">
					<h1>등록된 게시물이 없습니다..</h1>
				</c:when>
				<c:otherwise>
					<c:forEach items="${ boardLists }" var="row" varStatus="loop">
						<div class="card m-auto mt-5 border border-dark"
							style="width: 60%;">
							<img src="${pageContext.request.contextPath}/Uploads/${row.sfile}" class="card-img-top" alt="활동 사진">
							<div class="card-body">
								<h5 class="card-title">${row.title }</h5>
								<p class="card-text">${row.content }</p>
								<a href="../noticeboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }" 
									class="btn btn-warning">사진 다운로드</a>

								<c:if test="${sessionScope.UserId eq 'admin' }">
									<button type="button" class="btn btn-warning"
										onclick="location.href='../photoboard/edit.do?idx=${row.idx}';">수정하기</button>
										
									<button type="button" class="btn btn-warning"
										data-bs-toggle="modal" data-bs-target="#confirmModal">
										삭제하기</button>

									<div class="modal fade" id="confirmModal" tabindex="-1"
										aria-labelledby="confirmModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="confirmModalLabel">삭제 확인</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">정말로 삭제하시겠습니까?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">취소</button>
													<button type="button" class="btn btn-danger"
														onclick="location.href='../photoboard/delete.do?idx=${row.idx}';">확인</button>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>


			<!-- 하단 메뉴(바로가기, 글쓰기) -->
			<div
				class="d-flex justify-content-between align-items-center border p-3 m-3">
				<div>${ map.pagingImg }</div>
				<div>
					<c:set var="isAdmin" value="admin" />
					<c:if test="${sessionScope.UserId eq isAdmin }">
						<button type="button" class="btn btn-warning"
							onclick="location.href='../photoboard/write.do';">글쓰기</button>
					</c:if>
				</div>
			</div>
		</article>
	</div>
	<footer>
		<jsp:include page="/Frame/Footer.jsp" />
	</footer>
</body>
</html>