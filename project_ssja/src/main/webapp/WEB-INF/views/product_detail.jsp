<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="/js/barscript.js"></script>
<script src="/js/footer.js"></script>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>
<link href="/css/footerstyle.css?after" rel="stylesheet">
<link href="/css/barstyle.css?after" rel="stylesheet">
<link rel="stylesheet"
	href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
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

#logo_img {
	width: 3.5em;
	height: 3em;
}

.nav-link-custom {
	background-color: black;
	color: white;
	padding: 20px;
}
</style>
</head>
<body>
	<header>
		<div id="title_bar" class=" fixed-top">
			<div class="py-2 px-1" id="top-bar">
				<button type="toggle-button" class="top_btn" id="top_btn"></button>
				<a href=""><img id="logo_img"
					src="/images/utilities/logoSSJA.png"></a>
				<form action="http://www.naver.com" id=searchForm method="get">
				</form>
				<button id="search_icon"></button>
				<a id="cart_link"><img id="cart_img"></a> <a id="user_link"><img
					id="login_img"></a>
			</div>

		</div>
		<nav id="total_bar">
			<div id="home_user_bar"></div>
			<div id="sub_bar"></div>
		</nav>
	</header>

	<div id="side_bar">
		<div id="side_links" class="w-100"></div>
	</div>
	<main>
		<div id="main_container">
			 <div class="row goods">
				<!-- row 클래스를 추가 -->
				<div class="goodsImg col-12 col-md-6 col-lg-7">
					<div id="carouselExampleIndicators" class="carousel slide"
						data-bs-ride="carousel">
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
								<img src="/images/product/${productdetail.PRO_BANNERIMG}"
									class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="/images/product/${productdetail.PRO_BANNERIMG}"
									class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="/images/product/${productdetail.PRO_BANNERIMG}"
									class="d-block w-100" alt="...">
							</div>
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
					</div>
				</div>
				<div class="goodsInfo col-12 col-md-6 col-lg-5">
					<p class="cateName">
						<span>상품이름 ${productdetail.PRO_NAME}</span>
					</p>
					<p class="gdsPrice">
						<span>가격 <fmt:formatNumber pattern="###,###,###"
								value="${productdetail.PRO_PRICE}" /> 원
						</span>
					</p>
					<p class="cartStock">
						<span>수량</span> <input type="number" min="1"
							max="${productdetail.PRO_QUANTITY}" value="1" />
					</p>
					<hr>
					<div class="production-selling-header__info-wrap">
						<div class="production-selling-header__promotion">
							<div class="production-selling-header__promotion__title-wrap">
								<span>혜택</span>
							</div>
							<div class="production-selling-header__promotion__content-wrap">
								<p class="production-selling-header__promotion__entry">
									<b>20<!-- -->P
									</b> 적립 (
									<!-- -->
									WELCOME
									<!-- -->
									0.1
									<!-- -->
									% 적립)
								</p>
								<p class="production-selling-header__promotion__entry">
									<button
										class="production-selling-header__promotion__entry__button"
										type="button">
										최대 <b>10%</b> 결제할인 (카카오페이)
										<!-- -->
										<svg class="icon" width="10" height="10" viewBox="0 0 10 10"
											fill="currentColor" preserveAspectRatio="xMidYMid meet">
											<path d="M2.5 8.2L5.63 5 2.5 1.8l.94-.97L7.5 5 3.44 9.17z"></path></svg>
									</button>
								</p>
							</div>
						</div>
						<div class="production-selling-header__delivery">
							<div class="production-selling-header__delivery__title-wrap">
								<span>배송</span>
							</div>
							<div class="production-selling-header__delivery__content-wrap">
								<span class="production-selling-header__delivery__fee"><b>무료배송</b></span><span
									class="production-selling-header__delivery__type"><span>일반택배</span></span><span
									class="production-selling-header__delivery__disclaimer-wrap"><span
									class="production-selling-header__delivery__disclaimer"><svg
											class="check-icon" width="10" height="9" fill="none"
											preserveAspectRatio="xMidYMid meet">
											<path d="M1 3.83l2.153 3.03a1 1 0 001.627.005L9 1"
												stroke="#BDBDBD" stroke-width="1.5" stroke-linecap="round"
												stroke-linejoin="round"></path></svg><span>제주도/도서산간 지역
											5,000원</span></span></span>
								<div
									class="_2SUYq production-selling-header__delivery__expectation-date__dropdown">
									<div
										class="production-selling-header__delivery__expectation-section">
										<div
											class="production-selling-header__delivery__expectation-wrap">
											<div
												class="production-selling-header__delivery__expectation-date__header">
												<svg class="delivery-time-icon" width="24" height="24"
													fill="none" preserveAspectRatio="xMidYMid meet">
													<path fill-rule="evenodd" clip-rule="evenodd"
														d="M13.303 5.04l.394.92L7 8.83V12a.5.5 0 01-1 0V8.17l7.303-3.13z"
														fill="#00B8F0"></path>
													<path fill-rule="evenodd" clip-rule="evenodd"
														d="M10.197 4.628a.5.5 0 00-.394 0L4.269 7 10 9.456 15.73 7l-2.427-1.04-3.106-1.332zM3.5 14.341V7.758l6 2.572v6.912L3.803 14.8a.5.5 0 01-.303-.46zm7 2.9l1.534-.657a5 5 0 014.466-5.56V7.759l-6 2.572v6.912zm.09 1.05l1.664-.713A5.002 5.002 0 0022 16a5 5 0 00-4.5-4.975V7.659a1.5 1.5 0 00-.91-1.378l-2.893-1.24-3.106-1.332a1.5 1.5 0 00-1.182 0l-6 2.572A1.5 1.5 0 002.5 7.659v6.682c0 .6.358 1.142.91 1.378l6 2.572a1.5 1.5 0 001.18 0zM17 20a4 4 0 100-8 4 4 0 000 8zm.5-6.5a.5.5 0 00-1 0v2H15a.5.5 0 000 1h2a.5.5 0 00.5-.5v-2.5z"
														fill="#3F474D"></path></svg>
												<span class="text"><span class="date">5/22(수)<!-- -->
												</span>도착 예정</span>
												<svg class="information-icon" width="18" height="18"
													viewBox="0 0 18 18" fill="none"
													preserveAspectRatio="xMidYMid meet">
													<path
														d="M9 15.2C5.57583 15.2 2.8 12.4242 2.8 9C2.8 5.57583 5.57583 2.8 9 2.8C12.4242 2.8 15.2 5.57583 15.2 9C15.2 12.4242 12.4242 15.2 9 15.2ZM9 16.5C13.1421 16.5 16.5 13.1421 16.5 9C16.5 4.85786 13.1421 1.5 9 1.5C4.85786 1.5 1.5 4.85786 1.5 9C1.5 13.1421 4.85786 16.5 9 16.5Z"
														fill="#828C94"></path>
													<path d="M8.35 6.375V5.25H9.65V6.375H8.35Z" fill="#828C94"></path>
													<path d="M8.35 12.75V7.125H9.65V12.75H8.35Z" fill="#828C94"></path></svg>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<p class="addToCart">
						<label class="mb-2">총 금액</label><br>
						<button type="button">장바구니</button>
						<button type="button">바로구매</button>
					</p>
				</div>
			</div> 

			<section class="bg-light border-top py-4">
				<div class="container">
					<div class="row gx-4">
						<div class="col-lg-8 mb-4">
							<div class="border rounded-2 px-3 py-2 bg-white">

								<ul class="nav nav-pills nav-justified mb-3" id="ex1"
									role="tablist">
									<li class="nav-item d-flex" role="presentation"><a
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
										role="tabpanel" aria-labelledby="ex1-tab-1">
										<img src="/images/product_details/Design1.png"
											class="d-block w-100" alt="..."> <img
											src="/images/product_details/Design3.png"
											class="d-block w-100" alt="..."> <img
											src="/images/product_details/Design5.png"
											class="d-block w-100" alt="...">
									</div>
									<div class="tab-pane fade mb-2" id="ex1-pills-2"
										role="tabpanel" aria-labelledby="ex1-tab-2">상세리뷰</div>
									<div class="tab-pane fade mb-2" id="ex1-pills-3"
										role="tabpanel" aria-labelledby="ex1-tab-3">
										<section class="production-selling-section">
											<table class="production-selling-table">
												<tbody>		
												<%-- <tr>
														<th>상호명</th>
														<td>${productdetail.getV_BIZNAME()}</td>
													</tr>																	
													<tr>
														<th>사업자이름</th>
														<td>${productdetail.getM_NAME()}</td>
													</tr>	
													<tr>
														<th>사업장소재지</th>
														<td></td>
													</tr>
													<tr>
														<th>사업장전화번호</th>
														<td>${productdetail.getM_PHONE()}</td>
													</tr> 	
													<tr>
														<th>E-mail</th>
														<td>${productdetail.getM_EMAIL()}</td>
													</tr> 	 												 --%>
													<tr>
														<th>사업자 등록번호</th>
														<td>${productdetail.getV_LICENSE()}</td>
													</tr> 
												</tbody>
											</table>
										</section>
									</div>
								</div>
								<!-- Pills content -->
							</div>
						</div>
						<div class="col-lg-4">
							<div class="px-0 border rounded-2 shadow-0">
								<div class="card">
									<label class="mb-2">옵션선택</label> <select
										class="form-select border border-secondary"
										style="height: 35px;">
										<option>Small</option>
										<option>Medium</option>
										<option>Large</option>
									</select>
									<p class="addToCart">
										<label class="mb-2">총 금액</label><br>
										<button type="button">장바구니</button>
										<button type="button">바로구매</button>
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

	<!-- MDBootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>


</body>

</html>