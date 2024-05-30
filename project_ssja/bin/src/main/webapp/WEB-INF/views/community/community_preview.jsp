<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

          <!DOCTYPE html>
          <html lang="en">

          <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>SSJA</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous" />
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
              integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
              crossorigin="anonymous">
              </script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <script src="/js/barscript.js">

            </script>
            <script src="/js/footer.js">

            </script>
            <meta name="_csrf" content="${_csrf.token}" />
            <meta name="_csrf_header" content="${_csrf.headerName}" />
            <link href="/css/footerstyle.css?after" rel="stylesheet">
            <link href="/css/barstyle.css?after" rel="stylesheet">

            <link rel="stylesheet" href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">

            <style>
              @font-face {
                font-family: 'fonts';
                src: url("https://webfontworld.github.io/NanumSquare/NanumSquare.css") fotmat('font1');
              }
              @keyframes next_full_post{
                0% {
                  transform: translateX(0);
                }

                100% {
                  transform: translateX(-38%);
                }
              }
              @keyframes prev_full_post{
                0% {
                  transform: translateX(-38%);
                }

                100% {
                  transform: translateX(0);
                }
              }
              body {
                font-family: 'fonts', NanumSquare;
                background-color: #f7f0e8;
              }

              #logo_img {
                width: 3.5em;
                height: 3em;
                width: 90%;
              }
              #main_container{
                max-width: 1100px;
                min-width: 900px
              }

              #best_post{
                display: flex;
                flex-direction: row;
                justify-content: space-between;
              }

              #best_post img{
                width: 23%; 
                height: 20vh;
              }
              #recent_post{
                position: relative;
                overflow: hidden;
                height: 250px;
              }

              #recent_post_wrap{
                width: 280%;
                height: 250px;
              }
              
              #recent_post_wrap>img{
                width: 8.8vw;
                min-width: 125px;
                height: 250px;
                margin-left: 20px;
              }
              #recent_post_wrap>img:nth-child(7n){
                margin-left: 100px;
              }
              #recent_post_wrap>img:first-child{
                margin-left: 1vw;
              }
              #prev_btn{
                z-index: 1;
                position: absolute;
                top: 95px;
                left: -18px;
                background-color: transparent;
                border-color: transparent;
              }
              #prev_btn img{
                width: 60px;
                height: 60px;
              }
              #next_btn{
                position: absolute;
                top: 95px;
                right: -18px;
                background-color: transparent;
                border-color: transparent;
              }
              #next_btn img{
                transform: scaleX(-1);
                width: 60px;
                height: 60px;
              }
              #img_link{
                position: relative;
                margin-left: 40px;
              }
              #img_link img{
                width: 60px;
                height: 60px;
                transform: scaleX(-1);
              }
              #img_link span{
                position: absolute;
                width: 60px;
                top: 30px;
                right:-10px;
              }
              @media screen and (max-width : 1024px) {
                #main_container{
                  min-width: 700px;
                }
                #recent_post_wrap>img{
                  width: 20vw;
                  min-width: 150px;
                }

                #recent_post_wrap>img:nth-child(7n){
                  margin-left: 20px;
                }
                #prev_btn,#next_btn{
                  display: none;
                }
              }

              @media screen and (max-width : 768px) {
                #best_post{
                  flex-wrap: wrap;
                }

                #best_post img{
                  width: 49%; 
                  height: 25vh;
                  margin-bottom: 2%;
                }
                #recent_post_wrap>img:nth-child(4n){
                  margin-right: 0px;
                }
                #recent_post_wrap>img{
                  width: 30vw;
                  min-width: 0px;
                  margin-left: 20px;
                  margin-right: 0px;

                }
              }
            </style>

            <script>
              $(document).ready(function(){
                $(document).on("click","#next_btn",function(){
                  $("#recent_post_wrap").css("animation","next_full_post 0.3s ease-in-out forwards");
                  $("#prev_btn").css("display","inline");
                  $("#next_btn").css("display","none");
                })

                $(document).on("click","#prev_btn",function(){
                  $("#recent_post_wrap").css("animation","prev_full_post 0.3s ease-in-out forwards");
                    $("#next_btn").css("display","inline");
                    $("#prev_btn").css("display","none");
                  
                })
                $("#prev_btn").css("display","none");
                
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
            </header>

            <div id="side_bar">
              <div id="side_links" class="w-100"></div>
            </div>

            <main style="height: 600px;">
              <div id="main_container" class="vh-100 mt-4 px-2">
                <div class="d-flex justify-content-between  mb-1">
                  <span class="fs-3">베스트 게시물</span>
                  <span style="line-height: 40px;">더보기</span>
                </div>
                <div id="best_post" class="mb-4">
                  <!-- ajax로 데이터추가 -->
                  <img src="/images/product_banner/product_banner_1.jpg" alt="">
                  <img src="/images/product_banner/product_banner_2.jpg" alt="">
                  <img src="/images/product_banner/product_banner_3.jpg" alt="">
                  <img src="/images/product_banner/product_banner_2.jpg" alt="">
                  
                </div>
                <div class="d-flex justify-content-between">
                  <span class="fs-3">최신 게시물</span>
                  <span style="line-height: 40px;">더보기</span>
                </div>
                <div id="recent_post">
                  <button id="prev_btn" type="button">
                    <img src="/images/utilities/arrow1.png" alt="">
                  </button>
                  <div id="recent_post_wrap">
                    <!-- ajax로 데이터추가 -->
                    <img src="/images/product_banner/product_banner_1.jpg" alt="">
                    <img src="/images/product_banner/product_banner_2.jpg" alt="">
                    <img src="/images/product_banner/product_banner_3.jpg" alt="">
                    <img src="/images/product_banner/product_banner_1.jpg" alt="">
                    <img src="/images/product_banner/product_banner_2.jpg" alt="">
                    <img src="/images/product_banner/product_banner_3.jpg" alt="">
                    <img src="/images/product_banner/product_banner_1.jpg" alt="">
                    <img src="/images/product_banner/product_banner_2.jpg" alt="">
                    <img src="/images/product_banner/product_banner_3.jpg" alt="">
                    <img src="/images/product_banner/product_banner_1.jpg" alt="">
                    <img src="/images/product_banner/product_banner_2.jpg" alt="">
                    <!-- ajax로 데이터 추가후 추가 -->
                    <a id="img_link" href=""> 
                      <img src="/images/utilities/arrow1.png" alt="">
                      <span>더보기</span>
                    </a>

                  </div>
                  <button id="next_btn" type="button">
                    <img src="/images/utilities/arrow1.png" alt="">
                  </button>
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