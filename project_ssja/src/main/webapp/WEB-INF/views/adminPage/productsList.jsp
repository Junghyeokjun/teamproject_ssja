<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSJA</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<script src="/js/barscript_admin.js"></script>
<script src="/js/footer.js"></script>
<link href="/css/footerstyle.css?after" rel="stylesheet">
<link href="/css/barstyle_admin.css?after" rel="stylesheet">
<link href="/css/board.css?after" rel="stylesheet">
<link rel="stylesheet"
	href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">
<style>
/* 추가된 CSS 스타일 */
#productstable td {
	white-space: nowrap; /* 줄 바꿈 없이 한 줄에 표시 */
}

#productstable thead {
	font-weight: bold; /* 열 제목을 굵은 글꼴로 설정 */
}

#product_banner_img {
	height: 6rem;
	width: 7rem;
	border-radius: 4px;
}

#product_info_dv {
	margin-right: 0;
}

#item_info_div>span {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	width: 15rem;
	display: inline-block;
}

#product_title_a {
	cursor: pointer;
}
/* #product_table_body > tr:hover{
background-color:#eee;
cursor:pointer;
} */
</style>
</head>
<body>
	<header>
		<div id="title_bar" class=" fixed-top">
			<div class="py-2 px-1" id="top-bar">
				<button type="toggle-button" class="top_btn" id="top_btn"></button>
				<a id="logo_toHome" href=""><img id="logo_img"
					src="/images/utilities/logoSSJA.png"></a> <a id="user_link"
					href="/login" style="margin-left: auto;"><img id="login_img"></a>
			</div>
		</div>
		<nav id="total_bar"></nav>
	</header>
	<div id="side_bar">
		<div id="side_links" class="w-100"></div>
	</div>
	<div id="select_AdminPage" class="d-flex flex-column">
		<div id="select_mp_top" class="text-center">관리자</div>
		<div id="select_content">
			<button class="AdminPage_btn w-100" id="adminPage_Info_Select"
				style="border: 1px solid #cccccc"
				onclick="location.href='/adminPage'">SSJA 현황</button>
			<button class="AdminPage_btn w-100" id="adminPage_Info_Select"
				style="border: 1px solid #cccccc"
				onclick="location.href='/adminPage/membersList'">회원 목록</button>
			<button class="AdminPage_btn w-100" id="adminPage_Info_Select"
				style="border: 1px solid #cccccc"
				onclick="location.href='/adminPage/productsList'">상품 목록</button>
			<button class="AdminPage_btn w-100" id="adminPage_Info_Select"
				style="border: 1px solid #cccccc"
				onclick="location.href='/adminPage/purchasesList'">주문 목록</button>
			<button class="AdminPage_btn w-100" id="adminPage_Info_Select"
				style="border: 1px solid #cccccc"
				onclick="location.href='/adminPage/couponsList'">쿠폰 관리</button>
			<button class="AdminPage_btn w-100" id="adminPage_Info_Select"
				style="border: 1px solid #cccccc"
				onclick="location.href='/adminPage/notice'">공지사항 관리</button>
			<button class="AdminPage_btn w-100" id="adminPage_Info_Select"
				style="border: 1px solid #cccccc"
				onclick="location.href='/adminPage/qnasList'">고객 문의 목록</button>
			<button class="AdminPage_btn w-100" id="adminPage_Info_Select"
				style="border: 1px solid #cccccc"
				onclick="location.href='/adminPage/salesList'">매출 현황</button>
		</div>
	</div>
	<main>
		<div id="main_container"
			class="d-flex flex-row align-items-center justify-content-center">
			<div id="content_dv">
				<div id="AdminPage_content_name">
					<h2 id="AdminPageTitle">상품 목록</h2>
				</div>
				<br>
				<form name="products-search-form" autocomplete="off">
					<select name="type">
						<option selected value="">선택</option>
						<option value="PRO_NO">상품번호</option>
						<option value="PRO_BIZNAME">사업자이름</option>
					</select> <input type="text" name="keyword" value=""> <input
						type="button" onclick="productsSearchList()"
						class="btn btn-outline-dark mr-2" value="검색">
					<button type="button" class="btn btn-dark ms-auto"
						id="newProductBtn" >상품 등록</button>						
				</form>
				<div class="table-responsive">
					<table class="table" id="productstable" style="text-align: center;">
						<thead class="table">
							<tr>
								<td scope="col">상품번호</td>
								<td scope="col">상품</td>
								<td scope="col">가격</td>
								<td scope="col">수량</td>
								<td scope="col">위시 수</td>
								<td scope="col">판매 수</td>
							</tr>
						</thead>
						<tbody class="table-group-divider" id="product_table_body">
							<c:forEach var="product" items="${products}">
								<tr id="product_content_${product.getPRO_NO()}">
									<td class="p-3 py-5">${product.getPRO_NO()}</td>
									<td><a id="#product_title_a"
										href="/product_detail?PRO_NO=${product.getPRO_NO()}">
											<div class="d-flex flex-row py-2" id="product_info_dv">
												<img id="product_banner_img"
													src="${product.getPRO_BANNERIMG()}">
												<div id="item_info_div"
													class="d-flex flex-column align-items-start justify-content-center p-3">
													<span>${product.getPRO_BIZNAME()}</span> <span>${product.getPRO_NAME()}</span>
												</div>
											</div>
									</a></td>
									<td class="p-3 py-5">${product.getPRO_PRICE()}</td>
									<td class="p-3 py-5">${product.getPRO_QUANTITY()}</td>
									<td class="p-3 py-5">${product.getPRO_WISH()}</td>
									<td class="p-3 py-5">${product.getPRO_SELLCOUNT()}</td>
									<td class="p-3 py-5">
										<button type="button" class="btn btn-outline-dark"
											id="modifyProductBtn">수정</button>
										<button type="button" class="btn btn-outline-danger"
											id="deleteProductBtn">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="paging_dv">
						<nav aria-label="Page navigation example">
							<ul class="pagination ch-col justify-content-center">
								<c:if test="${productpageMaker.prev}">
									<li class="page-item"><a class="page-link ch-col"
										href="${pageContext.request.contextPath}/adminPage/productsList${productpageMaker.makeQuery(productpageMaker.startPage-1)}"><</a></li>
								</c:if>
								<c:forEach var="idx" begin="${productpageMaker.startPage}"
									end="${productpageMaker.endPage}">
									<c:choose>
										<c:when test="${productpageMaker.criteria.pageNum == idx}">
											<li class="page-item active"><a class="page-link"
												href="${pageContext.request.contextPath}/adminPage/productsList${productpageMaker.makeQuery(idx)}">${idx}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/adminPage/productsList${productpageMaker.makeQuery(idx)}">${idx}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if
									test="${productpageMaker.next && productpageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link ch-col"
										href="${pageContext.request.contextPath}/adminPage/productsList${productpageMaker.makeQuery(productpageMaker.endPage+1)}">></a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달 창 -->
		<div class="modal fade" id="editProductModal" tabindex="-1"
			role="dialog" aria-labelledby="editProductModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="editProductModalLabel">상품 수정</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="editProductForm">
							<div class="form-group">
								<label for="editPRO_NAME">상품이름</label> <input type="text"
									class="form-control" id="editPRO_NAME" name="editPRO_NAME">
							</div>
							<div class="form-group">
								<label for="editPRO_PRICE">가격</label> <input type="text"
									class="form-control" id="editPRO_PRICE" name="editPRO_PRICE">
							</div>
							<div class="form-group">
								<label for="editPRO_QUANTITY">수량</label> <input type="text"
									class="form-control" id="editPRO_QUANTITY"
									name="editPRO_QUANTITY">
							</div>
							<input type="hidden" id="editProductId" name="editProductId">
							<button type="submit" class="btn btn-primary">저장</button>
						</form>
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

	<sec:authorize access="isAuthenticated()">

		<sec:authorize access="hasRole('ROLE_VENDOR')">
			<input type="hidden" id="isVendorCheck" value="1">
		</sec:authorize>

		<script src="/js/login_user_tab.js">
			
		</script>
	</sec:authorize>
</body>
 <script>
        function redirectToWriteProductPage() {
            window.location.href = '/adminPage/product/write';
        }

        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('newProductBtn').addEventListener('click', redirectToWriteProductPage);
        });
    </script>
<script>
	$(document).ready(function() {
		$('body').on('click', '#modifyProductBtn', function() {
			var $btn = $(this); // 클릭된 버튼을 변수에 저장
			var $row = $btn.closest('tr'); // 클릭된 버튼의 부모 tr 요소 가져오기

			// 테이블에서 해당 열의 정보 가져오기
			var proId = $row.find('td:eq(0)').text();
			var proname = $row.find('#item_info_div span:eq(1)').text();
			var proprice = $row.find('td:eq(2)').text();
			var quantity = $row.find('td:eq(3)').text();

			// 모달 창에 정보 채우기
			$('#editProductModal').find('#editPRO_NAME').val(proname);
			$('#editProductModal').find('#editPRO_PRICE').val(proprice);
			$('#editProductModal').find('#editPRO_QUANTITY').val(quantity);
			$('#editProductModal').find('#editProductId').val(proId);

			// 모달 창 띄우기
			$('#editProductModal').modal('show');
		});
	});
</script>
<script>
	$(document)
			.ready(
					function() {
						$('#editProductForm')
								.submit(
										function() {

											var formData = {
												PRO_NO : $('#editProductId')
														.val(),
												PRO_NAME : $('#editPRO_NAME')
														.val(),
												PRO_PRICE : $('#editPRO_PRICE')
														.val(),
												PRO_QUANTITY : $(
														'#editPRO_QUANTITY')
														.val()
											};

											var csrfToken = $(
													'meta[name="_csrf"]').attr(
													'content'); // CSRF 토큰 가져오기
											var csrfHeader = $(
													'meta[name="_csrf_header"]')
													.attr('content'); // CSRF 헤더 이름 가져오기

											// AJAX를 이용한 문의 수정 요청
											$
													.ajax({
														type : 'POST',
														url : '/adminPage/modifyProduct',
														data : JSON
																.stringify(formData), // JSON 형식으로 데이터 전송
														contentType : 'application/json', // 요청 데이터 타입 지정
														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			csrfHeader,
																			csrfToken); // CSRF 토큰을 헤더에 포함
														},
														success : function(
																response) {
															console
																	.log('문의 수정 성공');
															// 모달 창 닫기
															$(
																	'#editProductModal')
																	.modal(
																			'hide');
															// 테이블에서 해당 행 업데이트
															var $row = $(
																	'#productstable')
																	.find(
																			'td:contains('
																					+ formData.PRO_NO
																					+ ')')
																	.closest(
																			'tr');
															$row
																	.find(
																			'#item_info_div span:eq(1)')
																	.text(
																			formData.PRO_NAME);
															$row
																	.find(
																			'td:eq(2)')
																	.text(
																			formData.PRO_PRICE);
															$row
																	.find(
																			'td:eq(3)')
																	.text(
																			formData.PRO_QUANTITY);
														},
														error : function(xhr,
																status, error) {
															console.error(
																	'상품 수정 오류',
																	error);
														}
													});
										});
					});
</script>
<script>
	$('body').on('click', '#deleteProductBtn', function() {
		var $row = $(this).closest('tr');
		var productId = $row.find('td:first').text();

		$.ajax({
			type : "POST",
			url : "/adminPage/removeProduct",
			data : JSON.stringify({
				PRO_NO : productId
			}),
			contentType : "application/json",
			success : function(response) {
				console.log('삭제 성공');
				$row.remove();
			},
			error : function(xhr, status, error) {
				console.error('삭제 오류', error);
			}
		});
	});
</script>
<script>
	function productsSearchList() {
		$.ajax({
			type : 'GET',
			url : "/adminPage/productsSearchList",
			data : $("form[name=products-search-form]").serialize(),
			success : function(result) {
				console.log(result);
				$('#productstable > tbody').empty();
				if (result.length >= 1) {
					$("#paging_dv").empty();
					result.forEach(function(product) {
						var str = '<tr>';
						str += "<td>" + product.pro_NO + "</td>";
						str += "<td>" + product.pro_NAME + "</td>";
						str += "<td>" + product.pro_PRICE + "</td>";
						str += "<td>" + product.pro_QUANTITY + "</td>";
						str += "<td>" + product.pro_WISH + "</td>";
						str += "<td>" + product.pro_SELLCOUNT + "</td>";
						str += "<td>" + product.pro_BIZNAME + "</td>";
						str += "</tr>";
						$('#productstable > tbody').append(str);
					});
				}
			}
		});
	}
</script>

</html>
