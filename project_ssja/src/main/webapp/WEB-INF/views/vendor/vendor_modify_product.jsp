<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>
<html lang="en">
<head>
<script>
	let vendorData = "${principal.memberNum}";
	console.log("vendorData : " + vendorData);
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>SSJA</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous">
    </script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<script src="/js/vendorbarscript.js">

  </script>

<script src="/js/footer.js">

  </script>
<script src="/js/board.js">
</script>
<link href="/css/footerstyle.css?after" rel="stylesheet">
<link href="/css/vendorbarstyle.css?after" rel="stylesheet">
<link href="/css/board.css?after" rel="stylesheet">
<link rel="stylesheet"
	href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
@font-face {
	font-family: 'fonts';
	src: url("https://webfontworld.github.io/NanumSquare/NanumSquare.css")
		fotmat('font1');
}

body {
	font-family: 'fonts', NanumSquare;
	background-color: #f7f0e8;
}

header{
	height: auto;
}


main, footer {
	height: auto;
	overflow: hidden;
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

/* vendorpage */
.mx-2.m-auto.input-group-text {
	width: 8em;
	line-height: 3em; /* 높이와 동일하게 설정하여 수직 중앙 정렬 */
	text-align: center;
	display: flex;
	justify-content: center;
}

.mx-2.m-auto.input-group-text, .form-control {
	height: 3em;
}

.file-container_ {
	padding: 0;
}
/* 기존 파일 형식 없애기 */
.file-container_ input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

/* 커스텀 시작 - label */
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
	flex-grow: 1;
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
	font-weight: bold;
	background-color: #aa6bce;
	border-color: #a85cd4;
}

.upload-image_ {
	display: none;
}

.btn-danger.btn-tuning {
	background-color: #962626;
}

.btn-danger.btn-tuning:hover {
	background-color: #c43c3c;
}

.vendorName {
	border-bottom: 5PX SOLID #222222;
	background-color: white;
	padding: 3px;
	border-radius: 15 15 15 15;
	margin: auto;
}

.vendorTitle {
	padding-top: 3px;
}

.top_btn {
	font-size: 2em;
}

.yellowStar {
	color: gold;
}

@media screen and (max-width: 860px) {
	.vendorTitle {
		display: none;
	}
}
</style>
</head>

<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.auth" var="myAuth" />
		<c:choose>
			<c:when test="${myAuth != 'ROLE_VENDOR'}">
				<!-- 권한이 판매자가 아닌 경우 -->
				<script>
					$(document).ready(function() {
		                alert("접근할 수 없습니다.");
		                window.location.href = "/";
		            });
				</script>
			</c:when>
			<c:otherwise>
				<header class="fixed-top">
					<div id="title_bar">
						<div class="py-2 px-1 d-flex justify-content-between" id="top-bar">
							<div class="d-flex align-items-center">
								<button type="toggle-button" class="top_btn"></button>
								<a id="logo_toHome" href=""><img id="logo_img"
									src="/images/utilities/logoSSJA.png"></a>
							</div>
							<div class="mx-5 my-2 d-flex ">
								<h1 class="h1 vendorTitle">판매자 :&nbsp;</h1>
								<!-- 
						땡땡땡땡 : 상호명
						로그인 시 vendorDto에 담기는 vendor.vbizname 또한 가져오기						
						그냥 조인을 쓴다면 vendorDto가 아니라 조인한 결과를 담는 다른 Dto가 필요할 것이다.
					 -->
								<h1 class="h1 vendorNames">
									&lt;
									<sec:authorize access="isAuthenticated()">
										<sec:authentication property="principal.userInfo"
											var="vendorMember" />
									</sec:authorize>
									<input type="hidden" id="vendorData"
										value="${vendorMember.m_No}"> ${vendorMember.m_Name}
									&gt;
								</h1>
							</div>
							<a id="user_link"><img id="login_img"></a>
						</div>
					</div>
					<nav id="total_bar"></nav>
				</header>
				<div id="side_bar">
					<div id="side_links" class="w-100"></div>
				</div>
				<!-- 	   
		<div id="select_MyPage" class="d-flex flex-column">
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
						<h1 class="h2 text-center mb-5">${product.getPRO_NAME()}</h1>
						<h3 class="h5 text-center"><span>상품 정보 조회 가능</span></h3>
						<h3 class="h5 text-center"><span>상품 카테고리, 상품명, 상품 가격 수정 가능</span></h3>
						<h3 class="h5 text-center"><span>해당 상품 등록 일자 : ${product.getPRO_DATE()}</span></h3>
					</div>
					<div id="main_container" class="d-flex flex-row align-items-center justify-content-center">
						<div class="border p-5 text-center w-50 product-info">
							<form id="productModify"
								action="${pageContext.request.contextPath}/vendor/product/modify"
								method="post" autocomplete="off" >
								<sec:csrfInput />
								<input type="hidden" name="PRO_NO" readonly="readonly" value="${product.getPRO_NO()}">
								<input type="hidden" name="V_NO" readonly="readonly" value="${product.getV_NO()}"> <input
									type="hidden" name="PRO_BIZNAME" readonly="readonly" value="${product.getPRO_BIZNAME()}">
								<div id="ProductCategory" class="p-2 input-group w-100">
									<label class="mx-2 m-auto input-group-text">1차 분류</label>
									<!-- 상품 카테고리를 해당 페이지에 뿌려줘야 함 : 한 자리 수 -->
									<select id="mainCategory" class="form-select w-25 mx-2">
										<option value=""></option>
										<c:forEach var="proCate" items="${pcMains}">
											<option value="${proCate.pcNum}">${proCate.pcSubName}</option>
										</c:forEach>
									</select>
								</div>
								<div id="ProductCategory2" class="p-2 input-group w-100">
									<label class="mx-2 m-auto input-group-text">2차 분류</label>
									<!-- 상품 카테고리를 해당 페이지에 뿌려줘야 함 : 10으로 나눈 값이 한 자리 수인 경우 -->
									<select id="subCategory" class="form-select w-25 mx-2"
										name="P_C_NO">
									</select>
								</div>

								<div class="p-2 input-group w-100">
									<label class="mx-2 m-auto input-group-text" for="gdsName">상품명</label>
									<input type="text" id="proName" name="PRO_NAME"
										class="border form-control mx-2" value="${product.getPRO_NAMEStr()}"/>
								</div>

								<div class="p-2 input-group w-100">
									<label class="mx-2 m-auto input-group-text" for="gdsPrice">상품가격</label>
									<input type="number" id="proPrice" name="PRO_PRICE"
										class="border form-control mx-2" value="${product.getPRO_PRICE()}"/>
								</div>

								<div class="p-2 input-group w-100">
									<label class="mx-2 m-auto input-group-text" for="gdsStock">상품수량</label>
									<input type="number" id="proQuantity" name="PRO_QUANTITY"
										class="border form-control mx-2 bg-secondary text-light" readonly="readonly" value="${product.getPRO_QUANTITY()}"/>
								</div>
								
								<div class="p-2 input-group w-100">
									<label class="mx-2 m-auto input-group-text" for="gdsStock">Wish</label>
									<input type="number" id="proWish" name="PRO_WISH"
										class="border form-control mx-2 bg-secondary text-light" readonly="readonly" value="${product.getPRO_WISH()}"/>
								</div>
								
								<div class="p-2 input-group w-100 mb-3">
									<label class="mx-2 m-auto input-group-text" for="gdsStock">판매량</label>
									<input type="number" id="proSellCount" name="PRO_SELLCOUNT"
										class="border form-control mx-2 bg-secondary text-light" readonly="readonly" value="${product.getPRO_SELLCOUNT()}"/>
								</div>								
						
								<div
									class="p-2 pt-4 w-100 border-secondary border-top d-flex justify-content-center">									
										<input type="submit" id="register_Btn" value="수정"
										class="btn btn-primary btn-tuning border mx-2"> 
									<div class="px-3"></div>										
									<input
										type="button" id="cancel_Btn"
										class="btn btn-danger btn-tuning border mx-2" value="취소">
								</div>
							</form>
						</div>
						<div class="border p-5 text-center w-50 review" style="overflow-y: auto">
							<div class="d-flex justify-content-between">
								<span class="h5">리뷰</span>
								<div>
									<span>
									평균 별점 : 
									<c:forEach var="i" begin="1" end="1">
										<i class="fa fa-star yellowStar" aria-hidden="true"></i>
									</c:forEach>
									</span>
									<span id="averageRating"></span>									
								</div>
							</div>
							<div>
								<hr class="border border-2 opacity-75">
							</div>
							<div class="mb-2"  id="product_review">
								<div class="comment-body">
									<c:choose>
										<c:when test="${empty reviewData.objectList}">											
											<div class="text-center">
												<h2 class="h2 text-center">해당 상품의 리뷰가 없습니다.</h2>
											</div>
											<div>
												<hr class="border border-2 opacity-75">
											</div>
										</c:when>
										<c:otherwise>
											<c:forEach var="review" items="${reviewData.objectList}"><!-- 리뷰 forEach문 -->
												<div class="d-flex justify-content-between">
													<div class="user-profile">												
														<div class="user-info">
															<input type="hidden" class="review-no" value="${review.b_no}" disabled="disabled"/>
															<input type="hidden" class="review-stars" value="${review.b_eval}" disabled="disabled"/>
															<span class="user-name">${review.b_writer }</span>
															<!-- 별점 구현 -->
															<span class="user-stars"> 
																<c:forEach var="i" begin="1" end="5">
																	<c:choose>
																		<c:when test="${review.b_eval >= i }"><!-- 별이미지 반복 -->
																			<i class="fa fa-star yellowStar" aria-hidden="true"></i>
																		</c:when>
																		<c:otherwise>	
																			<i class="fa fa-star" aria-hidden="true"></i>
																		</c:otherwise>
																	</c:choose>
																</c:forEach> 
															</span>
														</div>
														<div class="ml-5" style="color:#aaa;">${review.b_date }</div>
													</div>
													<div class="user-comment" id="review_content_div">
														${review.b_content }
													</div>
												</div>
												<div class="review-reply-add" data-rbno="${review.b_no}">
													<div class="add-button-area">

													</div>
												</div>												
												<hr class="border border-2 opacity-75">																																									
											</c:forEach>
										</c:otherwise>
									</c:choose>		
								</div>
							</div>
						</div>
					</div>
				</main>
				<div class="main_whitespace p-5 bg-white border-0" ></div>
				<footer>
					<div id="first_footer" class="p-3"></div>
					<div id="second_footer"></div>
					<div id="third_footer"></div>
				</footer>
			</c:otherwise>
		</c:choose>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<script type="text/javascript">
	    	$(document).ready(function(){
				alert("해당 게시판에 접근하기 위해서는 로그인이 필요합니다.");
			 	window.location.href = "/login";
	    	});
		</script>
	</sec:authorize>

</body>

 <sec:authorize access="isAuthenticated()">
	 
	 <sec:authorize access="hasRole('ROLE_VENDOR')">
        <input type="hidden" id="isVendorCheck" value="1">
    </sec:authorize>
	 
  <script src="/js/login_user_tab.js"> </script>
</sec:authorize>

<script type="text/javascript">

	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
	// 보통 페이지를 닫기 전에 사용자에게 중요한 경고 메시지를 보여주는 등의 용도로 사용
	// 해당 페이지 return 반영은 나중에. 현재는 return 값이 없으면 작동을 안하는데, return 값을 넣어도 text가 기본 브라우저 텍스트로만 나옴
	$(window).on('beforeunload', function() {
		return "내용이 손실될 수 있습니다.";
	});

	// vendorData = memberNum
	$('#inputReplyCon').on('input', function() {
		textareaAutoHeight(this);
	});

	function getReply(){
		$('.review-no').each(function(index, element){
			let bno = $(element).val();
			$.ajax({
				type : "GET",
				url : "/api/replys/list",
				data : {'bno' :  bno},
				success : function(response){					
					// eq(index)를 넣지 않으면 기본적으로 첫번째 요소만 선택하므로, 반드시 넣어주기.
					// 해당 부분 처리 완료/
					let reviewReplyAdd = $('.review-reply-add').eq(index);

					// 해당 리뷰 댓글 개수가 0이면
					if(response.replys.length == 0){						
						if(reviewReplyAdd.data('rbno') == bno){
							reviewReplyAdd.find('.add-button-area').append(
								$('<button>').addClass('btn btn-success btn-format reply-write-form')
											.attr('data-rbno', bno)
											.attr('data-rmno', vendorData)
											.text('작성'));
						}						
					}else{
						let writtenReviewReply = makeWrittenReviewReply($(element).parent().parent().parent().parent().find('.review-reply-add'))
						writtenReviewReply.find('#inputReplyCon').val(response.replys[0].rcontent);
						writtenReviewReply.find('.h5.m-1.p-1').text(response.replys[0].rwriter);
						reviewReplyAdd.append(writtenReviewReply);
					}
				},
				error : function(xhr, status, error) {
					alert("답변 가져오기 실패");
				}
			});
		});
	}
	// 클래스명만 다르게.
	function makeWrittenReviewReply(element){
		let writtenReviewReply = $('<div>').addClass('written-review-reply');
		let hr = $('<hr>').addClass('border border-1 opacity-75');
		let dFlexBetween = $('<div>').addClass('d-flex justify-content-between');
		let h5Title = $('<h5>').addClass('h5 m-1 p-1').text('답변');
		let spanButton = $('<span>').addClass('mx-2 my-1');
		let borderRounded = $('<div>').addClass('border rounded');
		let textarea =$('<textarea>').attr({
			id: 'inputReplyCon',
			class: 'form-control rounded-top scrollable-textarea',
			name: 'rcontent',
			'data-rbno': $(element).data('rbno'), // 리뷰 번호 설정
			'data-rmno': vendorData, // 회원 번호 설정
			placeholder: '판매자로서, 답변을 다실 수 있습니다.'
		}).attr('readonly',true).css({
			'resize': 'none',
			'overflow': 'hidden',
			'height': 'auto',
			'min-height' : '3em'
		});

		// 요소들을 구조에 맞게 추가
		dFlexBetween.append(h5Title).append(spanButton);
		writtenReviewReply.append(hr).append(dFlexBetween).append(borderRounded.append(textarea));

		return writtenReviewReply;
	}

	function makeWriteReviewReply(element){
		let writeReviewReply = $('<div>').addClass('write-review-reply');
		let hr = $('<hr>').addClass('border border-1 opacity-75');
		let dFlexBetween = $('<div>').addClass('d-flex justify-content-between');
		let h5Title = $('<h5>').addClass('h5 m-1 p-1').text('답변');
		let spanButton = $('<span>').addClass('mx-2 my-1');
		let inputBtn = $('<button>').attr('id', 'inputReply').addClass('btn btn-primary btn-format').text('입력');
		let borderRounded = $('<div>').addClass('border rounded');
		let textarea =$('<textarea>').attr({
			id: 'inputReplyCon',
			class: 'form-control rounded-top scrollable-textarea',
			name: 'rcontent',
			'data-rbno': $(element).data('rbno'), // 리뷰 번호 설정
			'data-rmno': vendorData, // 회원 번호 설정
			placeholder: '판매자로서, 답변을 다실 수 있습니다.'
		}).css({
			'resize': 'none',
			'overflow': 'hidden',
			'height': 'auto',
			'min-height' : '3em'
		});

		// 요소들을 구조에 맞게 추가
		spanButton.append(inputBtn);
		dFlexBetween.append(h5Title).append(spanButton);
		writeReviewReply.append(hr).append(dFlexBetween).append(borderRounded.append(textarea));

		return writeReviewReply;
	}

	function getReviewStarAvg(){
		// 숨겨진 input 요소에서 값을 가져옵니다.
		let reviewStars = $('.review-stars');

		// 값들을 저장할 배열을 초기화합니다.
		let ratings = [];

		// 모든 숨겨진 input 요소의 값을 배열에 추가합니다.
		reviewStars.each(function() {
			ratings.push(parseFloat($(this).val()));
		});

		// 배열의 평균을 계산합니다.
		let total = 0;
		for (let i = 0; i < ratings.length; i++) {
			total += ratings[i];
		}
		// NaN이면 0, 아니면 값을 출력
		let average = isNaN(total / ratings.length) ? 0 : (total / ratings.length);

		// 평균을 소수점 첫 번째 자리까지 반올림하여 표시합니다.
		// <i class="fa fa-star yellowStar" aria-hidden="true"></i>
		$('#averageRating').append( $('<i>').addClass('fa fa-star yellowStar').attr('aria-hidden', 'true'));
		$('#averageRating').text(average.toFixed(1));
			
	}

	$(document).ready(function(){
		$('.review').height($('.product-info').height()); 

		getReply();

		getReviewStarAvg();

		// 버튼마다 하나만 활성화되도록 하기 위한 변수
		let activeBtn = null;

		$(document).on('click','.reply-write-form',function(){			
			// 이미 다른 버튼이 활성화된 상태라면 초기화
			if (activeBtn && activeBtn[0] !== $(this)[0]) {
				// 이전 활성화된 버튼의 로직 초기화
				activeBtn.text('작성');
				activeBtn.parent().parent().find('.write-review-reply').remove();
			}

			// 현재 버튼을 활성화된 상태로 설정
			let writeReviewReply = makeWriteReviewReply(this);
			let thisReviewReply = $(this).parent().parent();

			if ($(this).text() === '작성') {				
				thisReviewReply.append(writeReviewReply);
				$(this).text('취소');
				activeBtn = $(this); // 활성화된 버튼으로 설정
			} else{
				let yesOrNo = confirm("정말로 답변 작성을 취소하시겠습니까?");
				if(yesOrNo){
					thisReviewReply.find('.write-review-reply').remove();
					$(this).text('작성');
					activeBtn = null;
				}else{
					activeBtn = $(this); // 활성화된 상태로 유지
				}			
			}
		});

		// memberNum 변수 값 유무에 따라 로그인 여부를 체크하는 함수(소셜 로그인도 해당 변수에 값이 들어간 상태라고 함)
		function isLoggedIn(){
			let memberNum = '${principal.memberNum}';
			// console.log('isLoggedIn memberNum : ' + memberNum);
			return memberNum != '' ? true : false;
		}

		$(document).on('click', '#inputReply', function(e){
			// 기본 동작을 막음.
			// 이후 폼 제출이나 링크 이동은 따로 선언해서 이벤트를 진행
			e.preventDefault();
			let thisWriteReviewReply = $(this).parent().parent().parent();
			let rbno = thisWriteReviewReply.find('#inputReplyCon').data('rbno');
			let rmno = thisWriteReviewReply.find('#inputReplyCon').data('rmno');
			let rWriter = $("input[name='PRO_BIZNAME']").val();
			let rcontent = thisWriteReviewReply.find('#inputReplyCon').val();
			// 나머지 경우에는 ajax를 통한 댓글 입력 실행.
			console.log('useruser : ' + rWriter);
			console.log('rbno : ' + rbno);
			console.log('rmno : ' + rmno);
			console.log('text : ' + $('#inputReplyCon').val());
			if(!isLoggedIn()){
				// 로그인이 안된 상태에서 버튼을 클릭 시
				alert('댓글을 달 수 없습니다. 로그인 페이지로 이동합니다.');
				$(location).attr('href', '/login');
				return;		
			}else if($('#inputReplyCon').val().length <= 9){
				// 10글자 미만으로 입력시
				alert('10글자 이상 입력하시기 바랍니다.');
				$('#inputReplyCon').val('');
				return;		
			} else{
				let yesOrNo = confirm("답변은 한번만 작성 가능합니다. 작성하시겠습니까?");
				if(yesOrNo){					
					$.ajax({
						url: '/api/replys/add',
						type : 'POST',
						beforeSend : function(xhr) {
							xhr.setRequestHeader(header, token);
						},
						data : {
							'rbno' : rbno,
							'rmno' : rmno,
							'rwriter' : rWriter,
							'rcontent' : rcontent
						},
						success :  function(response){
							console.log(response);
							
							thisWriteReviewReply.removeClass('write-review-reply');
							thisWriteReviewReply.addClass('written-review-reply');

							thisWriteReviewReply.find('#inputReplyCon').attr('readonly',true);
							// 입력 후 입력 버튼 없애기.
							$('#inputReply').remove();
							thisWriteReviewReply.parent().find('.reply-write-form').remove();
							thisWriteReviewReply.find('.h5.m-1.p-1').text($("input[name='PRO_BIZNAME']").val());
						},
						error : function(xhr, status, error){
							alert('답변 처리가 제대로 되지 않았습니다! 나중에 다시 시도하세요.');
							console.log("error : " + error);
							console.log("status : " + status);
							console.log("response : " + xhr.responseText);
						}
					});
				}				
			}
		});
		
		$.ajax({
			type : "POST",
			url : "/api/vendor/vendorInfo",
			data : { 'vendorData' : vendorData },
			success : function(response){
				console.log("판매자 정보 가져오기 성공");
				$("input[name='V_NO']").val(response.v_no);
				$("input[name='PRO_BIZNAME']").val(response.v_bizName);
				/* console.log( "V_NO VAL : " + response.v_no );
				console.log( "BIZNAME VAL : " + response.v_bizName); */
			},
			error : function(xhr, status, error) {
				console.log("판매자 정보 가져오기 실패");
			}
		});
		// 메인 카테고리 작업 중
		
		// 선택된 메인 카테고리 값
		// option:selected를 사용하지 않으면 값이 출력되지 않는 상황이 발생. 
		// 이후로도 안되면, 다른 방식을 찾아봄.
		
		$('#mainCategory').on('change',function(callback){	
			let $mainCategoryValue = $('#mainCategory option:selected').val();
			console.log("$mainCategoryValue : " + $mainCategoryValue);
			$.ajax({
				type: "GET",
				url: "/api/vendor/category",          
				data: {'categoryNo' : $mainCategoryValue},
				success: function(response) {
					// 기존에 있는 자식 요소들을 제거하기. 해당 처리를 하지 않으면 서브 카테고리들이 중첩되어 추가됨.
					$('#subCategory').empty();
					// window.location.href="/";
					console.log(response);
					for(let i=0; i< response.length; i++){
						$('#subCategory').append($('<option>', {
					        value: response[i].pcNum,
					        text: response[i].pcSubName							
					    }));
					}
				},
				error: function(xhr, status, error) {
					console.log("가져오기 실패");
					alert("카테고리 1차 분류 목록을 선택하세요.");
					console.error(xhr.responseText);
				}
			});
		}); 

		
		console.log("proprice val 타입 : " + typeof $("#proPrice").val());

		$('#productModify').on('submit',function(e){
			e.preventDefault();
			// 기존 submit 동작 중지
			let formData = new FormData(this);

			// 상품명 값 변경
			formData.delete($('#proName').attr('name'));
			formData.append($('#proName').attr('name'), "[" + $('#subCategory option:selected').text() + "]" + $('#proName').val());

			if($("#subCategory").val()=="" || $("#subCategory").val()==null){
				alert("1차 분류를 선택한 후, 2차 분류를 선택하십시오.");
				return;
			}else if($("#proName").val()=="" || $("#proName").val()==null){
				alert("상품명을 입력하셔야 합니다.");
				return;
			}else if($("#proName").val().length < 5){
				alert("상품명은 다섯 글자 이상 입력하셔야 합니다.");
				return;
			}else if($("#proPrice").val()=="" || $("#proPrice").val()==null || isNaN(Number($("#proPrice").val()))){
				alert("상품 가격을 입력하셔야 합니다.");
				return;
			}else if( Number($("#proPrice").val()) < 0){
				alert("상품 가격은 음수가 될 수 없습니다.");
				return;
			}else if( !Number.isInteger(Number($("#proPrice").val()))){
				alert("상품 가격에 소수는 입력하시면 안됩니다.");
				return;
			}else if($("#proQuantity").val()=="" || $("#proQuantity").val()==null || isNaN(Number($("#proQuantity").val())) ){
				alert("상품수량을 입력하셔야 합니다.");
				return;
			}else if( Number($("#proQuantity").val()) < 0 ){
				alert("상품 수량은 음수가 될 수 없습니다.");
				return;
			}else if( !Number.isInteger(Number($("#proQuantity").val()))){
				alert("상품 수량에 소수는 입력하시면 안됩니다.");
				return;
			}else{
				// 위 제약조건에 해당되지 않는 나머지 경우에 한해, 로직을 실행한다.	
				let addProduct = confirm("상품 정보 수정을 계속 진행합니다.");
				if(confirm){
					// 수정 후 확인을 위한, formData 데이터 확인
					// 데이터가 제대로 들어가고 있으므로 다시 주석처리
					// for(let pair of formData.entries()){
					// 	console.log(pair[0] + ", " + pair[1]);						
					// }
					
					// 여전히, 상품 등록 시 상품명 텍스트가 해당 요소의 val()값을 반영하고 있으므로 이를 val()을 수정하여 반영함
					// 파일은 잘 들어가는데 말이지......... 기존 데이터 수정해주고 반영해야 반영되려나보다.
					$('#proName').val("[" + $('#subCategory option:selected').text() + "]" + $('#proName').val());	

					this.submit();
				}else{
					alert("정보 수정을 취소했습니다.");
					return;
				}				
			}
		});

		let vnono = "${product.getV_NO()}"
		$("#cancel_Btn").on("click",function(){
			window.location.href = "/vendor/product/list/" + vnono;	
		});
	}); 
</script>


<script>
					 
  let select_dv = $("#select_content");
    
    $("#select_mp_top").on('click', function() {
        select_dv.toggle();
    });

	

</script>

</html>