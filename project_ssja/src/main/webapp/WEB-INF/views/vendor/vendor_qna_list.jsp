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
  <script src="/js/board.js">
  
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

  </style>
</head>

<body>
<div id="principalData" data-username="${principal.username}" data-email="${principal.email}" hidden></div>
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
			<c:otherwise>
			
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
	<header class="fixed-top">
		<div id="title_bar" >
			<div class="py-2 px-1 d-flex justify-content-between" id="top-bar">
				<div class="d-flex align-items-center">
					<button type="toggle-button" class="top_btn"></button>
					<a id="logo_toHome" href=""><img id="logo_img" src="/images/utilities/logoSSJA.png"></a>
				</div>
				<div class="mx-5 my-2 d-flex ">
					<h1 class="h1 vendorTitle" >판매자 :&nbsp;</h1>
					<!-- 
						땡땡땡땡 : 상호명
						로그인 시 vendorDto에 담기는 vendor.vbizname 또한 가져오기						
						그냥 조인을 쓴다면 vendorDto가 아니라 조인한 결과를 담는 다른 Dto가 필요할 것이다.
					 -->
        			<h1 class="h1 vendorNames"> 
        				&lt;
        				<sec:authorize access="isAuthenticated()">
        					<sec:authentication property="principal.userInfo" var="vendorMember"/>
        				</sec:authorize>
        				<input type="hidden" id="vendorData" value="${vendorMember.m_No}">
        				${vendorMember.m_Name}
        				&gt;</h1>      			
        		</div>
        <a id="user_link" href="/login"><img id="login_img"></a>
			</div>
		</div>
		<nav id="total_bar">
		</nav>
	</header>
	<div id="side_bar">
		<div id="side_links" class="w-100"></div>
	</div>
	<main>
		<div class="main_whitespace p-5 my-2">
			<h1 class="h3 text-center">${bc.bcname} 게시판</h1>
		</div>
		<div id="main_container" style="margin: 0 auto;">
			<c:choose>
				<c:when test="${empty boards}">
					<h1 class="h1">당신이 작성한 게시글이 없습니다. 작성하시겠습니까? </h1>
					<div class="d-flex justify-content-end p-1">
						<a href="${pageContext.request.contextPath}/vendor/question/write_view/${bc.bcno}" class="btn btn-primary btn-tuning">글 작성</a>
					</div> 
				</c:when>
				<c:otherwise>
					<div class="d-flex justify-content-between p-1">
						<div class="d-flex align-items-center">
							<h5 id="searchTotalText" class="h5 m-0">검색 결과 : </h5>
						</div>
						<div>
							<a href="${pageContext.request.contextPath}/vendor/question/write_view/${bc.bcno}" class="btn btn-primary btn-tuning">글 작성</a>
						</div>
					</div>
					<table class="table table-hover" style="text-align: center;">
						<thead class="table-secondary">
							<tr>
								<td>번호</td>
								<td>제목</td>
								<td>날짜</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${boards}">
								<tr>
									<td>${board.bno}</td>
									<td><a id="board_title" class=""
										href="${pageContext.request.contextPath}/vendor/question/content_view/${bc.bcno}?bno=${board.bno}">${board.btitle}</a>	
									</td>
									<td class="date_str">${board.bdate}</td>								
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="paging-or-comment">
						<nav aria-label="Page navigation example">
							<ul class="pagination ch-col justify-content-center">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link ch-col"
										href="${pageContext.request.contextPath}/vendor/question/${category}${pageMaker.makeQuery(pageMaker.startPage-1)}"><</a></li>
								</c:if>
								<c:forEach var="idx" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<c:choose>
										<c:when test="${pageMaker.criteria.pageNum == idx}">
											<li class="page-item active"><a class="page-link"
												href="${pageContext.request.contextPath}/vendor/question/${category}${pageMaker.makeQuery(idx)}">${idx}</a>
											</li>
										</c:when>
										<c:when test="${pageMaker.criteria.pageNum != idx}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/vendor/question/${category}${pageMaker.makeQuery(idx)}">${idx}</a></li>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link ch-col"
										href="${pageContext.request.contextPath}/vendor/question/${category}${pageMaker.makeQuery(pageMaker.endPage+1)}">></a></li>
								</c:if>
							</ul>
						</nav>
					</div>
					<!-- 모양내기 -->
					<div class="d-flex justify-content-center">
						<form id="qnas-search-form" class="w-50 input-group" autocomplete="off">
							<select class="form-select border" name="type">
								<option selected value="">선택</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="title_and_content">제목 + 내용</option>
							</select> 
							<input type="text" class="form-control border w-50" name="keyword" > 
							<input type="button" id="vendor-searchBtn" class="btn btn-dark" value="검색">
						</form>
					</div>
				</c:otherwise>
			</c:choose>
						
		</div>
		<div class="main_whitespace p-5 my-2">
			
		</div>
		
	</main>
  <footer>
    <div id="first_footer" class="p-3"></div>
    <div id="second_footer"></div>
    <div id="third_footer"></div>
  </footer>

</body>
 <sec:authorize access="isAuthenticated()">
	 
	 <sec:authorize access="hasRole('ROLE_VENDOR')">
        <input type="hidden" id="isVendorCheck" value="1">
    </sec:authorize>
	 
  <script src="/js/login_user_tab.js"> </script>
</sec:authorize>
<script>
					 
  let select_dv = $("#select_content");
    
    $("#select_mp_top").on('click', function() {
        select_dv.toggle();
    });


	$(document).ready(function(){
		let searchTotalText = $('#searchTotalText');
		
		searchTotalText.css('display', 'none');

		let option = $('select[name="type"]').val();
		let keyword = $('input[name="keyword"]').val();
		let pageNum = '${pageMaker.criteria.pageNum}';
		let amount = '${pageMaker.criteria.amount}';
		let bmno = '${vendorMember.m_No}';

		console.log('keyword :' + keyword);
		console.log('option :' + option);

		$('select[name="type"]').change(function(){
			option = $(this).val();			
			console.log('option :' + option);
		});

		$('input[name="keyword"]').on('input', function(){
			keyword = $(this).val();
			console.log('keyword :' + keyword);
		});

		function searchForm(option, keyword, pageNum, amount){
			if(pageNum == '' || pageNum == 'NaN'){
				pageNum = $('.page-item.active').children().first().text();
			}

			if(amount == '' || amount == 'NaN'){
				amount = 10;
			}
			
			//console.log("ajax 진입 전까지는 성공했음");

			$.ajax({
				type:"GET",
				url: "/api/vendor/search/QnA",
				data: {
					'option' : option,
					'keyword' : keyword,
					'pageNum' : pageNum,
					'amount' : amount,
					'bmno' : bmno,
					'bcno' : 20
				},
				success: function(response){
					//console.log("성공했음");
					searchTotalText.css('display', 'block');
					let total = response.pageVO.total;
					searchTotalText.text('검색 결과 : ' + total);
					$('tbody').empty();

					if($('.no-search-datas').length > 0){
						$('.no-search-datas').empty();
					}

					if(total == 0){
						let div = $('<div>').addClass('no-search-datas text-center').append(
							$('<h3>').addClass('h3 text-muted mb-4').text('검색 결과가 없습니다. 검색어를 다르게 입력하세요.')
						);
						$('#paging-or-comment').append(div);
					}else{
						for(let i = 0 ; i < response.totalData.length ; i++){
							let board = response.totalData[i];
							let tr = $('<tr>').append($('<td>').text(board.bno))
										.append($('<td>').append($('<a>').attr('id','board_title').attr('href','${pageContext.request.contextPath}/vendor/question/content_view/' + board.bbcno + '?bno=' + board.bno).text(board.btitle)))
										.append($('<td>').addClass('date_str').text(board.bdate));
							$('tbody').append(tr);
						}
					}				

					formatDates();
					
					let pagingUl = $('.pagination.ch-col.justify-content-center');
					pagingUl.empty();

					let pageMaker = response.pageVO;

					if(pageMaker.prev){
						pagingUl.append(
							$('<li>').addClass('page-item').append(
								$('<a>').addClass('page-link ch-col').text('<')
							)
						)
					}

					for(let i = pageMaker.startPage; i <= pageMaker.endPage; i++){
						if(pageMaker.criteria.pageNum == i){
							pagingUl.append(
								$('<li>').addClass('page-item active').append(
									$('<a>').addClass('page-link').text(i)
								)
							);
						}else if(pageMaker.criteria.pageNum != i){
							pagingUl.append(
								$('<li>').addClass('page-item').append(
									$('<a>').addClass('page-link').text(i)
								)
							);
						}
					}

					if(pageMaker.next && pageMaker.endPage > 0){
						pagingUl.append(
							$('<li>').addClass('page-item').append(
								$('<a>').addClass('page-link ch-col').text('>')
							)
						)
					}
				},					
				error: function(e){
					console.log(e);
				}
			});
		}

		$(document).on('click', '#vendor-searchBtn', function(e){
			e.preventDefault();
			if($('.form-select').val() == ''){
				alert('검색 옵션을 선택하지 않았습니다. 옵션을 선택하십시오.');
				return;
			}else if(bmno == ''){
				alert('판매자 정보가 없습니다.');
				return;
			}else if(keyword == ''){
				alert('검색어를 입력하시기 바랍니다.');
				return;
			}else{				
				// 첫 페이지로 무조건 이동시키도록
				searchForm(option, keyword, 1, amount);
			}
		});

		$(document).on('click','.page-link', function(e){
			e.preventDefault();
			if($(this).attr('href') == null || $('.page-link').attr('href') == '' ){
				if($('.form-select').val() == ''){
					alert('검색 옵션을 선택하지 않았습니다. 옵션을 선택하십시오.');
					return;
				}else if(bmno == ''){
					alert('판매자 정보가 없습니다.');
					return;
				}else if(keyword == ""){
					alert('검색어를 입력하시기 바랍니다.');
					return;
				}else{
					pageNum = $(this).text();
					searchForm(option, keyword, pageNum, amount);
				}
			}else{
				window.location.href = $(this).attr('href');
			}			
		});

		$(document).on('click','.page-link.ch-col', function(e){
			e.preventDefault();
			if($('.page-item.active').children().first().attr('href') == null || $('.page-item.active').children().first().attr('href') == ''){
				if($(this).text() == '>'){
					if($('.form-select').val() == ''){
					alert('검색 옵션을 선택하지 않았습니다. 옵션을 선택하십시오.');
					return;
					}else if(bmno == ''){
						alert('판매자 정보가 없습니다.');
						return;
					}else if(keyword == ""){
						alert('검색어를 입력하시기 바랍니다.');
						return;
					}else{
						pageNum = Number($('.page-item.active').children().first().text()) + 1;
						searchForm(option, keyword, pageNum, amount);
					}
				}else{
					if($('.form-select').val() == ''){
					alert('검색 옵션을 선택하지 않았습니다. 옵션을 선택하십시오.');
					return;
					}else if(bmno == ''){
						alert('판매자 정보가 없습니다.');
						return;
					}else if(keyword == ""){
						alert('검색어를 입력하시기 바랍니다.');
						return;
					}else{
						pageNum = Number($('.page-item.active').children().first().text()) - 1;
						searchForm(option, keyword, pageNum, amount);
					}
				}	
			}else{
				window.location.href = $(this).attr('href');
			}	
		});	
		
		// 검색창에서 엔터를 눌렀을 경우, 검색 버튼 클릭 이벤트 발생(함수로 묶어서 처리하지 않으려 한 흔적...)
		$(document).on('keypress', 'input[name="keyword"]', function(e) {
		    if (e.which === 13) { // 13은 엔터 키의 keyCode입니다
		    	e.preventDefault();
		        $('#vendor-searchBtn').trigger('click'); // 검색 버튼 클릭 이벤트 강제 발생
		    }
		});
	});
</script>

</html>