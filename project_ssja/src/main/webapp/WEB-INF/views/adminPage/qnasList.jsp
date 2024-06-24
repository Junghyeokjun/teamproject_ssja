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
	crossorigin="anonymous">
	
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    #qnastable td {
        white-space: nowrap; /* 줄 바꿈 없이 한 줄에 표시 */
    }
    
    #qnastable thead {
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
					<h2 id="AdminPageTitle">문의 목록</h2>
				</div>
				<br>
			  <form name="qnas-search-form" autocomplete="off">
					<select name="type">
						<option selected value="">선택</option>
						<option value="M_NO">회원번호</option>
						<option value="B_TITLE">제목</option>
						<option value="B_CONTENT">내용</option>						
					</select> <input type="text" name="keyword" value=""> <input
						type="button" onclick="qnasSearchList()"
						class="btn btn-outline-dark mr-2" value="검색">
				</form>  
				<div class="table-responsive">
					<table class="table" id="qnastable"
						style="text-align: center;">
						<thead>
							<tr>
								<td scope="col">회원번호</td>
								<td scope="col">작성자</td>
								<td scope="col">제목</td>
								<td scope="col">내용</td>
								<td scope="col">날짜</td>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<c:forEach var="qna" items="${qnas}">
								<tr>
									<td>${qna.getM_NO()}</td>
									<td>${qna.getB_WRITER()}</td>
									<td>${qna.getB_TITLE()}</td>
									<td>${qna.getB_CONTENT()}</td>
									<td>${qna.getB_DATE()}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="paging_dv">
						<nav aria-label="Page navigation example">
							<ul class="pagination ch-col justify-content-center">
								<c:if test="${qnapageMaker.prev}">
									<li class="page-item"><a class="page-link ch-col"
										href="${pageContext.request.contextPath}/adminPage/qnasList${qnapageMaker.makeQuery(qnapageMaker.startPage-1)}"><</a></li>
								</c:if>
								<c:forEach var="idx" begin="${qnapageMaker.startPage}"
									end="${qnapageMaker.endPage}">
									<c:choose>
										<c:when test="${qnapageMaker.criteria.pageNum == idx}">
											<li class="page-item active"><a class="page-link"
												href="${pageContext.request.contextPath}/adminPage/qnasList${qnapageMaker.makeQuery(idx)}">${idx}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/adminPage/qnasList${qnapageMaker.makeQuery(idx)}">${idx}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if
									test="${qnapageMaker.next && qnapageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link ch-col"
										href="${pageContext.request.contextPath}/adminPage/qnasList${qnapageMaker.makeQuery(qnapageMaker.endPage+1)}">></a></li>
								</c:if>
							</ul>
						</nav>
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
</body>
 <script>
	function qnasSearchList() {
		$.ajax({
			type : 'GET',
			url : "/adminPage/qnasSearchList",
			data : $("form[name=qnas-search-form]").serialize(),
			success : function(result) {
				console.log(result);
				$('#qnastable > tbody').empty();
				if (result.length >= 1) {
					$("#paging_dv").empty();
					result.forEach(function(qna) {
						var str = '<tr>';
						str += "<td>" + qna.m_NO + "</td>";
						str += "<td>" + qna.b_WRITER + "</td>";
						str += "<td>" + qna.b_TITLE + "</td>";
						str += "<td>" + qna.b_CONTENT + "</td>";
						str += "<td>" + qna.b_DATE + "</td>";
						str += "</tr>";
						$('#qnastable > tbody').append(str);
					});
				}
			}
		});
	}
</script> 
</html>
