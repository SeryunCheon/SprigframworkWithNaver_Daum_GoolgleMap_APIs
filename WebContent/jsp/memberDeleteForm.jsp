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
<script type="text/javascript">

	function deleteCheck() {
		msg = "정말 해당 회원을 삭제하시겠습니까?";
		if (checkforMe.userid.value == "") {
			alert("아이디를 제대로 입력해 주세요.");
			checkforMe.userid.focus();
			return false;
		} else if (confirm(msg) != 0) {
			return true;
		} else {
			return false;
		}
	}
</script>

		<form action="memberDelete.do" name="checkforMe" onsubmit="return deleteCheck()" >
			    <font color="grey" style="font-family: 나눔명조; font-weight: bold;">
			    <br>
<br>
<br>
<br>
<br>
			<h1>
				삭제하실 회원의 id를 입력하세요<br>
				<input type="text" name="userid"> <input type="submit" value="삭제하기" style="color: white;  background-color: grey; border: 1px solid #grey;">
			</h1>
	</font>
		</form>
		
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
<p>
<input type="button" value="To the Main" onclick="location.href='main.do'" style="background-color: white; color: grey; font-weight: bold; border: 1px solid #grey;">
</p>
</font>
	</center>
</body>
</html>
