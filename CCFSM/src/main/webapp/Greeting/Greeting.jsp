<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사말</title>
<link href="${pageContext.request.contextPath}/Resources/Style.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/Frame/Header.jsp" />
<style>
.picture-1 {
	position: relative;
}

.picture-1_text {
	position: absolute;
	top: 50%;
	left: 37%;
	transform: translate(-50%, -50%);
	color: black;
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
			<jsp:include page="/Navigator/Greeting.jsp" />
		</aside>
		<article>
			<div id="page-content-wrapper">

				<h1 class="display-6 m-2 p-2 bg-danger-subtle"
					style="text-align: center;">인 사 말</h1>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<img class="picture" src="${pageContext.request.contextPath}/Resources/Images/gr2.jpg"
					alt="어린이급식지원센터" style="width: 30%; height: 30%;"><br />
				<p style="font-size: 1.4em; color: #ff3300;">&nbsp;&nbsp;&nbsp;어린이
					급식 지원 센터는</p>
				<div class="picture-1">
					<img class="picture-1"
						src="${pageContext.request.contextPath}/Resources/Images/gr1.jpg"
						alt="어린이급식지원센터" style="width: 70%;">
					<p class="picture-1_text" style="text-align: left;">
						&nbsp;관내의 100명 미만의 어린이 급식소(어린이집, 유치원, 지역아동센터, 장애인복지시설 등)를 대상으로
						체계적인 위생 및 영양관리를 지원하고자 설립되었습니다. <br> <br>&nbsp;본 센터는
						수원시어린이의 식습관과 영양섭취의 질적 향상 및 위생적인 식사를<br> 제공할 수 있도록 식품영양 전문가들이
						다양한 프로그램을 기획•개발하고 있습니다.<br> <br> &nbsp;대상별 맞춤형 식단 제공과
						순회방문 지도를 통해 어린이, 학부모, 교사 및 조리원 들에게 영양•위생교육을 실시하며 급식운영 지원 및 정보제공 등
						업무를 담당하고 있습니다.<br> &nbsp;센터의 사업을 통해 학부모와 국민의 어린이 급식에 관한 신뢰와
						만족도를 높이고, 어린이에게 안전하고 건강한 균형 잡힌 식사를 제공함으로써 어린이가 지역사회의 따뜻한 사회인으로
						올바르게 성장할 수 있도록 노력할 것입니다.
					</p>
				</div>
				<div>
					<p class="picture-1" style="color: #ff3300;">
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;센터의 다양한 어린이 급식지원 사업에
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;많은 관심과 성원 부탁드립니다.
					</P>

					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;감사합니다.</p>
					<br> <br> <br> <br> <br> <br>
				</div>
			</div>

		</article>
	</div>
	<footer>
		<jsp:include page="/Frame/Footer.jsp" />
	</footer>
</body>
</html>