<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>네이버 지도 API - 주소로 지도 표시하기</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ZG43TRSjigJBhtabpHfG&submodules=geocoder"></script>
<style>
body {
	border: 0;
	padding: 0;
	background-image: url('bgForNaver.jpg');
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
<title>네이버 맵</title>
</head>

<body>
	<!-- ZG43TRSjigJBhtabpHfG -->
	<!-- JUstkSIKTH -->
	<center>
				<h1>
			<font color="#64CD3C" style="font-weight: bold;">"Naver Map으로 파악된 현재위치는 다음과 같습니다."</font>
		</h1>
<div id="map" style="width: 600px; height: 600px;"></div>
 <script>
      var map = new naver.maps.Map('map');
      var myaddress = '경기도 고양시 일산서구 일현로 97-11';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
          }
          var result = response.result;
          // 검색 결과 갯수: result.total
          // 첫번째 결과 결과 주소: result.items[0].address
          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
          // 마커 표시
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          // 마커 클릭 이벤트 처리
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
          // 마크 클릭시 인포윈도우 오픈
          var infowindow = new naver.maps.InfoWindow({
              content: '<font color="grey" style="font-family: Georgia; font-weight: bold;"><h4>서울YMCA</h4><a href="https://map.naver.com/local/siteview.nhn?code=12082119" target="_blank">서울특별시 종로구 종로 69 서울YMCA</a></font>'
          });
      });
      </script>


		<p>
			<input type="button" value="To the Member Main"
				onclick="location.href='main.do'"
				style="border: 1px solid #FFBF00; background-color: #64CD3C; color: white; font-weight: bold;">
			<input type="button" value="Log out"
				onclick="location.href='logout.do'"
				style="border: 1px solid #FFBF00; background-color: #64CD3C; color: white; font-weight: bold;">
		</p>

	</center>
</body>
</html>