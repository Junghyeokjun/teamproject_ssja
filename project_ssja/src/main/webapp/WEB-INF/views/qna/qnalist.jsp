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
<script src="/js/datetuning.js">

  </script>
<link href="/css/footerstyle.css?after" rel="stylesheet">
<link href="/css/barstyle.css?after" rel="stylesheet">
<link href="/css/qna.css?after" rel="stylesheet">

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
	<main style="margin: 0 auto;">
		<a href="${pageContext.request.contextPath}/qna/write_view">글작성</a>
		<div id="main_container" style="margin: 0 auto;">
			<table class="table table-hover" style="text-align: center;">
				<thead class="table-dark">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>이름</td>
						<td>날짜</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="qna" items="${qnas}">
						<tr>
							<td>${qna.bno}</td>
							<td>
	            				<a id="qna_title" class="" href="${pageContext.request.contextPath}/qna/content_view?bno=${qna.bno}" >${qna.btitle}</a>
							</td>
							<td>${qna.bwriter}</td>
							<td class="date_str">${qna.bdate}</td>
							<%-- <td><button type="button" onclick="location.href='/dept/remove?deptno=${dept.deptno}';">삭제</button></td> --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<nav aria-label="Page navigation example">
					<ul class="pagination ch-col justify-content-center">
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link ch-col"
								href="${pageContext.request.contextPath}/qna/list${pageMaker.makeQuery(pageMaker.startPage-1)}"><</a></li>
						</c:if>
						<c:forEach var="idx" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<c:choose>
								<c:when test="${pageMaker.criteria.pageNum == idx}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/qna/list${pageMaker.makeQuery(idx)}">${idx}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/qna/list${pageMaker.makeQuery(idx)}">${idx}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item"><a class="page-link ch-col"
								href="${pageContext.request.contextPath}/qna/list${pageMaker.makeQuery(pageMaker.endPage+1)}">></a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</main>
	<script type="text/javascript">

	</script>

	<footer>
		<div id="first_footer" class="p-3"></div>
		<div id="second_footer"></div>
		<div id="third_footer"></div>
	</footer>

</body>
</html>