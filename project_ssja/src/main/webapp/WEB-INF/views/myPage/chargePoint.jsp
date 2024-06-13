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
  
    <div id="main_container" class="d-flex flex-column align-items-center justify-content-center" style="width:80%;">
    	<div class="my-4">
    	<h2 style="margin-right:auto;" class="m-3"> 포인트 충전</h2>
    	<select id="select_charge_amount" style="width:150px;">
    	<option value="0">충전 금액선택</option>
    	<option value="5000">5000 P</option>
    	<option value="10000">10000 P</option>
    	<option value="15000">15000 P</option>
    	<option value="20000">20000 P</option>
    	<option value="25000">25000 P</option>
    	<option value="30000">30000 P</option>
    	<option value="50000">50000 P</option>
    	</select>
    	<p  style="color: #ac2925; margin-top: 30px">최소 충전금액은 5,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
    	</div>
    	<div id="main_content_dv" class="d-flex flex-row justify-content-between mb-5 mt-3">
    	
    	<div class="d-flex flex-column ">
    		<img src="/images/utilities/toss.png">
    		
                <button type="button" class="btn btn-lg btn-primary" id="charge_toss" >충 전 하 기</button>
    	</div>
    	
        	<div class="d-flex flex-column ">
				<img src="/images/utilities/kakaopaypoint.png">
				
                <button type="button" class="btn btn-lg btn-warning" id="charge_kakao" style="background-color:#fae100;color:#212529;">충 전 하 기</button>
    	</div>
    	
        	<div class="d-flex flex-column ">
			<img src="/images/utilities/payco.jpg">
			
                <button type="button" class="btn btn-lg btn-danger" id="charge_payco" style="background-color:#FA2829;" >충 전 하 기</button>
    	</div>
    	
    	<div class="d-flex flex-column d-flex flex-row align-items-center justify-content-between" style="background:#ddd;">
    		<img src="/images/utilities/naverpay.png">	
                         <span style="line-height:100px;">추가 예정</span> 
                 	</div>
    	
 		</div>
	</div>  
	  
     <script>
     let money=$("#select_charge_amount").val();
     $("#select_charge_amount").on('change',function(){
    	 money=$("#select_charge_amount").val();
     });
     let charge_validation = function(money){
    	 if (money < 5000){
    		 alert('충전금액 선택을 먼저 해주세요');
    		 return false;
    	 }
     }
     
     $('#charge_kakao').click(function () {
    	 charge_validation(money);
         // getter
         let IMP = window.IMP;
         IMP.init('imp17648218');

         IMP.request_pay({
             pg: 'kakaopay',
             merchant_uid: 'merchant_' + new Date().getTime(),

             name: '주문명 : 주문명 설정',
             amount: money,
             buyer_email: 'anjun0914@naver.com',
             buyer_name: '안준섭',
             buyer_tel: '010-9373-3596',
             buyer_addr: '인천광역시 부평구',
             buyer_postcode: '12345'
         }, function (rsp) {
             console.log(rsp);
             if (rsp.success) {
                 let msg = '결제가 완료되었습니다.';
                 msg += '고유ID : ' + rsp.imp_uid;
                 msg += '상점 거래ID : ' + rsp.merchant_uid;
                 msg += '결제 금액 : ' + rsp.paid_amount;
                 msg += '카드 승인번호 : ' + rsp.apply_num;
                 $.ajax({
                     type: "GET", 
                     url: "/charge/user/point", //충전 금액값을 보낼 url 설정
                     data: {
                         "amount" : money
                     },
                     success:function(data){
                    	 document.location.href="/myPage";
                     },
                     error:function(data){
                    	 alert("포인트 충전에 문제가 생겼습니다.")
                     }
                 });
             } else {
                 let msg = '결제에 실패하였습니다.';
                 msg += '에러내용 : ' + rsp.error_msg;
	             alert(msg);
                 window.location.href="";
             }
             alert(msg);
             document.location.href="/myPage"; //alert창 확인 후 이동할 url 설정
         });
     });
     
     
     $('#charge_payco').click(function () {
    	 charge_validation(money);
         // getter
         let IMP = window.IMP;
         IMP.init('imp17648218');
         console.log(money);

         IMP.request_pay({
             pg: 'payco',
             merchant_uid: 'merchant_' + new Date().getTime(),

             name: '주문명 : 주문명 설정',
             amount: money,
             buyer_email: 'anjun0914@naver.com',
             buyer_name: '안준섭',
             buyer_tel: '010-9373-3596',
             buyer_addr: '인천광역시 부평구',
             buyer_postcode: '12345'
         }, function (rsp) {
             console.log(rsp);
             if (rsp.success) {
                 let msg = '결제가 완료되었습니다.';
                 msg += '고유ID : ' + rsp.imp_uid;
                 msg += '상점 거래ID : ' + rsp.merchant_uid;
                 msg += '결제 금액 : ' + rsp.paid_amount;
                 msg += '카드 승인번호 : ' + rsp.apply_num;
                 $.ajax({
                     type: "GET", 
                     url: "/charge/user/point", //충전 금액값을 보낼 url 설정
                     data: {
                         "amount" : money
                     },
                     success:function(data){
                    	 document.location.href="/myPage";
                     },
                     error:function(data){
                    	 alert("포인트 충전에 문제가 생겼습니다.")
                     }
                 });
             } else {
                 let msg = '결제에 실패하였습니다.';
                 msg += '에러내용 : ' + rsp.error_msg;
	             alert(msg);
                 window.location.href="";
             }
             alert(msg);
             document.location.href="/myPage"; //alert창 확인 후 이동할 url 설정
         });
     });
     
     $('#charge_toss').click(function () {
    	 charge_validation(money);
         // getter
         let IMP = window.IMP;
         IMP.init('imp17648218');

         IMP.request_pay({
             pg: 'tosspay',
             merchant_uid: 'merchant_' + new Date().getTime(),

             name: '주문명 : 주문명 설정',
             amount: money,
             buyer_email: 'anjun0914@naver.com',
             buyer_name: '안준섭',
             buyer_tel: '010-9373-3596',
             buyer_addr: '인천광역시 부평구',
             buyer_postcode: '12345'
         }, function (rsp) {
             console.log(rsp);
             if (rsp.success) {
                 let msg = '결제가 완료되었습니다.';
                 msg += '고유ID : ' + rsp.imp_uid;
                 msg += '상점 거래ID : ' + rsp.merchant_uid;
                 msg += '결제 금액 : ' + rsp.paid_amount;
                 msg += '카드 승인번호 : ' + rsp.apply_num;
                 $.ajax({
                     type: "GET", 
                     url: "/charge/user/point", //충전 금액값을 보낼 url 설정
                     data: {
                         "amount" : money
                     },
                     success:function(data){
                    	 document.location.href="/myPage";
                     },
                     error:function(data){
                    	 alert("포인트 충전에 문제가 생겼습니다.")
                     }
                 });
             } else {
                 let msg = '결제에 실패하였습니다.';
                 msg += '에러내용 : ' + rsp.error_msg;
	             alert(msg);
                 window.location.href="";
             }
             alert(msg);
             document.location.href="/myPage"; //alert창 확인 후 이동할 url 설정
         });
     });
     
</script>

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