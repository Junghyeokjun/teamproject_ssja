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
<script src="/js/barscript.js"></script>
<script src="/js/footer.js"></script>
<link href="/css/footerstyle.css?after" rel="stylesheet">
<link href="/css/barstyle_admin.css?after" rel="stylesheet">
<link href="/css/board.css?after" rel="stylesheet">
<link rel="stylesheet"
	href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">
<style>
/* 추가된 CSS 스타일 */
#memberstable td {
	white-space: nowrap; /* 줄 바꿈 없이 한 줄에 표시 */
}

#memberstable thead {
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
					<h2 id="AdminPageTitle">회원목록</h2>
				</div>
				<br>
				<form name="members-search-form" autocomplete="off">
					<select name="type">
						<option selected value="">선택</option>
						<option value="m_name">회원이름</option>
						<option value="m_id">아이디</option>
						<option value="m_grade">등급</option>
					</select> <input type="text" name="keyword" value="">
					 <input type="button" onclick="membersSearchList()"
						class="btn btn-outline-dark mr-2" value="검색">
				</form>
				<div class="table-responsive">
					<table class="table" id="memberstable" style="text-align: center;">
						<thead>
							<tr>
								<td scope="col">회원번호</td>
								<td scope="col">아이디</td>
								<td scope="col">이름</td>
								<td scope="col">주소</td>
								<td scope="col">생일</td>
								<td scope="col">등급</td>
								<td scope="col">이메일</td>
								<td scope="col">휴대폰번호</td>
								<td scope="col">포인트</td>
								<td scope="col">닉네임</td>
								<td scope="col"></td>								
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<c:forEach var="member" items="${members}">
								<tr>
									<td>${member.m_NO}</td>
									<td>${member.m_ID}</td>
									<td>${member.m_NAME}</td>
									<td>${member.m_ADDRESS1}</td>
									<td><fmt:formatDate value="${member.m_BIRTH}"
											pattern="yyyy-MM-dd" /></td>
									<td>${member.m_GRADE}</td>
									<td>${member.m_EMAIL}</td>
									<td>${member.m_PHONE}</td>
									<td>${member.m_POINT}</td>
									<td>${member.m_NICKNAME}</td>
									<td><button type="button" class="btn btn-outline-success"
											id="modifyMemberBtn">수정</button>
										<button type="button" class="btn btn-outline-danger"
											id="deleteMemberBtn">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="paging_dv">
						<nav aria-label="Page navigation example">
							<ul class="pagination ch-col justify-content-center">
								<c:if test="${memberpageMaker.prev}">
									<li class="page-item"><a class="page-link ch-col"
										href="${pageContext.request.contextPath}/adminPage/membersList${memberpageMaker.makeQuery(memberpageMaker.startPage-1)}"><</a></li>
								</c:if>
								<c:forEach var="idx" begin="${memberpageMaker.startPage}"
									end="${memberpageMaker.endPage}">
									<c:choose>
										<c:when test="${memberpageMaker.criteria.pageNum == idx}">
											<li class="page-item active"><a class="page-link"
												href="${pageContext.request.contextPath}/adminPage/membersList${memberpageMaker.makeQuery(idx)}">${idx}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/adminPage/membersList${memberpageMaker.makeQuery(idx)}">${idx}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if
									test="${memberpageMaker.next && memberpageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link ch-col"
										href="${pageContext.request.contextPath}/adminPage/membersList${memberpageMaker.makeQuery(memberpageMaker.endPage+1)}">></a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script>
		$(document).ready(
				function() {
					/* // 신규 쿠폰 발급 버튼 클릭 시 모달 띄우기
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
							type : "POST",
							url : $(this).attr('action'), // 폼의 action 속성 값 가져오기
							data : formData,
							success : function(response) {
								// 성공적으로 처리된 경우, 원하는 동작 수행
								console.log('쿠폰 발급 성공');
								// 여기에 필요한 추가 동작 구현
							},
							error : function(xhr, status, error) {
								// 오류 발생 시 처리
								console.error('쿠폰 발급 오류:', error);
								// 오류 처리 로직 추가
							}
						});

						// 모달 닫기
						$('#newCouponModal').modal('hide');
					});

					// 쿠폰 수정 버튼 클릭 시 모달 띄우기
					$('body').on(
							'click',
							'#modifyCouponBtn',
							function() {
								var couponId = $(this).closest('tr').find(
										'td:first').text(); // 쿠폰 ID 가져오기

								// AJAX를 통해 쿠폰 정보 가져오기
								$.ajax({
									type : "GET",
									url : "/adminPage/modifyCoupon",
									data : {
										c_no : couponId
									},
									success : function(response) {
										// 가져온 쿠폰 정보를 모달 폼에 채워 넣기
										$('#editCouponId').val(response.c_no);
										$('#editCouponName').val(
												response.c_name);
										$('#editDiscountPercentage').val(
												response.c_dcper);

										// 날짜 포맷 변경 (yyyy-MM-dd)
										var startDate = new Date(
												response.c_startdate);
										var dueDate = new Date(
												response.c_duedate);
										$('#editStartDate').val(
												startDate.toISOString().slice(
														0, 10));
										$('#editDueDate').val(
												dueDate.toISOString().slice(0,
														10));

										// 모달 띄우기
										$('#editCouponModal').modal('show');
									},
									error : function(xhr, status, error) {
										console.error('쿠폰 정보 가져오기 오류:', error);
										// 오류 처리 로직 추가
									}
								});
							});

					$('#editCouponForm').submit(
							function(event) {
								event.preventDefault(); // 폼 기본 동작 방지

								// 폼 데이터 직렬화
								var formData = $(this).serialize();

								// 직렬화된 데이터에서 날짜 필드를 ISO 포맷으로 변환
								formData = formData.replace(
										/(\d{4})-(\d{2})-(\d{2})/g, function(
												match, year, month, day) {
											return year
													+ '-'
													+ month
													+ '-'
													+ (parseInt(day) < 10 ? '0'
															+ day : day);
										});

								// AJAX를 사용하여 서버로 데이터 전송
								$.ajax({
									type : "POST",
									url : $(this).attr('action'),
									data : formData,
									success : function(response) {
										// 성공적으로 처리된 경우, 원하는 동작 수행
										console.log('쿠폰 수정 성공');
										// 여기에 필요한 추가 동작 구현
									},
									error : function(xhr, status, error) {
										// 오류 발생 시 처리
										console.error('쿠폰 수정 오류:', error);
										// 오류 처리 로직 추가
									}
								});

								// 모달 닫기
								$('#editCouponModal').modal('hide');
							}); */

					// 쿠폰 삭제 버튼 클릭 시
					$('body').on(
							'click',
							'#deleteMemberBtn',
							function() {
								var couponId = $(this).closest('tr').find(
										'td:first').text(); // 테이블에서 쿠폰 ID 가져오기

								// AJAX를 이용한 쿠폰 삭제 요청
								$.ajax({
									type : "POST",
									url : "/adminPage/removeMember",
									data : JSON.stringify({
										c_no : couponId
									}), // JSON 형식으로 데이터 전송
									contentType : "application/json", // 요청 데이터 타입 지정
									success : function(response) {
										console.log('쿠폰 삭제 성공');
										// 삭제 성공 시 추가적인 작업 수행 (예: 테이블에서 해당 행 삭제)
										$(this).closest('tr').remove(); // 예시로 테이블에서 삭제된 행 제거
									},
									error : function(xhr, status, error) {
										console.error('쿠폰 삭제 오류', error);
										// 오류 처리 로직 추가
									}
								});
							});
				});
	</script>
	<footer>
		<div id="first_footer" class="p-3"></div>
		<div id="second_footer"></div>
		<div id="third_footer"></div>
	</footer>
</body>
<script>
	function membersSearchList() {
		$.ajax({
			type : 'GET',
			url : "/adminPage/membersSearchList",
			data : $("form[name=members-search-form]").serialize(),
			success : function(result) {
				console.log(result);
				$('#memberstable > tbody').empty();
				if (result.length >= 1) {
					$("#paging_dv").empty();
					result.forEach(function(member) {
						var str = '<tr>';
						str += "<td>" + member.m_NO + "</td>";
						str += "<td>" + member.m_ID + "</td>";
						str += "<td>" + member.m_NAME + "</td>";
						str += "<td>" + member.m_ADDRESS1 + "</td>";
						str += "<td>" + member.m_BIRTH + "</td>";
						str += "<td>" + member.m_GRADE + "</td>";
						str += "<td>" + member.m_EMAIL + "</td>";
						str += "<td>" + member.m_PHONE + "</td>";
						str += "<td>" + member.m_POINT + "</td>";
						str += "<td>" + member.m_NICKNAME + "</td>";
						str += "</tr>";
						$('#memberstable > tbody').append(str);
					});
				}
			}
		});
	}
</script>
</html>
