<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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

  <script src="/js/barscript.js">

  </script>

  <script src="/js/footer.js">

  </script>
  <link href="/css/footerstyle.css?after" rel="stylesheet">
  <link href="/css/barstyle.css?after" rel="stylesheet">

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

#userInfo_coupons, #userInfo_points, #userInfo_wishs {
	border-left: 1px solid #cccccc;
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

@media ( max-width : 1120px) {
	#select_MyPage {
		left: 0%;
		top: 25%;
	}
}

@media ( max-width : 780px) {
	#select_content {
		display: none;
	}
	#select_mp_top {
		padding-left: 0;
		padding-right: 0;
	}
}

#status_dv>span {
	color: #ccc;
	margin-left: 1em;
}

#select_mp_top {
	cursor: pointer;
}

#paging_dv>button {
	background-color: white;
	border: 1px solid #ccc;
	color: #ccc;
}

#Input_info_title>div {
	padding: 2rem;
	padding-left: 3em;
	font-weight: bold;
	max-height: 8rem;
	min-height: 8rem;
	font-size: 1.2em;
}

#Input_info_apply>div {
	padding: 2rem;
	display: flex;
	flex-direction: row;
	align-items: center;
	max-height: 8rem;
	min-height: 8rem;
}

#Input_info_apply>div>input {
	width: 15em;
	border-radius: 5px;
}

#Input_info_apply>span {
	color: #aaa;
}
#userlink {
    position: relative;
    display: inline-block;
}

#login_user_div {
    display: none;
    position: absolute;
    top: 75%;
    background: white;
    border: 1px solid #ccc;
    padding: 10px;
    z-index: 1000;
    display:flex;
    flex-direction:column;
    align-items:center;
}
#login_user_div button{
background:white;
padding:15px;
text-align:center;
border:none;
}
#cart_title_type_dv > span{
font-size:1.2rem;
color:#aaa;

}
#itemName_span {
	width: 30%;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        display: inline-block;
}
#cart_last_div > button{
	width:6em;
	height:3em;
}

</style>
</head>

<body>
<sec:authentication property="principal" var="principal" />

  <header>
    <div id="title_bar" class=" fixed-top">
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
	<input type="hidden" id="mno" value="${principal.userInfo.m_No}">
  </header>

 
		
  <main>
    <div id="main_container" class="d-flex flex-row align-items-center justify-content-center" >
      <div id="content_dv" >
        <div id="MyPage_content_name" > <h2 class="fw-bold ml-3">장바구니</h2></div>
        <div id=main_div>
        <div id="MyPage_content_container" class="border p-3 d-flex flex-column">
        
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
</body>

<script>
let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");
function formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
let deleteList = [];

let deleteListInsert = function(num){
	
	let ind = deleteList.indexOf(num);
	if(ind === -1){
	deleteList.push(num);
	}else{
		deleteList.splice(ind,1);
		
	}
	console.log(deleteList);
}

let pageNum = 1;

let itemCartPageRender = function(pageNum){
	$.ajax({
		  type: "get",
	        contentType: "application/json",
	        url: "/user/cart/items",
	        data: { 'pageNum': pageNum },
	        success:function(data){
	        console.log(data);
	        let $main_container = $("#MyPage_content_container").empty();
	        let $cart_content_top = $("<div>").appendTo($main_container);
	        let $cart_title_type_dv = $("<div>").attr('id',"cart_title_type_dv")
	        .css({'border-top':'3px solid black',
	        	'border-bottom':'3px solid black',
	        	'padding':'1em'})
	        .addClass("d-flex flex-row justify-content-evenly").appendTo($cart_content_top);
	        $("<span>").addClass("mx-5").text('상품').appendTo($cart_title_type_dv);
			$("<span>").text('일자').appendTo($cart_title_type_dv);
			$("<span>").text('개수').appendTo($cart_title_type_dv);
			$("<span>").text('금액').appendTo($cart_title_type_dv);
			
				let $cart_content_main = $("<div>").appendTo($main_container);
			data.objectList.forEach(function(item,index){
 				let $cart_item_content_dv = $("<div>").css('border-bottom','1px solid #ccc').on('click', function(){
					window.location.href='/product_detail?PRO_NO='  + item.pro_no;
				}).hover(
					    function(){
					    	$(this).css('background-color','#eee');
					    },
					    function(){
					    	$(this).css('background-color','white');
					    }).addClass("p-2 m-1 mx-3")
					    .appendTo($cart_content_main);
				
			$("<input>").attr({'type':'checkbox',"id":item.pro_no}).on('click',function(event){
				
				event.stopPropagation();
				
					 deleteListInsert(item.pro_no);
				
			}).appendTo($cart_item_content_dv);
			
			$("<img>").css({'width':'15%','max-height':'15%','margin-left':'1.5rem'})
			.attr('src',item.pro_bannerimg).appendTo($cart_item_content_dv);
			$("<span>").text(item.pro_name).attr("id","itemName_span").appendTo($cart_item_content_dv);
				$("<span>").text(item.i_date).appendTo($cart_item_content_dv);
				$("<span>").css("margin-left","10%").text(item.i_quantity+"개").appendTo($cart_item_content_dv);
				$("<span>").css("margin-left","10%")
				.text(formatNumber(item.i_quantity * item.pro_price)+'원').appendTo($cart_item_content_dv);

			});

			let $paging_dv = $("<div>").attr('id','paging_dv')
				.addClass('my-3 p-4 d-flex flex-row justify-content-center align-items-center')
				.appendTo($main_container);
				
					$("<button >").appendTo($paging_dv).text("<<").on("click",function(){
					
					pageNum = 1;
					itemCartPageRender(pageNum);
				
				});
				
				
				if (data.prev == true) {
					$("<button >").appendTo($paging_dv).text("<").on("click",function(){
						// 페이징 한단계 내리기
						pageNum = Math.floor((pageNum - 10 )/ 10)*10+1;
						itemCartPageRender(pageNum);
					
					});
				}
				for (let i = data.startPage; i <= data.endPage; i++) {
					  let $button = $("<button>").appendTo($paging_dv).text(i).on("click", function() {
					    pageNum=i;
					    itemCartPageRender(pageNum);
				
					  });
					  
					  if (i === data.pageNum) {
					    $button.css('background-color','#95857F').css('color','black');
					  }
					}
				
				if (data.next == true) {
					$("<button >").appendTo($paging_dv).text(">").on("click",function(){
						// 페이징 한단계 올리기
						pageNum = Math.floor((pageNum + 10 )/ 10)*10+1;
						itemCartPageRender(pageNum);
				
					});
				}
				
				$("<button >").appendTo($paging_dv).text(">>").on("click",function(){
					pageNum = Math.ceil((data.total * 1.0)/10);
					itemCartPageRender(pageNum);
					
				});
				let $cart_last_div = $("<div>").attr('id','cart_last_div').addClass("d-flex flex-row justify-content-center align-items-center")
					.appendTo($main_container);
					$("<button>").text('구매').addClass("btn btn-dark mx-2").on('click',function(){
						if(deleteList.length === 0){
							alert('구매하실 상품을 선택해주세요.');
							return false;
						}
						//구매 링크 
						//deleteList에 checkbox 내에 선택한 장바구니 제품들의 상품번호들이 있습니다. 
						//해당 상품번호와 회원 번호를 토대로 장바구니 item_cart테이블(기본키{상품번호, 회원번호})에서 
						//값을 가져와 구매 페이지 만드시면 될 듯합니다. 
						//만약 ajax로 하신다면 data: 에  JSON.stringify(deleteList) 그대로 넣어서 파싱(?)하시면 컨트롤러에서
						//@RequestBody List<Integer> deleteList로 그대로 받아서 활용가능합니다.
							$.ajax({
								type:'post', 
								url: '/purchase/'+$("#mno").val(),
								data: JSON.stringify(deleteList),
								contentType: 'text/html', 
								success: function(data) {
									$("#modal_close").click();
									
									if(data=="null"){
									return;
									}
									if($("#view_img").attr("src")==undefined){
									$("#content").prepend('<img src="'+data+'?'+(new Date().getTime())+'" alt="" id="view_img" class="w-75 d-inline-block mb-5 ">')
									$("#update_content").css("min-height","30px");
									img_update.val("true");
									return;
									}

									$("#view_img").attr("src","");

									$("#view_img").attr("src",data+"?"+(new Date().getTime()));

									img_update.val("true");
								},
								error: function(e) {
									alert("error:" + e);
								}
							});	
					}).appendTo($cart_last_div);

						$("<button>").text('삭제').addClass("btn btn-secondary mx-2").on('click',function(){
							if(deleteList.length === 0){
							
							return false;
						}
						deleteitemFromCart(deleteList);
					}).appendTo($cart_last_div);
	        },error:function(){
	        	console.log('실패');
	        }
	})
}
itemCartPageRender(1);
let deleteitemFromCart = function(deleteList){
	$.ajax({
		type: "delete",
		beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
		contentType: "application/json",
		url: "/user/cart/items",
		dataType:"text",
		data: JSON.stringify( deleteList ),
		success:function(data){
			console.log("성공");
			itemCartPageRender(pageNum);
		}
	});
	}
</script>

</html>