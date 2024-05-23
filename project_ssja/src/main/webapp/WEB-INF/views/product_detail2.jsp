<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSJA</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/js/barscript.js">
	
</script>
<script src="/js/footer.js">
	
</script>

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

.production-selling-navigation__container {
	display: flex;
	justify-content: center; /* 가로 중앙 정렬 */
	padding: 20px; /* 상하 패딩 (선택 사항) */
	background-color: #f8f8f8; /* 배경색 (선택 사항) */
}

.production-selling-navigation__list {
	display: flex;
	list-style-type: none; /* 기본 리스트 스타일 제거 */
	padding: 0; /* 기본 패딩 제거 */
	margin: 0; /* 기본 마진 제거 */
}

.production-selling-navigation__list li {
	margin-right: 20px; /* 리스트 항목 간의 간격 설정 */
}

.production-selling-navigation__list li:last-child {
	margin-right: 0; /* 마지막 항목의 오른쪽 마진 제거 */
}

.production-selling-navigation__list li a {
	text-decoration: none; /* 링크 밑줄 제거 */
	color: black; /* 링크 텍스트 색상 설정 */
}

.icon-hover:hover {
	border-color: #3b71ca !important;
	background-color: white !important;
	color: #3b71ca !important;
}

.icon-hover:hover i {
	color: #3b71ca !important;
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

			<section class="py-5">
				<div class="container">
					<div class="row gx-5">
						<aside class="col-lg-6">
							<div class="border rounded-4 mb-3 d-flex justify-content-center">
								<a data-fslightbox="mygalley" class="rounded-4" target="_blank"
									data-type="image"
									href="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big.webp">
									<img style="max-width: 100%; max-height: 100vh; margin: auto;"
									class="rounded-4 fit"
									src="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big.webp" />
								</a>
							</div>
							<div class="d-flex justify-content-center mb-3">
								<a data-fslightbox="mygalley" class="border mx-1 rounded-2"
									target="_blank" data-type="image"
									href="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big1.webp"
									class="item-thumb"> <img width="60" height="60"
									class="rounded-2"
									src="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big1.webp" />
								</a> <a data-fslightbox="mygalley" class="border mx-1 rounded-2"
									target="_blank" data-type="image"
									href="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big2.webp"
									class="item-thumb"> <img width="60" height="60"
									class="rounded-2"
									src="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big2.webp" />
								</a> <a data-fslightbox="mygalley" class="border mx-1 rounded-2"
									target="_blank" data-type="image"
									href="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big3.webp"
									class="item-thumb"> <img width="60" height="60"
									class="rounded-2"
									src="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big3.webp" />
								</a> <a data-fslightbox="mygalley" class="border mx-1 rounded-2"
									target="_blank" data-type="image"
									href="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big4.webp"
									class="item-thumb"> <img width="60" height="60"
									class="rounded-2"
									src="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big4.webp" />
								</a> <a data-fslightbox="mygalley" class="border mx-1 rounded-2"
									target="_blank" data-type="image"
									href="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big.webp"
									class="item-thumb"> <img width="60" height="60"
									class="rounded-2"
									src="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big.webp" />
								</a>
							</div>
							<!-- thumbs-wrap.// -->
							<!-- gallery-wrap .end// -->
						</aside>
						<main class="col-lg-6">
							<div class="ps-lg-3">
								<h4 class="title text-dark">
									${product_detail.PRO_NAME}
								</h4>
								<div class="d-flex flex-row my-3">
									<div class="text-warning mb-1 me-2">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fas fa-star-half-alt"></i> <span class="ms-1">
											4.5 </span>
									</div>
									<span class="text-muted"><i
										class="fas fa-shopping-basket fa-sm mx-1"></i></span>
								</div>

								<div class="mb-3">
									<span class="h5">${product_detail.PRO_PRICE}</span> 
								</div>

								<p>Modern look and quality demo item is a
									streetwear-inspired collection that continues to break away
									from the conventions of mainstream fashion. Made in Italy,
									these black and brown clothing low-top shirts for men.</p>

								<div class="row">
									<dt class="col-3">Type:</dt>
									<dd class="col-9">Regular</dd>

									<dt class="col-3">Color</dt>
									<dd class="col-9">Brown</dd>

									<dt class="col-3">Material</dt>
									<dd class="col-9">Cotton, Jeans</dd>

									<dt class="col-3">Brand</dt>
									<dd class="col-9">Reebook</dd>
								</div>

								<hr />

								<div class="row mb-4">
									<div class="col-md-4 col-6">
										<label class="mb-2">Size</label> ` <select
											class="form-select border border-secondary"
											style="height: 35px;">
											<option>Small</option>
											<option>Medium</option>
											<option>Large</option>
										</select>
									</div>
									<!-- col.// -->
									<div class="col-md-4 col-6 mb-3">
										<label class="mb-2 d-block">Quantity</label>
										<div class="input-group mb-3" style="width: 170px;">
											<button class="btn btn-white border border-secondary px-3"
												type="button" id="button-addon1"
												data-mdb-ripple-color="dark">
												<i class="fas fa-minus"></i>
											</button>
											<input type="text"
												class="form-control text-center border border-secondary"
												placeholder="14" aria-label="Example text with button addon"
												aria-describedby="button-addon1" />
											<button class="btn btn-white border border-secondary px-3"
												type="button" id="button-addon2"
												data-mdb-ripple-color="dark">
												<i class="fas fa-plus"></i>
											</button>
										</div>
									</div>
								</div>
								<p class="addToCart">
									<button type="button">장바구니</button>
									<button type="button">바로구매</button>
								</p>
							</div>
						</main>
					</div>
				</div>
			</section>
			<!-- content -->

			<section class="bg-light border-top py-4">
				<div class="container">
					<div class="row gx-4">
						<div class="col-lg-8 mb-4">
							<div class="border rounded-2 px-3 py-2 bg-white">
								<!-- Pills navs -->
								<ul class="nav nav-pills nav-justified mb-3" id="ex1"
									role="tablist">
									<li class="nav-item d-flex" role="presentation"><a
										class="nav-link d-flex align-items-center justify-content-center w-100 active"
										id="ex1-tab-1" data-mdb-toggle="pill" href="#ex1-pills-1"
										role="tab" aria-controls="ex1-pills-1" aria-selected="true">상품정보</a>
									</li>
									<li class="nav-item d-flex" role="presentation"><a
										class="nav-link d-flex align-items-center justify-content-center w-100"
										id="ex1-tab-2" data-mdb-toggle="pill" href="#ex1-pills-2"
										role="tab" aria-controls="ex1-pills-2" aria-selected="false">리뷰</a></li>
									<li class="nav-item d-flex" role="presentation"><a
										class="nav-link d-flex align-items-center justify-content-center w-100"
										id="ex1-tab-3" data-mdb-toggle="pill" href="#ex1-pills-3"
										role="tab" aria-controls="ex1-pills-3" aria-selected="false">사업자정보</a></li>
								</ul>
								<!-- Pills navs -->

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
													<tr>
														<th>상호</th>
														<td>(주)세이프인터내셔널</td>
													</tr>
													<tr>
														<th>대표자</th>
														<td>이정식</td>
													</tr>
													<tr>
														<th>사업장소재지</th>
														<td>경기 김포시 대곶면 초원로16번길 217-74 세이프인터내셔널</td>
													</tr>
													<tr>
														<th>고객센터 전화번호</th>
														<td>070-8899-7758</td>
													</tr>
													<tr>
														<th>E-mail</th>
														<td>shape-ok@hanmail.net</td>
													</tr>
													<tr>
														<th>사업자 등록번호</th>
														<td>105-86-64282</td>
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
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<!-- Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- MDBootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>


</body>

</html>