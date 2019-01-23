<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body {
	border: 0;
	padding: 0;
	background-image: url('bgForDaum.jpg');
	min-height: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
}

table, td {
	background-color: transparent;
}
</style>
<title>다음 맵</title>
</head>
<body>
	<center>
		<h1>
		<font color="#3CA0FF" style="font-weight: bold;">"Daum Map으로 파악된 현재위치는 다음과 같습니다."</font>
		</h1>

		<div id="map" style="width: 600px; height: 600px;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=76e758611d6cc01dffed9ba3985a3a9b"></script>
		<script>
			var container = document.getElementById('map');// 지도를 표시할 div 
			var options = {
				center : new daum.maps.LatLng(37.694293, 126.763069),// 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다
			var map = new daum.maps.Map(container, options);
			// 마커를 표시할 위치입니다 
			var markerPosition = new daum.maps.LatLng(37.570514, 126.985235);

			var marker = new daum.maps.Marker({
				position : markerPosition,
				clickable : true
			});

			// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
			// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
			// marker.setClickable(true);

			// 마커를 지도에 표시합니다.
			marker.setMap(map);

			// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
			var iwContent = '<div style="padding:10px;"><a href="http://map.daum.net/link/map/서울YMCA관광호텔,37.570514, 126.985235" style="color:blue" target="_blank"><font size="2">서울YMCA관광호텔</font></a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwRemoveable = true;// removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			// 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			})

			// 마커에 클릭이벤트를 등록합니다
			daum.maps.event.addListener(marker, 'click', function() {
				// 마커 위에 인포윈도우를 표시합니다
				infowindow.open(map, marker);
			});
		</script>

		<p>
			<input type="button" value="To the Member Main"
				onclick="location.href='main.do'"
				style="border: 1px solid #FFBF00; background-color: #3CA0FF; color: white; font-weight: bold;">
			<input type="button" value="Log out"
				onclick="location.href='logout.do'"
				style="border: 1px solid #FFBF00; background-color: #3CA0FF; color: white; font-weight: bold;">
		</p>
		<!-- <a href="http://map.daum.net/link/map/서울YMCA관광호텔,37.570514, 126.985235" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/서울YMCA관광호텔,37.570514, 126.985235" style="color:blue" target="_blank">길찾기</a> -->

	</center>
</body>
</html>