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
<title>글을 쓰시오</title>
</head>
<body>
	<center>
		<script type="text/javascript">
			function PWCheck() {
				if (checkforMe.pass.value == "") {
					alert("비밀번호는 빈칸이 불가합니다. 제대로 입력해 주세요.");
					checkforMe.pass.focus();
					return false;
				} else if (checkforMe.name.value == "") {
					alert("이름은 빈칸이 불가합니다. 제대로 입력해 주세요.");
					checkforMe.name.focus();
					return false;
				} else
					return true;
			}
		</script>
		<p>
	</p>
	<br>
	<br>
	<br>
			<font color="grey" style="font-family: 나눔명조; font-weight: bold;">
			<h1>"게시글을 작성해 주세요."</h1></font>
		<font color="grey" style="font-family: Georgia; font-weight: bold;">	
		
		<form action="write.do" enctype="multipart/form-data" method="post" name="checkforMe" onsubmit="return PWCheck()">
		<table>
		<tr>
		<td>Title :</td>
		<td><input type="text" name="title"></td>
		</tr>
				<tr>
		<td>pwd :</td>
		<td><input type="password" name="pass"></td>
		</tr>
				<tr>
		<td>Name :</td>
		<td><input type="text" name="name"></td>
		</tr>
				<tr>
		<td>Email :</td>
		<td><input type="text" name="email"></td>
		</tr>
				<tr>
		<td>attached file :</td>
		<td><input type="file" name="ufile" style="background-color: white; color: grey; font-weight: bold; border: 1px solid #grey;"></td>
		</tr>		
		</table>
			<p>Content<br>
			<textarea rows="20" cols="50" name="content"></textarea>
			</p>
								<tr>
		<td>video :</td>
		<td><input type="text" name="video"></td>
		</tr>	
			<p>
<input type="submit" value="Write" style="background-color: #FFBF00; color: white; font-weight: bold; border: 1px solid #FFBF00;">
<input type="button" value="To the Board" onclick="location.href='boardList.do'"
style="background-color: white; color: grey; font-weight: bold; border: 1px solid #FFBF00;">
<input type=button value="Back" onClick="history.back();"
style="background-color: white; color: grey; font-weight: bold; border: 1px solid #FFBF00;">
			</p>

		</form>
	</font>
	</center>

</body>
</html>