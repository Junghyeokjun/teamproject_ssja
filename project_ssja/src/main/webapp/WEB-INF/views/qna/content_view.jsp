<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
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
<script src="/js/board.js">
	
</script>

<link href="/css/footerstyle.css?after" rel="stylesheet">
<link href="/css/barstyle.css?after" rel="stylesheet">
<link href="/css/board.css?after" rel="stylesheet">

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

.main_whitespace{
	width : 100%;
	height : 5em;
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
			<div class="main_whitespace">
				
			</div>
			<form action="${pageContext.request.contextPath}/qna/modify_view" method="post">
				<div class="input-group">
					<input type="hidden" class="form-control" name="bno" value="${content_view.bno}">
					<sec:csrfInput />
				</div>
				<table class="table" >
					<tr>
						<td colspan="2">
							<div class="input-group no-border">
	    						<input type="text" class="form-control text-center" name="btitle" value="${content_view.btitle}" readonly="readonly">
	    					</div>
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td >
							<div class="d-flex justify-content-end">
								<div class="input-group no-border w-25">
									<span class="input-group-text">조회수</span>
		    						<input type="text" class="form-control" name="bhit" value="${content_view.bhit}" readonly="readonly">
		    					</div>
		    				</div>					
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<div class="d-flex justify-content-end">
							<div class="input-group no-border w-25">
								<span class="input-group-text">작성자</span>
	    						<input type="text" class="form-control" name="bwriter" value="${content_view.bwriter}" readonly="readonly">
	    					</div>
	    					</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group">
								<textarea id="qna_textarea" name="bcontent" class="form-control" rows="10" readonly="readonly">${content_view.bcontent}</textarea>	    				
	    					</div>
						</td>		
					</tr>
					<tr>
						<td  colspan="2">
							<div class="d-flex justify-content-center">
								<!-- data-likebmno 값 변경 필요 -->
								<button id="like-button" data-likebno="${content_view.bno}" data-likebmno="${content_view.bmno}">좋아요</button>
							</div>
					</tr>
					<tr>
						<td  colspan="2" style="border: none;">
							<div class="text-center">
								<p>
									좋아요 수 : <span id="like-count">${content_view.blike}</span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td  colspan="2">
							<div class="d-flex justify-content-between">
								<input type="submit" class="btn btn-danger customed-ssja" value="수정">
								<a class="btn btn-primary customed-ssja" href="${pageContext.request.contextPath}/qna/list">되돌아가기</a>								
								<%-- &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/qna/delete?bno=${content_view.bno}">삭제</a> --%>
							<%-- <sec:authorize access="hasRole('ROLE_ADMIN')">
								&nbsp;&nbsp;<a
									href="${pageContext.request.contextPath}/qna/${content_view.bno}">답변</a>
							</sec:authorize> <sec:authorize access="!hasRole('ROLE_ADMIN')">

							</sec:authorize> --%>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="">
							
							</div>
							<div>
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<c:if test="${pageMaker.prev}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/board/list2${pageMaker.makeQuery(pageMaker.startPage-1)}"><<a></li>
										</c:if>
										<c:forEach var="idx" begin="${pageMaker.startPage}"
											end="${pageMaker.endPage}">
											<c:choose>						
												<c:when test="${pageMaker.criteria.pageNum == idx}">
													<li class="page-item active"><a class="page-link"
														href="${pageContext.request.contextPath}/board/list2${pageMaker.makeQuery(idx)}">${idx}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/board/list2${pageMaker.makeQuery(idx)}">${idx}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/board/list2${pageMaker.makeQuery(pageMaker.endPage+1)}">></a></li>
										</c:if>
									</ul>
								</nav>
							</div>
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