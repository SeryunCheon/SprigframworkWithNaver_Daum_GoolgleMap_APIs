<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
	<center>
	<script type="text/javascript">

function ThingsToCheck() {

	var pattern1 = /[0-9]/;	
	// 숫자 
	var pattern2 = /[a-zA-Z]/;	
	// 문자 
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;	
	// 특수문자

	var pattern4 =/[--]/;
  if(checkforMe.userid.value == "") {  
		    alert("아이디를 제대로 입력해 주세요.");
		    checkforMe.userid.focus();
		    return false;
		  }
	
  else if(checkforMe.pwd.value == "") {
    alert("비밀번호를 제대로 입력해 주세요.");
    checkforMe.pwd.focus();
    return false;
  }

  else if(checkforMe.pwd_CHECK.value == "") {
    alert("비밀번호를 제대로 입력해 주세요.");
    checkforMe.pwd_CHECK.focus();
    return false;
  }

  else if(checkforMe.pwd.value != checkforMe.pwd_CHECK.value) {
	    alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
	    checkforMe.pwd.focus();
	    return false;
	  }
 
 else if(!pattern1.test(checkforMe.pwd.value) || !pattern2.test(checkforMe.pwd.value) || !pattern3.test(checkforMe.pwd.value) || checkforMe.pwd.value.length < 8) {
	    alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다. 사용가능한 특수문자: ~!@#$%^&*()_+|<>?:{}");
	    checkforMe.pwd.focus();
	    return false;
	  }
	
 else if(checkforMe.name.value == "") {
	    alert("이름은 공백이 불가합니다. 다시입력해주세요");
	    checkforMe.name.focus();
	    return false;
	  }
 else if(checkforMe.email.value == "") {
	    alert(" 이메일은 공백이 불가합니다. 다시입력해주세요");
	    checkforMe.email.focus();
	    return false;
	  }
else if (checkforMe.phone.value == "") {
		alert("연락처는 공백이 불가합니다.");
		checkforMe.phone.focus();
		return false;
	} 
 else if(!pattern1.test(checkforMe.phone.value) || !pattern4.test(checkforMe.phone.value) || pattern2.test(checkforMe.phone.value) || pattern3.test(checkforMe.phone.value) || checkforMe.phone.value.length >14 || checkforMe.phone.value.length<11) {
	    alert("연락처는 11~12자리의 숫자만 가능합니다. 연락처를 알맞은 형식으로 기입해주세요. ex)010-1234-5678");
	    checkforMe.phone.focus();
	    return false;
	  }
  
//  else if(checkforMe.phone.value == "") {
// 		    alert("이메일칸은 공백이 불가합니다."");
// 		    checkforMe.phone.focus();
// 		    return false;
// 		  }
  else return true;
//   	return "memberUpdate.do";
}

</script>	
		<font color="grey" style="font-family: 나눔명조; font-weight: bold;">
		<br>
		<br>
		
			<h1>회원가입 페이지</h1>
			<p>
				<font color="red"> ${msg } </font>
			</p>
			<form action="join.do" name="checkforMe" onsubmit="return ThingsToCheck()">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="userid"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<td>비밀번호 확인&nbsp;</td>
						<td><input type="password" name="pwd_CHECK"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email"></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input type="text" name="phone"><br>ex)010-1234-5678</td>
					</tr>
					<tr>
						<td>관리자번호</td>
						<!--                     <td><input type="text" name="admin" ></td> -->
						<td>&nbsp;&nbsp;&nbsp;일반<input type="radio" name="admin" value="2"
							checked="checked"> &nbsp;관리자<input type="radio" name="admin"
							value="1"></td>
					</tr>
				</table>
				<p>
					<input type="submit" value="join!" style="color: white;  background-color: grey; border: 1px solid #grey;">
					<input type="reset"  value="Write again" style="color: grey;  background-color: white; border: 1px solid #grey;"> 
					<input type="button"	value="To the Main" onclick="location.href='main.do'"	style="color: grey; background-color: white; border: 1px solid #grey;">
				</p>
			</form>
		</font>
	</center>
</body>
</html>
