<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>작성 창</h1>	
	<form action="${pageContext.request.contextPath}/board/write" method="post">
		<table border="1" style="width: 500; background-color: gray;">
			<tr>
				<td style="background-color: pink">제목</td>
				<td style="background-color: white"><input type="text" name="btitle" size="50"></td>
			</tr>
			<tr>
				<td style="background-color: pink">내용</td>
				<td style="background-color: white"><textarea name="bcontent" rows="10"></textarea></td>
			</tr>
			<tr>
				<td style="background-color: pink" colspan="2"><input type="submit" value="입력">&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/board/list">목록보기</a> </td>
			</tr>
		</table>
	</form>
</body>
</html>