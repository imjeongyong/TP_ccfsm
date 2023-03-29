<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>
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
		<article>
			<h1 class="display-6 m-2 p-2 bg-danger-subtle" style="text-align: center;">공지사항</h1>
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
								<th class="text-center" width="8%">첨부</th>
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
												<!-- 제목(링크) --> <a class="BoardTitle"
												href="../noticeboard/view.do?idx=${ row.idx }">${ row.title }</a>
											</td>
											<td class="text-center">${row.userid }</td>
											<!-- 작성자 -->
											<td class="text-center">${ row.visitcount }</td>
											<!-- 조회수 -->
											<td class="text-center">${ row.postdate }</td>
											<!-- 작성일 -->
											<td class="text-center">
												<!-- 첨부 파일 --> <c:if test="${ not empty row.ofile }">
													<a class="BoardFile"
														href="../noticeboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[식단]</a>
												</c:if>
											</td>
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
						<c:set var="isAdmin" value="admin" />
						<c:if test="${sessionScope.UserId eq isAdmin }">
							<button type="button" class="btn btn-warning"
								onclick="location.href='../noticeboard/write.do';">글쓰기</button>
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