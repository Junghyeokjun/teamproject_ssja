<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
   <meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>




  <script src="/js/barscript.js">

  </script>

  <script src="/js/footer.js">

  </script>
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
  </style>
  <style>
    .MyPage_btn {
      background-color: white;
      padding: 20px;

    }

    #MyPage_point {
      margin-left: auto;
    }

    #select_dv {
    
      margin: 2em;
      height: auto;
    }

    #content_dv {
      width: 80%;
      margin: 2em;
    }
    #MyPage_content_name{
      background-color: #f7f0e8;
      padding:3em;
     
    }
    #MyPage_content_name > h1{
    
      font-weight: bold;
      margin-left: 1em;

    }
    #select_MyPage{
      z-index:900;
      position: fixed;
      top:30%;
      left:5%;
      width:12%;
    }
    #select_mp_top{
      background-color: #f7f0e8;
      padding: 2em;
      height: auto;

    }
  </style>
</head>

<body>
  <header>
    <div id="title_bar" class=" fixed-top">
      <div class="py-2 px-1" id="top-bar">

        <button type="toggle-button" class="top_btn" id="top_btn"></button>
        <a href=""><img id="logo_img" src="/images/utilities/logoSSJA.png"></a>
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
    <div id="main_container" class="d-flex flex-row align-items-center justify-content-center" >
      
      <div id="content_dv" >
        
		   <div id="select_MyPage" class="d-flex flex-column">
		    <div id="select_mp_top" class="text-center">마이 페이지</div>
		    <div id="select_content">
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">회원 정보</button>
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">주문 사항</button>
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">주문 내역</button>
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">내가 쓴 글</button>
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">문의 및 요청</button>
		    </div>
		</div>

        <div id="MyPage_content_name" ><h1>선택 : </h1> </div>
        <div id="MyPage_content_container" class="border">
       

        </div>
      </div>


    </div>

  </main>

  <footer>
    <div id="first_footer" class="p-3"></div>
    <div id="second_footer"></div>
    <div id="third_footer"></div>
  </footer>

</body>

<script type="text/javascript">
					/*
					 $.ajax({
					 type : `http method type`,
					 url : `url`,
					 data : `서버에 전송할 데이터`,
					 contentType : "전송할 데이터 타입",
					 //기본 값 : "application / x-www-form-urlencoded; charset = UTF-8"  
					 dataType : '서버로 부터 수신할 데이터 타입',
					 //아무것도 지정하지 않으면 jQuery는 응답의 MIME 유형을 기반으로 해석을 시도
					 error : `에러 발생시 수행할 함수`,
					 success : `성공시 수행할 함수`
					}); 
					 */
					  let token = $("meta[name='_csrf']").attr("content");
					  let header = $("meta[name='_csrf_header']").attr("content");
				
					 let myPageUserInfo = function () {
						    $.ajax({
						        type: "post",
						        beforeSend: function(xhr){
						            xhr.setRequestHeader(header, token);
						        },
						        url: "/myPage/user", // 정적인 URL 사용
						        dataType: "json", // 받을 데이터의 유형 지정
						        success: function(data) {
						            let userInfo = data;
						            let $myPageContent = $("#MyPage_content_container")
						                .text(userInfo.m_Id);
						            console.log("data: " + data); 
						            console.log("userInfo: " + userInfo.m_Id); 
						            console.log(userInfo);
						            
						        }
						    });
						};
						myPageUserInfo();
		
			
</script>
<script>
					 

  $(document).ready(function () {
    let MyPage_link1 = "https://www.naver.com";
    let MyPage_link2 = "https://www.google.com";
    let MyPage_link3 = "https://www.daum.net";
    let MyPage_link4 = "https://store.ohou.se/exhibitions/12390";
    
  let select_dv = $("#select_content");
    
    $("#select_mp_top").on('click', function() {
        select_dv.toggle();
    });

  });

</script>

</html>