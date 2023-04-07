<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<title>분당구 어린이 급식지원 관리 센터</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Resources/Style.css">
<jsp:include page="/Frame/Header.jsp" />
</head>
<body>
	<jsp:include page="/Frame/HeadNav.jsp" />
	<header>
		<img src="${pageContext.request.contextPath}/Resources/Images/img1.jpg"
			style="height: 100%; width: 100%">
	</header>
	<div class="container">
		<aside>
			<jsp:include page="/Navigator/Event.jsp" />
		</aside>
		<article style="overflow: auto;">
			<div>
				<P class="display-6 m-2 p-2 bg-danger-subtle"
					style="text-align: center;">체 험 관 안 내</P>
				<p style="text-align: right; padding: 0 25px 0;">
					<span onclick="document.location.href='../Index.jsp?mstrCode=2'"
						style="cursor: pointer; font-size: 13px">홈</span> <span>&gt;</span>
					<span onclick="document.location.href='Introduce.jsp?mstrCode=2'"
						style="cursor: pointer; font-size: 13px">체험관 안내</span> <span>&gt;</span>
					<span onclick="document.location.href='Reservation.jsp?pageCode=3'"
						style="cursor: pointer; font-size: 13px">체험학습 신청</span>
				</p>
			</div>
			<h5 class="text">1.체험관 예약 절차</h5>
			<svg width="175" height="200">
           <circle cx="110" cy="100" r="60" fill="orange" />
            <text class="move-text" x="110" y="105" text-anchor="middle"
					font-weight="bold">웹에서 신청</text>
          </svg>

			<text class="move-text" text-anchor="middle" font-weight="bold">
			> </text>
			<svg width="125" height="200">
           <circle cx="60" cy="100" r="60" fill="yellow" />
           <text class="move-text" x="60" y="105" text-anchor="middle"
					font-weight="bold">관리자 승인</text>
          </svg>

			<text class="move-text" text-anchor="middle" font-weight="bold">
			> </text>
			<svg width="120" height="200">
           <circle cx="60" cy="100" r="60" fill="orange" />
           <text class="move-text" x="60" y="105" text-anchor="middle"
					font-weight="bold">예약일정 통보</text>
          </svg>

			<text class="move-text" text-anchor="middle" font-weight="bold">
			> </text>
			<svg width="125" height="200">
          <circle cx="63" cy="100" r="60" fill="yellow" />
          <text class="move-text" x="60" y="105" text-anchor="middle"
					font-weight="bold">예약 완료</text>
          </svg>

			<br> <br>

			<h5 class="text">2.교육대상 및 이용인원</h5>
			<p class="text">
				- 교육대상: 수원시 어린이급식관리지원센터 등록 급식소 어린이<br> - 이용인원: 시설당 20인 이내
			</p>
			<br>
			<h5 class="text">3.유의사항</h5>
			<p class="text">
				- 시설 당 연 1회 신청 가능합니다.<br> - 체험관 이용 시 정해진 인원을 꼭 지켜주시기 바랍니다.<br>
				- 예약 취소는 체험일 2주 전에 연락주시기 바랍니다.<br> - 체험 이용시간을 꼭 지켜주셔야 합니다. 늦을
				경우 센터로 바로 연락주시기 바랍니다.
			</p>
			<br>
			<h5 class="text">4.예약 문의</h5>
			<p class="text">
				- 전 화: 성남시 어린이급식관리지원센터 등록 급식소 어린이 <br> - 메 일: 시설당 20인 이내
			</p>
			<br>
			<div style="text-align: center;">
				<button type="submit" class="btn btn-primary"
					onclick="location.href='Reservation.jsp'" width="center">체험학습
					신청하기</button>
			</div>
		</article>
	</div>
	<footer>
		<jsp:include page="/Frame/Footer.jsp" />
	</footer>
</body>
</html>