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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<script src="/js/barscript_admin.js"></script>
<script src="/js/footer.js"></script>
<link href="/css/footerstyle.css?after" rel="stylesheet">
<link href="/css/barstyle.css?after" rel="stylesheet">
<link href="/css/board.css?after" rel="stylesheet">
<link rel="stylesheet"
	href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">
<style>
@font-face {
	font-family: 'fonts';
	src: url("https://webfontworld.github.io/NanumSquare/NanumSquare.css")
		format('font1');
}

body {
	font-family: 'fonts', NanumSquare;
	background-color: #f7f0e8;
}

#logo_img {
	width: 3.5em;
	height: 3em;
}

.MyPage_btn {
	background-color: white;
	padding: 20px;
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

#icon_div  img {
	width: 40%;
	text-align: center;
}

#icon_div {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

#icon_container {
	padding: 1.5em;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

#icn_txt {
	text-align: center;
}

#event_banners {
	width: 100% auto;
	height: 30em;
}

#title_best_conner  button {
	width: 3em;
	background-color: white;
	border: none;
	font-size: 2.5em;
	color: #aaa;
}

#title_best_conner  button:hover {
	color: #333;
}

#title_best_conner {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
}

#show_more_bestItem {
	background-color: white;
	with: 100%;
	border: 1px solid #ddd;
	height: 5em;
}


h2, h4, p {
	display: inline;
	margin: 0;
	margin-right: 10px;
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
	<main>
		<div id="main_container"
			class="d-flex flex-row align-items-center justify-content-center">
			<div id="content_dv_membersInfo">
			<br>
				<h2>쿠폰관리</h2>
				<button type="button" class="btn btn-dark" id="newCouponBtn">신규 쿠폰 발급</button>
				<br>
				<br>
				<br>
				<h4>쿠폰 현황</h4>
				<p>현재 사용가능한 쿠폰을 조회합니다.</p>
				<table class="table"  style="text-align: center;">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">쿠폰 이름</th>
							<th scope="col">할인율</th>
							<th scope="col">사용기간</th>					
						</tr>
					</thead>
					<tbody class="table-group-divider">
					<c:forEach var="coupon" items="${coupons}">
						<tr>
							<td>${coupon.c_no}</td>
							<td>${coupon.c_name}</td>
							<td>${coupon.c_dcper}%</td>
							<td>
							<fmt:formatDate value="${coupon.c_startdate}" pattern="yyyy-MM-dd"/>~
							<fmt:formatDate value="${coupon.c_duedate}" pattern="yyyy-MM-dd"/>														
							 </td>
						</tr>	
						</c:forEach>					
					</tbody>
				</table>
				<div id="paging_dv">
					<nav aria-label="Page navigation example">
						<ul class="pagination ch-col justify-content-center">
							<c:if test="${couponpageMaker.prev}">
								<li class="page-item"><a class="page-link ch-col"
									href="${pageContext.request.contextPath}/adminPage/couponsList${couponpageMaker.makeQuery(couponpageMaker.startPage-1)}"><</a></li>
							</c:if>
							<c:forEach var="idx" begin="${couponpageMaker.startPage}"
								end="${couponpageMaker.endPage}">
								<c:choose>
									<c:when test="${couponpageMaker.criteria.pageNum == idx}">
										<li class="page-item active"><a class="page-link"
											href="${pageContext.request.contextPath}/adminPage/couponsList${couponpageMaker.makeQuery(idx)}">${idx}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/adminPage/couponsList${couponpageMaker.makeQuery(idx)}">${idx}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if
								test="${couponpageMaker.next && couponpageMaker.endPage > 0}">
								<li class="page-item"><a class="page-link ch-col"
									href="${pageContext.request.contextPath}/adminPage/couponsList${couponpageMaker.makeQuery(couponpageMaker.endPage+1)}">></a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</main>
	<!-- Bootstrap 모달 -->
<div class="modal fade" id="newCouponModal" tabindex="-1" aria-labelledby="newCouponModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newCouponModalLabel">신규 쿠폰 발급</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 쿠폰 발급 폼이 들어갈 곳 -->
                <form id="newCouponForm" action="${pageContext.request.contextPath}/adminPage/write"  method="post">
                    <div class="mb-3">
                        <label for="couponName" class="form-label">쿠폰 이름</label>
                        <input type="text" class="form-control" id="couponName" name="c_name">
                    </div>
                    <div class="mb-3">
                        <label for="discountPercentage" class="form-label">할인율 (%)</label>
                        <input type="number" class="form-control" id="discountPercentage" name="c_dcper">
                    </div>
                    <div class="mb-3">
                        <label for="startDate" class="form-label">시작일</label>
                        <input type="date" class="form-control" id="startDate" name="c_startdate">
                    </div>
                    <div class="mb-3">
                        <label for="dueDate" class="form-label">만료일</label>
                        <input type="date" class="form-control" id="dueDate" name="c_duedate">
                    </div>
                    <button type="submit" class="btn btn-dark">쿠폰 발급</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        // 신규 쿠폰 발급 버튼 클릭 시 모달 띄우기
        $('#newCouponBtn').click(function() {
            $('#newCouponModal').modal('show');
        });

        // 쿠폰 발급 폼 제출 처리
        $('#newCouponForm').submit(function(event) {
            event.preventDefault(); // 폼 기본 동작 방지

            // 폼 데이터 직렬화
            var formData = $(this).serialize();

            // AJAX를 사용하여 서버로 데이터 전송
            $.ajax({
                type: "POST",
                url: $(this).attr('action'), // 폼의 action 속성 값 가져오기
                data: formData,
                success: function(response) {
                    // 성공적으로 처리된 경우, 원하는 동작 수행
                    console.log('쿠폰 발급 성공');
                    // 여기에 필요한 추가 동작 구현
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 처리
                    console.error('쿠폰 발급 오류:', error);
                    // 오류 처리 로직 추가
                }
            });

            // 모달 닫기
            $('#newCouponModal').modal('hide');
        });
    });
</script>

	<footer>
		<div id="first_footer" class="p-3"></div>
		<div id="second_footer"></div>
		<div id="third_footer"></div>
	</footer>
</body>
</html>
