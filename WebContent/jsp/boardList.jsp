<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body {
	border: 0;
	padding: 0;
	background-image: url('bgForBoard_Main1.jpg');
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

					<br>

		<p>
		<input type="button" value="To the Member Main" onclick="location.href='main.do'" style="  font-weight: bold; border: 1px solid #grey; background-color: grey; color:white; ">
		<input type="button" value="Log out" onclick="location.href='logout.do'" style="  font-weight: bold; border: 1px solid #grey; background-color: white; color:grey;"> 
		</p>
		<p>
		<span style="font-size: 130pt">
		<font color="grey" style="font-family: Georgia; ">The BoardList</font></span>
		</p>
		
		
						<font color="grey" style="font-family: Georgia; ">		
		
		<table>
			<tr>
				<td width="1250px" colspan="5" bgcolor="grey"></td>
			</tr>
			<tr style="color:grey; font-weight:bold;">

				<th width="100px" align="center">Number</th>
				<th width="700px" align="center">Title</th>
				<th width="200px" align="center">Write Date</th>
				<th width="100px" align="center">Read Count</th>
				<th width="150px" align="center">Writer</th>

			</tr>
			<tr>
				<td width="1250px" colspan="5" bgcolor="grey"></td>
			</tr>
			
			<c:forEach items="${boardList }" var="board">
				<tr>
					<td align="center">${board.num }</td>
					<td>
		<c:if test="${empty board.title}"><a href="view.do?num=${board.num }">No title</a></c:if>
		<c:if test="${not empty board.title}"><a href="view.do?num=${board.num }">${board.title }</a></c:if>	
					</td>
					<td align="center">
					<fmt:formatDate value="${board.writedate }"
							pattern="yyyy-MM-dd" /></td>
							
					<td align="center">${board.readCount }</td>
					<td align="center">${board.name }</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td width="1250px" colspan="5" bgcolor="grey"></td>
			</tr>
			
			<tr>
			<font color="#FFBF00">
				<td width="1250px" colspan="5" align="center">
<!-- 					<font color="#FFBF00"> -->
					<c:if test="${current != 1 }">
						<a href="boardList.do?page=1">[First page]</a>
						<a href="boardList.do?page=${current-1 }">[Prev]</a>
					</c:if>
					
					<c:forEach begin="${startPage }" end="${last }" var="item" varStatus="status" step="1">
						<c:choose>
							<c:when test="${item== current }">
								[${item }]
							</c:when>
							<c:otherwise>
								<a href="boardList.do?page=${item }">[${item }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> 
					<c:if test="${ current >= last }">
						다음
					</c:if> 
					<c:if test="${ current < last }">
						<a href="boardList.do?page=${current+ 1 }">Next</a>
					</c:if> 
					<a href="boardList.do?page=${last }">[end]</a>
	
					<input type="button" value="Write"
					onclick="location.href='writeForm.do'" style="border: 1px solid #grey; background-color: grey; color:white; font-weight:bold;">
<!-- 				</font> -->
				</td>
				</font>				
			</tr>
		</table>
</font>
	</center>
</body>
</html>