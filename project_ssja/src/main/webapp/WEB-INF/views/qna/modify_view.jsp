<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSJA</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous">
    </script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/js/barscript.js">

  </script>
<script src="/js/footer.js">

  </script>
<link href="/css/footerstyle.css?after" rel="stylesheet">
<link href="/css/barstyle.css?after" rel="stylesheet">

<link rel="stylesheet"
	href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">

<style>
@font-face {
	font-family: 'fonts';
	src: url("https://webfontworld.github.io/NanumSquare/NanumSquare.css")
		fotmat('font1');
}

body {
	font-family: 'fonts', NanumSquare;
	background-color: #f7f0e8;
}

#logo_img {
	width: 3.5em;
	height: 3em;
}
</style>
<style>
#icon_div  img {
	width: 40%;
	text-align: center;
}

#icon_div {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

#icon_container {
	padding: 1.5em;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

#icn_txt {
	text-align: center;
}
</style>
</head>

<body>
	<header>
		<div id="title_bar" class=" fixed-top">
			<div class="py-2 px-1" id="top-bar">

				<button type="toggle-button" class="top_btn" id="top_btn"></button>
				<a href=""><img id="logo_img"
					src="/images/utilities/logoSSJA.png"></a>
				<form action="http://www.naver.com" id=searchForm method="get">

				</form>
				<button id="search_icon"></button>
				<a id="cart_link"><img id="cart_img"></a> <a id="user_link"><img
					id="login_img"></a>
			</div>

		</div>
		<nav id="total_bar">
			<div id="home_user_bar"></div>
			<div id="sub_bar"></div>
		</nav>
	</header>

	<div id="side_bar">
		<div id="side_links" class="w-100"></div>
	</div>
	<main>
		<div id="main_container">
		
	<h1>글 보기</h1>
	<form action="${pageContext.request.contextPath}/qna/modify" method="post">
		<input type="hidden" name="bno" value="${modify_view.bno}">	
		<table border="1" style="width: 500; background-color: gray;">
			<tr>
				<td style="background-color: pink">이름</td>
				<td style="background-color: white"><input type="text" name="bwriter" size="50" value="${modify_view.bwriter}" readonly="readonly"></td>
			</tr>
			<tr>
				<td style="background-color: pink">제목</td>
				<td style="background-color: white"><input type="text" name="btitle" size="50" value="${modify_view.btitle}" ></td>
			</tr>
			<tr>
				<td style="background-color: pink">내용</td>
				<td style="background-color: white"><textarea name="bcontent" rows="10">${modify_view.bcontent}</textarea></td>
			</tr>
			<tr>
				<td style="background-color: pink" colspan="2">
					<input type="submit" value="수정">
					&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/qna/list">취소</a>
					<%-- &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/qna/delete?bno=${modify_view.bno}">삭제</a> --%> 
				</td>
			</tr>
		</table>
	</form>
		</div>

	</main>

	<footer>
		<div id="first_footer" class="p-3"></div>
		<div id="second_footer"></div>
		<div id="third_footer"></div>
	</footer>

</body>
</html>