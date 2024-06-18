<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
  <title>SSJA</title>
  <script>
		let getPrincipal = {
			'memberNum' : '${principal.memberNum}',
			'userName' : '${principal.userInfo.m_Name}'
		}
		console.log(getPrincipal);
</script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
   <meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<c:choose>
<c:when test="${principal.auth != 'ROLE_VENDOR'}">
  <script src="/js/barscript.js">

  </script>
  <link href="/css/barstyle.css?after" rel="stylesheet">
</c:when>
<c:when test="${principal.auth == 'ROLE_VENDOR'}">
  <script src="/js/vendorbarscript.js">

  </script>
  <link href="/css/barstyle.css?after" rel="stylesheet">
</c:when>
</c:choose>
  <script src="/js/footer.js">

  </script>
  <link href="/css/footerstyle.css?after" rel="stylesheet">
  

  <link rel="stylesheet" href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">

  <style>

  </style>
  <style>
#commuInfoContainer, #qnaInfoContainer{
width:100%;
margin-bottom:50px;
margin-top:50px;
display:flex;
flex-direction:column;
align-items:center;
border: 1px solid #ccc;
}
#commuInfoTitle, #qnaInfoTitle{
padding:40px;
display:flex;
border-bottom:1px solid #ccc;
flex-direction:row;
align-items:center;
width:100%;
}
#commuInfoTitle > h4, #qnaInfoTitle > h4 {
font-weight:bold;
}
#commuInfoPaging, #qnaInfoPaging{
display:flex;
flex-dirextion:row;
justify-content:center;
padding:1.5em;
}
 #paging_qnaInfoPaging_dv >  button, #paging_commuInfoPaging_dv > button {
background-color:white;
border:2px solid #ccc;
border-radius:3px;
}
#commuContetnts > img{
   width: 30%; 
    height: 100%;
    object-fit: cover; 
    border-radius:15px;
}
#commuContetnts{
width:100%;
}
#commuInfoDiv,#commuEtcInfo{
width:35%;
}
#commuInfoDiv > span {
    display: inline-block;
    max-width: 10em;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    text-align:start;
    
}
#commuEtcInfo > span {
    display: inline-block;
    max-width: 8em;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    text-align:end;
}

</style>
</head>

<body>
<input type="hidden" id="getPrincipal" value="${principal.auth }">
<c:choose>
	<c:when test="${principal.auth != 'ROLE_VENDOR'}">
	  <header>
	    <div id="title_bar" class="fixed-top">
	      <div class="py-2 px-1" id="top-bar">
	        <button type="toggle-button" class="top_btn" id="top_btn"></button>
	        <a id="logo_toHome" href=""><img id="logo_img" src="/images/utilities/logoSSJA.png"></a>
	        <form action="http://www.naver.com" id=searchForm method="get">
	
	        </form>
	        <button id="search_icon"></button>
	        <a id="cart_link"><img id="cart_img"></a>
	        <a id="user_link"><img id="login_img"></a>
	      </div>
	
	    </div>
	    <nav id="total_bar">
	      <div id="home_user_bar"> </div>
	      <div id="sub_bar"></div>
	    </nav>
	  </header>
  </c:when>
  <c:when test="${principal.auth == 'ROLE_VENDOR'}">
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
        		<a id="cart_link" hidden="hidden"></a>
				<a id="user_link"><img id="login_img"></a>
			</div>
		</div>
		<nav id="total_bar">
		</nav>
	</header>
  </c:when>
</c:choose>
  <div id="side_bar">
    <div id="side_links" class="w-100"></div>
  </div>
		   <div id="select_MyPage" class="d-flex flex-column">
		    <div id="select_mp_top" class="text-center">마이 페이지</div>
		    <div id="select_content">
		        <button class="MyPage_btn w-100" id="myPage_userInfo_Select" style="border:1px solid #cccccc">회원 정보</button>
		        <button class="MyPage_btn w-100" id="myPage_orderInfo_Select" style="border:1px solid #cccccc">주문 내역</button>
		        <button class="MyPage_btn w-100" id="myPage_boardInfo_Select" style="border:1px solid #cccccc">내가 쓴 글</button>
		        <button class="MyPage_btn w-100" id="myPage_charge_point" style="border:1px solid #cccccc">포인트 충전</button>
		        
		        <!--  principal객체를 꺼내서 해당 객체의 auth값을 yourAuth변수로 지정 -->
		     <sec:authentication property="principal.auth" var="yourAuth"/> 
		     
		       <c:if test="${principal.isOAuth2User() == true }">
		       <button class="MyPage_btn w-100" style="border:1px solid #cccccc" id="not_authorized_vendor_apply">판매자 신청</button>
		       </c:if> 
		 <c:if test="${yourAuth == 'ROLE_USER'}"><!-- 유저 권한 -->
		    <c:if test="${principal.isOAuth2User() == false }">
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc" id="vendor_apply">판매자 신청</button>
		        </c:if>
			</c:if>
			
			 <c:if test="${yourAuth == 'ROLE_VENDOR'}"><!--  판매자 권한일 경우 대체 되는 버튼 -->
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc" id="mange_yoursell">판매 관리</button>
		        </c:if>
		        
			 <c:if test="${yourAuth == 'ROLE_ADMIN'}"><!--  판매자 권한일 경우 대체 되는 버튼 -->
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc" id="mange_yoursell">판매 관리</button>
		        </c:if>
		        
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc" id="go_qna">문의 및 요청</button>
		    </div>
		</div>
  <main>
  
    <div id="main_container" class="d-flex flex-row align-items-center justify-content-center" >
      <div id="content_dv" >
        <div id="MyPage_content_name" > </div>
        <div id=main_div>
        <div id="MyPage_content_container" >
        </div>
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
  <script src="/js/login_user_tab.js"> </script>
    <script src="/js/user_cart_tab.js"> </script>
  
</sec:authorize>

   <div class="modal fade" id="totalInfoModal" tabindex="-1" aria-labelledby="totalInfoModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="width:800px; height:700px; background-color:white;">
                <div class="modal-header">
                    <h5 class="modal-title" id="totalInfoModalLabel"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                  <div class="modal-body" id="totalInfoContent">
					<p>Modal body text goes here.</p>
						</div>
                <div class="modal-footer d-flex flex-row justify-content-center" id="totlaInfoTooter">
         
                </div>
            </div>
        </div>
    </div>

</body>

<script src="/js/myPage/userMyPage.js"></script>
<script src="/js/myPage/userOrders.js"></script>
<script src="/js/myPage/applyVendor.js"></script>
<script >
let commu_pageNum = 1;
let qna_pageNum = 1;
let $myPageContent = $("#MyPage_content_container");

let getBoardInfoCommus = function(commu_pageNum) {

	$.ajax({
		type : "get",
		url : "/user/info/community?pageNum=" + commu_pageNum,
		contentType : "application/json",
		async:false,
		success : function(data) {
			console.log("commu : " );
			console.log(data);
			let $commuDV = $myPageContent.find('#commuDV');
			if ($commuDV.length) {
			    $commuDV.empty();
			} else {
			    $commuDV = $('<div>').attr('id', 'commuDV').appendTo($myPageContent);
			}
			
			let commuInfoContainer = $("<div>").attr('id','commuInfoContainer');
			
			commu_pageNum = data.pageNum;
			commuInfoContainer.append(
					$("<div>").attr('id','commuInfoTitle').append(
							$("<h4>").text('내가 쓴 글 - 커뮤니티')
					),
					
					$("<div>").attr('id','commuInfoContent').css('width','100%'),	
					$("<div>").attr('id','commuInfoPaging')	
			).appendTo($commuDV);
			if(data === null || data === ''){
				console.log('data is null')
				return;
				}
			
			data.objectList.forEach(function(board, index){
				$("<div>").attr('id','commuContetnts').addClass("d-flex flex-row justify-content-between align-items-center")
				.css({'padding':'1em','padding-right':'2em','padding-left':'2em'}).append(
						
						$("<img>").attr('src',board.img_path),
						
						$("<div>").attr('id', 'commuInfoDiv').addClass('d-flex flex-column mx-3 align-items-start').append(
							    $('<span>').text("NO." + board.bno),
							    $('<span>').text(board.btitle).css({'font-weight':'bold'}),
							    $('<span>').text(board.bwriter)	
							),
								
						$("<div>").attr('id','commuEtcInfo').addClass('d-flex flex-column mx-3').append(
								$('<span>').text( board.bdate.split(' ')[0] ),
								$('<span>').text(board.bdateStr),
								$('<span>').text( '조회 수 ' + board.bhit),
								$('<span>').text('좋아요 ' +board.blike),
								$('<span>').text('댓글 '+board.countrv)	
								)
								
				).hover(
						function () {
                            $(this).css('background-color', '#eee').css('cursor', 'pointer');
                        },
                        function () {
                            $(this).css('background-color', 'white').css('cursor', 'auto');
                        }
				).on('click', function(){
					
				window.location.href="/community/content/"+board.bno;
				}).appendTo("#commuInfoContent");
			});
			
			pageMaker(data.next, data.prev, data.pageNum,data.startPage, data.endPage, data.total, getBoardInfoCommus,5, 'commuInfoPaging')
		},error : function(xhr, status, ex) {

		}
	})
};

let getBoardInfoQnAs = function(qna_pageNum) {

	$.ajax({
		type : "get",
		url : "/user/info/qna?pageNum=" + qna_pageNum,
		contentType : "application/json",
		async:false,
		success : function(data) {
			console.log("qna : " );
			console.log(data)
			
			let $qnaDV = $myPageContent.find('#qnaDV');
			if ($qnaDV.length) {
			    $qnaDV.empty();
			} else {
			    $qnaDV = $('<div>').attr('id', 'qnaDV').appendTo($myPageContent);
			}
			
			let qnaInfoContainer = $("<div>").attr('id','qnaInfoContainer');
			
			qna_pageNum = data.pageNum;
			qnaInfoContainer.append(
					$("<div>").attr('id','qnaInfoTitle').append(
							$("<h4>").text('내가 쓴 글 - 고객문의')
					),
					
					$("<div>").attr('id','qnaInfoContent').css('width','100%'),	
					$("<div>").attr('id','qnaInfoPaging')	
			).appendTo($qnaDV);
			if(data === null || data === ''){
				console.log('data is null')
				return;
				}
			$("<div>").css({'border-top':'2px solid black','border-bottom':'2px solid black','width':'100%','text-align':'center'})
			.addClass('d-flex flex-row justify-content-evenly  align-items-center py-3').append(
					$('<span>').css('width','8%').text('번호'),
					$('<span>').css('width','35%').text('제목'),
					$('<span>').css('width','18%').text('답변'),
					$('<span>').css('width','30%').text('날짜')
			).appendTo('#qnaInfoContent');
			data.objectList.forEach(function(board, index){
				
				$("<div>").addClass('d-flex flex-row justify-content-evenly text-center align-items-center py-2')
				.css({'width':'100%'}).append(
						$('<span>').css('width','8%').text(((data.pageNum - 1) * 10) + (index + 1)),
						$('<span>').css('width','35%').text(board.btitle),
						$('<span>').css('width','18%').text((board.existAns > 0 ? '수신':'대기')),
						$('<span>').css('width','30%').text(board.bdate)		
				).hover(
						function () {
                            $(this).css('background-color', '#eee').css('cursor', 'pointer');
                        },
                        function () {
                            $(this).css('background-color', 'white').css('cursor', 'auto');
                        }
				).on('click', function(){
					
				window.location.href="/board/content_view/20?bno="+board.bno;
				}).appendTo('#qnaInfoContent');
			})
				
			
			pageMaker(data.next, data.prev, data.pageNum,data.startPage, data.endPage, data.total, getBoardInfoQnAs,10, 'qnaInfoPaging')
		},
		error : function(xhr, status, ex) {

		}

	})
}

$('#myPage_boardInfo_Select').on('click', function() {
	if($($myPageContent).text() == "내가 쓴 글"){
		console.log('내가 쓴 글 이미 눌림')
		return false;
	}
	console.log('내가 쓴 글 눌림')
	let $h2title = $("<h2>").attr('id','myPageTitle').text("내가 쓴 글");
	let $myPageTitle = $("#MyPage_content_name");
	$("#MyPage_content_container").empty();
	
	$myPageTitle.empty().append($h2title);
	getBoardInfoCommus(1);
	
	getBoardInfoQnAs(1);
	
})

let pageMaker = function(next, prev, pageNum,startPage, endPage, total, callback, number, div){
	 
	 $("#"+div).empty();
    	let $paging_dv = $("<div>").attr('id','paging_'+div+'_dv')
		.addClass(' d-flex flex-row justify-content-center align-items-center').appendTo("#"+div);
		
		if (prev == true) {
			$("<button >").appendTo($paging_dv).text("<<").on("click",function(){
			
			callback(1);
		});
		
		
			$("<button >").appendTo($paging_dv).text("<").on("click",function(){
				// 페이징 한단계 내리기
				pageNum = Math.floor((pageNum - number )/ number)*number+1;
				callback(pageNum);
			});
		}
		for (let i = startPage; i <= endPage; i++) {
			  let $button = $("<button>").appendTo($paging_dv).text(i).on("click", function() {
			    callback(i);
			  });
			  
			  if (i === pageNum) {
			    $button.css('background-color','#ddd').css('color','black');
			  }
			}
		
		if (next == true) {
			$("<button >").appendTo($paging_dv).text(">").on("click",function(){
				// 페이징 한단계 올리기
				callback( Math.floor((pageNum + number )/ number)*number+1);
			});
		
		$("<button >").appendTo($paging_dv).text(">>").on("click",function(){
			pageNum = Math.ceil((total * 1.0)/number);
			callback(pageNum);
		});
		}
		
    }
 
</script>
<script>
let path = window.location.pathname;
 if (path === '/myPage/orderInfo') {
    myPageOrderInfo(1);
}else if(path === '/myPage/apply/vendor'){
	$("#vendor_apply").click();
}else{
	
    myPageUserInfo();
}
 
 $("#myPage_charge_point").on('click', function(){
	 window.location.href="/charge/point";
 })

</script>

</html>