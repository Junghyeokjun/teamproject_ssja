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
</style>
</head>
<body>
	<header>
		<div id="title_bar" class=" fixed-top">
			<div class="py-2 px-1" id="top-bar">
				<button type="toggle-button" class="top_btn" id="top_btn"></button>
				<a id="logo_toHome" href=""><img id="logo_img"
					src="/images/utilities/logoSSJA.png"></a>
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
				</form>
				<div class="table-responsive">
					<table class="table" id="productstable" style="text-align: center;">
						<thead class="table">
							<tr>
								<td scope="col">상품번호</td>
								<td scope="col">상품이름</td>
								<td scope="col">가격</td>
								<td scope="col">수량</td>
								<td scope="col">위시 수</td>
								<td scope="col">판매 수</td>
								<td scope="col">사업자이름</td>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<c:forEach var="product" items="${products}">
								<tr>
									<td>${product.getPRO_NO()}</td>
									<td>${product.getPRO_NAME()}</td>
									<td>${product.getPRO_PRICE()}</td>
									<td>${product.getPRO_QUANTITY()}</td>
									<td>${product.getPRO_WISH()}</td>
									<td>${product.getPRO_SELLCOUNT()}</td>
									<td>${product.getPRO_BIZNAME()}</td>
									<td>
										<button type="button" class="btn btn-outline-success"
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
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">상품 수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 상품 정보 수정 폼 -->
                <form id="editForm">
                    <div class="form-group">
                        <label for="editProductName">상품 이름</label>
                        <input type="text" class="form-control" id="editProductName" name="editProductName">
                    </div>
                    <div class="form-group">
                        <label for="editProductPrice">가격</label>
                        <input type="number" class="form-control" id="editProductPrice" name="editProductPrice">
                    </div>
                    <div class="form-group">
                        <label for="editProductQuantity">수량</label>
                        <input type="number" class="form-control" id="editProductQuantity" name="editProductQuantity">
                    </div>
                    <div class="form-group">
                        <label for="editBusinessName">사업자 이름</label>
                        <input type="text" class="form-control" id="editBusinessName" name="editBusinessName">
                    </div>
                    <input type="hidden" id="editProductId" name="editProductId">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" onclick="saveChanges()">저장</button>
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function() {
    // 수정 버튼 클릭 시
    $('#productstable').on('click', '#modifyProductBtn', function() {
        // 선택한 행에서 상품 정보를 가져와 모달에 채움
        var row = $(this).closest('tr');
        var productId = row.find('td:eq(0)').text(); // 상품 번호
        var productName = row.find('td:eq(1)').text(); // 상품 이름
        var productPrice = row.find('td:eq(2)').text(); // 가격
        var productQuantity = row.find('td:eq(3)').text(); // 수량
        var businessName = row.find('td:eq(6)').text(); // 사업자 이름

        // 모달에 값 채우기
        $('#editProductId').val(productId);
        $('#editProductName').val(productName);
        $('#editProductPrice').val(productPrice);
        $('#editProductQuantity').val(productQuantity);
        $('#editBusinessName').val(businessName);

        // 모달 띄우기
        $('#editModal').modal('show');
    });

    // 저장 버튼 클릭 시
    $('#editModal').on('click', '#saveChangesBtn', function() {
        // 수정된 상품 정보를 서버로 전송하는 함수 호출
        saveChanges();
    });
});

function saveChanges() {
    // 수정된 정보를 가져와 서버로 전송하는 로직 구현
    var editedProductId = $('#editProductId').val();
    var editedProductName = $('#editProductName').val();
    var editedProductPrice = $('#editProductPrice').val();
    var editedProductQuantity = $('#editProductQuantity').val();
    var editedBusinessName = $('#editBusinessName').val();

    // AJAX를 사용하여 서버로 데이터 전송
    $.ajax({
        type: 'POST',
        url: '/adminPage/modifyProducts', // 수정된 정보를 처리할 서버의 URL
        contentType: 'application/json', // 요청의 데이터 타입 지정
        data: JSON.stringify({
            productId: editedProductId,
            productName: editedProductName,
            productPrice: editedProductPrice,
            productQuantity: editedProductQuantity,
            businessName: editedBusinessName
        }),
        success: function(response) {
            // 서버로부터의 응답 처리
            console.log('수정이 성공적으로 처리되었습니다.');
            $('#editModal').modal('hide'); // 모달 닫기
            location.reload(); // 현재 페이지 새로고침
        },
        error: function(xhr, status, error) {
            // 오류 처리
            console.error('수정 중 오류가 발생했습니다: ' + error);
        }
    });
}



</script>
	</main>
	<footer>
		<div id="first_footer" class="p-3"></div>
		<div id="second_footer"></div>
		<div id="third_footer"></div>
	</footer>
</body>
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
