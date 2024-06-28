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
					<a id="user_link" href="/login" style="margin-left:auto;"><img id="login_img" ></a>
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
					</select> <input type="text" name="keyword" value=""> <input
						type="button" onclick="membersSearchList()"
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
									<td id="memeberid_td">${member.m_ID}</td>
									<td>${member.m_NAME}</td>
									<td id="memberaddress_td">${member.m_ADDRESS1}</td>
									<td><fmt:formatDate value="${member.m_BIRTH}"
											pattern="yyyy-MM-dd" /></td>
									<td>${member.m_GRADE}</td>
									<td id="memberemail_td">${member.m_EMAIL}</td>
									<td>${member.m_PHONE}</td>
									<td>${member.m_POINT}</td>
									<td>${member.m_NICKNAME}</td>
									<td>
										<button type="button" class="btn btn-outline-success"
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
		<!-- 모달 창 -->
		<div class="modal fade" id="editMemberModal" tabindex="-1" role="dialog"
			aria-labelledby="editMemberModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="editMemberModalLabel">문의 수정</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="editMemberForm">							
							<div class="form-group">
								<label for="editId">아이디</label> <input type="text"
									class="form-control" id="editId" name="editId">
							</div>
							<div class="form-group">
								<label for="editName">이름</label> <input type="text"
									class="form-control" id="editName" name="editName">
							</div>							
							<div class="form-group">
								<label for="editADDRESS1">주소</label>
								<textarea class="form-control" id="editADDRESS1"
									name="editADDRESS1"></textarea>
							</div>
							<div class="form-group">
								<label for="editBIRTH">생일</label>
								<textarea class="form-control" id="editBIRTH"
									name="editBIRTH"></textarea>
							</div>
							<div class="form-group">
								<label for="editGRADE">등급</label>
								<textarea class="form-control" id="editGRADE"
									name="editGRADE"></textarea>
							</div>
							<div class="form-group">
								<label for="editEMAIL">이메일</label>
								<textarea class="form-control" id="editEMAIL"
									name="editEMAIL"></textarea>
							</div>
							<div class="form-group">
								<label for="editADDRESS1">휴대폰번호</label>
								<textarea class="form-control" id="editPHONE"
									name="editPHONE"></textarea>
							</div>
							<div class="form-group">
								<label for="editPOINT">포인트</label>
								<textarea class="form-control" id="editPOINT"
									name="editPOINT"></textarea>
							</div>
							<div class="form-group">
								<label for="editNICKNAME">닉네임</label>
								<textarea class="form-control" id="editNICKNAME"
									name="editNICKNAME"></textarea>
							</div>
							<input type="hidden" id="editMemberId" name="editMemberId">
							<button type="submit" class="btn btn-primary">저장</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script>
$(document).ready(function() {
	  $('body').on('click', '#modifyMemberBtn', function() {
	    var $btn = $(this); // 클릭된 버튼을 변수에 저장
	    var $row = $btn.closest('tr'); // 클릭된 버튼의 부모 tr 요소 가져오기

	    // 테이블에서 해당 열의 정보 가져오기
	    var memberId = $row.find('td:eq(0)').text(); 
	    var id = $row.find('td:eq(1)').text(); 
	    var name = $row.find('td:eq(2)').text(); 
	    var address1 = $row.find('td:eq(3)').text(); 
	    var birth = $row.find('td:eq(4)').text(); 
	    var grade = $row.find('td:eq(5)').text(); 
	    var email = $row.find('td:eq(6)').text(); 
	    var phone = $row.find('td:eq(7)').text(); 
	    var point = $row.find('td:eq(8)').text(); 
	    var nickname = $row.find('td:eq(9)').text(); 
	   
	    // 모달 창에 정보 채우기
	   $('#editMemberModal').find('#editId').val(id);
	   $('#editMemberModal').find('#editName').val(name);
	   $('#editMemberModal').find('#editADDRESS1').val(address1);
	   $('#editMemberModal').find('#editBIRTH').val(birth);
	   $('#editMemberModal').find('#editGRADE').val(grade);
	   $('#editMemberModal').find('#editEMAIL').val(email);
	   $('#editMemberModal').find('#editPHONE').val(phone);
	   $('#editMemberModal').find('#editPOINT').val(point);
	   $('#editMemberModal').find('#editNICKNAME').val(nickname); 
	   
	   $('#editMemberModal').find('#editMemberId').val(memberId);

	    // 모달 창 띄우기
	    $('#editMemberModal').modal('show');
	  });
	});
</script>
		<script>
$(document).ready(function() {
	  $('#editMemberForm').submit(function(event) {
	    event.preventDefault(); // 폼의 기본 동작 방지

	    var formData = {
	      m_NO: $('#editMemberId').val(),
	      m_ID: $('#editId').val(),
	      m_NAME: $('#editName').val(),
	      m_ADDRESS1: $('#editADDRESS1').val(),
	      m_BIRTH: $('#editBIRTH').val(),
	      m_GRADE: $('#editGRADE').val(),
	      m_EMAIL: $('#editEMAIL').val(),
	      m_PHONE: $('#editPHONE').val(),
	      m_POINT: $('#editPOINT').val(),
	      m_NICKNAME: $('#editNICKNAME').val()
	    };

	    var csrfToken = $('meta[name="_csrf"]').attr('content'); // CSRF 토큰 가져오기
	    var csrfHeader = $('meta[name="_csrf_header"]').attr('content'); // CSRF 헤더 이름 가져오기

	    // AJAX를 이용한 문의 수정 요청
	    $.ajax({
	      type: 'POST',
	      url: '/adminPage/modifyMember',
	      data: JSON.stringify(formData), // JSON 형식으로 데이터 전송
	      contentType: 'application/json', // 요청 데이터 타입 지정
	      beforeSend: function(xhr) {
	        xhr.setRequestHeader(csrfHeader, csrfToken); // CSRF 토큰을 헤더에 포함
	      },
	      success: function(response) {
	        console.log('문의 수정 성공');
	        // 모달 창 닫기
	        $('#editMemberModal').modal('hide');
	        // 테이블에서 해당 행 업데이트
	        var $row = $('#memberstable').find('td:contains(' + formData.m_NO + ')').closest('tr');
	        $row.find('td:eq(1)').text(formData.m_ID);
	        $row.find('td:eq(2)').text(formData.m_NAME);
	        $row.find('td:eq(3)').text(formData.m_ADDRESS1);
	        $row.find('td:eq(4)').text(formData.m_BIRTH);
	        $row.find('td:eq(5)').text(formData.m_GRADE);
	        $row.find('td:eq(6)').text(formData.m_EMAIL);
	        $row.find('td:eq(7)').text(formData.m_PHONE);
	        $row.find('td:eq(8)').text(formData.m_POINT);
	        $row.find('td:eq(9)').text(formData.m_NICKNAME);	        
	      },
	      error: function(xhr, status, error) {
	        console.error('문의 수정 오류', error);
	        // 오류 처리 로직 추가
	      }
	    });
	  });
	});

</script>
		<script>
	$('body').on('click', '#deleteMemberBtn', function() {
	    var $row = $(this).closest('tr');
	    var mId = $row.find('td:first').text();

	    $.ajax({
	        type: "POST",
	        url: "/adminPage/removeMember",
	        data: JSON.stringify({ m_NO: mId }),
	        contentType: "application/json",
	        success: function(response) {
	            $row.remove();
	        },
	        error: function(xhr, status, error) {
	            console.error('삭제 오류', error);
	        }
	    });
	});
	</script>
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

		<script src="/js/login_user_tab.js">
			
		</script>
		<script src="/js/user_cart_tab.js">
			
		</script>
	</sec:authorize>

</body>
</html>
