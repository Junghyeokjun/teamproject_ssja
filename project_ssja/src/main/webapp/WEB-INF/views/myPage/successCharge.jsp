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
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
   <meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

  <script src="/js/barscript.js">

  </script>

  <script src="/js/footer.js">

  </script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
  <link href="/css/footerstyle.css?after" rel="stylesheet">
  <link href="/css/barstyle.css?after" rel="stylesheet">

  <link rel="stylesheet" href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">

  <style>
#main_content_dv img {
	width:100%;
	height:200px;
}
#main_content_dv > div{
margin-left:1em;
margin-right:1em;
border:1px solid #ccc;
height:350px;
display:flex;
flex-direction:column;
justify-content:space-between;
align-items:center;
width:20%;
}
#main_content_dv  button{
widht:60%;
height:50px;
margin-bottom:1em;
color:white;
font-weight:bold;
border:none;
}
#main_content_dv{
width:88%;
}
#main_top{
background-color:#f7f0e8;
}
#main_btn_container{
margin-top:35px;
margin-bottom:50px;

}
#main_btn_container > a > button{
width:10em;
height:5em;
border-radius:2px;
margin-left:1em;
margin-right:1em;
}
</style>
</head>

<body>
<sec:authentication property="principal" var="principal" />
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
		  
  <main>
  
    <div id="main_container" class="d-flex flex-column align-items-center justify-content-center" style="width:70%;">
    	
    	<div class="w-100 p-5" id="main_top" style="height:150px;">
    		<h2 style="margin-left:3em;"> 충전 완료</h2>
    		
    	</div >
    	<div class="w-100 p-5 d-flex justify-content-center" id="main_content">
    	<div>
    	<div class="w-100 my-3">
    	<h4>충전이 무사히 완료되었습니다.</h4>
    	</div>
    	<div class="text-center mt-5">
    	미리 충전 시 저희 SSJA에서는 2% 추가 적립을 해드리고 있습니다.<br>
    	충전 금액은 아래 마이페이지 버튼을 통해 확인하실 수 있으며, 충전하신 포인트는 상품을 구매하실 때 현금처럼 사용하실 수 있습니다.
    	</div>
    	</div>
    	</div>
    	<div id="main_btn_container" class="d-flex flex-row justify-content-center">
    	<a href="/home"><button class="btn btn-dark">홈으로</button></a>
    	<a href="/myPage"><button class="btn btn-dark">마이페이지</button></a>
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


<script>

</script>

</html>