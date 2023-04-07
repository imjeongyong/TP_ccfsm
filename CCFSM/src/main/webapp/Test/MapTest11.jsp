<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사말</title>
<link href="${pageContext.request.contextPath}/Resources/Style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/Frame/Header.jsp" />
</head>

<body>
   <jsp:include page="/Frame/HeadNav.jsp" />
   <header class="bg"
      style="background-image: url('${pageContext.request.contextPath}/Resources/Images/img1.jpg'); background-size: cover;"
   > </header>
   <div class="container">

      <aside>
         <jsp:include page="../Navigator/Greeting.jsp" />
      </aside>

      <article>
         <h1 class="display-6 m-2 p-2 bg-danger-subtle" style="text-align: center;">오 시 는 길</h1>

         <div id="map" style="width: 800px; height: 350px; margin: 0px auto"></div>
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d18cf37d69ddc2b87a218bb7c1161299"></script>
         <script charset="UTF-8" src="http://t1.daumcdn.net/mapjsapi/js/main/4.4.8/kakao.js"></script>
         <script style="">
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

            // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
            var mapTypeControl = new kakao.maps.MapTypeControl();

            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl,
                  kakao.maps.ControlPosition.TOPRIGHT);

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
         </script>
         <br>
         <div>
            <table>
               <tr>
                  <td>
                     <strong>주소</strong>
                  </td>
                  <td>경기도 성남시 분당구 구미동 7-2 (돌마로 46) 5F</td>
               </tr>
               <tr>
                  <td>
                     <strong>전화번호</strong>
                  </td>
                  <td>☎ 010-0999-1234</td>
               </tr>
            </table>

         </div>

      </article>


   </div>
   <footer>
      <jsp:include page="/Frame/Footer.jsp" />
   </footer>
</body>
</html>