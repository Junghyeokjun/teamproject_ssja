<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/js/barscript.js">
	
</script>
<script src="/js/footer.js">
	
</script>
<script src="/js/board.js">
	
</script>
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
	font-family: 'fonts', NanumGothicLight;
	background-color: #f7f0e8;
}

#logo_img {
	width: 3.5em;
	height: 3em;
}
</style>
<style>
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
</style> --%>
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
#qna_title_a{
cursor:pointer;
}
#adminPage_Info_Select{
padding:0;
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
				<a id="cart_link"><img id="cart_img"></a> <a id="user_link" href="/login"><img
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
		<div id="main_container" style="margin: 0 auto;">
			<br>
			<h2>공지사항</h2>
			<form name="notices-search-form" autocomplete="off">
					<select name="type">
						<option selected value="">선택</option>
						<option value="b_title">제목</option>
						<option value="b_content">내용</option>
					</select> <input type="text" name="keyword" value=""> <input
						type="button" onclick="noticeSearchList()"
						class="btn btn-outline-dark mr-2" value="검색">
				</form>
			<div class="table-responsive">
				<table class="table"  id="noticestable" style="text-align: center;">
					<thead>
						<tr>
							<td scope="col">번호</td>
							<td scope="col">제목</td>
							<td scope="col">이름</td>
							<td scope="col">날짜</td>
						</tr>
					</thead>
					<tbody class="table-group-divider" id="notice_content_tablebody">
						<c:forEach var="notice" items="${notics}">
							<tr>
								<td>${notice.bno}</td>
								<td><a id="notice_title" class=""
									href="${pageContext.request.contextPath}/notice_view?bno=${notice.bno}">
										${notice.btitle}</a></td>
								<td>${notice.bwriter}</td>
								<td class="date_str">${notice.bdate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					<div id="paging_dv">
					<nav aria-label="Page navigation example">
						<ul class="pagination ch-col justify-content-center">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link ch-col"
									href="${pageContext.request.contextPath}/notice${pageMaker.makeQuery(pageMaker.startPage-1)}"><</a></li>
							</c:if>
							<c:forEach var="idx" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<c:choose>
									<c:when test="${pageMaker.criteria.pageNum == idx}">
										<li class="page-item active"><a class="page-link"
											href="${pageContext.request.contextPath}/notice${pageMaker.makeQuery(idx)}">${idx}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/notice${pageMaker.makeQuery(idx)}">${idx}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page-item"><a class="page-link ch-col"
									href="${pageContext.request.contextPath}/notice${pageMaker.makeQuery(pageMaker.endPage+1)}">></a></li>
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
	
	 <sec:authorize access="isAuthenticated()">
	 
	 <sec:authorize access="hasRole('ROLE_VENDOR')">
        <input type="hidden" id="isVendorCheck" value="1">
    </sec:authorize>
	 
  <script src="/js/login_user_tab.js"> </script>
  <script src="/js/user_cart_tab.js"> </script>
</sec:authorize>
	
</body>
<script>
var contextPath = "${pageContext.request.contextPath}";

	function noticeSearchList() {
		$.ajax({
			type : 'GET',
			url : "/noticeSearchList",
			data : $("form[name=notices-search-form]").serialize(),
			success : function(result) {
				console.log(result);
				$('#noticestable > tbody').empty();
				if (result.length >= 1) {
					$("#paging_dv").empty();
					result.forEach(function(notice) {
						var str = '<tr>';
						str += "<td>" + notice.bno + "</td>";
						str += "<td><a href='" + contextPath + "/notice_view?bno=" + notice.bno + "' class='notice-link'>" + notice.btitle + "</a></td>";
	                    str += "<td>" + notice.bwriter + "</td>";
						str += "<td>" + notice.bdate + "</td>";						
						str += "</tr>";
						$('#noticestable > tbody').append(str);
					});
					// 클릭 이벤트 핸들러 추가
					$('.notice-link').click(function (e) {
						e.preventDefault(); // 기본 동작 방지
						var url = $(this).attr('href');
						console.log("Navigate to: " + url);
						window.location.href = url;
					});
				} else {
					$('#noticestable > tbody').append('<tr><td colspan="4">검색 결과가 없습니다.</td></tr>');
				}				
			}
		});
	}
</script>	
</html>