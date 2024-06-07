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
    var header = $("meta[name='_csrf_header']").attr('content');
    var token = $("meta[name='_csrf']").attr('content');
    history.replaceState({}, null, location.pathname);
    $(document).ready(function(){
      let bno_val=$("#bno").val();
      let update_btn=$("#update_btn");
      let update_img_btn=$("#update_img_btn");

      let m_no_val=$("#m_no").val();
      let m_NickName_val=$("#m_NickName").val();


     
      

     
    

    })

  </script>
</head>

<body>
  <c:if test="${content==null}">
    <script>
        window.location="/community/main";
    </script>
  </c:if>
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
    <input type="hidden" id="m_no" value="${principal.userInfo.m_No}">
    <input type="hidden" id="m_NickName" value="${principal.userInfo.m_NickName}">
  </header>

  <div id="side_bar"> 
    <div id="side_links" class="w-100"></div>
</div>

  <main>
    <input id="bno" type="hidden" value="${content.bno}">
    <div id="main_container" class="border-start border-end container">
        
      <div class="d-flex flex-column align-items-center mt-3 container-fluid">
        
        <div class="w-100 mb-3 d-flex flex-column align-items-center" contentEditable >

          <img src="${content.img_path}" alt="" id="update_img" class="w-75 d-inline-block mb-5 ">
          <input type="hidden" id="update_img" value="${content.img_path}">
          <div contentEditable="true" id="update_content" class="w-75">
            ${content.bcontent}
          </div>
        </div>
        <div class="ps-3 py-2 w-100 border-bottom d-flex flex-row justify-content-end">
          	<span>
              <button class="btn btn-primary" id="update_img_btn" >이미지 수정</button>
              <button class="btn btn-primary" id="update_btn" >수정하기</button>
            </span>

        </div>
        
      
      
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
</html>