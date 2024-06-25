<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
  <title>SSJA</title>
  <sec:authorize access="isAuthenticated()">
  	<sec:authentication property="principal" var="principal" />
	<script>  		
		let getPrincipal = {
			'memberNum' : '${principal.memberNum}',
			'userName' : '${principal.userInfo.m_Name}'
		}
		console.log(getPrincipal);
	</script>
  </sec:authorize>
    
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
   <meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<c:choose>
<c:when test="${principal.auth != 'ROLE_VENDOR'}">
  <script src="/js/barscript.js">

  </script>
  <link href="/css/barstyle.css?after" rel="stylesheet">
</c:when>
<c:when test="${principal.auth == 'ROLE_VENDOR'}">
  <script src="/js/vendorbarscript.js">

  </script>
  <link href="/css/vendorbarstyle.css?after" rel="stylesheet">
</c:when>
</c:choose>
  <script src="/js/footer.js">

  </script>
  
  <script src="/js/board.js">
  </script>
  <link href="/css/footerstyle.css?after" rel="stylesheet">
  <link href="/css/board.css?after" rel="stylesheet">

  <link rel="stylesheet" href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">

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
	<sec:authorize access="isAuthenticated()">
		<c:set var="isAuthenticated" value="true"/>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<c:set var="isAuthenticated" value="false"/>
	</sec:authorize>
<c:choose>
	<c:when test="${principal.auth != 'ROLE_VENDOR'}">
	  <header>
	    <div id="title_bar" class="fixed-top">
	      <div class="py-2 px-1" id="top-bar">
	        <button type="toggle-button" class="top_btn" id="top_btn"></button>
	        <a id="logo_toHome" href=""><img id="logo_img" src="/images/utilities/logoSSJA.png"></a>
	        <form action="http://www.naver.com" id=searchForm method="get">
	
	        </form>
	        <button id="search_icon"></button>
	        <a id="cart_link"><img id="cart_img"></a>
        <a id="user_link" href="/login"><img id="login_img"></a>
	      </div>
	
	    </div>
	    <nav id="total_bar">
	      <div id="home_user_bar"> </div>
	      <div id="sub_bar"></div>
	    </nav>
	  </header>
  </c:when>
  <c:when test="${principal.auth == 'ROLE_VENDOR'}">
  	<header class="fixed-top">
		<div id="title_bar" >
			<div class="py-2 px-1 d-flex justify-content-between" id="top-bar">
				<div class="d-flex align-items-center">
					<button type="toggle-button" class="top_btn"></button>
					<a id="logo_toHome" href=""><img id="logo_img" src="/images/utilities/logoSSJA.png"></a>
				</div>
				<div class="mx-5 my-2 d-flex ">
					<h1 class="h1 vendorTitle" >판매자 :&nbsp;</h1>
        			<h1 class="h1 vendorNames"> 
        				&lt;
        				<sec:authorize access="isAuthenticated()">
        					<sec:authentication property="principal.userInfo" var="vendorMember"/>
        				</sec:authorize>
        				<input type="hidden" id="vendorData" value="${vendorMember.m_No}">
        				${vendorMember.m_Name}
        				&gt;</h1>      			
        		</div>
        		<a id="cart_link" hidden="hidden"></a>
				<a id="user_link" href="<sec:authorize access="isAuthenticated()">/mypage</sec:authorize><sec:authorize access="!isAuthenticated()">/login</sec:authorize>"><img id="login_img"></a>
			</div>
		</div>
		<nav id="total_bar">
		</nav>
	</header>
  </c:when>
</c:choose>
	<div id="side_bar">
		<div id="side_links" class="w-100"></div>
	</div>
	<main>
		<div class="main_whitespace p-5 my-2">
			<h1 class="h3 text-center">${bc.bcname} 게시판</h1>
		</div>
		<div id="main_container" style="margin: 0 auto;">
			<sec:authorize access="isAuthenticated()">
				<c:choose>
					<c:when test="${principal.auth == 'ROLE_USER' || principal.auth == 'ROLE_ADMIN'}">
						<div class="d-flex justify-content-end p-1">
							<a href="${pageContext.request.contextPath}/board/write_view/${bc.bcno}" class="btn btn-primary btn-tuning">글 작성</a>				
						</div>
					</c:when>
				</c:choose>
			</sec:authorize>
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
					<c:forEach var="board" items="${boards}">
						<tr>
							<td>${board.bno}</td>					
							<td>							
								<a class="board_title" href="${pageContext.request.contextPath}/board/content_view/${bc.bcno}?bno=${board.bno}">${board.btitle}</a>
							</td>
							<td>${board.bwriter}</td>
							<td class="date_str">${board.bdate}</td>
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
								href="${pageContext.request.contextPath}/board/list/${category}${pageMaker.makeQuery(pageMaker.startPage-1)}"><</a></li>
						</c:if>
						<c:forEach var="idx" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<c:choose>
								<c:when test="${pageMaker.criteria.pageNum == idx}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/board/list/${category}${pageMaker.makeQuery(idx)}">${idx}</a>
									</li>
								</c:when>
								<c:when test="${pageMaker.criteria.pageNum != idx}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/board/list/${category}${pageMaker.makeQuery(idx)}">${idx}</a></li>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item"><a class="page-link ch-col"
								href="${pageContext.request.contextPath}/board/list/${category}${pageMaker.makeQuery(pageMaker.endPage+1)}">></a></li>
						</c:if>
					</ul>
				</nav>
			</div>			
		</div>
		<div class="main_whitespace p-5 my-2">
			
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
<sec:authorize access="isAuthenticated()">
  <script src="/js/login_user_tab.js"> </script>
  <script src="/js/user_cart_tab.js"> </script>  
</sec:authorize><script type="text/javascript">
	$(document).ready(function(){
		let isAuthenticated = '${isAuthenticated}';
		console.log(typeof isAuthenticated);
		console.log(isAuthenticated);
		$('.board_title').on('click',function(e){
			e.preventDefault();
			if(isAuthenticated == 'false'){
				if (confirm('문의글을 보기 위해서는, 로그인이 필요합니다. 로그인하시겠습니까?')) {
					window.location.href = '/login';
				}
			}else{
				window.location.href = $(this).attr('href');
			}			
		})
	});
</script>
</html>