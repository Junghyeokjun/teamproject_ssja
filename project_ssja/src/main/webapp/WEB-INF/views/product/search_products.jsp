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
    
/* 추가 */
#product_search_select{
font-size:0.8em;
width:100%;
display:flex;
flex-direction:column;
align-items:center;
}
#product_search_select > div{
display:flex;
flex-direction:row;
align-items:center;
width:100%;
border-bottom:1px solid #ccc;
margin-top:1em;
margin-bottom:1em;
}
#product_search_select > div > button{
marigin-right:1.5em;
marigin-left:1.5em;
border:none;
background-color:white;
}

#product_search_select > div > input{

width:7em;
}
#product_search_select > div > span{
marign-right:1em;
marign-left:1em;
}

  </style>
  <style>

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
    <div id="main_container" >
    
    <div id="product_search_select" class="" style=" width:100%;">
		<div class="m-3"style="border-bottom:1px solid #ccc" ><h3>세부 조회</h3></div>
		
		<div class="w-100 mx-3">
		<h5>이름 별</h5>
		<span>|</span>
		<button>가나다순</button>
		<button>가나다역순</button>
		<button>이름 길이 순</button>
		<button>이름 길이 짧은 순</button>
		</div>
		
		<div class="w-100 mx-3">
		<h5>가격 별</h5>
		<span>|</span>
		<button>0 ~ 3만원대</button>
		<button>3 ~ 5만원대</button>
		<button>5 ~ 10 만원대</button>
		<button>10 ~ 20만원대</button>
		
		<input>
		<span>원~</span>
		<input>
		<span>원</span>
		<form class="mb-1 my-auto"><button id="search_custom_money_btn" class="btn btn-dark" style="width:4em;height:2em;">검색</button></form>
		
		</div>
		
		
		<div class="w-100 mx-3">
		<h5>분류 별</h5>
		<span>|</span>
		<button>인기 순</button>
		<button>별점 순</button>
		<button>후기 순</button>
		<button>위시 순</button>
		<button>신상품 순</button>
		</div>
    </div>
    
    <div id="product_content" class="my-5">
    
    </div>
 	 
</div>
  </main>

  <footer>
    <div id="first_footer" class="p-3"></div>
    <div id="second_footer"></div>
    <div id="third_footer"></div>
  </footer>
 

</body>
<script src="/js/product/getListProduct.js"></script>
</html>