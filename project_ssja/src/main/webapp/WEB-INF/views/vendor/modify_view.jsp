<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
  <title>SSJA</title>

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
	<sec:authorize access="isAnonymous()">
	    <script type="text/javascript">
	    	$(document).ready(function(){
	    		alert("관리자와 작성자 본인만 해당 페이지를 확인하실 수 있습니다. 먼저 로그인을 진행하시기 바랍니다.");
				window.location.href = "/login";
	    	});
		</script>
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
	        <a id="user_link"><img id="login_img"></a>
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
				<a id="user_link"><img id="login_img"></a>
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
		<div id="main_container">
			<div class="main_whitespace p-5">
				<h1 class="h3 text-center">내용 수정하기</h1>
			</div>
			<form class="form" action="${pageContext.request.contextPath}/vendor/question/modify" method="post">
				<sec:csrfInput />
				<div class="input-group">
					<input type="hidden" class="form-control" name="bbcno" value="${modify_view.bbcno}">
					<input type="hidden" class="form-control" name="bno" value="${modify_view.bno}">			
				</div>
				<table class="table" >
					<tr>
						<td colspan="2">
							<div class="input-group no-border">
	    						<input type="text" class="form-control" name="btitle" value="${modify_view.btitle}">
	    					</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group">
								<textarea id="board_textarea" name="bcontent" class="form-control" rows="10" placeholder="내용을 입력하세요.">${modify_view.bcontent}</textarea>	    				
	    					</div>
						</td>		
					</tr>
					<tr>
						<td colspan="2">
							<div class="d-flex justify-content-between">
								<input type="submit" class="btn btn-danger customed-ssja" value="수정">
								<a class="btn btn-primary customed-ssja" href="${pageContext.request.contextPath}/vendor/question/${modify_view.bbcno}">취소</a>								
							</div>
						</td>
					</tr>
				</table>
			</form>
			<div class="main_whitespace p-5">
				
			</div>
		</div>
	</main>
	<footer>
		<div id="first_footer" class="p-3"></div>
		<div id="second_footer"></div>
		<div id="third_footer"></div>
	</footer>	

</body>
<sec:authorize access="isAuthenticated()">
  <script src="/js/login_user_tab.js"> </script>
  <script src="/js/user_cart_tab.js"> </script>  
</sec:authorize>
</html>