<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사말</title>
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
			<jsp:include page="/Navigator/Greeting.jsp" />
		</aside>
		<article>
			<h1 class="display-6 m-2 p-2 bg-danger-subtle"
				style="text-align: center;">오 시 는 길</h1>
			<div id="map" style="width: 800px; height: 500px;"></div>
			<script type="text/javascript" style="img-align: center;"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d18cf37d69ddc2b87a218bb7c1161299"></script>
			<script>
				var container = document.getElementById('map');
				var options = {
					center : new kakao.maps.LatLng(37.350078, 127.108952),
					level : 3
				};
				var map = new kakao.maps.Map(container, options);

				var markerPosition = new kakao.maps.LatLng(37.350078,
						127.108952);
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					position : markerPosition
				});
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null);
			</script>
		</article>
	</div>
	<footer>
		<jsp:include page="/Frame/Footer.jsp" />
	</footer>

</body>
</html>