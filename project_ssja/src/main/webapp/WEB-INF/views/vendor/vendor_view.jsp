<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="principal" />

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

<!-- 그래프를 그리기 위해, Chart.js를 포함시킵니다. -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<script type="module" src="/js/vendorbarscript.js">

  </script>

<script src="/js/footer.js">

  </script>
<link href="/css/footerstyle.css?after" rel="stylesheet">
<link href="/css/vendorbarstyle.css?after" rel="stylesheet">
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

header{
	height: auto;
}


main, footer {
	height: auto;
	overflow: hidden;
}

#logo_img {
	width: 3.5em;
	height: 3em;
}
</style>
<style>
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

#MyPage_content_name {
	background-color: #f7f0e8;
	padding: 3em;
}

#MyPage_content_name>h1 {
	font-weight: bold;
	margin-left: 1em;
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

#userInfo_dv1 {
	display: flex;
	flex-direction: row;
	align-items: center;
}

#userInfo_dv1>h2 {
	margin-left: 1em;
	margin-right: 1em;
}

#userInfo_dv2 {
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
	align-items: center;
	height: auto;
}

#userInfo_dv2>div {
	font-weight: bold;
	margin-top: 1em;
	margin-bottom: 1em;
	padding: 5px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
	height: auto;
	width: 100%;
}

#your_address>input {
	border: none;
}

/* venderpage */
.mx-2.m-auto.input-group-text {
	width: 8em;
	line-height: 3em; /* 높이와 동일하게 설정하여 수직 중앙 정렬 */
	text-align: center;
	display: flex;
	justify-content: center;
}

.mx-2.m-auto.input-group-text, .form-control {
	height: 3em;
}

.file-container_ {
	padding: 0;
}
/* 기존 파일 형식 없애기 */
.file-container_ input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
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
	flex-grow: 1;
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
	font-weight: bold;
	background-color: #aa6bce;
	border-color: #a85cd4;
}

.upload-image_ {
	display: none;
}

.btn-danger.btn-tuning {
	background-color: #962626;
}

.btn-danger.btn-tuning:hover {
	background-color: #c43c3c;
}

.ssja-main-width{
	width: 66%;
}

#seller-download{
	width: 66%;
	clear: both;
}

.download-img{
	border: 0;
}

.download-img:hover{
	border: 0;
	background-color: #ccc;
}

.seller-download-main{
	width : 50%;
	display : flex;
	justify-content :space-between;
	align-items : center;
	border: 1px solid #ccc;
	padding: 1em 1em 1em 1em;
	border-radius: 5px 5px 5px 5px;
}


th{
  background-color: #706b6b !important; 
  color: #fff !important;
}

@media screen and (min-width: 1120px){
	#seller-download{
	  position: fixed; 
	  left: 85%;
	  top: 220px; 
	  text-align:center;
	  width: 150px;
	  height: 250px;
	  margin-right: 50px;
	  padding: 15px 5px;
	  border: 1px solid #ccc;
	  border-radius: 10px;
	}	

	.seller-download-main{
		width:100%;
		display : block;
		border : 0;
		padding: 0 0 0 0;
	}
	
	.download-img.img-thumbnail{
		display: none;
	}
	
	.table.download-table{
		border-radius: 10px;
	}	
}

</style>
</head>

<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.auth" var="myAuth" />
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
			<c:otherwise>
				<header class="fixed-top">
					<div id="title_bar">
						<div class="py-2 px-1 d-flex justify-content-between" id="top-bar">
							<div class="d-flex align-items-center">
								<button type="toggle-button" class="top_btn"></button>
								<a id="logo_toHome" href=""><img id="logo_img"
									src="/images/utilities/logoSSJA.png"></a>
							</div>
							<div class="mx-5 my-2 d-flex ">
								<h1 class="h1 vendorTitle">판매자 :&nbsp;</h1>
								<!-- 
									땡땡땡땡 : 상호명
									로그인 시 vendorDto에 담기는 vendor.vbizname 또한 가져오기						
									그냥 조인을 쓴다면 vendorDto가 아니라 조인한 결과를 담는 다른 Dto가 필요할 것이다.
					 			-->
								<h1 class="h1 vendorNames">
									&lt;
									<sec:authorize access="isAuthenticated()">
										<sec:authentication property="principal.userInfo"
											var="vendorMember" />
									</sec:authorize>
									<input type="hidden" id="vendorData"
										value="${vendorMember.m_No}"> ${vendorMember.m_Name}
									<input type="hidden" id="vendorNo">
									&gt;
								</h1>
							</div>
							<a id="user_link"><img id="login_img"></a>
						</div>
					</div>
					<nav id="total_bar"></nav>
				</header>
				<div id="side_bar">
					<div id="side_links" class="w-100"></div>
				</div>
				<main>
					<div class="main_whitespace p-5 my-2"></div>
					<div id="seller-download" class="d-flex justify-content-center text-center">
						<div class="seller-download-main">
							<div class="seller-download-h4 mb-2">
								<h4 class="h4">다운로드</h4>
								<img class="download-img img-thumbnail" alt="excel"
									src="/images/utilities/excel_download.png"
									style="width: 60px; height: 60px"></img>
							</div>

							<div>
								<table class="table download-table">
									<thead class="download- border">
										<tr>
											<td>정렬</td>
											<td>링크</td>
										</tr>
									</thead>
									<tbody class="border">
										<tr>
											<td><p class="m-0">매출</p></td>
											<td><a href=""><img class="border-0" alt="매출"
													src="/images/utilities/download.png"
													style="width: 25px; height: 25px"></img></a></td>
										</tr>
										<tr>
											<td>수량</td>
											<td><a href=""><img class="border-0" alt="수량"
													src="/images/utilities/download.png"
													style="width: 25px; height: 25px"></img></a></td>
										</tr>
										<tr>
											<td>일자</td>
											<td><a href=""><img class="border-0" alt="일자"
													src="/images/utilities/download.png"
													style="width: 25px; height: 25px"></img></a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div id="total-statistics" class="ssja-main-width text-center">
						<div class="text-center mb-3">
							<h5 class="h5">누적 통계</h5>
						</div>						
						<table id="ssja-vendor-datas" class="table">
							<tr>
								<th class="w-25">a</th>
								<th class="w-25">b</th>							
								<th class="w-25">c</th>							
							</tr>
							<tr>
								<td>111,111</td>
								<td>111</td>
								<td>1,111</td>
							</tr>
						</table>
					</div>
					<div id="main_container">						
						<div class="d-flex flex-row align-items-center justify-content-center container">
							<div id="MyPage_content_container" class="px-5 pt-5 pb-1">
								<div class="text-center mb-3">
									<h5 class="h5 chart-title">최근 일주일 간 매출 데이터</h5>
									<h5 class="h5 years"></h5>
								</div>
								<div class="d-flex show-chart">
									<div id="chart-table" class="border">
										<div class="p-5">
											<table id="sales" class="table table-striped text-center ">

											</table>
										</div>
									</div>
									<div id="chart-area" class="border p-3 d-flex align-items-center">
										<div >
											<canvas id="salesChart" width="400px" height="300px"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="main_whitespace p-5 my-2"></div>
				</main>
				<footer>
					<div id="first_footer" class="p-3"></div>
					<div id="second_footer"></div>
					<div id="third_footer"></div>
				</footer>
			</c:otherwise>
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
</body>
<script src="/js/vendor_login_user_tab.js"> </script>
<script type="text/javascript">
	
</script>

<script>
					 
  let select_dv = $("#select_content");
    
    $("#select_mp_top").on('click', function() {
        select_dv.toggle();
    });



</script>

</html>