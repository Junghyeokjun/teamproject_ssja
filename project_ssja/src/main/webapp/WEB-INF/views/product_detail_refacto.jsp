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
	color: #ff9900;
}

.nav-link.nav-link-custom.active {
	color: white;
	background-color: black;
}

.nav-link.nav-link-custom.active:hover {
	color: #ff9900;
}

.nav-link.nav-link-custom{
	color: black;
}

.input-group-text {
	width: 7em;
	text-align: center;
	justify-content: center;
	border: none;
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

#cart_btn, #cart_btn2 {
	background: white;
	border: 1px solid #ccc;
}

#purchase_btn, #purchaseBtn2 {
	background: black;
	color: white;
}

#purchase_btn, #cart_btn, #purchaseBtn2, #cart_btn2 {
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

#wish_rv_div img {
	widht: 1.5em;
	height: 1.5em;
}

#carouselExampleIndicators {
	overflow: hidden;
}

#carouselExampleIndicators img {
	width: 100%;
	max-height: 500px;
	min-height: 500px;
	object-fit: cover;
}

@media ( min-width : 1200px) {
}

#subtract_quantity, #add_quantity {
	width: 1.5em;
	height: 1.5em;
	background: white;
	border: 1px solid #ccc;
	display: flex;
	align-items: center;
	justify-content: center;
}

#review_content_div {
	margin-left: 3em;
	margin-right: 3em;
	margin-top: 1em;
	margin-bottom: 1em;
	background: #eee;
	padding: 1em;
	border-radius: 5px;
}

#categorylink, #avgeval {
	color: #bbb;
	text-decoration: underline;
}

#categorylink, #avgeval:hover {
	color: #888;
	cursor: pointer;
}

.user-profile {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.pagination .page-item.active .page-link {
	background-color: #ccc;
	color: #333; /* 배경색과 대비를 위한 글자색 설정 */
}

#paging_div a {
	padding: 0.5em;
	color: #aaa;
	text-decoration: none;
	border: 1px solid #aaa;
	border-radius: 3px 3px 3px 3px;
}

#toast {
	position: fixed;
	bottom: 20px;
	right: 20px;
	min-width: 200px;
	display: none;
	z-index: 1050;
}

#wish_img:hover {
	cursor: pointer;
}
.input-group-text > a{
text-decoration:none;
color:black;
}
</style>


</head>

<body>
	<header>
	
	<input type="hidden" id="product_number_dv" value="${productData.pro_no }">
	<input type="hidden" id="product_orgin_price_dv" value="${productData.pro_price }">
	
		<div id="title_bar" class=" fixed-top">
			<div class="py-2 px-1" id="top-bar">
				<button type="toggle-button" class="top_btn" id="top_btn"></button>
				<a href=""><img id="logo_img"
					src="/images/utilities/logoSSJA.png"></a>
				<form action="http://www.naver.com" id=searchForm method="get">
				</form>
				<button id="search_icon"></button>
				<a id="cart_link"><img id="cart_img"></a> 
				<a id="user_link" href="/login"><img id="login_img"></a>
			</div>
		</div>
		<nav id="total_bar">
			<div id="home_user_bar"></div>
			<div id="sub_bar"></div>
		</nav>
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="principal"/>
		</sec:authorize>
		<input type="hidden" id="m_no" value="${principal.userInfo.m_No}"><!-- 유저 번호 히든 -->
	</header>
	<div id="side_bar">
		<div id="side_links" class="w-100"></div>
	</div>	
	<main>
		<div class="main_whitespace p-4 my-2 mt-5">
			<h1 class="h3 text-center " style="font-weight:bold;">${productData.pro_name }</h1>
		</div>
		<div id="main_container">
			<div class="row goods">
				<!-- row 클래스를 추가 -->
				
				<div class="goodsImg col-12 col-md-6 col-lg-7">
					<div id="carouselExampleIndicators" class="carousel slide"
						data-bs-ride="carousel">
						<c:choose>
							<c:when test="${productData.findCoverImg().size() > 0}">
								<div class="carousel-indicators">
									<button type="button"	data-bs-target="#carouselExampleIndicators"
										data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
									<c:forEach var="cover"
										items="${productData.findCoverImg()}" varStatus="index">
										<button type="button"data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="${index.index + 1}"aria-label="Slide ${index.index + 2}"></button>
									</c:forEach>
								</div>
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img src="${productData.pro_bannerimg}" class="d-block w-100"alt="...">
										<!-- 첫 고정은 배너이미지로 -->
									</div>
									<c:forEach var="image"	items="${productData.findCoverImg()}">
										<div class="carousel-item">
											<img src="/images/${image}" class="d-block w-100" alt="...">
											<!-- 추후 상품 메인 이미지 개발 시 넣기 -->
										</div>
									</c:forEach>
								</div>
								<button class="carousel-control-prev" type="button"data-bs-target="#carouselExampleIndicators"data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"data-bs-target="#carouselExampleIndicators"data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</c:when>
							<c:otherwise>
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img src="${productData.pro_bannerimg}" class="d-block w-100"
											alt="...">
										<!-- 상품 메인 이미지 존재하지 않을 경우 배너 이미지만 표시 -->
									</div>
								</div>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
				
				<div class="goodsInfo col-12 col-md-6 col-lg-5" id="order_content">
					<div class="cateName input-group d-flex flex-column" id="itemInfoContainer">
						<span style="display: flex; justify-content: space-between;">
							<a id="categorylink" href="/product/search?category=${productData.p_c_no}">
								${productData.category1} > ${productData.category2} </a> 
								<span style="margin-left: auto; margin-right: 1.5em;"> 조회 수 ${productData.pro_hit} </span>
						</span>

						<div class="input-group-text">
    							<a style="font-weight: bold; border: none;"
    							href="/vendor/info/${productData.pro_bizname }">
    							${productData.pro_bizname}</a>
    							
								</div>

						<div class="mx-3" id="itemName" style="min-height:3em;">${productData.pro_name }</div>
					</div><br>
					<div id="sell_div" class=" m-2 d-flex flex-row justify-content-between pr-5">
						
						<div>누적 판매량 : ${productData.pro_sellcount }</div>
						<div class="mx-4" id="totalQuantity">수량 ${productData.pro_quantity }</div>
						
					</div>
						<div id="wish_rv_div" class="d-flex flex-row justify-content-between px-5">
						<div>
							<img src="/images/utilities/star_icon.jpg"> 
							<span id="avgeval">${productData.formattingAvgEval() }</span>
						</div>
						<div>
							<img src="/images/utilities/wish_icon.png" id="wish_img" onclick="wish_click('${productData.pro_no}')">
							 <span id="wish_count_sp">${productData.pro_wish }</span>
						</div>
					</div>
					<div class="cartStock input-group d-flex flex-row">
							<span class="form-control " id="itemPrice"> 
							<span id="product_price" style="margin-left:1em;font-size:1.2em; font-weight:bold;"> 원</span> </span>
						<span class="input-group-text mx-2" style="width:2.5em;">수량</span> 
						<input class="mx-5" type="number" id="quantity" value="1" style="width:3em;" readonly/>
						<div class="d-flex flex-row justify-content-center align-items-center px-0" style="margin-right:2em;">
							<button id="add_quantity">+</button>
							<button id="subtract_quantity">-</button>
						</div>
					</div>
					<hr>
						<div class="input-group">
							<span class="mb-2 input-group-text">총 금액</span><span id="totalPrice" class="form-control mb-2" >								
								<span id="totMoney2"></span> 원
							</span>
						</div>
						<div class="d-flex felx-row justify-content-center">
					<input type="button" class=" btn-outline-dark m-2" id="cart_btn"
								onclick="add_cart('${productData.pro_no}')" value="장바구니 ">
							<input type="button" class="m-2" id="purchase_btn"  value="바로구매" >
						</div>
				</div>
			</div>
			
			<!-- 장바구니 담기 정보 알림 토스트-->
			<div id="toast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-body">
            This is a toast message.
        </div>
    </div>
			
			
			<section class="bg-light border-top py-4" id="product_detail_section">
				<div class="container">
					<div class="row gx-4">
						<div class="col-lg-8 mb-4">
							<div class="border rounded-2 px-3 py-2 bg-white">
								<ul class="nav nav-pills nav-justified mb-3" id="ex1"
									role="tablist">
									<li class="nav-item d-flex custom-nav" role="presentation"><a
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
										<c:forEach var="mainImg" items="${productData.findMainImg() }" varStatus="stat">
										<img src="/images/${mainImg }" class="d-block w-100">
										</c:forEach>
									</div>
									<!-- 리뷰 구현 -->
									<div class="tab-pane fade mb-2" id="ex1-pills-2"
										role="tabpanel" aria-labelledby="ex1-tab-2" id="product_review">
										<div class="comment-body">
											<c:forEach var="review" items="${reviewData.objectList }"><!-- 리뷰 forEach문 -->
												<div class="user-profile">
													<div class="user-info">
														<span class="user-name">${review.b_writer }</span>
														<!-- 별점 구현 -->
														<span class="user-stars"> <c:forEach var="i"
																begin="1" end="5">
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
													${review.b_content }</div>
												<hr>
											</c:forEach>
										</div>
										<nav aria-label="Page navigation example " id="paging_div">
											<ul class="pagination justify-content-center">
												<c:if test="${reviewData.prev == true }"><!-- prev -->
													<li class="page-item"><a class="page-link"
														href="/product_detail?PRO_NO=${productData.pro_no }&pageNum=1"
														aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
													</a></li>
												</c:if>
			
												<c:forEach var="idx" begin="${reviewData.startPage }"
													end="${reviewData.endPage }"><!-- start에서 end 반복 -->
													<li class="page-item"><a class="page-link-${idx }"
														href="/product_detail?PRO_NO=${productData.pro_no }&pageNum=${idx}">
														${idx }</a></li>
												</c:forEach>

												<c:if test="${reviewData.prev == true && reviewData.endPage > 0 }"><!-- endPage and next -->
													<li class="page-item"><a class="page-link"
														href="/product_detail?PRO_NO=${productData.pro_no }&pageNum=${reviewData.endPage+1}"
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
														<td>${productData.pro_bizname }</td>
													</tr>
													<tr>
														<th>사업자이름</th>
														<td>${productData.m_name }</td>
													</tr>
													<tr>
														<th>사업장소재지</th>
														<td>${productData.m_address1 }${productData.m_address2 }</td>
													</tr>
													<tr>
														<th>사업장전화번호</th>
														<td>${productData.m_phone }</td>
													</tr>
													<tr>
														<th>E-mail</th>
														<td>${productData.m_email }</td>
													</tr>
													<tr>
														<th>사업자 등록번호</th>
														<td>${productData.v_license}</td>
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
												onclick="add_cart('${productData.pro_no}')" value="장바구니"><!--  장바구니 등록 구현 -->
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
	 
	 <sec:authorize access="hasRole('ROLE_VENDOR')">
        <input type="hidden" id="isVendorCheck" value="1">
    </sec:authorize>
	 
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
	
	$('#purchase_btn').on('click', function() {
        // 페이지 이동
		purchaseProduct()
    });
    $('#purchaseBtn2').on('click', function() {
        // 페이지 이동

		purchaseProduct()
    });
    

    let wish_click = function(productnumber) {
    	let productNum = parseInt(productnumber);
        $.ajax({
            type: "patch",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            data: JSON.stringify({"pro_no": productNum}),
            url: "/wishlist",
            async:false,
            contentType: "application/json",
            success: function(data) {
            	if($('#wish_count_sp').text() > data){
            		showToast('위시리스트에서 제거되었습니다.');
            	}else{
            		showToast('위시리스트에 추가되었습니다.');
            	}
                $('#wish_count_sp').text(data);
                
                
            }, error : function(e) {
            	console.log(e);
            	//window.location.href="/login";
            }
        });

    };
    
    
    function purchaseProduct() {


		//임의적으로 통일하기위하여 추가하였으나 나중에 필요에 따라 지우셔도 됩니다.

		let form = document.createElement("form");
		form.setAttribute("id", "dynamicForm");
		form.setAttribute("method", "POST");
		form.setAttribute("action", '/purchase');
		
		// CSRF 토큰을 저장할 hidden input 요소 추가
		let csrfInput = document.createElement("input");
		csrfInput.setAttribute("type", "hidden");
		csrfInput.setAttribute("name", "_csrf");
		csrfInput.setAttribute("value", token);
		form.appendChild(csrfInput);

		let pronoInput = document.createElement("input");
		pronoInput.setAttribute("type", "hidden");
		pronoInput.setAttribute("name", "productNo");
		pronoInput.setAttribute("value", parseInt($('#product_number_dv').val()));
		form.appendChild(pronoInput);

		let mnoInput = document.createElement("input");
		mnoInput.setAttribute("type", "hidden");
		mnoInput.setAttribute("name", "mno");
		mnoInput.setAttribute("value", parseInt($("#m_no").val()));
		form.appendChild(mnoInput);

		let quanInput = document.createElement("input");
		quanInput.setAttribute("type", "hidden");
		quanInput.setAttribute("name", "quantity");
		quanInput.setAttribute("value", parseInt($("#quantity").val()));
		form.appendChild(quanInput);

		// 폼을 body에 추가
		document.body.appendChild(form);

		// 폼을 서버로 제출
		form.submit();
		
		
    
    }
    
    document.getElementById('purchase_btn').addEventListener('click', purchaseProduct);
    document.getElementById('purchaseBtn2').addEventListener('click', purchaseProduct);
    
	
	let queryString = window.location.search;
	let params = new URLSearchParams(queryString);
	let pageNum = params.get('pageNum');
	 $(".page-link-"+pageNum).css('background','#ddd');
</script> 
	<script>
    
	let originPrice = $('#product_orgin_price_dv').val();

	let currentPage = '${reviewData.pageNum}'; 

	    function setActivePage() {
	    	let pageLinks = document.querySelectorAll('.page-link');
	        pageLinks.forEach(function(link) {
	        	let pageNumber = parseInt(link.innerHTML); // 페이지 번호를 가져옵니다.
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
	    
	    //장바구니 담기 ajax
	    let add_cart = function(productNum) {
	    	let item_quantity = $("#quantity").val();
	        $.ajax({
	            type: "get",
	            url: "/item_cart/"+ productNum +"/add?quantity=" + item_quantity,
	            async:false,
	            success: function(data) {
	            	if(data === 'Add')
	            		showToast("장바구니에 등록되었습니다.");
	            	if(data === 'Renew')
	            		showToast('이미 존재하는 장바구니 정보를 갱신하였습니다.');
	            	
	            	
	            }, error : function(xhr, status, e) {
	            	alert('장바구니 등록에 문제가 생겼습니다.');
	            }
	    });
	    };
	    
	    //토스트 창 함수
	    function showToast(message) {
            $('#toast .toast-body').text(message);
            $('#toast').fadeIn();

            setTimeout(function() {
                $('#toast').fadeOut();
            }, 3000); 
        }
	    
	  
	    
	    //리뷰 페이징으로 넘어갈 경우 쿼리파라미터 추가 여부에 따라 새 페이지 로딩 시 리뷰로 크롤 이동 및 리뷰칸 즉시 활성화
	    const currentURL = window.location.href;

	   
	   
	    let goReview = function(){
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
	    if (currentURL.includes('&')) {
	    	goReview();
	    }
	   

	   $("#avgeval").on('click',function(){
		   
	    	goReview();
	   })
	    
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
		    	$('#totMoney1').text(formattingTotMoney(newTotalMoney));
		    	$('#totMoney2').text(formattingTotMoney(newTotalMoney));
		    	
		    }
	    
	    
	    // 수량 증가 버튼
	    $('#add_quantity').on('click', function(){
	        let quantity_val = parseInt($("#quantity").val());
	        if($("#totalQuantity").text() < quantity_val) quantity_val = $("#totalQuantity").text();
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