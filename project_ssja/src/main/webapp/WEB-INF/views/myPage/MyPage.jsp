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
    margin-bottom:1em;
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
		   <div id="select_MyPage" class="d-flex flex-column">
		    <div id="select_mp_top" class="text-center">마이 페이지</div>
		    <div id="select_content">
		        <button class="MyPage_btn w-100" id="myPage_userInfo_Select" style="border:1px solid #cccccc">회원 정보</button>
		        <button class="MyPage_btn w-100" id="myPage_orderInfo_Select" style="border:1px solid #cccccc">주문 내역</button>
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">내가 쓴 글</button>
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">판매자 신청</button>
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">문의 및 요청</button>
		    </div>
		</div>

  <main>
    <div id="main_container" class="d-flex flex-row align-items-center justify-content-center" >
      
      <div id="content_dv" >
        

        <div id="MyPage_content_name" > </div>
        <div id=main_div>
        <div id="MyPage_content_container" class="border">
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
	
	let email_auth_code='00000000';
	const withdrawl_comment = '회원을 탈퇴하시면 계정이 삭제 되며 내가 쓴글, 구매내역, 리뷰, 채팅 등 모든 정보가 삭제됩니다.<br>' 
		+'계정 삭제 후 7일 간에 유보기간이 주어지며, 유보기간 동안 마이페이지 > 회원정보로 오셔서 탈퇴 취소를 누르시면 다시 회원으로 지내실 수 있습니다.';
		let $modi_email_auth_btn = $("<button>");
		let $modi_email_change_btn = $("<button>").css("width",'90px');
		

	let myPageUserInfo = function() {
		
		$.ajax({
					type : "post",
					beforeSend : function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					url : "/user/info", // 정적인 URL 사용
					dataType : "json", // 받을 데이터의 유형 지정
					success : function(data) {
						const userInfo = data;
						console.log(userInfo);
						let $h2title = $("<h2>").text("회원 정보");
						let $myPageContent = $("#MyPage_content_container")
								.empty();
						let $myPageTitle = $("#MyPage_content_name");
						$myPageTitle.empty().append($h2title);

						let $userInfo_dv1 = $("<div>").attr("id",
								"userInfo_dv1").addClass("w-100 my-3 mx-3");
						let $userInfo_name = $("<h2>").css("font-weight",
								"bold").text(userInfo.m_NickName);
						let $userInfo_txt1 = $("<span>").text('님의 등급은');
						let $userInfo_grade = $("<h2>").css("font-weight",
								"bold").text(userInfo.m_Grade);
						let $userInfo_txt2 = $("<span>").text('입니다.');

						$userInfo_dv1.append($userInfo_name, $userInfo_txt1,
								$userInfo_grade, $userInfo_txt2);

						let $userInfo_dv2 = $("<div>").attr("id",
								"userInfo_dv2").addClass(" my-3 mx-3").css(
								"background-color", "#eee");
						let $userInfo_orders = $("<div>").attr("id",
								"userInfo_orders").append($("<h4>").text("구매"),
								$("<span>").text(userInfo.countPurchase));
						let $userInfo_wishs = $("<div>").attr("id",
								"userInfo_wishs").append(
								$("<h4>").text("위시리스트"),
								$("<span>").text(userInfo.countWish));
						let $userInfo_points = $("<div>").attr("id",
								"userInfo_points").append(
								$("<h4>").text("포인트"),
								$("<span>").text(userInfo.m_Point));
						let $userInfo_coupons = $("<div>").attr("id",
								"userInfo_coupons").append(
								$("<h4>").text("쿠폰"),
								$("<span>").text(userInfo.countCoupon));

						$userInfo_dv2.append($userInfo_orders, $userInfo_wishs,
								$userInfo_points, $userInfo_coupons);

						let $password_title = $("<h4>").addClass("mx-5 my-3")
								.text("비밀 번호 ");
						let $modify_password = $("<a>").attr("href",
								"${pageContext.request.contextPath}/myPage/password/change")
								.addClass("btn btn-dark").text("변경하기");
						let $userInfo_dv3 = $("<div>")
								.attr("id", "userInfo_dv3")
								.css("border-top", "1px solid #cccc")
								.addClass(
										"py-3 my-3 mx-3 d-flex flex-row align-items-center")
								.append($password_title, $modify_password);

						let $email_title = $("<h4>").addClass("mx-5 my-3")
								.text("이메일");
						
						
						
						let $userInfo_email = $("<input>").addClass("mx-1").attr("id","modi_email_input")
						.val(userInfo.m_Email).prop("disabled",true);
						
						let $email_change_btn = $("<button>").addClass("btn btn-dark").text("변경");
						let $email_auth_input = $("<input>").attr("id","email_auth_input");
						
						let $modi_email_btn = $("<button>") .attr("id", "modify_email_btn").addClass("btn btn-dark mx-3")
					    .text("수정").on('click', function() {
					    	$email_change_btn.remove();
					    	$email_auth_input.remove();
					    	
					        $userInfo_email.prop('disabled', false).focus();
					        $userInfo_dv4.append($email_auth_input, $email_change_btn.on('click',function(){
								
								if(email_auth_code !== $email_auth_input.val()){
									return;
									}
								request_email_change();
							}));
					        $(this).removeClass("btn-dark").addClass("btn-outline-secondary").text("인증").on('click',function(e){
					        	$(this).addClass("btn-secondary");
					        	$email_auth_input.focus();
					        	
					        	request_email_auth();
					        });
					        
					    });
						
						
						let $userInfo_dv4 = $("<div>")
								.attr("id", "userInfo_dv4")
								.css("border-top", "1px solid #ccc")
								.addClass(
										"py-3 my-3 mx-3 d-flex flex-row align-items-center")
								.append($email_title, $userInfo_email,$modi_email_btn
										);

						let $address_title = $("<h4>").addClass("mx-5 my-3")
								.text("배송지");
						let $userInfo_address1 = $("<div>")
								.attr("id", "your_address")
								.addClass('mx-5')
								.html(
										'우편번호 : <input type="text" id="zip_code" name="zip_code" value="' + userInfo.m_ZipCode + '"><br>' +
									    '주소 : <input type="text" id="address" name="address" style="width:100%;" value="' + userInfo.m_Address1 + '"><br>' +
									    '상세 : <input type="text" id="extra_address" name="extra_address" style="width:70%;" value="' + userInfo.m_Address2 + '"><br>' +
									    '<input type="hidden" id="address_detail" name="detail"><br>'

								);
						let $chang_address_btn = $("<button>").attr("id",
								"chang_address_btn").addClass(
								"btn btn-dark m-3").text("변경").on('click',function(){
									change_address();
								});
						let $modify_address = $("<button>").attr("id",
								"address_modify_btn").addClass("btn btn-dark")
								.text("조회").on('click', function() {
									search_address();
								});

						let $userInfo_dv5 = $("<div>")
								.attr("id", "userInfo_dv5")
								.css("border-top", "1px solid #ccc")
								.addClass(
										"py-3 my-3 mx-3 d-flex flex-row align-items-center")
								.append($address_title, $userInfo_address1,
										$modify_address, $chang_address_btn);

						let $phone_title = $("<h4>").addClass("mx-5 my-3")
								.text("전화 번호 ");
						
						let $userInfo_dv6 = $("<div>")
								.attr("id", "userInfo_dv6")
								.css("border-top", "1px solid #ccc")
								.addClass(
										"py-3 my-3 mx-3 d-flex flex-row align-items-center")
								.append($phone_title);

						let $withdrawl_title = $("<h4>").addClass("mx-5 my-3").text("회원 탈퇴");
						
						let $withdrawl_btn = $("<button>").attr('id','withdrawl_btn').addClass("btn btn-outline-danger").text('탈퇴하기').on('click',function(){
							$("#wd_detail_dv1").empty();
							
							let $wd_detail_1 = $("<h4>").text(userInfo.m_NickName+'님과 이별인가요? 너무 아쉬워요')
							.css('font-weight','bold').addClass("my-3").appendTo($wd_detail_dv1);
							
							
							let $wd_detail_2 = $("<div>").addClass("mx-5").html(withdrawl_comment).appendTo($wd_detail_dv1);
							
							let $wd_detail_3 = $("<input>").addClass("my-3").attr("type","checkbox").attr('id',"withdrawl_check").appendTo($wd_detail_dv1);
							
							let $wd_detail_4 = $("<p>").text("위에 대해 확인하였고 탈퇴하겠습니다.").appendTo($wd_detail_dv1);
							let $wd_detail_5 = $("<div>").addClass("d-flex flex-row my-3 justify-conten-center align-items-center").appendTo($wd_detail_dv1);
							
							let $delete_ok_btn = $("<button>").addClass('btn btn-dark mx-1').text('탈퇴').on('click',function(){
								 if($wd_detail_3.is(':checked')===false){
										$wd_detail_6.text('확인란에 체크해 주시길 바랍니다.');
										return ;
									} 
									 $.ajax({
											type : "delete",
											beforeSend : function(xhr) {
												xhr.setRequestHeader(header, token);
											},
											url : "/user",
											success : function(data){
												alert('삭제 되었습니다.');
											},
											error : function(data){
												alert('에러 발생');
											}
										})
									
								});
							let $delete_no_btn = $("<button>").addClass("btn btn-outline-secondary mx-1").text('취소').on('click',function(){
								$wd_detail_dv1.empty();
							});
							
							$wd_detail_5.append($delete_ok_btn,$delete_no_btn);
							
							let $wd_detail_6 =$("<div>").addClass('text-center').css('color','red').appendTo($wd_detail_dv1);
						}
						);
						let $withdrawl_main = $("<div>").addClass("d-flex flex-row align-items-center")
						.attr("id","withdrawl_main").css("display","flex").append($withdrawl_title,$withdrawl_btn );
							let $wd_detail_dv1 = $("<div>").addClass("d-flex flex-column align-items-center justify-content-center")
							.attr("id","wd_detail_dv1").css("widh","90%");
						
						let $userInfo_dv7 = $("<div>")
						.attr("id", "userInfo_dv7")
						.css("border-top", "1px solid #ccc")
						.addClass(
								"py-3 my-3 mx-3 d-flex flex-column justify-content-center").append($withdrawl_main,$wd_detail_dv1);
						
						
						$myPageContent.append($userInfo_dv1, $userInfo_dv2,
								$userInfo_dv3, $userInfo_dv4, $userInfo_dv5,
								$userInfo_dv6,$userInfo_dv7);

					}
				});
	};
	myPageUserInfo();

	let change_address = function() {
		
		if($("#extra_address").val() == null || $("#extra_address").val() == ""){
			alert("상세주소를 입력해주세요.");
			return;
		}
		let address_data = {
			zip_code : $("#zip_code").val(),
			address : $("#address").val(),
			extra_address : $("#extra_address").val()
		};

		$.ajax({
			type : "post",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			data : JSON.stringify(address_data),
			contentType : "application/json",
			url : "/user/address",
			dataType : "json",
			success : function(data){
				alert('주소가 변경되었습니다');
				myPageUserInfo();
			}
		})
	}
	
	let request_email_auth = function() {
	    $.ajax({
	        type: "post",
	        beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			  data: JSON.stringify({'receiver': $("#modi_email_input").val()}),
	        contentType: "application/json",
	        url: "/user/email/auth",
	        success: function(data) {
	        	console.log(email_auth_code);
	        	
	            alert('해당 이메일로 인증번호를 전송하였습니다. \n 인증을 완료해주세요.');
	            email_auth_code = data.authNum;
	            console.log(email_auth_code);
	        }
	    });
	};
	let request_email_change = function() {
	    $.ajax({
	        type: "PATCH",
	        beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			//async:false,
		    data: $("#modi_email_input").val(),
	        contentType: "application/json",
	        url: "/user/email",
	        success: function(data) {
	        	alert('이메일이 변경되었습니다.');
	        	myPageUserInfo();
	        }
	    });
	};

	let search_address = function() {

		console.log('눌림');

		new daum.Postcode({
			onComplete : function(data) {
				let addr = ''; // 주소 변수
				let extraAddr = '';
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}
				if (data.userSelectedType == 'R') {
					/* if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += databname;
					} */
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
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

	$("#myPage_userInfo_Select").on('click', function() {
		myPageUserInfo();
	});
	$("#myPage_orderInfo_Select").on('click', function() {
		let $h2title = $("<h2>").text("주문 사항");
		let $myPageContent = $("#MyPage_content_container").empty();
		let $myPageTitle = $("#MyPage_content_name");
		$myPageTitle.empty().append($h2title);
	});
	
	
</script>
<script>
					 
  let select_dv = $("#select_content");
    
    $("#select_mp_top").on('click', function() {
        select_dv.toggle();
    });



</script>

</html>