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
  </style>
  <style>
#icon_div  img{
  width: 40%;
  
  text-align: center;
}
#icon_div{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
#icon_container{
  padding:1.5em;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
}
#icn_txt{
  text-align: center;
}
#event_banners{
width:100% auto;
height:30em;
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
    <div id="main_container" >
  <br>  메인 이벤트 배너 이미지 기본 출처  : <a href="https://shop.realcommerce.kr/kwa-real_event_v-22?process_num=26&pc=p">banner_default</a>
 	<br>메인 이벤트 배너 이미지 1 출처 : <a href="https://kr.freepik.com/free-vector/gradient-abstract-sale-banners-set_15628367.htm#query=%EC%9D%B4%EB%B2%A4%ED%8A%B8%20%EB%B0%B0%EB%84%88&position=5&from_view=keyword&track=ais_user_b&uuid=3f1c4775-f9b7-4e37-88b3-4008dfa4a88e">banner1</a>
 <br>	메인 이벤트 배너 이미지 2 출처 : <a href="https://kr.freepik.com/free-vector/flat-black-friday-horizontal-banners-set_18393662.htm#query=%EC%9D%B4%EB%B2%A4%ED%8A%B8%20%EB%B0%B0%EB%84%88&position=40&from_view=keyword&track=ais_user_b&uuid=3f1c4775-f9b7-4e37-88b3-4008dfa4a88e">banner2</a>
 <br>	메인 이벤트 배너 이미지 3 출처 : <a href="https://kr.freepik.com/free-vector/gradient-retro-vaporwave-birthday-sale-banner_20082280.htm#query=%EC%9D%B4%EB%B2%A4%ED%8A%B8%20%EB%B0%B0%EB%84%88&position=24&from_view=keyword&track=ais_user_b&uuid=3f1c4775-f9b7-4e37-88b3-4008dfa4a88e">banner3</a>
<br>
<br>  이벤트 페이지 이미지 1 출처 : <a href="https://befe.co.kr/m/event/befe.php?bgu=view&idx=771&event_cate=2">이벤트 페이지 이미지1</a>
<br>  이벤트 페이지 이미지 2 출처 : <a href="https://www.lguplus.com/pogg/event/1%EC%9B%94-0%EC%9B%90-%EC%9D%B4%EB%B2%A4%ED%8A%B8">이벤트 페이지 이미지2</a>
<br>  이벤트 페이지 이미지 3 출처 : <a href="https://www.lime-in.co.kr/app/mob/news/RONA100200.do?bultSeq=3180&stdt=20170121">이벤트 페이지 이미지3</a>


</div>
  </main>

  <footer>
    <div id="first_footer" class="p-3"></div>
    <div id="second_footer"></div>
    <div id="third_footer"></div>
  </footer>

</body>


</html>