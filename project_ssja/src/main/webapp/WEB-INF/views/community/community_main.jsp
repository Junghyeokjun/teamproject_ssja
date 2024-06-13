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
      width:90%;
    }
    


  </style>
  <script>
    $(document).ready(function(){
      $("#insert_btn").on("click",function(){
        location.href="/community/content/insert"
      })
    })
  </script>
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
    <sec:authorize access="isAuthenticated()">
    	<sec:authentication property="principal" var="principal"/>
    </sec:authorize>
  </header>

  <div id="side_bar"> 
    <div id="side_links" class="w-100"></div>
</div>

  <main>
    <div id="main_container" >

      <div id="community_content" class="mt-4 mb-2"></div>


        <div class="w-100 d-flex justify-content-between ms-4" style="">
          <span></span>
          <span class="ms-4">
            <select name="" id="search_opt" style="height: 29px;">
              <option value="all" selected>전체</option>
              <option value="title">제목</option>
              <option value="content">내용</option>
              <option value="title_and_content">제목+내용</option>
              <option value="writer">작성자</option>
            </select>
            <input type="text" id="search_keyword" class="ms-2">
            <button type="button" id="search_btn" class="btn btn-primary btn-sm ms-1" >검색</button>
          </span>
          <span style="width: 70px;height: 40px;">
            <c:if test="${principal != null}">
              <button id="insert_btn" type="button" class="btn btn-primary">글쓰기</button>
            </c:if>
          </span>
        </div>
      <div id="paging_dv" class="d-flex flex-row justify-content-center align-items-center mb-4"> </div>
    
    </div>
  </main>

  <footer>
    <div id="first_footer" class="p-3"></div>
    <div id="second_footer"></div>
    <div id="third_footer"></div>
  </footer>
 

</body>
<script src="/js/community/getListCommunity.js"></script>
</html>