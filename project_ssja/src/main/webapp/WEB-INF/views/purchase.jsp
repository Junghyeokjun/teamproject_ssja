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
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



 
  <script src="/js/footer.js">
  </script>
  <script src="/js/barscript.js">
  </script>
  
   <link href="/css/footerstyle.css?after" rel="stylesheet">
  <link href="/css/barstyle.css?after" rel="stylesheet">
  <link rel="stylesheet" href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">

 

  <style>
    input:focus {
      outline: none;
      border-color: #ffffff;
    }

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
  <script>
    $(document).ready(function(){
      let post_search_btn=$("#post_search_btn");
      post_search_btn.on("click",function(){
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수

                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
                          extraAddr = ' (' + extraAddr + ')';
                      }
                      // 조합된 참고항목을 해당 필드에 넣는다.
                      document.getElementById("extra_address").value = extraAddr;
                  
                  } else {
                      document.getElementById("extra_address").value = '';
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('post').value = data.zonecode;
                  document.getElementById("address").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("detail_address").focus();
              }
          }).open();
      })
    })
  </script>
</head>

<body>
  <header>
    <div id="title_bar" class=" fixed-top">
      <div class="py-2 px-1" id="top-bar">

        <button type="toggle-button" class="top_btn" id="top_btn"></button>
        <a href="${pageContext.request.contextPath}/"><img id="logo_img" src="/images/utilities/logoSSJA.png"></a>
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

  <div id="side_bar"></div>
  <main style="background-color: #f7f0e8;">
    <!--결제 페이지부 -->
    <div id="main_container" class="d-flex flex-column " style="height:800px;">
      <h2 class="mt-3 fw-bold">주문/결제</h2>
      <div class="ms-3" style="margin-right: 30%;">
        <h3 class="mt-5 border-bottom ">배송지</h3>
        <table class="ms-3">
          <tr>
            <td>
              <span>주소</span>
            </td>
            <td>
              <input type="text" size="35" class="mb-1" id="address" name="M_ADDRESS1">
            </td>
          </tr>
          <tr>
            <td>
              <span>상세주소ㅤ</span>
            </td>
            <td>
              <input type="text" size="23" class=" mb-1" id="detail_address" name="M_ADDRESS2">
              <input type="text" size="6" class="mb-1 d-none" id="extra_address" name="extra_address" >
              <input type="text" size="10" class="mb-1 d-none" id="post" name="M_ZIPCODE">
              <input type="button" value="주소 찾기" class="mb-1 ms-3" id="post_search_btn">
            </td>
          </tr>
        </table>
      </div>
      <div class="ms-3" style="margin-right: 30%;">
         <h3 class="my-3 border-bottom">주문상품</h3>
         <!-- 아래부터 c:foreach로 반복 -->
        <div>
          <img src="/images/utilities/logoSSJA.png" alt="" style="width: 150px;height: 150px; float: left;">
          <div class="m-2 pt-3 fs-4"><span>상품명:</span><span>로고</span></div>
          <div class="m-2 fs-4"><span>선택옵션 :</span><span>네이비블루</span></div>
          <div class="m-2 fs-4"><span>금액:</span><span>1000원</span> <span>수량:</span> <span>1개</span></div>
        </div>
      </div>
      <div class="ms-3" style="margin-right: 30%;">
        <h3 class="my-3 border-bottom">쿠폰</h3>
        <select name="coupon" id="coupon">
          <option value="none">선택안함</option>
          <!-- c:foreach로 쿠폰추가 -->
          <option value="coupon1">쿠폰1</option>
          <option value="coupon2">쿠폰2</option>
          <option value="coupon3">쿠폰3</option>

        </select>
     </div>
     <div class="ms-3" style="margin-right: 30%;">
      <h3 class="my-3 border-bottom">포인트</h3>
      <input type="text">
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