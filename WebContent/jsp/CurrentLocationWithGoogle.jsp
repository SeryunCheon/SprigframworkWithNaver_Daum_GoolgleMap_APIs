<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="https://maps.google.com/maps/api/js?sensor=true"></script>
<style>
#map {
	height: 600px;
	width: 600px;
}

body {
	border: 0;
	padding: 0;
	background-image: url('bgForGoogle.jpg');
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
<title>구글 맵</title>
</head>

<body >
	<center>
		<h1>
			<font color="#FFBF00" style="font-weight: bold;">"Google Map으로 파악된 현재위치는 다음과 같습니다."</font>
		</h1>
		<div id="map"></div>
<!-- 	37.570514, 126.985235	 -->
		<script type="text/javascript">
      function initialize() {
        var myLatlng;
        var map;
        var marker; 
        myLatlng = new google.maps.LatLng(37.694293, 126.763069); 
        
        var mapOptions = {
                zoom: 17, 
                center: myLatlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                scrollwheel: false, 
                draggable: false
    };
        map = new google.maps.Map(document.getElementById('map'), mapOptions);
        

        var contentString ='<p style="line-height: 20px;">탄현 스타벅스</p><p>경기도 고양시 일산서구 일현로 97-11</p>'; 

        var infowindow = new google.maps.InfoWindow({
                content: contentString
        });

        marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: 'Marker'
        });

        infowindow.open(map, marker);

        google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
        });
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>

<!-- Google API Key 값을 생성하여 입력하세요. -->
		<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAor4LUeLk4cpTSBCNue-I1Nu_tKlMvvn0&callback=initMap">
    </script>

		<p>
			<input type="button" value="To the Member Main"
				onclick="location.href='main.do'"
				style="border: 1px solid #FFBF00; background-color: #FFBF00; color: white; font-weight: bold;">
			<input type="button" value="Log out"
				onclick="location.href='logout.do'"
				style="border: 1px solid #FFBF00; background-color: #FFBF00; color: white; font-weight: bold;">
		</p>

	</center>
</body>
</html>