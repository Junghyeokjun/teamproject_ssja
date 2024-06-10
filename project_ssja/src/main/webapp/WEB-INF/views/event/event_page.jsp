<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
  <script src="/js/barscript.js">

  </script>
  <script src="/js/footer.js">

  </script>
   <meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
  <link href="/css/footerstyle.css?after" rel="stylesheet">
  <link href="/css/barstyle.css?after" rel="stylesheet">

  <link rel="stylesheet" href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">

  <style>
    @font-face {
      font-family: 'fonts';
      src: url("https://webfontworld.github.io/NanumSquare/NanumSquare.css") fotmat('font1');
    }

    body {
      font-family: 'fonts', NanumSquare;
      background-color: #f7f0e8;
    }

    #logo_img {
      width: 3.5em;
      height: 3em;
    }
    
    #event_top{
    border-bottom:1px solid #cccccc;
    text-aling:center;
    margin-top:2em;
    margin-bottom:1em;
    }
    #event_top_next > sapn{
    margin-left:2em;
    margin-right:2em;
    }
   
  </style>

</head>

<body>
  <header>
    <div id="title_bar" class=" fixed-top">
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

  <div id="side_bar"> 
    <div id="side_links" class="w-100"></div>
</div>


	<main>
		<div id="main_container">
		
		<div id="event_top" class="d-flex justify-content-center">
		<h3>이벤트</h3>
		</div>
		
		<div id="event_top_next" style="border-bottom:1px solid #cccc;" class="my-3 d-flex justify-content-between align-items-center py-2"> 
		<span>상태 | 
		<c:choose>
		
   				 <c:when test="${evPageInfo.ev_status == 1}"> 진행 중 </c:when>
    			<c:when test="${evPageInfo.ev_status == 0}">  종료</c:when>
   			 	<c:otherwise> 상태 정보 없음</c:otherwise>
    
		</c:choose>
		</span>
		<span>기간 :  ${evPageInfo.ev_duedate } 까지</span>
		</div>
		
		<img src="/images/event/page/event_page_${evPageInfo.ev_no}.jpg" class="w-100 " style="height:auto;" id="event_main_content">
		
		<div id="event_bottom" style="border-bottom:1px solid #cccc;border-top:1px solid #cccc;" class="d-flex flex-row my-3 py-3"> 
		<span class="mx-3">작성자 :  관리자 </span>
		<span class="mx-3">등록일 :${evPageInfo.ev_startdate } </span>
		</div>
		
		</div>
	</main>


	<footer>
    <div id="first_footer" class="p-3"></div>
    <div id="second_footer"></div>
    <div id="third_footer"></div>
  </footer>
   <sec:authorize access="isAuthenticated()">
  <script src="/js/login_user_tab.js"> </script>
</sec:authorize>
</body>


</html>