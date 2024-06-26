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
            <script src="https://kit.fontawesome.com/0fa31147fa.js" crossorigin="anonymous"></script>
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
              .yellowStar {
                color: orange;
                opacity: 1;
              }
              .review_content{
                width: 450px; 
                height: 27px; 
                overflow: hidden;
                margin-left: 100px;

              }


            </style>
            <script>
              function getProduct(pro_no,element){

                $.ajax({
                  type : 'GET',
                  url : '/community/product/'+pro_no,
                  async : false,
                  dataType : 'json',  
                  success : function(result) {
                    $(element.children[0]).text(result.pro_BIZNAME);
                    $(element.children[1]).text(result.pro_NAME);
                  },    
                  error : function(request, status, error) {
                    alert(error);
                  }
                })
              }
              $(document).ready(function(){
                $(".product").each(function(){
                  getProduct($(this).attr("prono"),this);
                })
                $(".user_review").first().addClass("border-bottom");

              })
            </script>
          </head>

          <body>
            <header>
              <c:if test="${user==null}">
                <script>
                  location.href="/"
                </script>
              </c:if>
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
                <div class="d-flex flex-row mt-5">
                  <img class="mx-5" src="${pageContext.request.contextPath}/images/utilities/default_profile.jpg" alt="" style="width: 100px; height: 100px; border-radius: 100px;">  
                  <span>
                    <p class="mt-3 fs-3">${user.getM_NICKNAME()}</p>
                    <p class="ms-4">${user.getM_ADDRESS1().split(" ")[0]}</p>      
                  </span>
                </div>   
                <div class="mt-3 mx-5"> 
                  <p class="fs-2 mb-0 fw-bold">리뷰</p>
                  <div class="border" style="border-radius: 10px;">
                    <span id="user_review" class=" px-2" style="min-height: 42px; display: block;"> 
                      
                      <c:choose>
                        <c:when test="${reviews.size()!=0}">
                          
                          <c:forEach var="review" items="${reviews}">
                            <div class="product mt-3 ms-2" prono="${review.prono}">
                                <a href="${pageContext.request.contextPath}/product_detail?PRO_NO=${review.prono}" class="fs-5 fw-bold text-dark" style=" text-decoration: none;">
                                    상호명
                                </a>
                                <a href="${pageContext.request.contextPath}/product_detail?PRO_NO=${review.prono}" class="fs-5 fw-bold pro_name ps-4 text-dark d-inline-block" style=" width: 620px; text-decoration: none;">
                                    상품이름
                                </a>  
                            </div>
                            <div class="user_review pb-3 d-flex justify-content-between">
                              <span class="d-flex align-items-center" style="height: 27px;">
                                 
                                  <span class="fs-5 text-dark d-inline-block review_content">${review.bcontent}</span>
                                </a>
                              </span>
                              <span class="pe-4">
                                <span>${review.bwriter}</span>
                                <c:forEach var="i"
                                begin="1" end="5">
                                <c:choose>
                                  <c:when test="${review.beval >= i }">
                                    <i class="fa fa-star yellowStar" aria-hidden="true"></i>
                                  </c:when>
                                  <c:otherwise>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                  </c:otherwise>
                                </c:choose>
                                </c:forEach>
                              </span>
                            </div>
                            <!-- <div class="border"></div> -->
                          </c:forEach>   
                        </c:when>
                        <c:otherwise>
                          <p class="fs-5">해당 유저가 작성한 리뷰가 없습니다.</p>
                        </c:otherwise>
                      </c:choose>               
                  </div>
                </div>           
                <div class="my-3 mx-5"> 
                  <p class="fs-2 mb-0 fw-bold">커뮤니티</p>
                  <div class="border" style="border-radius: 10px;">
                    <span id="community" class="pt-2 ps-2" style="min-height: 90px; display: block;"> 
                      <c:choose>
                        <c:when test="${communitys.size()!=0}">
                          
                          <c:forEach var="community" items="${communitys}">
                            <div class="user_review mb-2 d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/community/content/${community.bno}" style="text-decoration: none;">
                                    <span class="ms-2 text-dark">${community.btitle}</span>
                                </a>
                              <span class="pe-4">${community.bdate}</span>
                            </div>
                          </c:forEach>   
                        </c:when>
                        <c:otherwise>
                          <p class="fs-5">해당 유저가 작성한 커뮤니티 게시글이 없습니다.</p>
                        </c:otherwise>
                      </c:choose>               

                    </span>
                  </div>
                </div>      


              </div>
              
            </main>

            <footer>
              <div id="first_footer" class="p-3"></div>
              <div id="second_footer"></div>
              <div id="third_footer"></div>
            </footer>
 <sec:authorize access="isAuthenticated()">
	 
	 <sec:authorize access="hasRole('ROLE_VENDOR')">
        <input type="hidden" id="isVendorCheck" value="1">
    </sec:authorize>
	 
  <script src="/js/login_user_tab.js"> </script>
  <script src="/js/user_cart_tab.js"> </script>
</sec:authorize>

          </body>


          </html>