<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
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

<script src="/js/barscript.js"></script>
<script src="/js/footer.js"></script>


<link href="/css/footerstyle.css?after" rel="stylesheet">
<link href="/css/barstyle.css?after" rel="stylesheet">

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
	font-family: 'fonts', NanumGothicLight;
	background-color: #f7f0e8;
}

.no-ripple {
	pointer-events: none; /* 클릭 이벤트를 무시합니다. */
	user-select: none; /* 사용자 선택을 막습니다. */
	cursor: default; /* 기본 커서를 사용합니다. */
	transition: none; /* 전환 효과를 없앱니다. */
}

.yellowStar {
	color: gold;
}

table {
	display: table;
	border-collapse: separate;
	box-sizing: border-box;
	text-indent: initial;
	unicode-bidi: isolate;
	border-spacing: 2px;
	border-color: gray;
}

.nav-link.nav-link-custom:hover {
	color: yellow;
}

.nav-link.nav-link-custom.active {
	color: white;
	background-color: black;
}

.nav-link.nav-link-custom{
	color: black;
}


.input-group-text {
	width: 7em;
	text-align: center;
	justify-content: center;
	border: none;
	border-right: 1px solid #ccc;
}

.input-group-text, .form-control {
	height: 3em;
	line-height: 3em; /* 높이와 동일하게 설정하여 수직 중앙 정렬 */
	display: flex;
}

.form-control {
	align-items: center;
}

.btn-primary.custom-btn {
	
}

.btn-primary.custom-btn:hover {
	background-color: chocolate;
	border-color: chocolate;
}

.production-selling-table {
	padding: 30px;
	padding-bottom: 100px;
}

#vendorInfo_tbody>tr>th {
	margin-right: 2em;
}

#cart_btn ,#cart_btn2{
	background: white;
	border: 1px solid #ccc;
}

#purchase_btn,#purchaseBtn2 {
	background: black;
	color: white;
}

#purchase_btn, #cart_btn,#purchaseBtn2,#cart_btn2 {
	border-radius: 3px 3px 3px 3px;
	width: 8em;
	height: 3.5em;
}

#quantity, #itemName, #totalPrice, #itemPrice {
	border: none;
}

#order_content span, #order_content label {
	background-color: white;
}

#itemName {
	min-height: 2;
	max-height: 4;
	font-size: 1.3em;
	overflow: hidden;
	text-overflow: ellipsis;
}
#wish_rv_div img{
widht:1.5em;
height:1.5em;
}
#carouselExampleIndicators{
overflow: hidden;
}
#carouselExampleIndicators img{
width:100%;
max-height:500px;
min-height:500px;
object-fit: cover;
}

@media (min-width: 1200px) {
         
 }
#subtract_quantity, #add_quantity{
width:1.5em;
height:1.5em;
background:white;
border:1px solid #ccc;
 display: flex;
align-items: center;
justify-content: center;
}
#review_content_div{
margin-left:3em;
margin-right:3em;
margin-top:1em;
margin-bottom:1em;
background:#eee;
padding:1em;
border-radius:5px;
}
</style>


</head>

<body>
	<header>
	
	<input type="hidden" id="product_number_dv" value="sdsad">
	<input type="hidden" id="product_orgin_price_dv" value="${productdetail.PRO_PRICE}">
	
		<div id="title_bar" class=" fixed-top">
			<div class="py-2 px-1" id="top-bar">
				<button type="toggle-button" class="top_btn" id="top_btn"></button>
				<a href=""><img id="logo_img"
					src="/images/utilities/logoSSJA.png"></a>
				<form action="http://www.naver.com" id=searchForm method="get">
				</form>
				<button id="search_icon"></button>
				<a id="cart_link"><img id="cart_img"></a> <a id="user_link" href="/login"><img
					id="login_img"></a>
			</div>
		</div>
		<nav id="total_bar">
			<div id="home_user_bar"></div>
			<div id="sub_bar"></div>
		</nav>
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="principal"/>
		</sec:authorize>
		<input type="hidden" id="m_no" value="${principal.userInfo.m_No}">
	</header>
	<div id="side_bar">
		<div id="side_links" class="w-100"></div>
	</div>	
	<main>
		<div class="main_whitespace p-4 my-2 mt-5">
			<h1 class="h3 text-center " style="font-weight:bold;">${productdetail.PRO_NAME}</h1>
		</div>
		<div id="main_container">
			<div class="row goods">
				<!-- row 클래스를 추가 -->
				
				<div class="goodsImg col-12 col-md-6 col-lg-7">
					<div id="carouselExampleIndicators" class="carousel slide"
						data-bs-ride="carousel">
						<c:if test="${productdetail == null}"><!-- 상품메인 이미지가 없을 경우로 추후 변경 -->
						<div class="carousel-item active">
								<img src="${productdetail.PRO_BANNERIMG}"
									class="d-block w-100" alt="...">
							</div>
						</c:if> <!-- 상품 메인이미지 존재 여부에 따라 없으면 배너이미지만,ㅡ 있으면 forEach문 돌려서 캐러셀 담당 -->
				<c:if test="${productdetail != null}">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="${productdetail.PRO_BANNERIMG}" 
									class="d-block w-100" alt="..."><!-- 첫 고정은 배너이미지로 -->
							</div>
							<c:forEach var="image" items="상품메인 이미지 db" >
							<div class="carousel-item ">
								<img src="${productdetail.PRO_BANNERIMG}"
									class="d-block w-100" alt="..."> <!-- 추후 상품 메인 이미지 개발 시 넣기 -->
							</div>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
				</c:if>
					</div>
				</div>
				
				<div class="goodsInfo col-12 col-md-6 col-lg-5" id="order_content">
					<div class="cateName input-group d-flex flex-column" id="itemInfoContainer">
						<div class="input-group-text" style="font-weight:bold;border:none;">${productdetail.PRO_BIZNAME} </div>
						<div class="mx-3" id="itemName" >${productdetail.PRO_NAME}</div>
					</div><br>
					<div class="gdsPrice input-group">
						<span class="input-group-text">가격							
						</span>
						<span class="form-control " id="itemPrice"> 
							<span id="product_price" ></span> 원
						</span>
					</div>
					<div id="wish_rv_div" class="d-flex flex-row justify-content-between px-5">
						<div>
							<img src="/images/utilities/star_icon.jpg"> 
							<span>리뷰 개수</span>
						</div>
						<div>
							<img src="/images/utilities/wish_icon.png">
							 <span>위시 개수</span>
						</div>
					</div>
					<div class="cartStock input-group d-flex flex-row">
						<span class="input-group-text" >수량</span> 
						<input class="" type="number" id="quantity" value="1" style="width:20%;" readonly/>
						<div class="d-flex flex-row justify-content-center align-items-center">
							<button id="add_quantity">+</button>
							<button id="subtract_quantity">-</button>
						</div>
					</div>
					<hr>
						<div class="input-group" >
							<span class="mb-2 input-group-text">총 금액</span><span id="totalPrice" class="form-control mb-2" >								
								<span id="totMoney2" style="margin-left:auto;margin-right:2em;"></span> 원
							</span>
						</div>
						<div class="d-flex felx-row justify-content-center">
					<input type="button" class=" btn-outline-dark m-2" id="cart_btn"
								onclick="wish_click(${productdetail.getPRO_NO()})" value="장바구니 ">
							<input type="button" class="m-2" id="purchase_btn"  value="바로구매" >
						</div>
				</div>
			</div>
			
			<section class="bg-light border-top py-4" id="product_detail_section">
				<div class="container">
					<div class="row gx-4">
						<div class="col-lg-8 mb-4">
							<div class="border rounded-2 px-3 py-2 bg-white">
								<ul class="nav nav-pills nav-justified mb-3" id="ex1"
									role="tablist">
									<li class="nav-item d-flex " role="presentation"><a
										class="nav-link nav-link-custom d-flex align-items-center justify-content-center w-100 active"
										id="ex1-tab-1" data-mdb-toggle="pill" href="#ex1-pills-1"
										role="tab" aria-controls="ex1-pills-1" aria-selected="true">상품정보</a>
									</li>
									<li class="nav-item d-flex" role="presentation"><a
										class="nav-link nav-link-custom d-flex align-items-center justify-content-center w-100"
										id="ex1-tab-2" data-mdb-toggle="pill" href="#ex1-pills-2"
										role="tab" aria-controls="ex1-pills-2" aria-selected="false">리뷰</a>
									</li>
									<li class="nav-item d-flex" role="presentation"><a
										class="nav-link nav-link-custom d-flex align-items-center justify-content-center w-100"
										id="ex1-tab-3" data-mdb-toggle="pill" href="#ex1-pills-3"
										role="tab" aria-controls="ex1-pills-3" aria-selected="false">사업자정보</a>
									</li>
								</ul>
								<!-- Pills content -->
								<div class="tab-content" id="ex1-content">
									<div class="tab-pane fade show active" id="ex1-pills-1"
										role="tabpanel" aria-labelledby="ex1-tab-1"><!-- 상품 상세 이미지 가져와야함 -->
										<img src="/images/product_details/Design1.png"
											class="d-block w-100" alt="..."> <img
											src="/images/product_details/Design3.png"
											class="d-block w-100" alt="..."> <img
											src="/images/product_details/Design5.png"
											class="d-block w-100" alt="...">
									</div>
									<!-- 리뷰 구현 -->
									<div class="tab-pane fade mb-2" id="ex1-pills-2"
										role="tabpanel" aria-labelledby="ex1-tab-2" id="product_review">
										<div class="comment-body">
											<c:forEach var="productdetailreply"
												items="${productdetailreplys}">
												<div class="user-profile">
													<div class="user-info">
														<span class="user-name">${productdetailreply.getB_WRITER()}</span>
														<!-- 별점 구현 -->
														<span class="user-stars"> <c:forEach var="i"
																begin="1" end="5">
																<c:choose>
																	<c:when test="${productdetailreply.getB_EVAL() ge i}">
																		<i class="fa fa-star yellowStar" aria-hidden="true"></i>
																	</c:when>
																	<c:otherwise>
																		<i class="fa fa-star" aria-hidden="true"></i>
																	</c:otherwise>
																</c:choose>
															</c:forEach> ${productdetailreply.getB_EVAL()}.0
														</span>

													</div>
												</div>
												<div class="user-comment" id="review_content_div">
													${productdetailreply.getB_CONTENT()}</div>
												<hr>
											</c:forEach>
										</div>
										<nav aria-label="Page navigation example ">
											<ul class="pagination justify-content-center">
												<c:if test="${pageMaker.prev}">
													<li class="page-item"><a class="page-link"
														href="product_detail${pageMaker.makeReviewQuery(pageMaker.startPage - 1) }"
														aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
													</a></li>
												</c:if>

												<c:forEach var="idx" begin="${pageMaker.startPage}"
													end="${pageMaker.endPage}">
													<li class="page-item"><a class="page-link"
														href="product_detail${pageMaker.makeReviewQuery(idx)}">${idx}</a></li>
												</c:forEach>

												<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
													<li class="page-item"><a class="page-link"
														href="product_detail${pageMaker.makeReviewQuery(pageMaker.endPage + 1) }"
														aria-label="Next"> <span aria-hidden="true">&raquo;</span>
													</a></li>
												</c:if>
											</ul>
										</nav>

									</div>

									<div class="tab-pane fade mb-2" id="ex1-pills-3"
										role="tabpanel" aria-labelledby="ex1-tab-3">
										<section class="production-selling-section">
											<table class="production-selling-table">
												<tbody id="vendorInfo_tbody">
													<tr>
														<th>상호명</th>
														<td>${productdetail.getV_BIZNAME()}</td>
													</tr>
													<tr>
														<th>사업자이름</th>
														<td>${productdetail.getM_NAME()}</td>
													</tr>
													<tr>
														<th>사업장소재지</th>
														<td>${productdetail.getM_ADDRESS1()}&nbsp;${productdetail.getM_ADDRESS2()}&nbsp;${productdetail.getM_ZIPCODE()}</td>
													</tr>
													<tr>
														<th>사업장전화번호</th>
														<td>${productdetail.getM_PHONE()}</td>
													</tr>
													<tr>
														<th>E-mail</th>
														<td>${productdetail.getM_EMAIL()}</td>
													</tr>
													<tr>
														<th>사업자 등록번호</th>
														<td>${productdetail.getV_LICENSE()}</td>
													</tr>
												</tbody>
											</table>
										</section>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="px-0 border rounded-2 shadow-0">
								<div class="card px-3">
									<p class="addToCart mx-2">
										<div class="input-group">
											<label class="mb-2 input-group-text">총 금액</label><span id="totalPrice" class="form-control mb-2" >
												<span id="totMoney1" > </span> 원
											</span>
										</div>
										<div class="d-flex justify-content-center">
										<input type="button" class="mx-2" id="cart_btn2"
												onclick="wish_click(${productdetail.getPRO_NO()})" value="장바구니">
											<input type="button" class="mx-2" id="purchaseBtn2" value="바로구매" >
										</div>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>
  <script>
	//추가부분
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');	
    //추가부분 끝
	
	document.getElementById('purchase_btn').addEventListener('click', function() {
        // 페이지 이동
		purchaseProduct()
        // window.location.href = '/purchase';
    });
    document.getElementById('purchaseBtn2').addEventListener('click', function() {
        // 페이지 이동

		purchaseProduct()
        // window.location.href = '/purchase';
    });
    function purchaseProduct() {

        var quantity = document.getElementById("quantity").value;
        var productNo = ${productdetail.getPRO_NO()};

		//임의적으로 통일하기위하여 추가하였으나 나중에 필요에 따라 지우셔도 됩니다.

		var form = document.createElement("form");
		form.setAttribute("id", "dynamicForm");
		form.setAttribute("method", "POST");
		form.setAttribute("action", '/purchase');
		
		// CSRF 토큰을 저장할 hidden input 요소 추가
		var csrfInput = document.createElement("input");
		csrfInput.setAttribute("type", "hidden");
		csrfInput.setAttribute("name", "_csrf");
		csrfInput.setAttribute("value", token);
		form.appendChild(csrfInput);

		var pronoInput = document.createElement("input");
		pronoInput.setAttribute("type", "hidden");
		pronoInput.setAttribute("name", "productNo");
		pronoInput.setAttribute("value", productNo);
		form.appendChild(pronoInput);

		var mnoInput = document.createElement("input");
		mnoInput.setAttribute("type", "hidden");
		mnoInput.setAttribute("name", "mno");
		mnoInput.setAttribute("value", $("#m_no").val());
		form.appendChild(mnoInput);
		
		console.log($("#quantity").val());
		
		var quanInput = document.createElement("input");
		quanInput.setAttribute("type", "hidden");
		quanInput.setAttribute("name", "quantity");
		quanInput.setAttribute("value", $("#quantity").val());
		form.appendChild(quanInput);

		// 폼을 body에 추가
		document.body.appendChild(form);

		// 폼을 서버로 제출
		form.submit();
		
		
        // // AJAX 요청 생성
        // var xhr = new XMLHttpRequest();
        // xhr.open("POST", "/purchase", true);
        // xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        // xhr.setRequestHeader(header, token);
        
		// //수정전
        // // AJAX 요청이 완료되었을 때의 처리
        // xhr.onreadystatechange = function() {
        //     if (xhr.readyState === XMLHttpRequest.DONE) {
        //         // 페이지 이동
        //         window.location.href = '/purchase';
        //     }
        // };

        // // AJAX 요청 본문 생성
        // var params = "quantity=" + quantity + "&productNo=" + productNo;
        
        // // AJAX 요청 전송
        // xhr.send(params);
    }

    document.getElementById('purchaseBtn').addEventListener('click', purchaseProduct);
    document.getElementById('purchaseBtn2').addEventListener('click', purchaseProduct);

</script> 
	<script>
	

	    var currentPage = ${pageMaker.criteria.getPageNum()}; 

	    function setActivePage() {
	        var pageLinks = document.querySelectorAll('.page-link');
	        pageLinks.forEach(function(link) {
	            var pageNumber = parseInt(link.innerHTML); // 페이지 번호를 가져옵니다.
	            if (pageNumber === currentPage) {
	                link.classList.add('active'); // 현재 페이지에 active 클래스 추가
	            } else {
	                link.classList.remove('active'); // 현재 페이지가 아니면 active 클래스 제거
	            }
	        });
	    }

	    // 페이지 로드 시 초기화
	    window.onload = function() {
	        setActivePage();
	    };	    
	    let wish_click = function(productnumber) {
	    	let count = 0;
	        $.ajax({
	            type: "PUT",
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader(header, token);
	            },
	            data: JSON.stringify({"pro_no": productnumber}),
	            url: "/wishlist",
	            async:false,
	            contentType: "application/json",
	            success: function(data) {
	     console.log(data);
	                count = data;
	            }, error : function() {
	            	window.location.href="/login";
	            }
	        });
	        return count;
	    };
	    document.addEventListener('DOMContentLoaded', function() {
	        const btnButtons = document.querySelectorAll('.btn');

	        btnButtons.forEach(function(button) {
	            button.addEventListener('click', function(event) {
	                event.preventDefault(); // 기본 동작 방지
	                event.stopPropagation(); // 이벤트 전파 중지
	                setTimeout(function() {
	                    button.classList.remove('style'); // 일정 시간 후에 클래스 제거
	                }, 0); // 0 밀리초 뒤에 실행하여 최소한의 딜레이로 동작하도록 설정
	            });
	        });
	    });
	    
	    document.addEventListener("DOMContentLoaded", function() {
	        var quantityInput = document.getElementById("quantity");
	        var maxQuantity = ${productdetail.PRO_QUANTITY};

	        if (maxQuantity < 10) {
	            quantityInput.max = maxQuantity;
	        } else {
	            quantityInput.max = 10;
	        }
	     // 수량 입력값 변경 시 제한
	        quantityInput.addEventListener("input", function() {
	            var currentValue = parseInt(quantityInput.value);
	            if (currentValue > parseInt(quantityInput.max)) {
	                quantityInput.value = quantityInput.max;
	            }
	        });
	    });
	    
	    //리뷰 페이징으로 넘어갈 경우 쿼리파라미터 추가 여부에 따라 새 페이지 로딩 시 리뷰로 크롤 이동 및 리뷰칸 즉시 활성화
	    const currentURL = window.location.href;

	    if (currentURL.includes('&')) {
	        $("#ex1-tab-2").attr('aria-selected', 'true').addClass('active');
	        $("#ex1-pills-2").addClass('show active');
	        
	        $("#ex1-tab-1").attr('aria-selected', 'false').removeClass('active');
	        $("#ex1-pills-1").removeClass('show active');
	        
	        $("#ex1-tab-3").attr('aria-selected', 'false').removeClass('active');
	        $("#ex1-pills-3").removeClass('show active');
	        
	        //스크롤 리뷰로 이동
		let productReview = $("#product_detail_section");
		let topReviewHeight = productReview.offset();
		let goTop = topReviewHeight.top;

	      	setTimeout(() => {
	      	    $(window).scrollTop(goTop);
	      	}, 200);
	      
	    }
	    
let originPrice = $('#product_orgin_price_dv').val();
	    
	    //금액 포맷
		let formattingTotMoney = function(number){
			let formattedCurrency = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' })
			.format(number);
			return formattedCurrency;
		    }
		$('#product_price').text(formattingTotMoney(originPrice));
		$('#totMoney1').text(formattingTotMoney(originPrice));
		$('#totMoney2').text(formattingTotMoney(originPrice));
		  
		    //총 금액 최신화 함수
		    let updateTotal = function(quantity){
		    	let newTotalMoney = originPrice * quantity;
		    	console.log(newTotalMoney);
		    	$('#totMoney1').text(formattingTotMoney(newTotalMoney));
		    	$('#totMoney2').text(formattingTotMoney(newTotalMoney));
		    	
		    }
	    
	    
	    // 수량 증가 버튼
	    $('#add_quantity').on('click', function(){
	        let quantity_val = parseInt($("#quantity").val());
	        if(quantity_val >= 10){
	            return false;
	        }
	        $("#quantity").val(quantity_val + 1);
	        updateTotal($('#quantity').val()); // 이 부분에서 괄호 사용 수정
	    });

	    // 수량 감소 버튼
	    $('#subtract_quantity').on('click', function(){
	        let quantity_val = parseInt($("#quantity").val());
	        if(quantity_val <= 1){
	            return false;
	        }
	        $("#quantity").val(quantity_val - 1);
	        updateTotal($('#quantity').val()); // 이 부분에서 괄호 사용 수정
	    });
	</script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/0fa31147fa.js"
		crossorigin="anonymous"></script>
</body>
</html>
