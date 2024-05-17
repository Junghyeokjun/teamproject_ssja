<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>T 9</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>



  </script>
  <script src="/js/footer.js">

  </script>
  <script src="/js/barscript.js">

  </script>
   <link href="/css/footerstyle.css?after" rel="stylesheet">
  <link href="/css/barstyle.css?after" rel="stylesheet">
  <link rel="stylesheet" href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">
  <script>
    $(document).ready(function () {
     
      //추가변수 시작 
      let $detail_search_btn = $("#detail_search_btn");
      let $detail_search_bar = $("#detail_search_bar");
     // 추가변수 끝
    // 추가부분
      $detail_search_bar.load("detail_serach.html")
      function hideDetailSearchBar() {
          $detail_search_bar.css("display", "none");
      }
      function showDetailSearchSideBar() {
          $detail_search_bar.css("display","block");
      }
      $detail_search_btn.on("click", function () {
   
        if ($detail_search_bar.css("display") === "block") {
          hideDetailSearchBar();
        } else { 
          showDetailSearchSideBar();
        }
      });
      $(window).on("click", function (event) {
  
        if ($side_bar.css("display") === "block" && !$(event.target).closest('#barbtn').length) {
          hideSideBar();
        }
      });

    });
    
  </script>
  <style>
  
  </style>
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
    /* 추가부분 */
    #detail_search_bar{
      background-color: #f7f0e8;  
      width: 100%;
      position: absolute;
      display: none;
    }
  </style>
</head>

<body>
  <header>
    <div id="title_bar" class=" fixed-top">
      <div class="py-2 px-1" id="top-bar">

        <button type="toggle-button" class="top_btn" id="top_btn"></button>
        <a href=""><img id="logo_img" src="/images/utilities/logo.png"></a>
        <form action="http://www.naver.com" id=searchForm method="get">
        
        </form>
        <a id="cart_link"><img id="cart_img"></a>
        <a id="user_link"><img id="login_img"></a>
      </div>

    </div>
    <nav id="total_bar">
      <div id="home_user_bar"> </div>
      <div id="sub_bar"></div>
    </nav>
  </header>

  <div id="side_bar"></div>
  <main style="background-color: #f7f0e8;">
    <div id="main_container" style="height:800px;">
      <!--추가부분시작 -->
      <div id="detail_search_bar"></div>
      <div id="search" style="height: 131px;">
        <button id="detail_search_btn" style="background-color: transparent;border-color: transparent;text-decoration: none;">상세검색</button>
      </div>
    </div>

  </main>

  <footer>
    <div id="first_footer" class="p-3"></div>
    <div id="second_footer"></div>
    <div id="third_footer"></div>
  </footer>

</body>

</html>