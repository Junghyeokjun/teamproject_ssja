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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
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
    #userInfo_dv1{
    display:flex;
    flex-direction:row;
    align-items:center;
  
    }
    #userInfo_dv1 > h2 {
    margin-left:1em;
    margin-right:1em;
    }
    #userInfo_dv2{
    display:flex;
    flex-direction:row;
    justify-content:space-evenly;
    align-items:center;
  height:auto;
    }
    #userInfo_coupons, #userInfo_points, #userInfo_wishs{
    border-left:1px solid #cccccc;
    }
    #userInfo_dv2 > div{
    font-weight:bold;
    margin-top:1em;
    padding:5px;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    text-align:center;
     height:auto;
     width:100%;
    }
    #your_address > input{
    border:none;
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
    <div id="main_container" class="d-flex flex-row align-items-center justify-content-center" >
      
      <div id="content_dv" >
        
		   <div id="select_MyPage" class="d-flex flex-column">
		    <div id="select_mp_top" class="text-center">마이 페이지</div>
		    <div id="select_content">
		        <button class="MyPage_btn w-100" id="myPage_userInfo_Select" style="border:1px solid #cccccc">회원 정보</button>
		        <button class="MyPage_btn w-100" id="myPage_orderInfo_Select" style="border:1px solid #cccccc">주문 사항</button>
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">주문 내역</button>
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">내가 쓴 글</button>
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">문의 및 요청</button>
		    </div>
		</div>

        <div id="MyPage_content_name" > </div>
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
						            console.log(userInfo);
						            let $h2title = $("<h2>").text("회원 정보");
						            let $myPageContent = $("#MyPage_content_container").empty();
						            let $myPageTitle = $("#MyPage_content_name");
						            $myPageTitle.empty().append($h2title);
						            
						            let $userInfo_dv1= $("<div>").attr("id","userInfo_dv1").addClass("w-100 my-3 mx-3");
						            let $userInfo_name = $("<h2>").css("font-weight","bold").text(userInfo.m_Name);
						            let $userInfo_txt1 = $("<span>").text('님의 등급은');
						            let $userInfo_grade = $("<h2>").css("font-weight","bold").text(userInfo.m_Grade);
						            let $userInfo_txt2 = $("<span>").text('입니다.');
						           
						            
						            $userInfo_dv1.append($userInfo_name,$userInfo_txt1,$userInfo_grade,$userInfo_txt2);
						            
						            let $userInfo_dv2= $("<div>").attr("id","userInfo_dv2").addClass(" my-3 mx-3")
						            .css("background-color","#eee");
						            let $userInfo_orders = $("<div>").attr("id","userInfo_orders").append($("<h4>").text("구매"));
						            let $userInfo_wishs = $("<div>").attr("id","userInfo_wishs").append($("<h4>").text("위시리스트"));
						            let $userInfo_points = $("<div>").attr("id","userInfo_points").append($("<h4>").text("포인트"),$("<span>").text(userInfo.m_Point));
						            let $userInfo_coupons = $("<div>").attr("id","userInfo_coupons").append($("<h4>").text("쿠폰"));
						            
						            $userInfo_dv2.append($userInfo_orders,$userInfo_wishs,$userInfo_points,$userInfo_coupons);
						            
						            
						            let $password_title = $("<h4>").addClass("mx-5 my-3").text("비밀 번호 ");
						            let $modify_password=$("<a>").attr("href","http://www.naver.com").addClass("btn btn-dark").text("변경하기");
						            let $userInfo_dv3= $("<div>").attr("id","userInfo_dv3").css("border-top","1px solid #cccc")
						            .addClass("py-3 my-3 mx-3 d-flex flex-row align-items-center").append($password_title,$modify_password);
						            
						            
						            let $email_title = $("<h4>").addClass("mx-5 my-3").text("이메일");
						            let $userInfo_email = $("<span>").addClass("p-3").css('background-color','#eee').text(userInfo.m_Email);
						            let $modify_email=$("<a>").attr("href","http://www.naver.com").addClass("btn btn-dark mx-3").text("수정");
						            let $userInfo_dv4= $("<div>").attr("id","userInfo_dv4").css("border-top","1px solid #ccc")
						            .addClass("py-3 my-3 mx-3 d-flex flex-row align-items-center").append($email_title,$userInfo_email,$modify_email);
						            
						            
						            let $address_title = $("<h4>").addClass("mx-5 my-3").text("배송지");
						            let $userInfo_address1= $("<div>").attr("id","your_address").addClass('mx-5').html(
						            		'우편번호 :  <input type="text" id="zip_code" name="zip_code" value='+userInfo.m_ZipCode +'><br>'+
						            		'주소 :         <input type="text" id="address" name="address" style="width:70%"value='+userInfo.m_Address1 +'><br>'+
						            		'상세 :   <input type="text" id="extra_address" name="extra_address" style="width:70%"value='+userInfo.m_Address2 +'><br>'+
						            		'요구사항 :  <input type="text" id="detail" name="detail"><br>'
						          
						            );
						            let $modify_address=$("<button>").attr("id","address_modify_btn").addClass("btn btn-dark").text("수정").on('click', function(){
						            	chang_address();
						            });
						            
						            let $userInfo_dv5= $("<div>").attr("id","userInfo_dv5").css("border-top","1px solid #ccc")
						            .addClass("py-3 my-3 mx-3 d-flex flex-row align-items-center").append($address_title,$userInfo_address1,$modify_address);
						            
						            let $phone_title = $("<h4>").addClass("mx-5 my-3").text("전화 번호 ");
						            let $modify_phoneNum=$("<a>").attr("href","http://www.naver.com").addClass("btn btn-dark").text("변경하기");
						            let $userInfo_dv6= $("<div>").attr("id","userInfo_dv6").css("border-top","1px solid #ccc")
						            .addClass("py-3 my-3 mx-3 d-flex flex-row align-items-center").append($phone_title,$modify_phoneNum);
						            
						            
						           $myPageContent.append($userInfo_dv1,$userInfo_dv2,$userInfo_dv3,$userInfo_dv4,$userInfo_dv5,$userInfo_dv6);
						           
						          
						            
						        }
						    });
						};
						myPageUserInfo();
						
						
						
						
						let chang_address = function(){
							
							console.log('눌림');
							
					        new daum.Postcode({
					          onComplete: function (data) {
					             let addr = ''; // 주소 변수
					               let   extraAddr = '';
					            if (data.userSelectedType === 'R') {
					              addr = data.roadAddress;
					            } else {
					              addr = data.jibunAddress;
					            }
					            if (data.userSelectedType == 'R') {
					              if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
					                extraAddr += databname;
					              }
					              if (data.buildingName !== '' && data.apartment === 'Y') {
					                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					              }
					              if (extraAddr !== '') {
					                extraAddr = ' (' + extraAddr + ')';
					              }
					              document.getElementById("extra_address").value = extraAddr;
					            } else {
					              document.getElementById("extra_address").value = '';
					            }
					            document.getElementById('zip_code').value = data.zonecode;
					            document.getElementById("address").value = addr;
					         
					            document.getElementById("extra_address").focus();
					          }
					        }).open(); 
						}
						
						 
						 $("#myPage_userInfo_Select").on('click',function(){
							 myPageUserInfo();
						 });
						 $("#myPage_orderInfo_Select").on('click',function(){
							 let $h2title = $("<h2>").text("주문 사항");
					            let $myPageContent = $("#MyPage_content_container").empty();
					            let $myPageTitle = $("#MyPage_content_name");
					            $myPageTitle.empty().append($h2title);
						 });
			
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