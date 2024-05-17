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
  <script src="footer.js">

  </script>
  <link href="footerstyle.css?after" rel="stylesheet">


  <link rel="stylesheet" href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">
  <script>
    $(document).ready(function () {
      let $home_user_bar = $("#home_user_bar").addClass("nav ");
      let $sub_bar = $("#sub_bar");
      let $total_bar = $("#total_bar");
      //추가변수 시작 
      let $detail_search_btn = $("#detail_search_btn");
      let $detail_search_bar = $("#detail_search_bar");
     // 추가변수 끝

      //상강 카테고리 바 분류
      let $ul = $("<ul>").attr("id", "list_category").appendTo($home_user_bar);
      let $li1 = $("<li>").css("order", "1").text("가구").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);
      let $li2 = $("<li>").css("order", "2").text("패브릭").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);
      let $li3 = $("<li>").css("order", "3").text("쇼핑하기").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);
      let $li4 = $("<li>").css("order", "4").text("생활소품").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);
      let $li5 = $("<li>").css("order", "5").text("인테리어").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);

      //카테고리 분류 바 순서대로 링크
      let $link1_1 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("1-1").css("text-decoration", "none");
      let $link1_2 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("1-2").css("text-decoration", "none");
      let $link1_3 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("1-3").css("text-decoration", "none");

      let $link2_1 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("2-1").css("text-decoration", "none");
      let $link2_2 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("2-2").css("text-decoration", "none");
      let $link2_3 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("2-3").css("text-decoration", "none");

      let $link3_1 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("3-1").css("text-decoration", "none");
      let $link3_2 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("3-2").css("text-decoration", "none");
      let $link3_3 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("3-3").css("text-decoration", "none");

      let $link4_1 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("4-1").css("text-decoration", "none");
      let $link4_2 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("4-2").css("text-decoration", "none");
      let $link4_3 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("4-3").css("text-decoration", "none");

      let $link5_1 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("5-1").css("text-decoration", "none");
      let $link5_2 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("5-2").css("text-decoration", "none");
      let $link5_3 = $("<a>").attr("href", "https://www.naver.com").addClass("button").text("5-2").css("text-decoration", "none");



      let $searchForm = $("#searchForm");
      let $searchIn = $("<input>").attr("placeholder", "search").attr("id", "searchIn").appendTo($searchForm);
      let $searchBtn = $("<button>").attr("id", "searchBtn").attr("type", "submit");

      $("<img>").attr("src", "sear.png").attr("id", "searchImg").appendTo($searchBtn);//검색창 돋보기 이미지 경로
      $searchBtn.appendTo($searchForm);

      let $cartLink = $("#cart_link").attr("href", " http://www.naver.com");//카트 이미지 버튼
      let $userLink = $("#user_link").attr("href", " http://www.google.com");//로그인 이미지 버튼 링크
      let $cartImgPath = $("#cart_img").attr("src", "cartShop.png");//카트 이미지 경로
      let $loginImgPath = $("#login_img").attr("src", "login.png");//로그인 이미지 경로


      $li1.mouseenter(function () {
        $sub_bar.css("display", "block");
        $("#sub_bar").children().remove();
        let $subUl = $("<ul>").addClass("sub-nav").appendTo($sub_bar);
        let $subLi1 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link1_1.appendTo($subLi1);
        let $subLi2 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link1_2.appendTo($subLi2);
        let $subLi3 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link1_3.appendTo($subLi3);
      });
      $li2.mouseenter(function () {
        $sub_bar.css("display", "block");
        $("#sub_bar").children().remove();
        let $subUl = $("<ul>").addClass("sub-nav").appendTo($sub_bar);
        let $subLi1 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link2_1.appendTo($subLi1);
        let $subLi2 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link2_2.appendTo($subLi2);
        let $subLi3 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link2_3.appendTo($subLi3);

      });
      $li3.mouseenter(function () {
        $sub_bar.css("display", "block");
        $("#sub_bar").children().remove();
        let $subUl = $("<ul>").addClass("sub-nav").appendTo($sub_bar);
        let $subLi1 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link3_1.appendTo($subLi1);
        let $subLi2 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link3_2.appendTo($subLi2);
        let $subLi3 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link3_3.appendTo($subLi3);

      });
      $li4.mouseenter(function () {
        $sub_bar.css("display", "block");
        $("#sub_bar").children().remove();
        let $subUl = $("<ul>").addClass("sub-nav").appendTo($sub_bar);
        let $subLi1 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link4_1.appendTo($subLi1);
        let $subLi2 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link4_2.appendTo($subLi2);
        let $subLi3 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link4_3.appendTo($subLi3);

      });
      $li5.mouseenter(function () {
        $sub_bar.css("display", "block");
        $("#sub_bar").children().remove();
        let $subUl = $("<ul>").addClass("sub-nav").appendTo($sub_bar);
        let $subLi1 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link5_1.appendTo($subLi1);
        let $subLi2 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link5_2.appendTo($subLi2);
        let $subLi3 = $("<li>").addClass("sub-px-3").appendTo($subUl);
        $link5_3.appendTo($subLi3);

      });

      let $barbtn = $(".top_btn").addClass("btn btn-ouyline-dark").attr("id", "barbtn").text("☰");
      let side_h = $(window).height();
      let $side_bar = $("#side_bar").css("height", side_h);


      function hideSideBar() {
        $side_bar.css("animation", "slideLeftFromIn 0.3s ease-in-out forwards");
        setTimeout(function () {
          $side_bar.css("display", "none");
        }, 300);
      }
      function showSideBar() {
        $side_bar.css("animation", "slideInFromLeft 0.3s ease-in-out forwards");
        $side_bar.css("display", "block");
      }


      $barbtn.on("click", function () {

        if ($side_bar.css("display") === "block") {
          hideSideBar();
        } else {
          showSideBar();
        }
      });


      $(window).on("click", function (event) {

        if ($side_bar.css("display") === "block" && !$(event.target).closest('#barbtn').length) {
          hideSideBar();
        }
      });


      $total_bar.mouseleave(function () {
        $sub_bar.css("display", "none");
      });

   

      $(window).on('scroll', function() {
    let $side_bar = $('#side_bar');
    let scrollPosition = $(this).scrollTop();

    if (scrollPosition === 0) {
        // 브라우저 최상단에 위치할 때
        $side_bar.css('top', '130px');
    } else {
        // 최상단이 아닐 때
        $side_bar.css('top', '65px');
    }
});

      $ul.append($li1, $li2, $li3);
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
    body {
      background-color: white;
    }

    header {
      background-color: #f7f0e8;

    }

    #title_bar {
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #f7f0e8;
      margin: 0;
    }

    #top-bar {
      width: 66%;
      display: flex;
      flex-direction: row;
      align-items: center;
      margin: 0;
      height: 65px;
    }

    #home_user_bar {
      width: 66%;
      padding: 0.5m;
      color: black;
      color: white;
      margin: 0;
      height: auto;
    }

    #header_container {

      width: 66%;


    }

    #total_bar {
      margin-top: 65px;
      background-color: #95857F;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    }

    main {
      width: 100%;
      padding: 0;
      margin: 0;
      display: flex;
      flex-direction: column;
      align-items: center;
      background-color: white;
    }

    #main_container {
      width: 66%;

    }

    #sub_bar {
      width: 100%;
      padding: 1.5em;
      background-color: #95857F;
      display: none;
      flex-direction: row;
      justify-content: space-evenly;
      align-items: center;
      position: absolute;
      top: 100%;
      left: 0;
      z-index: 1;
      height: auto;
    }

    #sub_bar a {
      color: white;
    }

    #list_category {
      list-style: none;
      padding: 0;
      display: flex;
      flex-direction: row;
      justify-content: space-evenly;
      align-items: center;
      height: auto;
      margin-bottom: 0.5em;
      margin-top: 0.5em;
    }



    .sub-nav {

      list-style: none;
      display: flex;
      flex-direction: row;
      margin-left: 17%;
    }

    .sub-nav>li {
      margin-left: 2em;
    }

    #sub_bar {
      padding: 0;

    }

    nav {
      position: relative;
    }

    #barbtn {
      background-color: transparent;
      border: 1px solid #333333;
      color: black;
      font-size: 1.5rem;
      cursor: pointer;
      border: none;
      display: block;
    }

    #side_bar {
      width: 17%;
      background-color: white;
      display: none;
      color: black;
      position: fixed;
      top: 130px;
      left: 0;
      z-index: 999;
      padding: 0;
      margin: 0;
      border-right: 1px solid #cccccc;

    }


    @media screen and (max-width: 720px) {

      #barbtn {
        display: block;
      }

      #list_category>li {
        margin-left: 0em;
      }

    }

    @media screen and (max-width: 640px) {
      #total_bar {
        height: 0;
      }

      #top-bar,
      #home_user_bar,
      #header_container,
      #main_container {
        width: 100%;

      }

      #side_bar {
        width: 25%;
      }
    }

    @media screen and (max-width: 860px) {

      #barbtn {
        display: block;
      }


    }



    @media screen and (max-width: 1120px) and (min-width: 860px) {

      #top-bar,
      #home_user_bar,
      #header_container,
      #main_container {
        width: 88%;

      }

      #side_bar {
        width: 20%;
      }

      #list_category>li {
        margin-left: 3em;
      }
    }

    @media screen and (max-width: 560px) {

    }
    @keyframes slideInFromLeft {
      0% {
        transform: translateX(-100%);
        opacity: 0;
      }

      100% {
        transform: translateX(0);
        opacity: 1;
      }
    }

    @keyframes slideLeftFromIn {
      from {
        transform: translateX(0);

      }

      to {
        transform: translateX(-100%);

      }
    }

    #side_bar {
      animation: slideInFromLeft 0.3s ease-in-out forwards;
    }

    #test_btn {
      background-color: black;

      border-radius: 0;
    }

    #top-bar {

      display: flex;
      flex-direction: row;
      align-items: center;
    }

    #linked_btn {
      display: inline-block;
      padding: 10px 20px;
      background-color: #4CAF50;
      color: white;
      text-align: center;
      text-decoration: none;
      font-size: 16px;
      border: none;
      cursor: pointer;
      border-radius: 5px;
    }

    #searchImg,
    #login_img {
      width: 35px;

      height: 35px;
      border: 0px;
      margin-left: 1em;
    }

    #cart_img {
      width: 45px;

      height: 45px;
      border: 0px;
      margin-right: 1em;
    }

    #searchBtn {
      border: 0px;
      background-color: white;

    }



    #searchForm {
      border-bottom: 5PX SOLID #222222;
      background-color: white;
      padding: 3px;
      border-radius: 15 15 15 15;
      margin: auto;

    }

    #searchIn {
      border: 0px;
    }

    input:focus {
      outline: none;
      border-color: #ffffff;
    }
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
        <a href=""><img id="logo_img" src="logo.png"></a>
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

  <div id="side_bar"> 사이드바</div>
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