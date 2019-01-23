<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<center>
				<font color="grey" style="font-family: Georgia; font-weight: bold;">
			<h1>"Login please"</h1>
			<form action="login.do">
				

				
				<table>
					<tr>
						<td width="150px" align="center">아이디 :</td>
						<td width="150px" align="left"><input type="text" name="id">
						</td>
					</tr>
					<tr>
						<td width="150px" align="center">비밀번호 :</td>
						<td width="150px" align="left"><input type="password"
							name="pwd"></td>
					</tr>

				</table>
		<p>
		<input type="submit"	value="Login" style="background-color: white; color: grey; font-weight: bold; border: 1px solid #grey;">
						<input type="button" value="Join" onclick="location.href='joinForm.do'"
						style="background-color: white; color: grey; font-weight: bold; border: 1px solid #grey;">
		</p>		
				</font>
				
			</form>

		</center>
</body>

</html>