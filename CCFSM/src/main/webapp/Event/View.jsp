<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- style css 링크 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/Style.css">

<!-- 헤더 링크 -->
<jsp:include page="/Frame/Header.jsp" />

<!-- 부트스트랩 5.3 CDN 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>

<!-- full calendar CDN 링크 -->
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css' rel='stylesheet' />
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js'></script>
<script>
  $(document).ready(function() {
    $('#calendar').fullCalendar({
      events: [
        <c:forEach var="event" items="${events}">
          {
            title: '${event.title}',
            start: '${event.start_date}',
            end: '${event.end_date}',
            description: '${event.content}',
            capacity: ${event.capa},
            remaining: ${event.rest},
          },
        </c:forEach>
      ],
    });
  });
</script>
</head>
<body>
	<jsp:include page="/Frame/HeadNav.jsp" />
	<header>
		<img src="${pageContext.request.contextPath}/Resources/Images/img1.jpg" style="height: 100%; width: 100%">
	</header>
	<div class="container">
		<aside>
			<jsp:include page="/Navigator/Event.jsp" />
		</aside>
		<article style="overflow: auto;">
			<h1 class="display-6 m-2 p-2 bg-danger-subtle" style="text-align: center;">체험활동 신청하기</h1>
			
			<div class="m-2 p-2">
				<form method="post" action="../event/check.do">
				    <input type="hidden" name="userid" value="${sessionScope.UserId }">				
					<button type="submit" class="btn btn-warning">나의 체험활동 신청 확인하기</button>
				</form>
				<div class="m-2 p-2">
					<h5>${currentState }</h5>
				</div>
			</div>

			<div class="m-2 p-2">
	  			<div id='calendar' style="width: 95%;"></div>
  			</div>
  			
  			<div class="m-2 p-2">
	  			<!-- 등록한 체험행사 목록 -->
				<div class="table-responsive">
					<table class="table table-warning table-hover align-middle mt-3">
						<thead>
							<tr>
								<th class="text-center" width="10%">번호</th>
								<th class="text-center" width="*">행사 이름</th>
								<th class="text-center" width="25%">시작 시간</th>
								<th class="text-center" width="25%">종료 시간</th>
								<th class="text-center" width="10%">정원</th>
								<th class="text-center" width="10%">예약</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${ empty events }">
									<!-- 게시물이 없을 때 -->
									<tr>
										<td colspan="6" class="text-center">등록된 체험관 행사가 없습니다^^*</td>
									</tr>
								</c:when>
								<c:otherwise>
									<!-- 게시물이 있을 때 -->
									<c:forEach items="${ events }" var="row" varStatus="loop">
										<tr>
											<td class="text-center">${row.idx }</td>
											<!-- 행사명(링크) -->
											<td><a href="../event/eview.do?idx=${row.idx }" class="BoardTitle">${row.title }</a></td>
											<!-- 시작 시간 -->
											<td class="text-center">${row.start_date }</td>
											<!-- 종료 시간 -->
											<td class="text-center">${row.end_date }</td>
											<!-- 정원 -->
											<td class="text-center">${row.capa - row.rest } / ${row.capa }</td>
											<!-- 신청 가능 여부 -->
											<td class="text-center">
												<c:choose>
													<c:when test="${row.rest eq 0 }">
														예약 불가
													</c:when>
													<c:otherwise>
														예약 가능
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
  			</div>
  			
  			<!-- 이벤트 등록 -->
				<div class="d-flex justify-content-between align-items-center border p-3">
					<div>${ map.pagingImg }</div>
					<div>
						<c:set var="isAdmin" value="admin" />
						<c:if test="${sessionScope.UserId eq isAdmin }">
							<button type="button" class="btn btn-warning"
								onclick="location.href='${pageContext.request.contextPath}/Event/EventInput.jsp';">이벤트 등록하기</button>
						</c:if>
					</div>
				</div>
				
				<c:if test="${sessionScope.UserId eq 'admin' }">
					<div class="m-2 p-2">
						<button type="button" class="btn btn-warning"
							onclick="location.href='../event/manage.do';">이벤트 관리하기(관리자 메뉴)</button>
					</div>
				</c:if>
				
  		</article>
	</div>
	<footer>
		<jsp:include page="/Frame/Footer.jsp" />
	</footer>
</body>
</html>