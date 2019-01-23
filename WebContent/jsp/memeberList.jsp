<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Insert title here</title>
</head>
<body>
<center>
<p>
<!-- <font color="grey" style="font-family: Georgia; font-weight: bold;"> -->
<font color="grey" style="font-family: 나눔명조; font-weight: bold;">
<!-- <h1>"List of all the Members is like below"</h1> -->
<br>
<br>
<br>
<br>
<br>

<h1>"전체 회원정보는 아래와 같습니다."</h1>
</font>

<font color="grey" style="font-family: Georgia;">
<table border="1">
<tr style="color: white;" bgcolor="grey">
					<th>userid	</th>
					<th>name </th>
					<th>email</th>
					<th>phone</th>
</tr>
<c:forEach var="member" items="${memberList }">
<tr align="center" style="font-family: 'monaco';" bgcolor="white">
				<td>&nbsp;${member.userid }&nbsp;</td>
				<td>&nbsp;${member.name }&nbsp;</td>
				<td>&nbsp;${member.email }&nbsp;</td>
				<td>&nbsp;${member.phone }&nbsp;</td>

</tr>
				</c:forEach>
</table>



<%-- 	<c:forEach var="member" items="${memberList }"> --%>
<%-- 		${member.name }, ${member.userid }<br> --%>
<%-- 	</c:forEach> --%>
	
	<p>
	<input type="button" value="To the Main" onclick="location.href='main.do'" style="background-color: white; color: grey; font-weight: bold; border: 1px solid #grey;">
	<input type="button"	value="LogOut" onclick="location.href='logout.do'"	style="color: grey; background-color: white; font-weight: bold; border: 1px solid #grey;">	
		</p>
</font>		
</p>		
	</center>
</body>
</html>
