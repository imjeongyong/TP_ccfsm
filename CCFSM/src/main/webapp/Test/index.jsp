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
		<img src="${pageContext.request.contextPath}/Resources/Images/img1.jpg" style="height: 100%; width: 100%">
	</header>
	<div class="container">
		<aside></aside>
		<article>
			<div id="carouselExampleCaptions" class="carousel slide">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="3" aria-label="Slide 4"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="4" aria-label="Slide 5"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="${pageContext.request.contextPath}/Resources/Images/Homeimg1.jpg"
							class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5 style="color: black">어린이 급식지원 관리센터</h5>
							<p style="color: black">반갑습니다. 찾아주셔서 감사합니다.</p>
						</div>
					</div>
					<div class="carousel-item" style="color: black">
						<img
							src="${pageContext.request.contextPath}/Resources/Images/Homeimg2.jpg"
							class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5 style="color: black">센터 소개</h5>
							<div style="display: inline-block;">
								<p>
									<a href="Greeting/Greeting.jsp"
										style="text-decoration: none; color: black;">인사말,</a> <a
										href="Greeting/Map.jsp"
										style="text-decoration: none; color: black;">오시는길</a>
								</P>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/Resources/Images/Homeimg3.jpg"
							class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5 style="color: black">체험 학습</h5>

							<div style="display: inline-block;">
								<p>
									<a href="Experience/Introduce.jsp"
										style="text-decoration: none; color: black;">체험관 안내,</a> <a
										href="Experience/Reservation.jsp"
										style="text-decoration: none; color: black;">체험학습 신청</a>

								</p>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/Resources/Images/Homeimg4.jpg"
							class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5 style="color: black">식단/표준 레시피</h5>

							<div style="display: inline-block;">
								<p>
									<a href="MenuBoard/List.jsp"
										style="text-decoration: none; color: black;">식단표,</a> <a
										href="RecipeBoard/List.jsp"
										style="text-decoration: none; color: black;">표준 레시피</a>

								</p>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/Resources/Images/Homeimg5.jpg"
							class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5 style="color: black">알림 마당</h5>

							<div style="display: inline-block;">
								<p>
									<a href="NoticeBoard/List.jsp"
										style="text-decoration: none; color: black;">공지사항,</a> <a
										href="QnABoard/List.jsp"
										style="text-decoration: none; color: black;">질문 게시판,</a> <a
										href="PhotoBoard/List.jsp"
										style="text-decoration: none; color: black;">포토 갤러리</a>

								</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>

		</article>
	</div>
	<footer>
		<jsp:include page="/Frame/Footer.jsp" />
	</footer>
</body>
</html>