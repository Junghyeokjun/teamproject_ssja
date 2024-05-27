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

<script src="/js/barscript.js">
	
</script>

<script src="/js/footer.js">
	
</script>
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

#logo_img {
	width: 3.5em;
	height: 3em;
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
						<span>수량</span> <input type="number" id="quantity" min="1"
							max="${productdetail.PRO_QUANTITY}" value="1" />
					</p>
					<hr>
					<p class="addToCart">
						<label class="mb-2">총 금액</label><br> <span id="totalPrice">
							<fmt:formatNumber pattern="###,###,###"
								value="${productdetail.PRO_PRICE}" /> 원
						</span><br>
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
									<!-- 리뷰 구현 -->
									<div class="tab-pane fade mb-2" id="ex1-pills-2"
										role="tabpanel" aria-labelledby="ex1-tab-2">
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
												<div class="user-comment">
													${productdetailreply.getB_CONTENT()}</div>
												<hr>
											</c:forEach>
										</div>
<nav aria-label="Page navigation example ">
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link"
					href="list2${pageMaker.makeQuery(pageMaker.startPage - 1) }"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<c:forEach var="idx" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="page-item"><a class="page-link"
					href="list2${pageMaker.makeQuery(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item"><a class="page-link"
					href="list2${pageMaker.makeQuery(pageMaker.endPage + 1) }"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</nav>
										
										 
										
									</div>
									
									<div class="tab-pane fade mb-2" id="ex1-pills-3"
										role="tabpanel" aria-labelledby="ex1-tab-3">
										<section class="production-selling-section">
											<table class="production-selling-table ">
												<tbody>
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
								<div class="card">
									<p class="addToCart">
										<label class="mb-2">총 금액</label><br> <span
											id="totalPrice"> <fmt:formatNumber
												pattern="###,###,###" value="${productdetail.PRO_PRICE}" />
											원
										</span><br>
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
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const priceElement = document.querySelector(".gdsPrice span");
			const quantityInput = document.getElementById("quantity");
			const totalPriceElement = document.getElementById("totalPrice");

			// 상품 가격을 가져오기
			const productPrice = parseFloat(priceElement.textContent.replace(
					/[^\d]/g, ''));

			// 수량이 변경될 때 총 금액을 계산하는 함수
			function updateTotalPrice() {
				const quantity = parseInt(quantityInput.value);
				const totalPrice = productPrice * quantity;
				totalPriceElement.textContent = totalPrice.toLocaleString()
						+ " 원";
			}

			// 수량 입력 값이 변경될 때마다 총 금액 업데이트
			quantityInput.addEventListener("input", updateTotalPrice);

			// 페이지 로드 시 초기 총 금액 설정
			updateTotalPrice();
		});
	</script>
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/0fa31147fa.js"
		crossorigin="anonymous"></script>
	<script>
    // 현재 페이지의 정보
    var currentPage = ${pageMaker.criteria.getPageNum()}; 

    // 각 페이지 링크를 확인하고 활성화/비활성화를 결정하는 함수
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
</script>

</body>
</html>