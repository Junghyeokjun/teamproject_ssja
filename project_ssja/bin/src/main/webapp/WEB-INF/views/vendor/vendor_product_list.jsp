<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authentication property="principal" var="principal" />
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
  <title>SSJA</title>
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
   <meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>

  <script src="/js/vendorbarscript.js">

  </script>

  <script src="/js/footer.js">

  </script>
  <link href="/css/footerstyle.css?after" rel="stylesheet">
  <link href="/css/vendorbarstyle.css?after" rel="stylesheet">
  <link href="/css/board.css?after" rel="stylesheet">
  <link rel="stylesheet" href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">

  <style>
    @font-face {
      font-family: 'fonts';
      src: url("https://webfontworld.github.io/NanumSquare/NanumSquare.css") fotmat('font1');
    }

    body {
      font-family: 'fonts', NanumSquare;
      background-color: #f7f0e8;
    }

	header, main, footer{
		height: auto;
		overflow : hidden;
	}
	
    #logo_img {
      width: 3.5em;
      height: 3em;
    }
    
  </style>
  <style>
  	.btn.btn-outline-success{
  		border-color: #26ac26;
		font-weight: bold;
		border-width: 2px 2px 2px 2px;
  	}

	.btn.btn-outline-success:hover, .btn.btn-outline-success:active, .btn.btn-outline-success:focus{
  		border-color: #26ac26;
		background-color: #26ac26;
		font-weight: bold;
  	}
  
    .MyPage_btn {
      background-color: white;
      padding: 20px;

    }

    #MyPage_point {
      margin-left: auto;
    }

    #select_dv {
    
      margin: 2em;
      height: auto;
    }

    #content_dv {
      width: 80%;
      margin: 2em;
    }
    #MyPage_content_name{
      background-color: #f7f0e8;
      padding:3em;
     
    }
    #MyPage_content_name > h1{
    
      font-weight: bold;
      margin-left: 1em;

    }
    #select_MyPage{
      z-index:900;
      position: fixed;
      top:30%;
      left:5%;
      width:12%;
    }
    #select_mp_top{
      background-color: #f7f0e8;
      padding: 2em;
      height: auto;

    }
    #userInfo_dv1{
    display:flex;
    flex-direction:row;
    align-items:center;
  
    }
    #userInfo_dv1 > h2 {
    margin-left:1em;
    margin-right:1em;
    }
    
    #userInfo_dv2{
    display:flex;
    flex-direction:row;
    justify-content:space-evenly;
    align-items:center;
  	height:auto;
    }

    #userInfo_dv2 > div{
    font-weight:bold;
    margin-top:1em;
    margin-bottom:1em;
    padding:5px;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    text-align:center;
     height:auto;
     width:100%;
    }
    #your_address > input{
    border:none;
    }
    
	/* venderpage */
    .mx-2.m-auto.input-group-text{
    	width : 8em;
        line-height: 3em; /* 높이와 동일하게 설정하여 수직 중앙 정렬 */
    	text-align: center;
    	display: flex;
   		justify-content: center;
    }
    
    .mx-2.m-auto.input-group-text, .form-control{
    	height: 3em;
    }  
	
 
 
 	.file-container_ {
 		padding : 0;
 	}
	/* 기존 파일 형식 없애기 */
	.file-container_ input[type="file"] {
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip:rect(0,0,0,0);
		border: 0;
	}
	
	/* 커스텀 시작1 - label */
	.file-container_ label {
	  display: inline-block;
	  padding: .5em .75em;
	  color: #857474;
	  font-size: inherit;
	  line-height: normal;
	  vertical-align: middle;
	  background-color: #fdfdfd;
	  cursor: pointer;
	  border: 1px solid #ebebeb;
	  border-bottom-color: #e2e2e2;
	  border-radius: .25em;
	  
	  /* 줄바꿈되지 않게 하기. 한 줄로 표시 */
	  white-space: nowrap;
	}
	
	/* 파일 업로드명 */
	.file-container_ .file-upload-name_ {
		/* 가능한 공간을 모두 차지하게 설정 */
		flex-grow : 1;		
		display: inline-block;
		padding: .5em .75em; /* label의 패딩값과 일치 */
		font-size: inherit;
		font-family: inherit;
		line-height: normal;
		vertical-align: middle;
		background-color: #f5f5f5;
		border: 1px solid #ebebeb;
		border-bottom-color: #e2e2e2;
		border-radius: .25em;
	  
		/* 브라우저의 기본 스타일 제거 -> 커스텀 스타일이 적용되도록 하기 */
		-webkit-appearance: none; 
		-moz-appearance: none;
		appearance: none;
	}
	
	.file-container_.custom-primary label {
		color: #ffffff;
		background-color: #8c20ca;
		border-color: #7d22b3;
	}
	
	.file-container_.custom-primary label:hover {
		color: #ffffff;
		font-weight:bold;
		background-color: #aa6bce;
		border-color: #a85cd4;
	}
	
	.upload-image_{
		display: none;
	}
	
	.btn-danger.btn-tuning{
		background-color: #962626;	
	}

	.btn-danger.btn-tuning:hover{
		background-color: #c43c3c;	
	}

	.venderName {
		border-bottom: 5PX SOLID #222222;
		background-color: white;
		padding: 3px;
		border-radius: 15 15 15 15;
		margin: auto;	
	}
	
	.venderTitle{
		padding-top: 3px; 
	}
	
	.top_btn{
		font-size : 2em;

	}
@media screen and (max-width: 860px){	
	.venderTitle {
		display: none;
	}
	
}	
  </style>
</head>

<body>
	<sec:authorize access="isAuthenticated()">
    	<sec:authentication property="principal.auth" var="myAuth"/>
    	<c:choose>		
			<c:when test="${myAuth != 'ROLE_VENDOR'}">
			<!-- 권한이 판매자가 아닌 경우 -->
				<script>
					$(document).ready(function() {
		                alert("접근할 수 없습니다.");
		                window.location.href = "/";
		            });
				</script>
			</c:when>
		</c:choose>
    </sec:authorize>
	<sec:authorize access="isAnonymous()">
	    <script type="text/javascript">
	    	$(document).ready(function(){
				alert("해당 게시판에 접근하기 위해서는 로그인이 필요합니다.");
			 	window.location.href = "/login";
	    	});
		</script>
	</sec:authorize>	
	<header class="fixed-top">
		<div id="title_bar" >
			<div class="py-2 px-1 d-flex justify-content-between" id="top-bar">
				<div class="d-flex align-items-center">
					<button type="toggle-button" class="top_btn"></button>
					<a id="logo_toHome" href=""><img id="logo_img" src="/images/utilities/logoSSJA.png"></a>
				</div>
				<div class="mx-5 my-2 d-flex ">
					<h1 class="h1 vendorTitle" >판매자 :&nbsp;</h1>
        			<h1 class="h1 vendorNames"> 
        				&lt;
        				<sec:authorize access="isAuthenticated()">
        					<sec:authentication property="principal.userInfo" var="vendorMember"/>
        				</sec:authorize>
        				<input type="hidden" id="vendorData" value="${vendorMember.m_No}">
        				${vendorMember.m_Name}
        				&gt;</h1>      			
        		</div>
				<a id="user_link"><img id="login_img"></a>
			</div>
		</div>
		<nav id="total_bar">
		</nav>
	</header>
	<div id="side_bar">
		<div id="side_links" class="w-100"></div>
	</div>
	<main>
		<c:choose>
			<c:when test="${empty product}">
				<div class="main_whitespace p-5 my-2">
					<h1 class="h3 text-center ">상품 목록</h1>
				</div>
				<div id="main_container">
					<div>
						<hr class="border border-2 opacity-75">
					</div>
					<div class="text-center">
						<h1 class="h1 text-center">상품 목록이 현재 비어있는 상태입니다. </h1>
					</div>
					<div class="mt-4">
						<h1 class="h1 text-center">상품을 등록하시겠습니까?</h1>
					</div>
					<div class="text-center mt-3">
						<br>
						<a class="btn btn-outline-success" href="${pageContext.request.contextPath}/vendor/product/write">상품 등록 창으로 가기</a>
					</div>
					<div>
						<hr class="border border-2 opacity-75">
					</div>
				</div>
				<div class="main_whitespace p-5 my-2">
					
				</div>
			</c:when>
			<c:otherwise>
				<div class="main_whitespace p-5 my-2">
					<h1 class="h3 text-center ">상품 목록</h1>
				</div>
				<div id="main_container"
					class="d-flex flex-row align-items-center justify-content-center">
					 <div id="content_dv_productsInfo" >
						<table class="table table-hover" id="productstable" style="text-align: center;">
							<thead>
								<tr>
									<td>상품번호</td>
									<td>상품이름</td>
									<td>가격</td>
									<td>수량</td>
									<td>위시 수</td>
									<td>판매 수</td>
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
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="my-4">
							<%-- <form name="products-search-form" autocomplete="off">
								<select name="type">
									<option selected value="">선택</option>
									<option value="PRO_NO">상품번호</option>		
									<option value="PRO_BIZNAME">사업자이름</option>														
								</select>
								 <input type="text" name="keyword" value=""> <input
									type="button" onclick="productsSearchList()"
									class="btn btn-outline-primary mr-2" value="검색">
							</form> --%>
						</div>
						<div id="paging_dv">				
							<nav aria-label="Page navigation example">
								<ul class="pagination ch-col justify-content-center">
									<c:if test="${productpageMaker.prev}">
										<li class="page-item"><a class="page-link ch-col"
											href="${pageContext.request.contextPath}/vendor/product/list/${vno}${productpageMaker.makeQuery(productpageMaker.startPage-1)}"><</a></li>
									</c:if>
									<c:forEach var="idx" begin="${productpageMaker.startPage}"
										end="${productpageMaker.endPage}">
										<c:choose>
											<c:when test="${productpageMaker.criteria.pageNum == idx}">
												<li class="page-item active"><a class="page-link"
													href="${pageContext.request.contextPath}/vendor/product/list/${vno}${productpageMaker.makeQuery(idx)}">${idx}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="${pageContext.request.contextPath}/vendor/product/list/${vno}${productpageMaker.makeQuery(idx)}">${idx}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${productpageMaker.next && productpageMaker.endPage > 0}">
										<li class="page-item"><a class="page-link ch-col"
											href="${pageContext.request.contextPath}/vendor/product/list/${vno}${productpageMaker.makeQuery(productpageMaker.endPage+1)}">></a></li>
									</c:if>
								</ul>
							</nav>
						</div>
						<div class="main_whitespace p-5 my-2"></div>				
					</div> 
				</div>
			</c:otherwise>
		</c:choose>
	</main>
	<footer>
		<div id="first_footer" class="p-3"></div>
		<div id="second_footer"></div>
		<div id="third_footer"></div>
	</footer>
</body>
<sec:authorize access="isAuthenticated()">
	<script src="/js/vendor_login_user_tab.js"> </script>
</sec:authorize>
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
                    str += "</tr>";
                    $('#productstable > tbody').append(str);
                });
            }
        }
    });
}
</script>

</html>