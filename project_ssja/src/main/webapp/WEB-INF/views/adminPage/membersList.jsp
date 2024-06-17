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
		<div id="main_container" style="margin: 0 auto;">
			<br> 
				<h2>회원목록</h2>
				<form name="members-search-form" autocomplete="off">
					<select name="type">
						<option selected value="">선택</option>
						<option value="m_name">회원이름</option>
						<option value="m_id">아이디</option>
						<option value="m_grade">등급</option>
					</select> <input type="text" name="keyword" value=""> 
					<input type="button" onclick="membersSearchList()" class="btn btn-outline-dark mr-2" value="검색">
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
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach var="member" items="${members}">
							<tr>
								<td>${member.m_NO}</td>
								<td>${member.m_ID}</td>
								<td>${member.m_NAME}</td>
								<td>${member.m_ADDRESS1}</td>
								<td>${member.m_BIRTH}</td>
								<td>${member.m_GRADE}</td>
								<td>${member.m_EMAIL}</td>
								<td>${member.m_PHONE}</td>
								<td>${member.m_POINT}</td>
								<td>${member.m_NICKNAME}</td>
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
	</main>
	<footer>
		<div id="first_footer" class="p-3"></div>
		<div id="second_footer"></div>
		<div id="third_footer"></div>
	</footer>
</body>
<script>
function membersSearchList() {
    $.ajax({
        type: 'GET',
        url: "/adminPage/membersSearchList",
        data: $("form[name=members-search-form]").serialize(),
        success: function(result) {
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
