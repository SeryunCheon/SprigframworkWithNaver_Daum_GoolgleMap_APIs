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
<title>여기는 View</title>
</head>
<body>
	<center>
<script type="text/javascript">

	function deleteCheck() {
		msg = "정말 해당 게시글을 삭제하시겠습니까?";
		if (confirm(msg) != 0) {
			return true;
		} else {
			return false;
		}
	}
</script>
		<!-- 						<font color="grey" style="font-family: Georgia; font-weight: bold;">	 -->
		<font color="grey" style="font-family: 나눔명조; font-weight: bold;">
			<h1>" ${board.num }번 게시글의 내용은 아래와 같습니다."</h1> ( The Content for
			number${board.num } is like below )"
		</font>
		<p></p>
		<font color="grey" style="font-family: Georgia;">
<form action="deleteBoard.do" name="checkforMe" onsubmit="return deleteCheck()" >			
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
					<td><input type="text" value="${board.num }" name="num" readonly="readonly"></td>
					<td><c:if test="${empty board.title}">&nbsp;No title&nbsp;</c:if>
						<c:if test="${not empty board.title}">&nbsp;${board.title }&nbsp;</c:if></td>
					<td>&nbsp;<fmt:formatDate value="${board.writedate }"
							pattern="yyyy-MM-dd" />&nbsp;
					</td>
					<td>&nbsp;${board.readCount }&nbsp;</td>
					<td>&nbsp;${board.name }&nbsp;</td>
					<td>&nbsp;${board.email }&nbsp;</td>
					<td>
						<%-- 				<a href="download.do?num=${board.num }">${board.file }</a> --%>
						<c:if test="${empty board.file}">&nbsp; No attached file&nbsp;</c:if>
						<c:if test="${not empty board.file}">
							<a href="download.do?num=${board.num }">${board.file }</a>
						</c:if>
					</td>
				</tr>

				<tr>
					<td style="color: white" bgcolor="darkgrey" align="center"
						colspan="7"><font color="grey">	Content</font></td>
				</tr>
				<tr>
					<td style="color: white" bgcolor="darkgrey" align="center"
						colspan="7">
						<font color="grey">		
		<c:if test="${empty board.video}">No video</c:if> 
		<c:if test="${not empty board.video}">
<iframe width="980" height="551" src="http://www.youtube.com/embed/${board.video}?autoplay=1&loop=1&playlist=${board.video}" frameborder="0"  allowfullscreen></iframe>	
		</c:if>	
		</font>		
					</td>
				</tr>
				<tr>
					<td align="center" colspan="7" height="500">
					<font color="grey">					
					<c:if test="${empty board.file}">&nbsp; &nbsp;</c:if>
					<c:if test="${not empty board.file}">
					<img src="download.do?num=${board.num }"><br></a>
					</c:if>					
					<p>
					</p> 
					<c:if test="${empty board.content}">No content</c:if> 
					<c:if test="${not empty board.content}">${board.content }</c:if>
					</font>
					</td>
				</tr>
				
				<tr>
					<td align="center" colspan="7">	
<input type="submit" value="Delete This Content" style="background-color: white; border: 1px solid #FFBF00; color: #FFBF00; font-weight: bold;">			
<input type="button" value="Modify"onclick="location.href='modifyForm.do?num=${board.num}'"style="background-color: #FFBF00; color: white; font-weight: bold; border: 1px solid #FFBF00;">
<input type="button" value="To the Board"onclick="location.href='boardList.do'"	style="background-color: white; border: 1px solid #FFBF00; color: #FFBF00; font-weight: bold;">
<input type=button value="Back" onClick="history.back();"style="background-color: white; border: 1px solid #FFBF00; color: #FFBF00; font-weight: bold;">
					</td>
				</tr>
				
				<tr>
<td align="center" colspan="7">	
<!-- <iframe width="980" height="551" src="http://www.youtube.com/embed/7JmprpRIsEY?autoplay=1&loop=1&playlist=7JmprpRIsEY" frameborder="0"  allowfullscreen></iframe> -->
</td>
				</tr>


			</table>

			</form>
			<br> <br> <br>

		</font>

	</center>

</body>
</html>