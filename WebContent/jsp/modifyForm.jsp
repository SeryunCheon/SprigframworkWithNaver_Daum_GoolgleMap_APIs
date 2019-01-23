<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body {
	border: 0;
	padding: 0;
	background-image: url('bgForBoard.jpg');
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

	function PWCheck() {
// 		msg = "정말 해당 회원을 삭제하시겠습니까?";
		if (checkforMe.pass.value == "") {
			alert("비밀번호 입력값이 빈칸입니다.");
			checkforMe.pass.focus();
			return false;
		} else if (confirm(msg) != 0) {
			// Yes click
		} else {
			// no click
		}
	}
</script>
<font color="grey" style="font-family: Georgia; font-weight: bold;">		
	<p>
	<input type="button" value="To the Board"	 onclick="location.href='boardList.do'" style="color: grey;  background-color: white; border: 1px solid #F78181;">
	<input type="button" value="To Member Main" onclick="location.href='main.do'"	style="color: grey;  background-color: white; border: 1px solid #ff0000;"> 
	<input type="button"	value="Logout" onclick="location.href='logout.do'"	style="color: grey; background-color: white; border: 1px solid #F78181;">
	</p>
	<p>${boardModifymsg }</p>

			<form action="modify.do"  name="checkforMe" onsubmit="return PWCheck()">
			<table border="1">
				<tr style="color: white;" bgcolor="grey">
					<th>Number</th>
					<th>Title</th>
					<th>Writedate</th>
					<th>Read Count</th>
					<th>Writer</th>
					<th>Email</th>
					<th>File</th>
				</tr>


				<tr align="center" style="font-family: 'monaco';" bgcolor="white">
					<td><input type="text" readonly="readonly"
						value="${board.num }" name="num"></td>
					<td><input type="text" value="${board.title }" name="title">
					</td>
					<td>
					<input type="text" readonly="readonly"	value="<fmt:formatDate value="${board.writedate }"
							pattern="yyyy-MM-dd" />" name="writedate">
					</td>		
					<td><input type="text" readonly="readonly"
						value="${board.readCount }" name="readCount"></td>
					<td><input type="text" readonly="readonly"
						value="${board.name }" name="name"></td>
					<td><input type="text" readonly="readonly"
						value="${board.email }" name="email"></td>
					<td>										
<%-- 			<input type="text" readonly="readonly"	value="${board.file }" name="file"> --%>
					<c:if test="${empty board.file}">　No attached FIle　 </c:if>
					<c:if test="${not empty board.file}">
					<input type="text" readonly="readonly"	value="${board.file }" name="file"></c:if>					
					</td>
				</tr>

				<tr>
					<td style="color: white;" bgcolor="pink" align="center" colspan="7">
						Content</td>
				</tr>

				<tr>
					<td align="center" colspan="7" height="500"><textarea
							rows="15" cols="120" name="content">
				${board.content }
				</textarea><br>
				<p>
				<input type="password" name="pass"> 
				<input type="submit" value="modify" style="  font-weight: bold; border: 1px solid #grey; background-color: grey; color:white; ">
				<input type=button value="Back" onClick="history.back();"
						style="background-color: white; border: 1px solid #FFBF00; color: #FFBF00; font-weight: bold;">
				</p>
				</td>
				</tr>
			</table>

		</form>

</font>
	</center>


</body>
</html>