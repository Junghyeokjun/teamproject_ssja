<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<sec:authentication property="principal" var="principal" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
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
	font-family: 'fonts', NanumSquare;
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
</style>
</head>

<body>
	<sec:authorize access="isAnonymous()">
		<script type="text/javascript">
			$(document).ready(function() {
				alert("관리자와 작성자 본인만 해당 페이지를 확인하실 수 있습니다. 먼저 로그인을 진행하시기 바랍니다.");
				window.location.href = "/login";
			});
		</script>
	</sec:authorize>
	<fmt:parseNumber var="bcNum" value="${bcNo}" type="number" />
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="principal" />
		<script type="text/javascript">
			var bcNum = '${bcNum}';
			// content_view를 그대로 넣으면 안됨. 모두 문자열로 변환된 상태로 넘어오니까.
			// 객체로 받고 싶다면 json 객체로 받기. 물론 담당자는 필요 데이터만 뽑아서 처리함.
			var contentViewBmo = '${content_view.bmno}';
			var principal = {
				memberNum : "${principal.memberNum}",
				auth : "${principal.auth}"
			};

			// QnA 게시판이고, 로그인 유저의 권한이 관리자가 아니며, 해당 작성자 번호와 로그인 번호가 다른 경우
			if (principal.auth != 'ROLE_ADMIN' && bcNum == 20
					&& contentViewBmo != principal.memberNum) {
				alert("작성자의 문의 내용이 아니므로 확인하실 수 없습니다.");
				window.location.href = "${pageContext.request.contextPath}/vendor/question/list/20";
			}

			$(document).ready(function() {
				// console.log("bcNum: " + bcNum);
				// console.log("contentViewBmo: " + contentViewBmo);
				// console.log("Member Number: " + principal.memberNum);
				// console.log("Auth: " + principal.auth);
				// 여기서 principal 값을 사용하여 추가 작업 수행 가능

			});
		</script>
		<c:choose>
			<c:when	test="${bcNo == 20 && principal.auth == 'ROLE_USER' && content_view.bmno != principal.memberNum}">
				<script type="text/javascript">
					function role() {
						alert("관리자와 본인만 해당 페이지를 확인하실 수 있습니다. 목록으로 돌아갑니다.");
						window.location.href = "${pageContext.request.contextPath}/vendor/question/list/20";
					};
					role();
				</script>
			</c:when>
			<c:otherwise>
				<header>
					<div id="title_bar" class=" fixed-top">
						<div class="py-2 px-1" id="top-bar">
							<div class="d-flex align-items-center">
								<button type="toggle-button" class="top_btn"></button>
								<a id="logo_toHome" href=""><img id="logo_img"
									src="/images/utilities/logoSSJA.png"></a>
							</div>
							<form action="http://www.naver.com" id=searchForm method="get">

							</form>
							<button id="search_icon"></button>
							<a id="cart_link"><img id="cart_img"></a> <a id="user_link"><img
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
					<div id="main_container">
						<div class="main_whitespace p-5 my-2"></div>
						<form
							action="${pageContext.request.contextPath}/vendor/question/modify_view"
							method="post">
							<div class="input-group">
								<input type="hidden" class="form-control" name="bno"
									value="${content_view.bno}"> <input type="hidden"
									class="form-control" name="bbcno" value="${content_view.bbcno}">
								<input type="hidden" class="form-control" name="bmno"
									value="${content_view.bmno}">
								<sec:csrfInput />
							</div>
							<table class="table">
								<tr>
									<td colspan="2">
										<div class="input-group no-border">
											<input type="text" class="form-control text-center"
												name="btitle" value="${content_view.btitle}"
												readonly="readonly">
										</div>
									</td>
								</tr>
								<tr>
									<td></td>
									<td>
										<div class="d-flex justify-content-end">
											<div class="input-group no-border w-25">
												<span class="input-group-text">조회수</span> <input type="text"
													class="form-control" name="bhit"
													value="${content_view.bhit}" readonly="readonly">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td></td>
									<td>
										<div class="d-flex justify-content-end">
											<div class="input-group no-border w-25">
												<span class="input-group-text">작성자</span> <input type="text"
													class="form-control" name="bwriter"
													value="${content_view.bwriter}" readonly="readonly">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="input-group">
											<textarea id="board_textarea" name="bcontent"
												class="form-control" rows="10" readonly="readonly">${content_view.bcontent}</textarea>
										</div>
									</td>
								</tr>

								<c:if test="${bcNum >= 30}">
									<tr>
										<td colspan="2">
											<div class="d-flex justify-content-center">
												<!-- data-likebmno 값 변경 필요 -->
												<button id="like-button" class="btn"
													data-likebno="${content_view.bno}"
													data-likebmno="${principal.memberNum}">
													<img class="board-like">
												</button>
											</div>
									</tr>
									<tr>
										<td colspan="2" style="border: none;">
											<div class="text-center">
												<p>
													좋아요 수 : <span id="like-count">${content_view.blike}</span>
												</p>
											</div>
										</td>
									</tr>
								</c:if>
								<tr>
									<td colspan="2">
										<div class="d-flex justify-content-between">
											<sec:authorize access="isAuthenticated()">
												<c:choose>
													<c:when
														test="${principal.memberNum == content_view.bmno || principal.auth == 'ROLE_ADMIN'}">
														<div>
															<input type="submit" class="btn btn-danger customed-ssja"
																value="수정"> <a id="deleteBoard"
																href="${pageContext.request.contextPath}/vendor/question/delete?bno=${content_view.bno}"
																class="btn btn-danger">삭제</a>
														</div>
													</c:when>
													<c:otherwise>
														<div></div>
													</c:otherwise>
												</c:choose>
											</sec:authorize>
											<sec:authorize access="isAuthenticated()">
												<a class="btn btn-primary customed-ssja"
													href="${pageContext.request.contextPath}/vendor/question/${content_view.bbcno}">되돌아가기</a>
											</sec:authorize>
											<%-- &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/vendor/question/delete?bno=${content_view.bno}">삭제</a> --%>
											<%-- <sec:authorize access="hasRole('ROLE_ADMIN')">
								&nbsp;&nbsp;<a
									href="${pageContext.request.contextPath}/vendor/question/${content_view.bno}">답변</a>
							</sec:authorize> <sec:authorize access="!hasRole('ROLE_ADMIN')">

							</sec:authorize> --%>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2"></td>
								</tr>
								<tr>
									<c:choose>
										<c:when
											test="${(bcNum == 20 && principal.auth != 'ROLE_ADMIN') 
											|| (bcNum == 10 && principal.auth == 'ROLE_USER')
											|| (bcNum == 30 && principal.auth == 'ROLE_USER') }">
											<td colspan="2">
												<h5 class="h5 m-1 p-1 text-center">답변</h5>
												<div class="input-group border visually-hidden">
													<input id="inputReplyCon" type="text" class="form-control"
														name="rcontent" data-rbno="${content_view.bno}"
														data-rmno="" placeholder="관리자만 달 수 있는 댓글입니다.">
												</div>
											</td>
										</c:when>
										<c:otherwise>
											<td colspan="2">
												<h5 class="h5 m-1 p-1">답변</h5>
												<div class="input-group border">
													<input id="inputReplyCon" type="text" class="form-control"
														name="rcontent" data-rbno="${content_view.bno}"
														data-rmno="" placeholder="댓글을 입력하세요."> <span
														class="input-group-text"><button id="inputReply"
															class="btn btn-primary btn-format">입력</button></span>
												</div>
											</td>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr>
									<td colspan="2">
										<div id="replys">
											<!-- <div class="input-group">
									<c:forEach var="reply_view" items="${replys}">
										<c:forEach var="re" begin="1" end="${reply_view.rindent}">
											<img src="">
										</c:forEach>												
										<span id="rwriter" class="input-group-text bg-replywriter">${reply_view.rwriter}</span>
										<input id="rcontent" type="text" class="form-control" data-rno="${reply_view.rno}" value="${reply_view.rcontent}" readonly="readonly">
										
										<span class="input-group-text"><button id="reply-likes" class="btn mx-1">좋아요</button><button id="reply-delete" class="btn ">삭제</button></span>
									</c:forEach>
								</div> -->
										</div>
										<div>
											<nav aria-label="Page navigation example">
												<ul id="pagination"
													class="pagination justify-content-center ch-col">
													<%-- <c:if test="${pageMaker.prev}">
											<li class="page-item">
												<a class="page-link" href="${pageContext.request.contextPath}/api/replys/${pageMaker.startPage-1}">&lt;<a>
											</li>
										</c:if>
										<c:forEach var="idx" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
											<c:choose>																		
												<c:when test="${pageMaker.criteria.pageNum == idx}">
													<li class="page-item active">
														<a class="page-link"
														href="${pageContext.request.contextPath}/api/replys/${pageMaker.makeQuery(idx)}">${idx}</a>
													</li>
												</c:when>
												<c:when test="${pageMaker.criteria.pageNum != idx && idx > 0}">
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/api/replys/${pageMaker.makeQuery(idx)}">${idx}</a></li>
												</c:when>
												<c:otherwise>													
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
											<li class="page-item">
												<a class="page-link" href="${pageContext.request.contextPath}/api/replys/${pageMaker.makeQuery(pageMaker.endPage+1)}">&gt;</a>
											</li>
										</c:if> --%>
												</ul>
											</nav>
										</div>
									</td>
								</tr>
							</table>
						</form>
						<div class="main_whitespace p-5"></div>
					</div>
				</main>
				<footer>
					<div id="first_footer" class="p-3"></div>
					<div id="second_footer"></div>
					<div id="third_footer"></div>
				</footer>
			</c:otherwise>
		</c:choose>

	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<script src="/js/vendor_login_user_tab.js">
			
		</script>
	</sec:authorize>
	<script>
		$(document)
				.ready(
						function() {
							let token = $("meta[name='_csrf']").attr("content");
							let header = $("meta[name='_csrf_header']").attr(
									"content");

							console.log("document.referrer : "
									+ document.refererr);
							// 해당 jsp 파일에서만 텍스트 영역의 스크롤바를 없애고 내용에 따라 높이를 조정해 줄 예정
							// srollHeight : 컨텐츠가 차지하는 공간 높이. 제이쿼리로는 접근을 못해서, DOM 객체로 변환 후 접근해야 함.
							// $('#board_textarea')[0] : 해당 제이쿼리 객체에서 첫 번째 DOM 요소로 접근한다는 것을 의미.
							if ($('#board_textarea')[0].scrollHeight > $(
									'#board_textarea').height()) {
								$('#board_textarea').css('height', 'auto');
							}

							// 댓글 url
							let replysUrl = '/api/replys';

							// 댓글 쪽에 달린, 게시글 번호 관련 정보
							let rbno = $('#inputReplyCon').data('rbno');

							console.log("inputReplyBno : " + rbno);

							// 댓글 텍스트 상자 높이 조절 함수
							let replyTextareaHeight = function() {
								$('.rcontent.form-control').each(
										function() {
											$(this).css('height', 'auto').css(
													'height',
													this.scrollHeight + 'px');
										})
							};

							/* let html1 = ''; 
							html1+= '<c:forEach var="reply_view" items="${replys}">';
							html1+=	'<c:forEach var="re" begin="1" end="${reply_view.rindent}">';
							html1+=	'<img src="">';
							html1+=	'</c:forEach>';
							html1+=	'<span id="rwriter" class="input-group-text bg-replywriter">${reply_view.rwriter}</span>';
							html1+=	'<input id="rcontent" type="text" class="form-control" data-rno="${reply_view.rno}" value="${reply_view.rcontent}" readonly="readonly">';
							html1+=	'<span class="input-group-text"><button id="reply-likes" class="btn mx-1">좋아요</button><button id="reply-delete" class="btn ">삭제</button></span>';
							html1+=	'</c:forEach>'; */
							// 댓글 리스트 가져오는 함수. 재사용성을 위해서 변수에 할당함.
							let getReplyLists = function(response) {
								$('#replys').empty(); // 기존 내용 비우기
								let html1 = '';

								// 커뮤니티 댓글 외형
								// $.each(response.replys, function(index, reply_view) {
								// 	html1 += '<div class="rounded border m-1">';
								// 	html1 += '<div class="input-group">'; 
								// 	// 댓글 만들기
								// 	for (let i = 1; i <= reply_view.rindent; i++) {
								// 		html1 += '<img src="">';
								// 	}
								// 	html1 += '<span class="input-group-text bg-replywriter border">' + reply_view.rwriter + '</span>';
								// 	//html1 += '<input type="text" class="rcontent form-control" data-rno="' + reply_view.rno + '" value="' + reply_view.rcontent + '" readonly="readonly">';				
								// 	html1 += '<textarea class="rcontent form-control" data-rno="' + reply_view.rno + '" rows="1" readonly="readonly">' + reply_view.rcontent + '</textarea>';				
								// 	html1 += '</div>';

								// 	// 좋아요 부분의 숫자는 추후 없애고 따로 처리해야 한다.
								// 	html1 += '<div class="d-flex justify-content-between"><div><button class="reply-likes btn mx-1">좋아요 '+ 1 +'</button><button class="reply-modify btn">수정</button><button id="reply-delete" class="btn">X</button><button class="reply-report btn">신고</button></div><div class="btn disabled border-0">' + reply_view.rdate + '</div>';
								// 	html1 += '</div></div>'
								// });

								// 관리자 댓글 외형
								// 현재 페이지에서는 관리자 댓글 외형을 입히기 위해 ajax에 댓글 헤드를 꾸미는 함수를 집어넣었음.
								$
										.each(
												response.replys,
												function(index, reply_view) {
													html1 += '<div class="rounded border m-2">';
													html1 += '<div class="replyhead1 text-center"><h2 class="h2 disabled border-0 m-0 pt-2">관리자 답변</h2></div><div class="d-flex flex-row-reverse replyhead2">'												
													html1 += '<div class="btn disabled border-0">'
															+ reply_view.rdate
															+ '</div></div><div class="input-group">';
													// 댓글 만들기
													for (let i = 1; i <= reply_view.rindent; i++) {
														html1 += '<span class=""></span>';
													}

													//html1 += '<input type="text" class="rcontent form-control" data-rno="' + reply_view.rno + '" value="' + reply_view.rcontent + '" readonly="readonly">';				
													html1 += '<textarea class="board-textarea form-control border-0" data-rno="' + reply_view.rno + '" rows="1" readonly="readonly">'
															+ reply_view.rcontent
															+ '</textarea>';
													html1 += '</div>';

													html1 += '</div></div>'
												});

								if (html1 == '') {
									html1 += '<div class="m-2"><h2 class="h2 text-center no-data-font">현재 댓글이 없습니다.</h2></div>'
									$('#replys').before(html1);
								} else {
									$('#replys').html(html1);
								}

								// 페이지네이션 부분
								// qna에서는 댓글에 해당 부분이 필요하지 않다. 주석으로 처리하면 된다.

								// $('#pagination').empty(); // 기존 내용을 비우기.
								// // 서버로부터 받은 데이터를 HTML로 바꿔서 특정 요소에 추가
								// let html2 = '';

								// // 이전 페이지 링크 추가
								// if (response.pageMaker.prev) {
								// 	html2 += '<li class="page-item">';
								// 	html2 += '<a class="page-link" href="${pageContext.request.contextPath}/api/replys/list/' + (response.pageMaker.startPage - 1) + '">&lt;</a>';
								// 	html2 += '</li>';
								// }

								// // 페이지 번호 링크 추가
								// for (let idx = response.pageMaker.startPage; idx <= response.pageMaker.endPage; idx++) {
								// 	if (response.pageMaker.criteria.pageNum == idx) {
								// 		html2 += '<li class="page-item active">';
								// 		// 문자로 전달된 데이터이므로, 매개변수가 숫자라면 숫자형으로 바꾸기
								// 		html2 += '<a class="page-link" href="${pageContext.request.contextPath}/api/replys/list/' + idx +  '/' + response.pageMaker.criteria.amount +'">' + idx + '</a>'					
								// 	} else {
								// 		html2 += '<li class="page-item">';
								// 		// 문자로 전달된 데이터이므로, 매개변수가 숫자라면 숫자형으로 바꾸기
								// 		html2 += '<a class="page-link" href="${pageContext.request.contextPath}/api/replys/list/' + idx +  '/' + response.pageMaker.criteria.amount +'">' + idx + '</a>';							
								// 	}					
								// 	html2 += '</li>';
								// }

								// // 다음 페이지 링크 추가
								// if (response.pageMaker.next && response.pageMaker.endPage > 0) {
								// 	html2 += '<li class="page-item">';
								// 	html2 += '<a class="page-link" href="${pageContext.request.contextPath}/api/replys/list' + (response.pageMaker.endPage + 1) + '">&gt;</a>';
								// 	html2 += '</li>';
								// }

								// // 요소에 HTML 추가
								// $('#pagination').html(html2);

								$('.h5.m-1.p-1').text(
										'답변 ' + response.pageMaker.total);
							};

							// $('.reply-modify').on('click',function(){
							// 	let replyParent = $(this).parents('div').eq(2);
							// 	let textarea = replyParent.find('textarea')
							// 	if($(this).text == '수정'){
							// 		textarea.prop('readonly', false);
							// 		textarea.focus();
							// 		$(this).text = '완료';
							// 	}else if($(this).text == '완료'){
							// 		$.ajax({
							// 			url: replysUrl + '/modify',
							// 			type : 'POST',
							// 			beforeSend : function(xhr) {
							// 				xhr.setRequestHeader(header, token);
							// 			},
							// 			data : {
							// 				'bno' : rbno
							// 			},					
							// 			success :  function(response){
							// 				console.log("replys : " + response.replys);
							// 				console.log("pageMaker : " + response.pageMaker);
							// 				console.log("replyTotal : " + response.pageMaker.total);
							// 				console.log("===============================");
							// 				getReplyLists(response);	
							// 				replyTextareaHeight();
							// 				adminReplyHead();
							// 			},
							// 			error : function(xhr, status, error){
							// 				console.log("error : " + error);
							// 				console.log("response : " + xhr.responseText);
							// 			}
							// 		});
							// 	}			
							// });

							// 관리자 댓글 헤드 꾸미기 함수
							let adminReplyHead = function() {
								$('.replyhead1').css({
									'border-radius' : '0.375em 0.375em 0 0',
									'background-color' : '#d7d8da'
								});

								$('.replyhead2').css({
									'background-color' : '#d7d8da'
								});
							};

							console.log(replysUrl);
							// 기본적인 댓글 리스트 가져오기
							$
									.ajax({
										url : replysUrl + '/list',
										type : 'GET',
										data : {
											'bno' : rbno
										},
										success : function(response) {
											console.log("replys : "
													+ response.replys);
											console.log("pageMaker : "
													+ response.pageMaker);
											console.log("replyTotal : "
													+ response.pageMaker.total);
											console
													.log("===============================");
											getReplyLists(response);
											replyTextareaHeight();
											adminReplyHead();
										},
										error : function(xhr, status, error) {
											console.log("error : " + error);
											console.log("response : "
													+ xhr.responseText);
										}
									});

							// 페이지네이션 처리된 부분 클릭 시 
							// 동적으로 생성된 요소에 대해서도 이벤트를 처리할 수 있음
							$(document)
									.on(
											'click',
											'.page-link',
											function(e) {
												// 이벤트 비활성화(기본 동작 방지하기)
												e.preventDefault();

												let url = $('.page-link').attr(
														'href');

												$
														.ajax({
															url : url,
															type : 'GET',
															data : {
																'bno' : rbno
															},
															success : function(
																	response) {
																console
																		.log("replys : "
																				+ response.replys);
																console
																		.log("pageMaker : "
																				+ response.pageMaker);
																console
																		.log("replyTotal : "
																				+ response.pageMaker.total);
																getReplyLists(response);
																replyTextareaHeight();
																adminReplyHead();
															},
															error : function(
																	xhr,
																	status,
																	error) {
																console
																		.log("error : "
																				+ error);
																console
																		.log("response : "
																				+ xhr.responseText);
															}
														});
											});

							// memberNum 변수 값 유무에 따라 로그인 여부를 체크하는 함수(소셜 로그인도 해당 변수에 값이 들어간 상태라고 함)
							function isLoggedIn() {
								return sessionStorage.getItem('memberNum') != null ? true
										: false;
							}

							// 댓글 입력 관련

							// 제약 1 : 댓글 내용 칸 클릭 시, 로그인이 되어 있지 않다면 로그인 상태를 방지
							$(document).on('click', '#inputReplyCon',
									function() {
										if (principal.auth != "ROLE_ADMIN") {
											alert('관리자만 댓글을 달 수 있습니다');
											return;
										}
									});

							$('.rcontent.form-control').each(
									function() {
										// 현재 textarea 요소의 높이를 자동으로 조절
										$(this).css('height', 'auto').css(
												'height',
												this.scrollHeight + 'px');
									});

							//  댓글 제한
							//$('#inputReply').click(function(e){
							$(document)
									.on(
											'click',
											'#inputReply',
											function() {
												// 기본 동작을 막음.
												// 이후 폼 제출이나 링크 이동은 따로 선언해서 이벤트를 진행
												e.preventDefault();

												if (!isLoggedIn()) {
													// 로그인이 안된 상태에서 버튼을 클릭 시
													alert('댓글을 달 수 없습니다. 로그인 페이지로 이동합니다.');
													$(location).attr('href',
															'/login');
													return;
												} else if ($('#inputReplyCon')
														.val().length <= 2) {
													// 3글자 미만으로 입력시
													alert('세 글자 이상 입력하시기 바랍니다.');
													$('#inputReplyCon').val('');
													return;
												} else {
													// 나머지 경우에는 ajax를 통한 댓글 입력 실행.
													// $.ajax({

													// });
												}
											});

							// 댓글 좋아요 버튼 클릭 시 관련 처리
							//$('.reply-likes').click(function(e){
							$(document).on('click', '.reply-likes', function() {
								e.preventDefault();

								if (!isLoggedIn()) {
									alert('좋아요를 할 수 없습니다.');
									$(location).attr('href', '/login');
									return;
								} else {

								}
							});
						});
	</script>
</body>
</html>