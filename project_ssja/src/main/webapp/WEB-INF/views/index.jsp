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
#title_best_conner  button{
width:3em;
background-color:white;
border:none;
font-size:2.5em;
color:#aaa;
}

#title_best_conner  button:hover{
color:#333;
}
#title_best_conner{
display:flex;
flex-direction:row;
justify-content:space-between;
align-items:center;

}

  </style>
</head>

<body>
  <header>
    <div id="title_bar" class=" fixed-top">
      <div class="py-2 px-1" id="top-bar">

        <button type="toggle-button" class="top_btn" id="top_btn"></button>
        <a id="logo_toHome" href=""><img id="logo_img" src="/images/utilities/logoSSJA.png"></a>
        <form action="/logout" id=searchForm method="post">

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
    
 	   <div id="carouselExampleIndicators" class="carousel slide">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"data-bs-slide-to="0" 
						class="active" aria-current="true"aria-label="Slide 1"></button>
				</div>
				<div class="carousel-inner" id="event_banner_content">
					<div class="carousel-item active">
					<a href="/event/page?event=0"><img src="/images/event/banner/event_banner_img_default.jpg" id="event_banners" class="d-block w-100" alt="Event1..."></a>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>



    <div id="best_items_container">
    <div id ="title_best_conner" class="my-3"><h2 class="mx-3">Best</h2><button id="more_best_item_btn">></button></div>
    
    
    
    <div id="best_item_content">
    
    </div>
    
    
    
    </div>
    
      <div id="icon_container" class="d-flex flex-row justify-content-evenly align-items-center">
          <div id="icon_div"><img id="icon_img"src="/images/utilities/icon_fur.png"><div id="icn_txt">가구</div></div>
          <div id="icon_div"><img id="icon_img" src="/images/utilities/icon_fab.png">  <div id="icn_txt">패브릭</div></div>
          <div id="icon_div"><img id="icon_img" src="/images/utilities/icon_inte.png"> <div id="icn_txt">인테리어</div></div>
          <div id="icon_div"><img id="icon_img" src="/images/utilities/icon_cook.png"><div id="icn_txt">주방용품</div></div>
          <div id="icon_div"><img id="icon_img" src="/images/utilities/icon_life.png"><div id="icn_txt">생활용품</div></div>
    </div>
</div>
  </main>

  <footer>
    <div id="first_footer" class="p-3"></div>
    <div id="second_footer"></div>
    <div id="third_footer"></div>
  </footer>

</body>
<script src="/js/mainpage/mainpage.js" >
</script>
<script src="/js/mainpage/bestItemList.js" >
</script>


</html>