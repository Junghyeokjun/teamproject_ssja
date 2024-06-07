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
<script src="/js/barscript.js"></script>
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
</style>
</head>
<body>
<header>
		<div id="title_bar" class=" fixed-top">
			<div class="py-2 px-1" id="top-bar">
				<a id="logo_toHome" href=""><img id="logo_img"
					src="/images/utilities/logoSSJA.png"></a>
				<form action="http://www.naver.com" id=searchForm method="get">
				</form>
				<button id="search_icon"></button>
				<a id="user_link"><img id="login_img"></a>
			</div>
		</div>
		<nav id="total_bar">
			<div id="home_user_bar"></div>
			<div id="sub_bar"></div>
		</nav>
	</header>
	<div id="select_MyPage" class="d-flex flex-column">
		<div id="select_mp_top" class="text-center">관리자 메뉴</div>
		<div id="select_content">
			<button class="MyPage_btn w-100" id="adminPage_membersInfo_Select"
				style="border: 1px solid #cccccc">회원목록</button>
			<button class="MyPage_btn w-100" id="adminPage_productsInfo_Select"
				style="border: 1px solid #cccccc">상품목록</button>
			<button class="MyPage_btn w-100" id="adminPage_purchasesInfo_Select" style="border: 1px solid #cccccc">주문목록</button>
			<button class="MyPage_btn w-100" style="border: 1px solid #cccccc">쿠폰관리</button>
			<button class="MyPage_btn w-100" style="border: 1px solid #cccccc">게시판관리</button>
			<button class="MyPage_btn w-100" style="border: 1px solid #cccccc">이벤트관리</button>
			<button class="MyPage_btn w-100" style="border: 1px solid #cccccc">매출</button>
		</div>
	</div>

	<main>
		<div id="main_container"
			class="d-flex flex-row align-items-center justify-content-center">
			 <div id="content_dv_productsInfo" >
				<h2>상품목록</h2>
				<table class="table" style="text-align: center;">
					<thead class="table-dark">
						<tr>
							<td>상품번호</td>
							<td>상품이름</td>
							<td>가격</td>
							<td>수량</td>
							<td>위시 수</td>
							<td>판매 수</td>
							<td>사업자이름</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${products}">
							<tr>
								<td>${product.getPRO_NO()}</td>
								<td>${product.getPRO_NAME()}</td>
								<td>${product.getPRO_PRICE()}</td>
								<td>${product.getPRO_QUANTITY()}</td>
								<td>${product.getPRO_WISH()}</td>
								<td>${product.getPRO_SELLCOUNT()}</td>
								<td>${product.getPRO_BIZNAME()}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<form name="products-search-form" autocomplete="off">
					<select name="type">
						<option selected value="">선택</option>
						<option value="PRO_NO">상품번호</option>					
					</select> <input type="text" name="keyword" value=""> <input
						type="button" onclick="productsSearchList()"
						class="btn btn-outline-primary mr-2" value="검색">
				</form>
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
							<c:if test="${productpageMaker.next && productpageMaker.endPage > 0}">
								<li class="page-item"><a class="page-link ch-col"
									href="${pageContext.request.contextPath}/adminPage/productsList${productpageMaker.makeQuery(productpageMaker.endPage+1)}">></a></li>
							</c:if>
						</ul>
					</nav>
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
document.addEventListener("DOMContentLoaded", function() {
    // select_content div 내의 모든 버튼을 가져옵니다.
    var buttons = document.querySelectorAll('#select_content button');
    
    // 각 버튼에 클릭 이벤트를 추가합니다.
    buttons.forEach(function(button) {
        button.addEventListener('click', function() {
            // 클릭한 버튼의 ID를 가져옵니다.
            var buttonId = button.getAttribute('id');

            // 모든 콘텐츠 div를 숨깁니다.
            var contentDivs = document.querySelectorAll('#main_container > div');
            contentDivs.forEach(function(div) {
                div.style.display = 'none';
            });

            // 클릭한 버튼에 대응하는 콘텐츠 div를 표시합니다.
            if (buttonId === 'adminPage_membersInfo_Select') {
                // 회원목록 버튼이 클릭되면 membersList() 메서드를 호출합니다.
                membersList();
            } else if (buttonId === 'adminPage_productsInfo_Select') {
                // 상품목록 버튼이 클릭되면 productsList() 메서드를 호출합니다.
                productsList();
            } else if (buttonId === 'adminPage_purchasesInfo_Select') {
                // 상품목록 버튼이 클릭되면 ordersList() 메서드를 호출합니다.
                purchasesList();
            }
            // 필요한 경우 다른 버튼에 대한 조건을 추가합니다.
        });
    });

    // membersList() 메서드
    function membersList() {
        // membersList 페이지로 이동합니다.
        window.location.href = '${pageContext.request.contextPath}/adminPage/membersList';
    }

    // productsList() 메서드
    function productsList() {
        // productsList 페이지로 이동합니다.
        window.location.href = '${pageContext.request.contextPath}/adminPage/productsList';
    }
    
    // ordersList() 메서드
	function purchasesList() {
		// ordersList 페이지로 이동합니다.
		window.location.href = '${pageContext.request.contextPath}/adminPage/purchasesList';
	}
});
function productsSearchList() {
    $.ajax({
        type: 'GET',
        url: "/adminPage/productsSearchList",
        data: $("form[name=products-search-form]").serialize(),
        success: function(result) {
			console.log(result);
            $('#memberstable > tbody').empty();
            if (result.length >= 1) {
            	$("#paging_dv").empty();
                result.forEach(function(product) {
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
