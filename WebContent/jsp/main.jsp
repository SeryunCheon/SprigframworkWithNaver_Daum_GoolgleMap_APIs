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
	background-image: url('bgForMember2.jpg');
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

<title>Main Page </title>
</head>
<body>

<center>

		<p><font color="red" > ${msgg } </font></p>
<font color="grey" style="font-family: Georgia; font-weight: bold;">
<br>
<br>	
<br>	
<br>	
<br>	
<br>	
<br>			
    <h1>"Only for Member"</h1>
    ${userid}님으로 로그인 하셨습니다.<br>
    ${name }님 환영합니다<br>
    연락처 : ${phone }<br>
    이메일 : ${email }<br>    
    <p>
    <input type="button" value="Logout" onclick="location.href='logout.do'" style="background-color: white; color: grey; font-weight: bold; border: 1px solid #grey;">  
    <input type="button" value="See all the member" onclick="location.href='memberList.do'" style="background-color: white; color: grey; font-weight: bold; border: 1px solid #grey;">
    <input type="button" value="Modifying your Info" onclick="location.href='memberUpdateForm.do'" style="background-color: white; color: grey; font-weight: bold; border: 1px solid #grey;">
    <input type="button" value="Delete Member" onclick="location.href='memberDeleteForm.do'" style="background-color: white; color: grey; font-weight: bold; border: 1px solid #grey;">
    <input type="button" value="To the Board" onclick="location.href='boardList.do'" style="background-color: white; color: #ff0000; font-weight: bold; border: 1px solid #ff0000;">
    <input type="button" value="To see Current Location w/ Google" onclick="location.href='CurrentLocationWithGoogle.do'" style="background-color: white; color: #DD5100; font-weight: bold; border: 1px solid #DD5100;">
 	<input type="button" value="To see Current Location w/ Daum" onclick="location.href='CurrentLocationWithDaum.do'" style="background-color: white; color: #3CA0FF; font-weight: bold; border: 1px solid #3CA0FF;">
 	<input type="button" value="To see Current Location w/ Naver" onclick="location.href='CurrentLocationWithNaver.do'" style="background-color: white; color: #64CD3C; font-weight: bold; border: 1px solid #64CD3C;">
</p>
</font>
 </center>
    
</body>
</html>
