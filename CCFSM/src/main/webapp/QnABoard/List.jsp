<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 게시판</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Resources/Style.css">
<jsp:include page="/Frame/Header.jsp" />
<script>
function checkPassword(idx, pass) {
	  const passwordInput = document.getElementById("passwordInput");
	  const password = passwordInput.value;
	  
	  // 비밀번호 검증을 수행합니다.
	  if (password == pass) {
	    // 비밀번호가 맞으면 링크로 이동합니다.
	    location.href = "../qnaboard/view.do?idx=" + idx;
	  } else {
	    // 비밀번호가 틀리면 경고창을 띄웁니다.
	    alert("비밀번호가 틀렸습니다.");
	    passwordInput.value = "";
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
			<jsp:include page="/Navigator/Notice.jsp" />
		</aside>
		<article>
			<h1 class="display-6 m-2 p-2 bg-danger-subtle"
				style="text-align: center;">질문 게시판</h1>
			<!-- 검색 폼 -->
			<div class="container-fluid px-5 my-5">
				<form method="get">
					<div class="row">
						<div class="col-9">
							<div class="input-group">
								<select name="searchField" class="form-select me-2"
									style="width: 20%;">
									<option value="title">제목</option>
									<option value="content">내용</option>
								</select> <input type="text" name="searchWord" class="form-control"
									style="width: 60%;" />
							</div>
						</div>
						<div class="col-3">
							<button type="submit" class="btn btn-warning w-100">검색하기</button>
						</div>
					</div>
				</form>

				<!-- 게시글 목록 -->
				<div class="table-responsive">
					<table class="table table-warning table-hover align-middle mt-3">
						<thead>
							<tr>
								<th class="text-center" width="10%">번호</th>
								<th width="*">제목</th>
								<th class="text-center" width="15%">작성자</th>
								<th class="text-center" width="10%">조회수</th>
								<th class="text-center" width="15%">작성일</th>
								<th class="text-center" width="8%">답변</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${ empty boardLists }">
									<!-- 게시물이 없을 때 -->
									<tr>
										<td colspan="6" class="text-center">등록된 게시물이 없습니다^^*</td>
									</tr>
								</c:when>
								<c:otherwise>
									<!-- 게시물이 있을 때 -->
									<c:forEach items="${ boardLists }" var="row" varStatus="loop">
										<tr>
											<td class="text-center">
												<!-- 번호 --> ${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
											</td>
											<td>
												<!-- 제목(링크) --> <c:choose>
													<c:when test="${sessionScope.UserId eq 'admin' }">
														<a class="BoardTitle"
															href="../qnaboard/view.do?idx=${ row.idx }">${ row.title }</a>
													</c:when>
													<c:otherwise>
														<a class="BoardTitle" href="#" data-bs-toggle="modal"
															data-bs-target="#passwordModal">${row.title }<img
															src="${pageContext.request.contextPath}/Resources/Images/lock.png"
															style="height: 1em; width: auto; margin-left: 0.5em;"></a>

														<div class="modal fade" id="passwordModal" tabindex="-1"
															aria-labelledby="passwordModalLabel" aria-hidden="true">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="passwordModalLabel">비밀번호
																			입력</h5>
																		<button type="button" class="btn-close"
																			data-bs-dismiss="modal" aria-label="Close"></button>
																	</div>
																	<div class="modal-body">
																		<div class="mb-3">
																			<label for="passwordInput" class="form-label">비밀번호</label>
																			<input type="password" class="form-control"
																				id="passwordInput">
																		</div>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary"
																			data-bs-dismiss="modal">취소</button>
																		<button type="button" class="btn btn-primary"
																			onclick="checkPassword(${row.idx }, ${row.pass })">확인</button>
																	</div>
																</div>
															</div>
														</div>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-center">${row.userid }</td>
											<!-- 작성자 -->
											<td class="text-center">${ row.visitcount }</td>
											<!-- 조회수 -->
											<td class="text-center">${ row.postdate }</td>
											<!-- 작성일 -->
											<c:choose>
												<c:when test="${empty row.reply }">
													<td class="text-center">대기</td>
												</c:when>
												<c:otherwise>
													<td class="text-center">완료</td>
												</c:otherwise>
											</c:choose>
											<!-- 답변 여부 -->
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>

				<!-- 하단 메뉴(바로가기, 글쓰기) -->
				<div
					class="d-flex justify-content-between align-items-center border p-3">
					<div>${ map.pagingImg }</div>
					<div>
						<c:if test="${not empty sessionScope.UserId}">
							<button type="button" class="btn btn-warning"
								onclick="location.href='../qnaboard/write.do';">글쓰기</button>
						</c:if>
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