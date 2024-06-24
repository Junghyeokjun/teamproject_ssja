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
                width: 100%; 
                height: 100%;
              }

              .best_post{
                position: relative;
                width: 23%; 
                height: 20vh;
              }

              .best_post>span:nth-child(2){
                position: absolute;
                bottom: 20px;
                left: 5px;
              }
              .best_post>span:nth-child(3){
                position: absolute;
                bottom: 5px;
                left: 5px;
              }

              .best_post>img:hover{
                cursor: pointer;
                opacity: 0.7;
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

              .recent_post>span{
                position: absolute;
                bottom: -110px;
                left: 5px;
              }
              
              #recent_post_wrap>span{
                position: relative;
                margin-left: 20px;
              }

              #recent_post_wrap>span>img{
                width: 8.3vw;
                min-width: 125px;
                height: 250px;
              }
              #recent_post_wrap>span>img:hover{
                cursor: pointer;
                opacity: 0.7;
              }
              #recent_post_wrap > span:nth-child(7n){
                margin-left: 140px;
              }
              #recent_post_wrap>span:first-child{
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

              @media screen and (max-width : 1900px) {
                #recent_post_wrap>span>img{
                width: 8.8vw;
              }
              }
              
              @media screen and (max-width : 1024px) {
                #main_container{
                  min-width: 700px;
                }
                #recent_post_wrap>span>img{
                  width: 20vw;
                  min-width: 150px;
                }

                #recent_post_wrap>span:nth-child(7n){
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

                #best_post>span{
                  width: 49%; 
                  height: 25vh;
                  margin-bottom: 2%;
                }
                #recent_post_wrap>span{
                  margin-left: 20px;
                  margin-right: 0px;
                }

                #recent_post_wrap>span:nth-child(4n){
                  margin-right: 0px;
                }
                #recent_post_wrap>span>img{
                  width: 30vw;
                  min-width: 0px;
                }
              }
            </style>

            <script>
              
              $(document).ready(function(){

                let best_post=$("#best_post");
                let recent_post_wrap=$("#recent_post_wrap");
                
                //베스트 게시물을 추가하는 부분
                $.ajax({
                  type : "GET",
                  async : false,
                  dataType:"json",
                  url : "/community/bestPost",
                  data :{
                    pageNum : 1,
                    amount : 11
                  },    
                  success : function(data) {
                    var temp_node;
                    var temp_child;
                    data.forEach(function(e, idx){
                      temp_node=$('<span class="best_post"></span>');
                      temp_child=$('<img  src="'+e.img_path+'" alt=""></img>')
                      temp_child.on("click",function(){
                        window.location="/community/content/"+e.bno;
                      })

                      temp_node.append(temp_child);
                      temp_node.append('<span class="fs-4 fw-bold">'+e.btitle +'</span>');
                      temp_node.append('<span>'+e.bwriter +'</span>');
                      best_post.append(temp_node);
                    })
                  },    
                  error : function(request, status, error) {
                    alert(error);
                  }
                })

                //최신게시물 추가하는 부분
                $.ajax({
                  type : "GET",
                  async : false,
                  dataType:"json",
                  url : "/community/post",
                  data :{
                    pageNum : 1,
                    amount : 11
                  },    
                  success : function(data) {
                    var temp_node;
                    var temp_child;
                    data.postList.forEach(function(e, idx){
                      temp_node=$('<span class="recent_post"></span>');
                      temp_child=$('<img  src="'+e.img_path+'" alt=""></img>')
                      temp_child.on("click",function(){
                        window.location="/community/content/"+e.bno;
                      })

                      temp_node.append(temp_child);
                      temp_node.append('<span>'+e.bwriter +'</span>');
                      recent_post_wrap.append(temp_node);
                    })

                    temp_node=$('<a id="img_link" href="${pageContext.request.contextPath}/community/main"></a>');
                    temp_node.append($('<img src="/images/utilities/arrow1.png" alt="">'));
                    temp_node.append($('<span>더보기</span>'));
                    recent_post_wrap.append(temp_node);
                    
                    choiceTextColor();
                  },    
                  error : function(request, status, error) {
                    alert(error);
                  }
                })

                //최신게시물 화살표 이벤트
                $(document).on("click","#next_btn",function(){
                  $("#recent_post_wrap").css("animation","next_full_post 0.3s ease-in-out forwards");
                  $("#prev_btn").removeAttr("hidden");
                  $("#next_btn").attr("hidden","hidden");
                })
                  // $("#prev_btn").css("display","inline");
                  // $("#next_btn").css("display","none");

                $(document).on("click","#prev_btn",function(){
                  $("#recent_post_wrap").css("animation","prev_full_post 0.3s ease-in-out forwards");
                  $("#next_btn").removeAttr("hidden");
                  $("#prev_btn").attr("hidden","hidden");
                      // $("#next_btn").css("display","inline");
                      // $("#prev_btn").css("display","none");
                      
                })
                $("#prev_btn").attr("hidden","hidden");
              })

              //배경색에 따라 텍스트 컬러를 선택해주는 메서드
              function choiceTextColor(){

              $(".recent_post").each(function(){
                  // var canvas=document.getElementById('myCanvas');
                  var canvas = document.createElement('canvas');
                  var ctx = canvas.getContext('2d');

                  // Canvas에 이미지를 그림
                  var img = this.children[0];
                  canvas.width = img.width;
                  canvas.height = img.height;
                  ctx.drawImage(img, 0, 0, img.width, img.height);

                  var text_width=$(this.children[1]).css("width").replace("px","");
                  var text_height=$(this.children[1]).css("height").replace("px","");

                  // Canvas에서 이미지 데이터를 가져와서 처리
                  var imageData = ctx.getImageData(0, img.height-text_height, text_width, text_height);

                  var data = imageData.data;
                  var totalR = 0, totalG = 0, totalB = 0, totalA=0;

                  // 이미지의 평균 색상 계산
                  for (var i = 0; i < data.length; i += 4) {
                      totalR += data[i];
                      totalG += data[i + 1];
                      totalB += data[i + 2];
                      totalA += data[i+3];
                  }

                  var avgR = Math.floor(totalR / (data.length / 4));
                  var avgG = Math.floor(totalG / (data.length / 4));
                  var avgB = Math.floor(totalB / (data.length / 4));
                  var avgA = Math.floor(totalA / (data.length / 4));

                  // 평균 색상 값에 따라 텍스트의 색상을 결정
                  var textElement = this.children[1];
                  var textColor = calculateTextColor(avgR, avgG, avgB,avgA); // 평균 색상을 기준으로 텍스트 색상 계산
                  textElement.style.color = textColor;
              })       
              }   
              // 평균 색상에 따라 텍스트 색상을 결정하는 함수
              function calculateTextColor(r, g, b,a) {

              console.log(r+" "+g+" "+b+" "+a);
              if(a==0){
                  return 'black';
              }
              // RGB 색상값을 기준으로 흑백으로 변환할 수 있는 알고리즘을 사용하여 색상 결정
              var brightness = (r * 0.299 + g * 0.587 + b * 0.114);
              return brightness > 186  ? 'black' : 'white'; // 임계값에 따라 검정 또는 흰색 선택
              }
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
        <a id="user_link" href="/login"><img id="login_img"></a>
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

            <main style="min-height: 650px;">
              <div id="main_container" class="mt-4 px-2">
                <div class="d-flex justify-content-between  mb-1">
                  <span class="fs-3">베스트 게시물</span>
                </div>
                <div id="best_post" class="mb-4">
                  <!-- ajax로 데이터추가 -->
                  <!-- <span class="best_post">                  
                    <img src="/images/product_banner/product_banner_1.jpg" alt="">
                    <span class="fs-4 fw-bold"> title</span>
                    <span>name</span>
                  </span>
                  <span class="best_post">                  
                    <img src="/images/product_banner/product_banner_2.jpg" alt="">
                  </span>
                  <span class="best_post">                  
                    <img src="/images/product_banner/product_banner_3.jpg" alt="">
                  </span>
                  <span class="best_post">                  
                    <img src="/images/product_banner/product_banner_2.jpg" alt="">
                  </span> -->

                  
                </div>
                <div class="d-flex justify-content-between">
                  <span class="fs-3">최신 게시물</span>
                  <span style="line-height: 40px;"><a href="${pageContext.request.contextPath}/community/main" style="text-decoration: none; color: black;">더보기</a></span>
                </div>
                <div id="recent_post" class="mb-3">
                  <button id="prev_btn" type="button" tabIndex={-1}>
                    <img src="/images/utilities/arrow1.png" alt="">
                  </button>
                  <div id="recent_post_wrap">
                    <!-- ajax로 데이터추가 -->
                    <!-- <span class="recent_post">
                      <img src="/images/product_banner/product_banner_1.jpg" alt="">
                      <span>sss</span>
                    </span> -->
                    
                    <!-- ajax로 데이터 추가후 추가 -->
                    <!-- <a id="img_link" href="${pageContext.request.contextPath}/community/main"> 
                      <img src="/images/utilities/arrow1.png" alt="">
                      <span>더보기</span>
                    </a> -->

                  </div>
                  <button id="next_btn" type="button" tabIndex={-1}>
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
   <sec:authorize access="isAuthenticated()">
  <script src="/js/login_user_tab.js"> </script>
  <script src="/js/user_cart_tab.js"> </script>
</sec:authorize>


          </body>


          </html>