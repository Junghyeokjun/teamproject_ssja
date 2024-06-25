<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="_csrf" content="${_csrf.token}"/>
  <meta name="_csrf_header" content="${_csrf.headerName}"/>
  <title>T 9</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


  <script src="/js/barscript.js">
  </script>
  <script src="/js/footer.js">
  </script>
  
   <link href="/css/footerstyle.css?after" rel="stylesheet">
  <link href="/css/barstyle.css?after" rel="stylesheet">
  <link rel="stylesheet" href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">
  <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
 

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

    /* number타입의 input 화살표제거 */
    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
      -webkit-appearance: none;
      margin: 0;
    }
    /* 결제용 플로트 바 */
    #payment_title{
      border-bottom: 1px solid #DEE2E6;
      
    }
    #payment_bar{
      margin: 16px 0px 16px 16px;
      width: 68%;
      clear: both;
    }
    #full_amount,#result_price_wrap{
      text-align: right;
    }
    #discount{
      float: right;
    }
    #discount_per{
      color: #ccc;
      text-align: end;
      
    }
    #won{
      display: inline;
    }
    #buy_btn{
      width: 150px;
      height: 55px;
    }
    #buy_btn_wrap{
      display: flex;
      justify-content: end;
    }

    @media screen and (min-width: 861px) {
      #payment_title{
        display: none;
      }
      #payment_bar{
        position: fixed; 
        left: 70%;
        top: 220px; 
        text-align:center;
        width: 190px;
        height: 280px;
        margin-right: 50px;
        padding: 15px 5px;
        border: 1px solid #ccc;
        border-radius: 10px;
      }
      #full_amount,#discount{
        padding-right: 50px;
      }

      #result_price_wrap{
        padding-right: 25px;
      }
      #buy_btn_wrap{
        justify-content: center;
      }
      #discount_per{
        padding-right: 26px;
      }
    }

  </style>
  <script>
    //csrf토큰 변수
    var header = $("meta[name='_csrf_header']").attr('content');
    var token = $("meta[name='_csrf']").attr('content');

    //결제모듈 연동 코드
    var IMP = window.IMP
    IMP.init('imp22716806')
    function pay(f_amount,func){
      //파라미터로 수정 필요
      IMP.request_pay({
          pg : 'html5_inicis',
          pay_method : 'card', //카드결제
          merchant_uid : 'merchant_' + new Date().getTime(),
          name : '결제상품',
          amount : f_amount, //판매가격
          buyer_email : 'id', 
          buyer_name : 'my',
          buyer_tel : '01012345678 ',
          buyer_addr : 'gyeonggi',
          buyer_postcode : '11232'
        }, function(rsp) {
          if ( rsp.success ) {
              var msg = '결제가 완료되었습니다.';
              msg += '고유ID : ' + rsp.imp_uid;
              msg += '상점 거래ID : ' + rsp.merchant_uid;
              msg += '결제 금액 : ' + rsp.paid_amount;
              msg += '카드 승인번호 : ' + rsp.apply_num;
              window.alert(msg);
              console.log(msg);
              func();
          } else {
              var msg = '결제에 실패하였습니다.';
              msg += '에러내용 : ' + rsp.error_msg;
              window.alert(msg);
          }
      })
    }
    
    //남은 수량 체크 함수
    function quantity_check(proNo,quantity,proName){
      //남은 수량의 여부를 저장할 변수
      let temp_tf=true;

      $.ajax({
          type : 'GET',         
          beforeSend: function(xhr){
            xhr.setRequestHeader(header, token);
          },  
          url : '/sign/quantityCheck',
          async : false,
          headers : { 
            "Content-Type" : "application/json; charset:UTF-8" },
          dataType : 'json',
          data :{
            proNo : Number(proNo),
            quantity : Number(quantity)
          },    
          success : function(result) {
            if(result==false){
              //남은 수량이 적을시 실행될 함수
              alert(proName+" 상품의 남은 수량이 구매 수량보다 적습니다.")
              temp_tf=false;
            }
          },    
          error : function(request, status, error) {
          console.log(error)    
          }
        })
      return temp_tf;
    }
  

  //pay함수 호출로 결제 실행
    $(document).ready(function(){
      let point=$("#point");
      let use_point=0;
      let full_use_btn=$("#full_use_btn");
      let post_search_btn=$("#post_search_btn");
      let coupon=$("#coupon");
      let coupon_discount=0;
      let full_amount=$("#full_amount");
      let full_amount_val=0;
      let discount=$("#discount");
      let discount_val=0;
      let result_price=$("#result_price");
      let result_price_val=full_amount_val-discount_val;
      let discount_per=$("#discount_per");
      let payment='discount';
      let address=$("#address");
      let detail_address=$("#detail_address");
      let buy_btn=$("#buy_btn");
      let address_val;
      let detail_address_val;
      let M_NO_val;
      
      //유저정보 로드 코드
      myPageUserInfo = function() {
      
        $.ajax({
          type : "post",
          beforeSend : function(xhr) {
            xhr.setRequestHeader(header, token);
          },
          url : "/user/info", // 정적인 URL 사용
          dataType : "json", // 받을 데이터의 유형 지정
          success : function(data) {
            M_NO_val=data.m_No;
            
            address.val(data.m_Address1);
            address_val=address.val();

            detail_address.val(data.m_Address2);
            detail_address_val=detail_address.val();

            //포인트 입력제한을 소지 포인트로 거는 부분
            point.attr("max", data.m_Point);
          }
        })
      }
      myPageUserInfo();
      //결제성공시 ajax요청을 보내는 함수
    //필요할때마다 업데이트
    function pay_succese(){
        let product = [];
        $(".product").each(function(idx, item){
          product.push({product_no:item.querySelector(".product_no").value,
                        price : item.querySelector(".product_price").innerHTML*item.querySelector(".product_pcs").innerHTML,
                        quantity : item.querySelector(".product_pcs").innerHTML,
                        discount : discount_val/full_amount_val*item.querySelector(".product_price").innerHTML*item.querySelector(".product_pcs").innerHTML,
                        pay : result_price_val/full_amount_val*item.querySelector(".product_price").innerHTML*item.querySelector(".product_pcs").innerHTML,
                        coupon : $('#coupon option:selected').val()
                      });
        })

        $.ajax({
            type : 'POST',         
            beforeSend: function(xhr){
              xhr.setRequestHeader(header, token);
            },
            url : '/purchase/success',
            async : false,
            dataType : 'json',
            data :{
                M_NO : M_NO_val,
                PUR_TOT : full_amount_val,
                PUR_DC : discount_val,
                PUR_PAY : result_price_val,
                PUR_PAYMENT : payment,
                PUR_DVADDRESS : address_val+' '+detail_address_val,
                PUR_DV : '대한통운',
                USE_POINT : use_point,
                products: product  
            },    
            success : function(result) {
              location=("/purchase/complete?price="+result_price_val);
            },    
            error : function(request, status, error) {
              alert(error);
            }
          })
      }
      //주소 api 부분
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
                  address.val(addr);
                  address_val=address.val();

                  // 커서를 상세주소 필드로 이동한다.
                  detail_address.val("");
                  detail_address_val=detail_address.val();
                  document.getElementById("detail_address").focus();
              }
          }).open();
      })
      //결제 가격 세팅 메서드
      function amountSet(){
        full_amount.text(full_amount_val);
        discount.text(discount_val);
        result_price.text(result_price_val);
        discount_per.text(coupon_discount+"%");
      }

      //결제 관련 가격들을 세팅하는 부분
      $(".product").each(function(idx, item){
        full_amount_val+=Number(item.querySelector(".product_price").innerHTML)*Number(item.querySelector(".product_pcs").innerHTML);
      })
      result_price_val=full_amount_val-discount_val;
      amountSet();

      //주소변경시 주소값을 변경하는 부분
      address.on('change',function(){
        address_val=address.val();
      })

      detail_address.on('change',function(){
        detail_address_val=detail_address.val();
      })

      //수량증가 부분
      $(document).on('click','.pcs_plus',function(){
        var pcs=this.parentNode.parentNode.querySelector(".product_pcs");
        var amount=this.parentNode.parentNode.querySelector(".product_price");
        pcs.innerHTML=Number(pcs.innerHTML)+1;
        full_amount_val=Number(full_amount_val)+Number(amount.innerHTML);
        discount_val=Math.ceil(full_amount_val/100*coupon_discount);
        result_price_val=full_amount_val-discount_val;
        amountSet();
      })
      
      //수량감소 부분
      $(document).on('click','.pcs_minus',function(){
        var pcs=this.parentNode.parentNode.querySelector(".product_pcs");
        var amount=this.parentNode.parentNode.querySelector(".product_price");
        if(pcs.innerHTML=="1"){
          return;
        }
        pcs.innerHTML=Number(pcs.innerHTML)-1;
        full_amount_val=Number(full_amount_val)-Number(amount.innerHTML);
        discount_val=Math.ceil(full_amount_val/100*coupon_discount);
        result_price_val=full_amount_val-discount_val;
        amountSet();
      })

      //상품제거 부분
      $(document).on('click','.pro_rm',function(){
        var product=this.parentNode.parentNode
        var pcs=this.parentNode.parentNode.querySelector(".product_pcs");
        var amount=this.parentNode.parentNode.querySelector(".product_price");
        full_amount_val-=Number(amount.innerHTML)*Number(pcs.innerHTML);
        discount_val=Math.ceil(full_amount_val/100*coupon_discount);
        result_price_val=full_amount_val-discount_val;
        point.val(0);
        use_point=0;
        amountSet();
        product.remove();
      })

      //쿠폰사용시 이벤트
      coupon.on("change",function(){
        //쿠폰변경시 포인트 사용 초기화
        use_point=0;
        point.val(use_point);
        //할인액 계산
        coupon_discount=$('#coupon option:selected').attr("discount")
        discount_val=Math.ceil(full_amount_val/100*coupon_discount);
        result_price_val=full_amount_val-discount_val;
        amountSet();
      })

      //포인트 최대값 제한 이벤트, 디스카운트 변경이벤트
      point.on("change", function(){
        //포인트의 기존값이 0이 아닐경우의 처리
        if(use_point!="0"){
          use_point=0;
          discount_val=Math.ceil(full_amount_val/100*coupon_discount);
          result_price_val=full_amount_val-discount_val;
        }
        //포인트 최대값 제한
        if(Number(point.val())>point.attr("max")){ 
          if(result_price_val>point.attr("max")){ 
            point.val(point.attr("max"));
          }else{
            point.val(result_price_val);
          }        
        }else if(Number(point.val())>result_price_val){
          point.val(result_price_val);
        }
        use_point=point.val();
        //할인액 수정
        discount_val=Math.ceil(full_amount_val/100*coupon_discount)+Number(use_point);
        //결제액 수정
        result_price_val=full_amount_val-discount_val;
        amountSet();
      })
      //클릭시 소지포인트가 가격을 초과하지 않는다면 소지포인트의 전액, 초과한다면 가격으로 포인트를 설정해주는 이벤트
      full_use_btn.on("click",function(){
        //포인트의 기존값이 0이 아닐경우의 처리
        if(use_point!=0){
          point.val(0);
          discount_val=Math.ceil(full_amount_val/100*coupon_discount);
          result_price_val=full_amount_val-discount_val;
        }
        //포인트 전액사용시 값에 따른 처리
        if(result_price_val>point.attr("max")){ 
          point.val(point.attr("max"));
        }else{
          point.val(result_price_val);
        }
        use_point=point.val();
        //할인액 수정
        discount_val=Math.ceil(full_amount_val/100*coupon_discount)+Number(use_point);
        discount.text(discount_val);
        //결제액 수정
        result_price_val=full_amount_val-discount_val;
        result_price.text(result_price_val);
      })
      buy_btn.on("click",function(){
        //주소 입력을 확인하는 부분
        if(address_val==""){
          alert("주소를 입력해주세요")
          return;
        }else if(detail_address_val==""){
          alert("상세주소를 입력해주세요")
          return;
        }

        //상품의 수량을 체크하는 부분
        let quantity_tf;
        $(".product").each(function(idx, item){
          quantity_tf=quantity_check(item.querySelector(".product_no").value,item.querySelector(".product_pcs").innerHTML,item.querySelector(".product_name").innerHTML);
          if(!quantity_tf){
            return false; 
          }
        })
        
        if(!quantity_tf){
          return;
        }
        if(result_price_val>=100){
          payment='card';
          pay(result_price_val,pay_succese);
        }else if(result_price_val==0){
          window.alert("결제가 완료되었습니다.")
          pay_succese();
          //리다이렉트 추가
        }else{
          window.alert("최소 결제단위는 100원입니다.")
        }
      })
    })
  </script>
</head>

<body>
  <header>
    <div id="title_bar" class=" fixed-top">
      <div class="py-2 px-1" id="top-bar">

        <button type="toggle-button" class="top_btn" id="top_btn"></button>
        <a href="${pageContext.request.contextPath}/product/search?category=11"><img id="logo_img" src="/images/utilities/logoSSJA.png"></a>
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
    <!-- 유저 정보를 사용하기 위한 코드 -->
    <!-- 추후 서버측에서 받는경우에 문제가 생길경우 사용 -->
    <sec:authorize access="isAuthenticated()">
    	<sec:authentication property="principal" var="principal"/>
    </sec:authorize>
  </header>

  <div id="side_bar"></div>
  <main>
    <!--결제 페이지부 -->
    <div id="main_container" class="d-flex flex-column " style="min-height:800px;">
      
      <h2 class="mt-3 py-2 fw-bold">주문/결제</h2>
      <div class="ms-3" style="margin-right: 30%;">
        <h3 class="mt-5 border-bottom py-2">배송지</h3>
        <table class="ms-3">
          <tr>
            <td>
              <span>주소</span>
            </td>
            <td>
              <input type="text" size="35" class="mb-1 form-control" id="address" name="M_ADDRESS1" readonly="readonly">
            </td>
          </tr>
          
          <tr>
            <td>
              <span>상세주소ㅤ</span>
            </td>
            <td>
              <input type="text" size="23" class=" mb-1 form-control w-50 d-inline" id="detail_address" name="M_ADDRESS2"  >
              <input type="text" size="6" class="mb-1 d-none" id="extra_address" name="extra_address" >
              <input type="text" size="10" class="mb-1 d-none" id="post" name="M_ZIPCODE">
              <input type="button" value="주소 찾기" class="mb-1 ms-3 btn btn-secondary" id="post_search_btn">
            </td>
          </tr>
        </table>
      </div>
      <div class="ms-3" style="margin-right: 30%;">
        <h3 class="my-3 border-bottom py-2">주문상품</h3>
        <!-- 아래부터 c:foreach로 반복 -->
        <!-- 해당 데이터는 서버에서 제공받음 -->
        <c:forEach var="product" items="${products}">
        	<div class="product my-3" style="height:150px;">
            <input class="product_no" type="hidden" value="${product.PRO_NO}">
	          <img src="${product.PRO_BANNERIMG}" alt="" class="me-2" style="width: 150px;height: 150px; float: left;">
	          <div class="m-2 pt-3 fs-5"><span class="product_name">${product.PRO_NAME}</span></div>
	          <!-- <div class="m-2 fs-4"><span>옵션 :</span><span id="product_opt">네이비블루</span></div> -->
	          <div class="m-2 fs-5"><span>금액:</span><span class="product_price">${product.PRO_PRICE}</span>원 <br><span>수량:</span> <span class="product_pcs">${product.PRO_QUANTITY}</span>개</div>
            <div class="btn-group" role="group" aria-label="Basic example">
              <button type="button" class="btn btn-primary pcs_plus">1개추가</button>
              <button type="button" class="btn btn-secondary pcs_minus">1개감소</button>
              <button type="button" class="btn btn-danger pro_rm">X</button>
            </div>
          </div>
        </c:forEach>
        
      </div>
      <div class="ms-3" style="margin-right: 30%;">
        <h3 class="my-3 border-bottom py-2">쿠폰</h3>
        <select class="ms-3 form-control w-50" name="coupon" id="coupon">
          <option value="0" discount="0">선택안함</option>
          <!--데이터를 받아오는 곳에 따라 추후 서버측에서 직접적으로 받을경우 c:foreach-->
          <!--현재 페이지에서 ajax를 통해 받을경우 javascrip append  -->
          <c:forEach var="coupon" items="${coupons}">
            <option value="${coupon.c_no}" discount="${coupon.c_dcper}">${coupon.c_name}</option>
					</c:forEach>
          <!-- <option value="1" discount="10">쿠폰1</option>
          <option value="2" discount="20">쿠폰2</option>
          <option value="3" discount="30">쿠폰3</option> -->
        </select>
      </div>
      <div class="ms-3 mb-3" style="margin-right: 30%;">
        <h3 class="my-3 border-bottom py-2">포인트</h3>
        <input type="number" class="ms-3 me-0 form-control w-25 d-inline" id="point" value="0" min="0" max="0">
        <button class="ms-0 btn btn-primary" id="full_use_btn">전액사용</button>
      </div>
      <div id="payment_bar">

        <h3 id="payment_title">결제금액</h3>
        <h3 id="full_amount">
          0
        </h3>
        <h3 id="discount_per">0%</h3>
        <h3>
          <span>-</span>
          <span id="discount">0</span>
          <hr>
        </h3>
        <h3 id="result_price_wrap"><SPan id="result_price">0</SPan>원</h3>
        <div id="buy_btn_wrap">
          <button type="button" class="btn btn-primary" id="buy_btn">결제하기</button>
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
  <script src="/js/login_user_tab.js"> </script>
  <script src="/js/user_cart_tab.js"> </script>
</sec:authorize>
</body>

</html>