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

#MyPage_content_name {
	background-color: #f7f0e8;
	padding: 3em;
}

#MyPage_content_name>h1 {
	font-weight: bold;
	margin-left: 1em;
}

#select_MyPage {
	z-index: 900;
	position: fixed;
	top: 30%;
	left: 5%;
	width: 12%;
}

#select_mp_top {
	background-color: #f7f0e8;
	padding: 2em;
	height: auto;
}

#userInfo_dv1 {
	display: flex;
	flex-direction: row;
	align-items: center;
}

#userInfo_dv1>h2 {
	margin-left: 1em;
	margin-right: 1em;
}

#userInfo_dv2 {
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
	align-items: center;
	height: auto;
}

#userInfo_coupons, #userInfo_points, #userInfo_wishs {
	border-left: 1px solid #cccccc;
}

#userInfo_dv2>div {
	font-weight: bold;
	margin-top: 1em;
	margin-bottom: 1em;
	padding: 5px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
	height: auto;
	width: 100%;
}

#your_address>input {
	border: none;
}

@media ( max-width : 1120px) {
	#select_MyPage {
		left: 0%;
		top:25%;
	}
}

@media ( max-width : 780px) {
	#select_content {
		display: none;
		
	}
	#select_mp_top {
	padding-left:0;
	padding-right:0;
	}
}
#status_dv > span{
color:#ccc;
margin-left:1em;
}
#select_mp_top {
    cursor: pointer;
}
#paging_dv > button{
background-color:white;
border:1px solid #ccc;
color:#ccc;
}
#Input_info_title > div{
padding:2rem;
padding-left:3em;
font-weight:bold;
max-height:8rem;
min-height:8rem;
font-size:1.2em;

}
#Input_info_apply > div{
padding:2rem;
display:flex;
flex-direction:row;
align-items:center;
max-height:8rem;
min-height:8rem;
}
#Input_info_apply > div > input{
width:15em;
border-radius:5px;
}
#Input_info_apply > span{
color:#aaa;
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
		   <div id="select_MyPage" class="d-flex flex-column">
		    <div id="select_mp_top" class="text-center">마이 페이지</div>
		    <div id="select_content">
		        <button class="MyPage_btn w-100" id="myPage_userInfo_Select" style="border:1px solid #cccccc">회원 정보</button>
		        <button class="MyPage_btn w-100" id="myPage_orderInfo_Select" style="border:1px solid #cccccc">주문 내역</button>
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">내가 쓴 글</button>
		        
		        <!--  principal객체를 꺼내서 해당 객체의 auth값을 yourAuth변수로 지정 -->
		     <sec:authentication property="principal.auth" var="yourAuth"/> 
		     
		       <c:if test="${principal.isOAuth2User() == true }">
		       <button class="MyPage_btn w-100" style="border:1px solid #cccccc" id="not_authorized_vendor_apply">판매자 신청</button>
		       </c:if> 
		 <c:if test="${yourAuth == 'ROLE_USER'}"><!-- 유저 권한 -->
		    <c:if test="${principal.isOAuth2User() == false }">
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc" id="vendor_apply">판매자 신청</button>
		        </c:if>
			</c:if>
			
			 <c:if test="${yourAuth == 'ROLE_VENDOR'}"><!--  판매자 권한일 경우 대체 되는 버튼 -->
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc" id="mange_yoursell">판매 관리</button>
		        </c:if>
		        
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc" id="go_qna">문의 및 요청</button>
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

<script src="/js/myPage/userMyPage.js"></script>
<script src="/js/myPage/userOrders.js">
</script>

<script>
$("#not_authorized_vendor_apply").on('click',function(){
	let notice_toLogin = confirm('회원 등록 여부와 상관 없이 소셜로그인의 경우에는 판매자 신청이 불가능합니다. \n 로그아웃 후 일반 회원으로 로그인 해주시길 바랍니다.');
	if(notice_toLogin){
		window.location.href="/login";
	}
})
$("#vendor_apply").on('click', function(){
	
	if($('#h2title').text().substr(0,3) === "판매자"){
		return false;
	}
	console.log('판매자 신청 눌림 이사 람 회원임 소셜 아님');
	
	let $h2title = $("<h2>").attr('id','h2title').text("판매자 신청 : 1. 이메일 인증");
	
	 let $MyPage_content_container = $("#MyPage_content_container").empty();
	
	let $myPageTitle = $("#MyPage_content_name");
	$myPageTitle.empty().append($h2title);
	
	let $biz_authorize_dv = $("<div>").css({'border-top':'1px solid #eee','border-bottom':'1px solid #eee'})
	.addClass("mx-5 p-3").appendTo($MyPage_content_container);
	$('<img>').attr("src","/images/utilities/logoSSJA.png").css({'width':'2.5em','height':'2.5em'}).appendTo($biz_authorize_dv);
	$("<span>").css('margin-left','1.5em').text('사업자 인증').appendTo($biz_authorize_dv);
	let $v_auth_form_dv = $('<div>').css('padding','2em').attr('id','v_auth_form_dv')
	.addClass("d-flex flex-column justify-content-center align-items-center").appendTo($MyPage_content_container);
	$("<h4>").text('이메일을 입력해주세요').appendTo($v_auth_form_dv);
	$('<p>').text('판매자 신청 전 인증이 필요합니다.').appendTo($v_auth_form_dv);
	$('<p>').text('이메일과 회원 정보의 이메일과 조회 후 인증 후 신청이 가능합니다.').appendTo($v_auth_form_dv);
	$('<p>').text('인증 키 메일 전송이 완료되면 입력창이 나타납니다.').appendTo($v_auth_form_dv);
	
	let $auth_email_dv = $("<div>").addClass("d-flex flex-row ").appendTo($v_auth_form_dv);
	$('<input>').attr('id','auth_email').addClass('mx-2').css('border-radius',"5px").appendTo($auth_email_dv);
	$("<button>").addClass("btn ").css('background-color','#ccc').text('인증').on('click',function(){
			let address = $('#auth_email').val();
			email_check(address);
	}).appendTo($auth_email_dv);
	
	
})

let email_check = function(address){
	$.ajax({
		type : "post",
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
			},
		data: JSON.stringify({'receiver': address}),
	    contentType: "application/json",
		url : "/user/email/check", 
		success :function(data){
			let authNum = data;
			console.log(authNum);
			let $auth_input_dv = $("<div>").attr('id','auth_input_dv')
			.addClass("d-flex flex-row m-2").appendTo($("#v_auth_form_dv"));
			$('<input>').attr('id','auth_key').addClass('mx-2').css({'width':'7em','border-radius':'5px'}).appendTo($auth_input_dv);
			$("<button>").addClass("btn btn-dark").text('확인').on('click',function(){
				if(authNum !== $("#auth_key").val()){
					alert('인증 키와 입력하신 정보가 다릅니다.');
					
					return false;
				}
					console.log('인증 키 같음 인증 완료');
					let $success_auth = $('<div>').addClass("d-flex flex-column");
					$("<span>").text("인증완료").css('color','blue').appendTo($success_auth);
					$('<button>').text("다음").addClass('btn btn-dark m-3').css({'width':'7em','height':'4em'}).on('click',function(){
						
						vendor_info_form();
					}).appendTo($success_auth);
					
					$("#v_auth_form_dv").append($success_auth);
			}).appendTo($auth_input_dv);
			
			
		},
		error:function(){
			alert('회원 정보의 이메일과 다른 이메일로 인증을 요청하였습니다 \n 회원 정보의 이메일로 인증해주세요.');
			}
	})
}

let bizname_dupl_check = function(name){
	$.ajax({
		type : "get",
		data: {'bizName': name},
	    contentType: "application/json",
		url : "/user/bizname/check-duplicate", 
		success :function(data){
			console.log('중복 없읍 : '+ data)
			let successname = data;
			$("#input_hidden_bizname").val(successname);
			$("<span>").text('완료').appendTo("#dv_bizname");
			},
			error:function(e){
			console.log('중복 O')
				}
			})
		};
let apply_vendor_auth = function(buzNum, bizName, account,FAXnum){
	$.ajax({
		type : "post",
		data: JSON.stringify({
			'v_bizName': bizName,
			'v_license': buzNum,
			'v_FAX': FAXnum,
			'v_account': account
			}),
	    contentType: "application/json",
		url : "/user/info/apply-vendor", 
		success :function(data){
			
			},
			error:function(e){
				alert('판매자 등록에 있어 문제가 생겼습니다. \n 다시 부탁드립니다.');
				window.location.href="/myPage";
				}
			})
		};


let vendor_info_form = function(){
	let $h2title = $("<h2>").attr('id','h2title').text("판매자 신청 : 2. 신청 정보 입력");
	
	 let $MyPage_content_container = $("#MyPage_content_container").addClass("d-flex flex-column align-items-center").empty();
	
	let $myPageTitle = $("#MyPage_content_name");
	$myPageTitle.empty().append($h2title);
	
	let $vendor_info_caontainer = $("<div>").addClass("d-flex flex-row border-bottom w-100").appendTo($MyPage_content_container);
	
	
	let $Input_info_title = $("<div>").attr('id','Input_info_title').css('width','30%').appendTo($vendor_info_caontainer);
	$("<div>").text("사업자 등록 번호").attr('id','title_biznum').appendTo($Input_info_title);
	$("<div>").text("사업자 명").attr('id','title_bizname').appendTo($Input_info_title);
	$("<div>").text("계좌 번호").attr('id','title_account').appendTo($Input_info_title);
	$("<div>").text("FAX 번호").attr('id','title_FAXnum').appendTo($Input_info_title);
	
	let $Input_info_apply = $("<div>").attr('id','Input_info_apply').css('width','70%').appendTo($vendor_info_caontainer);
	$("<div>").attr('id','dv_biznum').append($("<input>").attr({'placeholder':"-를 빼고 적어주세요.",
										 'id':'input_biznum'})).appendTo($Input_info_apply);
	$("<div>").attr('id','dv_bizname').append(
			$("<input>").attr({'placeholder':"중복 체크도 필요합니다.", 'id':'input_bizname'}),
			$("<input>").attr({'type':'hidden', 'id':'input_hidden_bizname'}),
			$('<button>').addClass("btn").text("중복 검사").css({'background-color':'#ddd','margin-left':'1em'}).attr("id","checkDupleBizName")
			.on('click',function(){
				bizname_dupl_check($("#input_bizname").val());
			})
	).appendTo($Input_info_apply);
	
	$("<div>").attr('id','dv_account').append($("<input>").attr({'placeholder':"-를 빼고 적어주세요.",
										'id':'input_account'})).appendTo($Input_info_apply);
	
	$("<div>").attr('id','dv_FAXnum').append($("<input>").attr({'placeholder':"-를 빼고 적어주세요.",
										'id':'input_FAXnum'})).appendTo($Input_info_apply);

	
	let $addInfo_dv = $("<div>").css({'width':'60%','margin-top':'2em'}).appendTo($MyPage_content_container);
	let $Additional_information = $("<p>").text("해당 입력하신 정보를 통해 사업자 인증을 확인 후 SSJA에서 해당 FAX번호로 응답을 통해 더욱 상세한 과정을 거쳐 판매자 신청 과정을 진행해드립니다.")
	.css('text-align','center').appendTo($addInfo_dv);
	
	
	$("<button>").addClass("btn btn-dark my-4").css({'width':'8em','height':'4em'}).text("신청").on('click',function(){
		  $("#dv_biznum span").remove();
		    $("#dv_account span").remove();
		    $("#dv_FAXnum span").remove();
		
		if($("#input_biznum").val()===''){
			$("<span>").text('사업자 번호를 입력').appendTo("#dv_biznum");
			return false;
		}
		if($("#input_account").val()===''){
			$("<span>").text('계좌 번호를 입력').appendTo("#dv_account");
			
			return false;
		}
		if($("#input_FAXnum").val()===''){
			$("<span>").text('FAX 번호를 입력').appendTo("#dv_FAXnum");
			
			return false;
		}
		if($("#input_hidden_bizname").val()===''){
			alert("사업자 명 중복 검사를 마치셔야 합니다.")
			
			return false;
		}
		
		alert('등록완료');
		apply_vendor_auth($("#input_biznum").val(),$("#input_hidden_bizname").val(),$("#input_account").val(),$("#input_FAXnum").val());
		noticeCompleteApply();
	}).appendTo($MyPage_content_container);
	
};

let noticeCompleteApply = function(){
	let $h2title = $("<h2>").attr('id','h2title').text("판매자 신청 : 3. 신청 완료");
	
	 let $MyPage_content_container = $("#MyPage_content_container").addClass("d-flex flex-column align-items-center").empty();
	
	let $myPageTitle = $("#MyPage_content_name");
	$myPageTitle.empty().append($h2title);
	
	$("<img>").attr("src","/images/utilities/logoSSJA.png").addClass("mt-3").css({'width':'10em','height':'8em'}).appendTo($MyPage_content_container);
	$("<h3>").text('판매자 신청이 완료되었습니다!!').addClass("m-4").appendTo($MyPage_content_container);
	
	let $vendorInfo_div = $("<div>").attr('id','vendorInfo_div').addClass("d-flex flex-column align-items-center").appendTo($MyPage_content_container);
	$("<button>").text('홈으로').addClass("btn btn-dark my-4").css({'width':'8em','height':'4em'}).on('click', function(){
		window.location.href="/";
	}).appendTo($MyPage_content_container);
	$("<p>").css({'width':'50%','text-align':'center'})
	 .text('판매자 신청 확인 후 등록하신 FAX번호로 세부양식이 전달되어 승인이 완료 후 사업자로써 SSJA에서 판매가 가능합니다. \n 많이 판매하시길 바라겠습니다!!')
	.addClass("m-2").appendTo($MyPage_content_container);
	
	let $apply_complete_btn_div = $("<div>").appendTo($MyPage_content_container);
	getVendorInfo();
};
let getVendorInfo = function(){
	$.ajax({
		type : "post",
		url : "/user/info/vendor", 
		success :function(data){
			console.log(data);
			$('<span>').text('판매자 번호 : ' + data.v_no).appendTo('#vendorInfo_div');
			$('<span>').text('사업자 명: ' + data.v_name).appendTo('#vendorInfo_div');
			$('<span>').text('사업자 번호 : ' + data.v_nlicense).appendTo('#vendorInfo_div');
			
			},
			error:function(e){
				window.location.href="/myPage";
				}
			})
		};
</script>

</html>