<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../login/NavBar.jsp" var="NavBar"/>
<c:out value="${NavBar}" escapeXml="false"/>
<title>찾아오는 길</title>
<style>
    * {
        font-family: 'Nanum Gothic', sans-serif; /* 한글 폰트 지정 */
    }
    #map {
        width: 100%;
        height: 400px; /* 지도의 높이 지정 */
    }
</style>
<!-- 카카오 맵 API 비동기적으로 로드 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e349724d5bdb90952c8f2f22e1419693&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script><!-- clusterer: 마커를 클러스터링 /drawing :지도 위에 마커와 그래픽스 객체를 쉽게 그릴 수 있게 그리기 모드  -->
<style>
* {
	font-family: 국민연금체;
}
</style>
</head>
<body>
<h2>찾아오는 길</h2>
<div id="map"></div>
<button class="map-btn" id="map-btn">길찾기</button>

<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script> <!-- 서비스 라이브러리: 장소 검색 과 주소-좌표 변환 을 할 수 있는 services 라이브러리 입니다.-->
<script>
let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
let map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
let geocoder = new kakao.maps.services.Geocoder();

let searchCoords = new Object;
// 주소로 좌표를 검색합니다
geocoder.addressSearch('서울 서초구 서초대로74길 33 3층', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        searchCoords.lat = result[0].y;
        searchCoords.lon = result[0].x;
 
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });


        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">CODE WAVE</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    

let mapbtn = document.getElementById('map-btn');
mapbtn.addEventListener("click", function() {
	console.log(searchCoords);
    let sName = encodeURIComponent("CODE WAVE"); // 주소에 공백이 있을 경우를 대비하여 인코딩합니다.
    window.location = "https://map.kakao.com/link/to/" + sName + "," + searchCoords.lat + "," + searchCoords.lon;
});
</script>

</body>
</html>
