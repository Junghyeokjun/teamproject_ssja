<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	
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
<script src="/js/boardLike.js">
	
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
	<header>
		<div id="title_bar" class=" fixed-top">
			<div class="py-2 px-1" id="top-bar">

				<button type="toggle-button" class="top_btn" id="top_btn"></button>
				<a href=""><img id="logo_img"
					src="/images/utilities/logoSSJA.png"></a>
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
			<div class="main_whitespace p-5 my-2">
				
			</div>
			<form action="${pageContext.request.contextPath}/board/modify_view" method="post">
				<div class="input-group">
					<input type="hidden" class="form-control" name="bno" value="${content_view.bno}">
					<input type="hidden" class="form-control" name="bbcno" value="${content_view.bbcno}">
					<sec:csrfInput />
				</div>
				<table class="table" >
					<tr>
						<td colspan="2">
							<div class="input-group no-border">
	    						<input type="text" class="form-control text-center" name="btitle" value="${content_view.btitle}" readonly="readonly">
	    					</div>
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td >
							<div class="d-flex justify-content-end">
								<div class="input-group no-border w-25">
									<span class="input-group-text">조회수</span>
		    						<input type="text" class="form-control" name="bhit" value="${content_view.bhit}" readonly="readonly">
		    					</div>
		    				</div>					
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<div class="d-flex justify-content-end">
							<div class="input-group no-border w-25">
								<span class="input-group-text">작성자</span>
	    						<input type="text" class="form-control" name="bwriter" value="${content_view.bwriter}" readonly="readonly">
	    					</div>
	    					</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group">
								<textarea id="board_textarea" name="bcontent" class="form-control" rows="10" readonly="readonly">${content_view.bcontent}</textarea>	    				
	    					</div>
						</td>		
					</tr>
					<tr>
						<td  colspan="2">
							<div class="d-flex justify-content-center">
								<!-- data-likebmno 값 변경 필요 -->
								<button id="like-button" class="btn" data-likebno="${content_view.bno}" data-likebmno="${content_view.bmno}">
									<img class="board-like" >
								</button>
							</div>
					</tr>
					<tr>
						<td  colspan="2" style="border: none;">
							<div class="text-center">
								<p>
									좋아요 수 : <span id="like-count">${content_view.blike}</span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td  colspan="2">
							<div class="d-flex justify-content-between">
								<div>
									<input type="submit" class="btn btn-danger customed-ssja" value="수정">
									<a id="deleteBoard" href="${pageContext.request.contextPath}/board/delete?bno=${content_view.bno}" class="btn btn-danger">삭제</a>
								</div>
								
								<a class="btn btn-primary customed-ssja" href="${pageContext.request.contextPath}/board/list/${content_view.bbcno}">되돌아가기</a>								
								<%-- &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/board/delete?bno=${content_view.bno}">삭제</a> --%>
							<%-- <sec:authorize access="hasRole('ROLE_ADMIN')">
								&nbsp;&nbsp;<a
									href="${pageContext.request.contextPath}/board/${content_view.bno}">답변</a>
							</sec:authorize> <sec:authorize access="!hasRole('ROLE_ADMIN')">

							</sec:authorize> --%>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<h5 class="h5 m-1 p-1">댓글</h5>		
							<div class="input-group border">								
	    						<input id="inputReplyCon" type="text" class="form-control" name="rcontent" data-rbno="${content_view.bno}" data-rmno="" placeholder="댓글을 입력하세요.">
	    						<span class="input-group-text"><button id="inputReply" class="btn btn-primary">입력</button></span>
	    					</div>	   						    					
						</td>					
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
									<ul id="pagination" class="pagination justify-content-center ch-col">
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
			<div class="main_whitespace p-5">
				
			</div>
		</div>
	</main>
	<footer>
		<div id="first_footer" class="p-3"></div>
		<div id="second_footer"></div>
		<div id="third_footer"></div>
	</footer>
<script>
	$(document).ready(function(){
		// 댓글 url
		let replysUrl = '/api/replys';

		// 댓글 쪽에 달린, 게시글 번호 관련 정보
		let rbno = $('#inputReplyCon').data('rbno');

		console.log("inputReplyBno : " + rbno);		

		// 어느 사용자든 확인할 수 있는, 댓글 좋아요
		let replyLike = function(){
			/* $.ajax({
				
			}); */
			
		};

		// 로그인한 사람만 할 수 있는, 댓글 좋아요 눌렀을 때의 좋아요 숫자 증가 or 감소
		let replyLiked = function(){

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
		let getReplyLists = function(response){
			$('#replys').empty(); // 기존 내용 비우기
			let html1 = '';
			$.each(response.replys, function(index, reply_view) {
				html1 += '<div class=" rounded border"><div class="input-group">'; 
				// 댓글 만들기
				for (let i = 1; i <= reply_view.rindent; i++) {
					html1 += '<img src="">';
				}
				html1 += '<span class="input-group-text bg-replywriter">' + reply_view.rwriter + '</span>';
				html1 += '<input id="rcontent" type="text" class="form-control" data-rno="' + reply_view.rno + '" value="' + reply_view.rcontent + '" readonly="readonly">';				
				html1 += '</div>';
				html1 += '<div class="d-flex justify-content-between"><div><button id="reply-likes" class="btn mx-1">좋아요 '+ 1 +'</button><button id="reply-modify" class="btn">수정</button><button id="reply-delete" class="btn">X</button></div><div class="btn disabled border-0">' + reply_view.rdate + '</div>';
				html1 += '</div>'
			});

			$('#replys').html(html1);
			

			// 페이지네이션 부분
    		$('#pagination').empty(); // 기존 내용을 비우기.
			// 서버로부터 받은 데이터를 HTML로 바꿔서 특정 요소에 추가
			let html2 = '';

			// 이전 페이지 링크 추가
			if (response.pageMaker.prev) {
				html2 += '<li class="page-item">';
				html2 += '<a class="page-link" href="${pageContext.request.contextPath}/api/replys/list' + (response.pageMaker.startPage - 1) + '">&lt;</a>';
				html2 += '</li>';
			}
			
			// 페이지 번호 링크 추가
			for (let idx = response.pageMaker.startPage; idx <= response.pageMaker.endPage; idx++) {
				if (response.pageMaker.criteria.pageNum == idx) {
					html2 += '<li class="page-item active">';
					// 문자로 전달된 데이터이므로, 매개변수가 숫자라면 숫자형으로 바꾸기
					html2 += '<a class="page-link" href="${pageContext.request.contextPath}/api/replys/list/' + idx +  '/' + response.pageMaker.criteria.amount +'}">' + idx + '</a>'
				} else {
					html2 += '<li class="page-item">';
					// 문자로 전달된 데이터이므로, 매개변수가 숫자라면 숫자형으로 바꾸기
					html2 += '<a class="page-link" href="${pageContext.request.contextPath}/api/replys/list/' + idx +  '/' + response.pageMaker.criteria.amount +'}">' + idx + '</a>';							
				}					
				html2 += '</li>';
			}
			
			// 다음 페이지 링크 추가
			if (response.pageMaker.next && response.pageMaker.endPage > 0) {
				html2 += '<li class="page-item">';
				html2 += '<a class="page-link" href="${pageContext.request.contextPath}/api/replys/list' + (response.pageMaker.endPage + 1) + '">&gt;</a>';
				html2 += '</li>';
			}

			// 요소에 HTML 추가
			$('#pagination').html(html2);
		};
		
		// 기본적인 댓글 리스트 가져오기
		$.ajax({
			url: replysUrl + '/list',
			type : 'GET',
			data : {
				'bno' : rbno
			},
			success :  function(response){
				console.log("replys : " + response.replys);
				console.log("pageMaker : " + response.pageMaker);
				getReplyLists(response);
			},
			error : function(xhr, status, error){
				console.log("error : " + error);
				console.log("response : " + xhr.responseText);
			}
		});

		// 페이지네이션 처리된 부분 클릭 시 
		$('.page-link').click(function(e){
			// 이벤트 비활성화(기본 동작 방지하기)
			e.preventDefault();

			let url = $('.page-link').attr('href');
			let parts = url.split('/');
			let pageNum = parts[parts.length - 2]; // 마지막에서 두 번째 요소가 페이지 번호
			let amount = parts[parts.length - 1]; // 마지막 요소가 개수

			$.ajax({
				url: url,
				type : 'GET',
				success :  function(response){
					console.log("replys : " + response.replys);
					console.log("pageMaker : " + response.pageMaker);
					getReplyLists(response);
				},
				error : function(xhr, status, error){
					console.log("error : " + error);
					console.log("response : " + xhr.responseText);
				}
			});
		});


		// memberNum 변수 값 유무에 따라 로그인 여부를 체크하는 함수(소셜 로그인도 해당 변수에 값이 들어간 상태라고 함)
		function isLoggedIn(){
			return sessionStorage.getItem('memberNum')  != null ? true : false;
		}

		// 댓글 입력 관련


		// 제약 1 : 댓글 내용 칸 클릭 시, 로그인이 되어 있지 않다면 로그인 상태를 
		$('#inputReplyCon').click(function(){
			if(!isLoggedIn()){
				alert('댓글을 달 수 없습니다. 로그인 페이지로 이동합니다.');
				$(location).attr('href', '/login');
				return;
			}
		});

		

		//  댓글 제한
		$('#inputReply').click(function(e){
			// 기본 동작을 막음.
			// 이후 폼 제출이나 링크 이동은 따로 선언해서 이벤트를 진행
			e.preventDefault();
					
			if(!isLoggedIn()){
				// 로그인이 안된 상태에서 버튼을 클릭 시
				alert('댓글을 달 수 없습니다. 로그인 페이지로 이동합니다.');
				$(location).attr('href', '/login');
				return;		
			}else if($('#inputReplyCon').val().length <= 2){
				// 3글자 미만으로 입력시
				alert('세 글자 이상 입력하시기 바랍니다.');
				$('#inputReplyCon').val('');
				return;		
			} else{
				// 나머지 경우에는 ajax를 통한 댓글 입력 실행.
				// $.ajax({

				// });
			}
		});

		// 댓글 좋아요 버튼 클릭 시 관련 처리
		$('#reply-likes').click(function(e){
			e.preventDefault();


			if(!isLoggedIn()){
				alert('좋아요를 할 수 없습니다.');
				$(location).attr('href', '/login');
				return;
			}else{

			}
		});		
	});
</script>	
</body>
</html>