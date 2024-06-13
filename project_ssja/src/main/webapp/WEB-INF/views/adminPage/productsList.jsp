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
				 <button type="toggle-button" class="top_btn" id="top_btn"></button>
				<a id="logo_toHome" href=""><img id="logo_img"
					src="/images/utilities/logoSSJA.png"></a>
			</div>
		</div>
		<nav id="total_bar">
		</nav>
	</header>
	<div id="side_bar">
		<div id="side_links" class="w-100"></div>
	</div>
	<main>
		<div id="main_container"
			class="d-flex flex-row align-items-center justify-content-center">
			 <div id="content_dv_productsInfo" >
				<h2>상품목록</h2>
				<table class="table" id="productstable"  style="text-align: center;">
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
						<option value="PRO_BIZNAME">사업자이름</option>														
					</select>
					 <input type="text" name="keyword" value=""> <input
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
function productsSearchList() {
    $.ajax({
        type: 'GET',
        url: "/adminPage/productsSearchList",
        data: $("form[name=products-search-form]").serialize(),
        success: function(result) {
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
