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
	<h1>${reply_view.bid}번 글에 댓글 쓰기</h1>
	<form action="${pageContext.request.contextPath}/board/reply" method="post">
		<input type="hidden" name="bid" value="${reply_view.bid}">
		<input type="hidden" name="bgroup" value="${reply_view.bgroup}">
		<input type="hidden" name="bstep" value="${reply_view.bstep}">
		<input type="hidden" name="bindent" value="${reply_view.bindent}">	
		<table border="1" style="width: 500; background-color: gray;">
			<tr>
				<td style="background-color: pink">글번호</td>
				<td style="background-color: white">${reply_view.bid}</td>
			<tr>
				<td style="background-color: pink">조회수</td>
				<td style="background-color: white"><input type="text" name="bhit" size="50" value="${reply_view.bhit}" readonly="readonly"></td>
			</tr>
			<tr>
				<td style="background-color: pink">이름</td>
				<td style="background-color: white"><input type="text" name="bname" size="50" value="${reply_view.bname}"></td>
			</tr>			
			<tr>
				<td style="background-color: pink">제목</td>
				<td style="background-color: white"><input type="text" name="btitle" size="50" value="${reply_view.btitle}"></td>
			</tr>
			<tr>
				<td style="background-color: pink">내용</td>
				<td style="background-color: white"><textarea name="bcontent" rows="10">${reply_view.bcontent}
				---[답변내용]---</textarea></td>
			</tr>
			<tr>
				<td style="background-color: pink" colspan="2"><input type="submit" value="답변">&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/board/list">목록보기</a></td>
			</tr>
		</table>
	</form>
</body>
</html>