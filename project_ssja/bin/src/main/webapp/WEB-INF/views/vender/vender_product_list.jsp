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

  <script src="/js/venderbarscript.js">

  </script>

  <script src="/js/footer.js">

  </script>
  <link href="/css/footerstyle.css?after" rel="stylesheet">
  <link href="/css/venderbarstyle.css?after" rel="stylesheet">
  <link href="/css/board.css?after" rel="stylesheet">
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

	header, main, footer{
		height: auto;
		overflow : hidden;
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
    
	/* venderpage */
    .mx-2.m-auto.input-group-text{
    	width : 8em;
        line-height: 3em; /* 높이와 동일하게 설정하여 수직 중앙 정렬 */
    	text-align: center;
    	display: flex;
   		justify-content: center;
    }
    
    .mx-2.m-auto.input-group-text, .form-control{
    	height: 3em;
    }  
	
 
 
 	.file-container_ {
 		padding : 0;
 	}
	/* 기존 파일 형식 없애기 */
	.file-container_ input[type="file"] {
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip:rect(0,0,0,0);
		border: 0;
	}
	
	/* 커스텀 시작1 - label */
	.file-container_ label {
	  display: inline-block;
	  padding: .5em .75em;
	  color: #857474;
	  font-size: inherit;
	  line-height: normal;
	  vertical-align: middle;
	  background-color: #fdfdfd;
	  cursor: pointer;
	  border: 1px solid #ebebeb;
	  border-bottom-color: #e2e2e2;
	  border-radius: .25em;
	  
	  /* 줄바꿈되지 않게 하기. 한 줄로 표시 */
	  white-space: nowrap;
	}
	
	/* 파일 업로드명 */
	.file-container_ .file-upload-name_ {
		/* 가능한 공간을 모두 차지하게 설정 */
		flex-grow : 1;		
		display: inline-block;
		padding: .5em .75em; /* label의 패딩값과 일치 */
		font-size: inherit;
		font-family: inherit;
		line-height: normal;
		vertical-align: middle;
		background-color: #f5f5f5;
		border: 1px solid #ebebeb;
		border-bottom-color: #e2e2e2;
		border-radius: .25em;
	  
		/* 브라우저의 기본 스타일 제거 -> 커스텀 스타일이 적용되도록 하기 */
		-webkit-appearance: none; 
		-moz-appearance: none;
		appearance: none;
	}
	
	.file-container_.custom-primary label {
		color: #ffffff;
		background-color: #8c20ca;
		border-color: #7d22b3;
	}
	
	.file-container_.custom-primary label:hover {
		color: #ffffff;
		font-weight:bold;
		background-color: #aa6bce;
		border-color: #a85cd4;
	}
	
	.upload-image_{
		display: none;
	}
	
	.btn-danger.btn-tuning{
		background-color: #962626;	
	}

	.btn-danger.btn-tuning:hover{
		background-color: #c43c3c;	
	}

	.venderName {
		border-bottom: 5PX SOLID #222222;
		background-color: white;
		padding: 3px;
		border-radius: 15 15 15 15;
		margin: auto;	
	}
	
	.venderTitle{
		padding-top: 3px; 
	}
	
	.top_btn{
		font-size : 2em;

	}
@media screen and (max-width: 860px){	
	.venderTitle {
		display: none;
	}
	
}	
  </style>
</head>

<body>
	<header>
		<div id="title_bar" class="fixed-top">
			<div class="py-2 px-1 d-flex justify-content-between" id="top-bar">
				<button type="toggle-button" class="top_btn"></button>
				<div class="mx-5 my-2 d-flex ">
					<h1 class="h1 venderTitle" >판매자 :&nbsp;</h1>
					<!-- 
						땡땡땡땡 : 상호명
						로그인 시 venderDto에 담기는 vender.vbizname 또한 가져오기						
						그냥 조인을 쓴다면 venderDto가 아니라 조인한 결과를 담는 다른 Dto가 필요할 것이다.
					 -->
        			<h1 class="h1 venderName"> &lt;땡땡땡땡&gt;</h1>        			
        		</div>
				<a id="user_link"><img id="login_img"></a>
			</div>

		</div>
		<nav id="total_bar">
		</nav>
	</header>
		<div id="side_bar">
		<div id="side_links" class="w-100"></div>
	</div>
<!-- 	   <div id="select_MyPage" class="d-flex flex-column">
		    <div id="select_mp_top" class="text-center">판매자 페이지</div>
		    <div id="select_content">
		        <button class="MyPage_btn w-100" id="myPage_userInfo_Select" style="border:1px solid #cccccc">회원 정보</button>
		        <button class="MyPage_btn w-100" id="myPage_orderInfo_Select" style="border:1px solid #cccccc">상품 등록</button>
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">등록 상품 목록</button>		        
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">문의 및 요청</button>
		    </div>
		</div>
 -->
  <main>
  	<div class="main_whitespace p-5 my-2">
		<h1 class="h3 text-center ">상품 등록</h1>
	</div>
    <div id="main_container" class="d-flex flex-row align-items-center justify-content-center" >      	
        <div id="MyPage_content_container" class="border p-5">
        	<form role="form" method="post" action="" autocomplete="off">
				<div id="ProductCategory" class="p-2 input-group w-100">   
				   <label class="mx-2 m-auto input-group-text" >1차 분류</label>
				   <!-- 상품 카테고리를 해당 페이지에 뿌려줘야 함 : 한 자리 수 -->
				   <select id="mainCategory" class="form-select w-25 mx-2" >
				   	<option value="1">가구</option>
				   	<option value="2">패브릭</option>
				   	<option value="3">인테리어</option>
				   	<option value="4">주방용품</option>
				   	<option value="5">생활용품</option>
				   </select>
				</div>
				<div id="ProductCategory2" class="p-2 input-group w-100">
				   <label class="mx-2 m-auto input-group-text" >2차 분류</label>
				   <!-- 상품 카테고리를 해당 페이지에 뿌려줘야 함 : 10으로 나눈 값이 한 자리 수인 경우 -->
				   <select id="subCategory" class="form-select w-25 mx-2" >
				   </select>
				</div>
				
				<div class="p-2 input-group w-100">
				   <label class="mx-2 m-auto input-group-text" for="gdsName">상품명</label>
				   <input type="text" id="proName" name="PRO_NAME" class="border form-control mx-2" />
				</div>
				
				<div class="p-2 input-group w-100">
				   <label class="mx-2 m-auto input-group-text" for="gdsPrice">상품가격</label>
				   <input type="text" id="proPrice" name="PRO_PRICE" class="border form-control mx-2"/>
				</div>
				
				<div class="p-2 input-group w-100">
				   <label class="mx-2 m-auto input-group-text" for="gdsStock">상품수량</label>
				   <input type="text" id="proQuantity" name="PRO_QUANTITY" class="border form-control mx-2"/>
				</div>
				
				<div class="input-group mt-2 p-2 w-100 border-secondary d-flex align-items-center border-top">
				    <label class="mx-2 m-auto input-group-text">배너 이미지</label>
 					<div class="file-container_ form-control custom-primary m-2 d-flex align-items-center">
			            <input id="bannerFileText" class="file-upload-name_" placeholder="파일을 선택하세요" disabled="disabled">			
			            <label for="bannerFile" >올리기</label> 
			            <input type="file" id="bannerFile" class="upload-image_" name=""> 
			         </div>
				</div>
						
				<div class="input-group mt-2 p-2 w-100 border-secondary d-flex align-items-center border-top">					
				    <label class="mx-2 m-auto input-group-text">설명 이미지</label>
 					<div class="file-container_ form-control custom-primary m-2 d-flex align-items-center">
			            <input id="explainFileText" class="file-upload-name_" placeholder="파일을 선택하세요" disabled="disabled">			
			            <label for="explainFile" >올리기</label> 
			            <input type="file" id="explainFile" class="upload-images_" name="" >			        
			        </div>			        
				</div>
				<div class="input-group w-100 p-2">	
					<label class="mx-2 m-auto input-group-text"></label>
					<div class="form-control m-2 p-0 " style="height: auto">								
		        		<ul id="uploadedExplainFiles" class=" w-100 list-group">			        		
			        	</ul>
		        	</div>
		        </div> 
				<div class="p-2 w-100 border-secondary border-top d-flex justify-content-end">
				   <button type="submit" id="register_Btn" class="btn btn-primary btn-tuning border mx-2">등록</button>
				   <button id="cancel_Btn" class="btn btn-danger btn-tuning border mx-2">취소</button>
				</div>				
			</form>
      	</div>    
      </div>
    <div class="main_whitespace p-5 my-2">
		
	</div>
  </main>	
  <footer>
    <div id="first_footer" class="p-3"></div>
    <div id="second_footer"></div>
    <div id="third_footer"></div>
  </footer>

</body>
<script type="text/javascript">
	$(document).ready(function(){
		/* 메인 카테고리 작업 중
		
		let mainCategoryValue = $('#mainCategory').val(); 
		$('#mainCategory').on('change',function(){								
			$.ajax({
				type: "GET",
				url: "/api/vender/category",          
				data: {'categoryNo' : mainCategoryValue},
				success: function(response) {
				// window.location.href="/";
					console.log(response);
					$('#subCategory').append($('<option>', {
				        value: response[i].categoryId,
				        text: response[i].categoryName
				    }));
				},
				error: function(xhr, status, error) {
					console.log("가져오기 실패");
					console.error(xhr.responseText);
				}
			});
		}); 
		
		*/
		
		
		let bannerFile = $('#bannerFile');
		let explainFile = $('#explainFile');
		let uploadedExplainFiles = $('#uploadedExplainFiles');
		
		
		
		
		// 배너 이미지 경로 가져오기
		bannerFile.change(function(e){
		    let filename = "";
		    let files = e.target.files;
		    let bannerDeleteButton = $('<button></button>').addClass('btn font-weight-bold').text('X').attr('id','BnDelBtn');
		    
		    if (files.length > 0) {
		        filename = files[0].name;
		        $(this).siblings('#bannerFileText').val(filename);
		        $('#bannerFileText').after(bannerDeleteButton);
		    } else {
		    	// 이외의 경우에는 취소로 받아들이고 경고창을 띄우겠음.
		    	alert("배너 이미지 업로드가 취소되었습니다. 다시 올려주세요.");
		    	$(this).siblings('#bannerFileText').val('파일을 선택하세요');
		    }		    
		    
		    bannerDeleteButton.on('click',function(){
		    	if($(this).parents().children('#bannerFileText').length != 0){
		       		$(this).parents().children('#bannerFileText').each(function(){
		       			// #bannerFileText의 텍스트 초기화
		       			// this가 가리키는 요소가 다름.
		       			$(this).val('');
		       		});
		       		$(this).remove();
		       	}
		    });
		});
		
		// 설명 이미지 경로 가져오기
		explainFile.change(function(e){
		    let filename;
		    let files = e.target.files;
		   
		    // 파일을 선택한 경우
		    if (files.length > 0) {
		        filename = files[0].name;
		     // siblings() 메서드는 선택한 요소의 형제 요소들을 선택하여 반환
			    // -> explainFile의 형제인 #explainFileText(파일명 출력 공간)의 텍스트 값 입력
			    $(this).siblings('#explainFileText').val(filename);		        
		    } else {    			    	
		    	// 파일 전체 경로 -> /로 분할 -> 마지막 요소 추출 -> 다시 \\로 분할  -> 마지막 요소 추출	
		    	// -> 파일 이름 추출
		    	// filename = $(this).val().split('/').pop().split('\\').pop();
		        
		    	// 이외의 경우에는 취소로 받아들이고 경고창을 띄우겠음.
		    	alert("설명 이미지 업로드가 취소되었습니다. 다시 올려주세요.");
		    }  
			
			/*  파일 리스트를 보여주는 <ul> 태그 내 <li> 태그 만들기 작업 	*/		
			
		    // 파일 리스트로 보여주기 위한 <li> 
		    let newItem = $('<li></li>').addClass('list-group-item');
		    
			// 삭제 버튼
		    let explainDeleteButton = $('<button></button>').addClass('btn font-weight-bold').text('X').attr('id','exDelBtn');
		    
			// files 배열의 각 요소에 대해 반복
		    $.each(files, function(index, file){
		    	// 현재 파일명
                let fileName = file.name;  			    
		    	
    		 	// <li> 에 삭제 버튼 및 파일이름 추가 
    		    newItem.text(fileName).append(explainDeleteButton);    		 	
    		 	
                // 새로운 li 요소 생성 및  ul에 추가
                $('#uploadedExplainFiles').append(newItem);
            });    	 	
			
		 	// 삭제 버튼을 클릭할 때 파일을 삭제하는 이벤트를 추가
		    explainDeleteButton.on('click', function() {
		    	// 삭제 버튼을 포함한 파일 아이템을 삭제
		    	// closest() 메서드는 선택한 요소를 기준으로 가장 근접한 상위 요소를 찾아 반환
		    	
		    	// parents() : 현재 요소의 모든 부모 요소
		    	// parent() : 현재 요소의 직계 부모 요소
		    	
		    	// 버튼 직계 부모가 newItem이면
		    	if($(this).parent().is(newItem)){
		    		// 직계 부모 삭제
		       		$(this).parent().remove();
		    		$('#explainFileText').val('');
		       	}
		    });
		});
	}); 

</script>

<!-- 
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
		

	let venderPageUserInfo = function() {
		
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
						
						
						
						let $userInfo_email = $("<input>").attr("type","email").addClass("mx-1").attr("id","modi_email_input")
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
	venderPageUserInfo();

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
				venderPageUserInfo();
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
	        	venderPageUserInfo();
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
		venderPageUserInfo();
	});
	$("#myPage_orderInfo_Select").on('click', function() {
		let $h2title = $("<h2>").text("주문 사항");
		let $myPageContent = $("#MyPage_content_container").empty();
		let $myPageTitle = $("#MyPage_content_name");
		$myPageTitle.empty().append($h2title);
	});
	
	
</script> -->
<script>
					 
  let select_dv = $("#select_content");
    
    $("#select_mp_top").on('click', function() {
        select_dv.toggle();
    });



</script>

</html>