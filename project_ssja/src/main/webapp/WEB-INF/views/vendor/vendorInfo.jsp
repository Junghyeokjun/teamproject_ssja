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
<script src="/js/barscript.js">
	
</script>
<script src="/js/footer.js">
	
</script>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<link href="/css/footerstyle.css?after" rel="stylesheet">
<link href="/css/barstyle.css?after" rel="stylesheet">

<link rel="stylesheet"
	href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">

<style>
#moreCommu_btn {
	background: white;
	border: none;
	font-weight: bold;
}

#main_container {
	margin-top: 3em;
	margin-bottom: 3em;
}

.v_category_btn {
	width: 100%;
	height: 2.5em;
	text-align: center;
	border: none;
	background: white;
	font-size: 1.3rem;
	font-weight: bold;
}

.select_vItems {
	background: #eee;
	font-weight: bold;
	border: none;
	margin-left: 1.5rem;
	width: 7em;
	border-radius: 4px;
	height: 2em;
}

#vInfo_content_title>a {
	text-decoration: none;
	color: #bbb;
}

select:focus {
	outline: none;
	border-color: none;
	background-color:white;
}

option:checked {
	background-color: #ddd;
	color: white;
}
option:hover{
background-color: #ddd;
cursor:pointer;
}
</style>
<link rel="stylesheet" href="/css/boardcontentpreview.css">
</head>

<body>
	<header>
		<div id="title_bar" class=" fixed-top">
			<div class="py-2 px-1" id="top-bar">

				<button type="toggle-button" class="top_btn" id="top_btn"></button>
				<a id="logo_toHome" href=""><img id="logo_img"
					src="/images/utilities/logoSSJA.png"></a>
				<form action="/logout" id=searchForm method="post"></form>
				<button id="search_icon"></button>
				<a id="cart_link"><img id="cart_img"></a>       
				  <a id="user_link" href="/login"><img id="login_img"></a>

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
		<input id="bizname_repo" type="hidden" value="${vendor }">

		<div id="main_container" class="d-flex flex-row">

			
			<div id="vendorInfo_content" class="d-flex flex-column"
				style="width: 100%; padding: 3em;">

				<!-- 판매자 명, 이름, 평균 별점 등 기타 정보 -->
				<div id="vInfo_content_title" class="m-3">
					<h2 style="font-weight: bold;">${vendor }</h2>

					<div class="d-flex flex-row align-items-center" id="vendor_etc_dv">
						<img src="/images/utilities/star_icon.jpg"
							style="width: 2.5rem; height: 2.5rem;">
					</div>
				</div>
				<div id="vInfo_content_etc"></div>

				<!-- 판매자 관련 상품 커뮤 -->
				<div id="vItem_relative_c_title"
					class="d-flex flex-row align-items-center my-5">
					<h4>유저 커뮤니티 스타일링</h4>
					<button id="moreCommu_btn" style="margin-left: auto;">더보기></button>
				</div>
				<div id="vItem_relative_c_content" class="d-flex flex-row">

				</div>

				<!-- 해당 판매자의 판매 상품 -->
				<div id="vItem_select" class="my-5">
					<h4>상품</h4>
					<span id="cate_span" class="py-3" style="margin-left: 2.5rem;min-height:3rem;"></span>
					<div class="d-flex flex-row align-items-center">

						<select class="select_vItems" id="select_vItem_order">
							<option value="0">가격</option>
							<option value="0 3">3 만원 이하</option>
							<option value="3 5">3~5 만원대</option>
							<option value="5 7">5~7 만원대</option>
							<option value="7 10">7~10 만원대</option>
							<option value="10 1000">10 만원 이상</option>
							
						</select> 
						<select class="select_vItems" id="select_vItem_price">

							<option value="pro_sellcount desc">인기순</option>
							<option value="countrv desc">리뷰 순</option>
							<option value="pro_wish desc">위시 순</option>
							<option value="pro_price asc">가격 낮은 순</option>
							<option value="pro_date desc">최신 순</option>
						</select>
					</div>

				</div>
				<div id="vItem_content"></div>

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
	let bizname = $("#bizname_repo").val();
	let start = 0;
	let end = 0;
	let order = "pro_sellcount desc";
	let total = 0;
	let moreNotExist = false;
	
	function formatNumber(num) {
	    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	let getVnerdorInfoTotal = function(bizname){
$.ajax({
			type : "get",
			url : "/api/vendor/totalInfo",
			data : {
				bizname : bizname
			},
			contentType : "application/json",
			success : function(data) {
				console.log(data);
				$("#vInfo_content_title").append(
						$("<a>").text("상품 : " + data.info.countItems + "개").attr("href", '/search?keyword=' + bizname));
				
				$("#vendor_etc_dv").append($("<span>").text(data.info.avgVendorEval).css('font-weight', 'bold'));

				let recent_post_wrap = $("#recent_post_wrap");
				if (data.commuList.length !== 0) {
					

					data.commuList.forEach(function(commu, idx) {
	
						let commuContDv = $("<div>").css({'width':'100%'}).append($("<div>").css({
									'width' : '100%',
									'height' : '200px',
									'background-image' : 'url('+ commu.b_img_path + ')',
									'background-size' : 'cover',
									'background-position' : 'center center',
									'border-radius' : '10px'
								}),
								$("<sapn>").text(commu.b_writer),
								$("<br>"),
								$("<sapn>").text(commu.b_title).css({'font-weight':'bold'})).hover(
										   function(){
										    	$(this).css({'cursor':'pointer','background-color':'#eee'});
										    },
										    function(){
										    	
										    	$(this).css({'cursor':'auto','background-color':'white'});
										    }
										).on('click', function(){
											window.location.href="/community/content/"+commu.b_no;
										})
						$('#vItem_relative_c_content').append(commuContDv);

					})
				}else{
					$('#vItem_relative_c_content').append(
							$("<div>").addClass('d-flex justify-content-center').append(
									$("<img>").attr("src",'/images/utilities/warn_icon.png')
									.css({'widht':'5rem','height':'5rem','margin-left':'3rem'}),
									$("<div>").text('현재 게시된 스타일링 글이 존재하지 않습니다.')
									.css({'color':'#ccc','font-size':'1.5rem','font-weight':'bold'})
							)
							)
				}
			}
		})
	}
	let pageNum=1;
	
	let getVendorItems = function(bizname, pageNum,start, end, order) {
	    $.ajax({
	        type: "get",
	        url: "/api/vendor/items",
	        data: {
	            bizname: bizname,
	            pageNum: pageNum,
	            start:start,
	            end:end, 
	            order:order
	        },
	        contentType: "application/json",
	        success: function(data) {
	            console.log(data);
	            if(data.length === 0 ){
	            	moreNotExist = true;
	            	return;
	            }
	            if(data.length < 16){
	            	moreNotExist = true;
	            }
	            
	            let $list_content_dv = $("#vItem_content").addClass("d-flex flex-column");
	            let $row;

	            data.forEach(function(e, index) {
	                if (index % 4 === 0) {
	                    $row = $("<div>").addClass("d-flex flex-row w-100 mb-5"); 
	                    $list_content_dv.append($row); 
	                }

	                let $item_content_dv = $("<div>").addClass("item-content-div")
	                    .css({ 
	                        "max-width": "25%",
	                        "min-width": "25%",
	                        "height": "20em",
	                        "margin-bottom": "1em"
	                    })
	                    .hover(
	                        function() {
	                            $item_img_dv.css('background-size', '115%');
	                            $(this).css('background-color', 'white').css('cursor', 'pointer');
	                            $item_title_dv.css({ "text-overflow": "clip", "white-space": "normal" });
	                        },
	                        function() {
	                            $item_img_dv.css('background-size', 'cover');
	                            $(this).css('background-color', 'white').css('cursor', 'auto');
	                            $item_title_dv.css({ "text-overflow": "ellipsis", "white-space": "nowrap" });
	                        }
	                    ).on('click', function() {
	                        window.location.href = '/product_detail?PRO_NO=' + e.pro_NO;
	                    });

	                let $item_img_dv = $("<div>").addClass("item-img-div mx-1")
	                    .css({
	                        "max-width": "100%",
	                        "min-height": "55%",
	                        "background-image": 'url(' + e.pro_BANNERIMG + ')',
	                        "background-size": "cover",
	                        "background-position": "center",
	                        "overflow": "hidden"
	                    });

	                let $item_info_dv = $("<div>").addClass("m-0 mx-1").attr('id', 'item-info-div')
	                    .css({ 
	                        "margin": "1em", 
	                        "width": "100%", 
	                        "height": "10em", 
	                        "padding-bottom": "1em", 
	                        "padding": "1em"
	                    });

	                let $item_title_dv = $("<div>").addClass("item-title-div").attr("id", 'item_title_dv')
	                    .css({  
	                        "font-size": "1em",  
	                        "overflow": "hidden",  
	                        "text-overflow": "ellipsis",  
	                        "white-space": "nowrap"
	                    })
	                    .append($("<p>").text(e.pro_NAME));

	                let $item_bizname_dv = $("<div>").addClass("item-bizname-div")
	                    .text(e.pro_BIZNAME)
	                    .css({ 
	                        "font-weight": "bold", 
	                        "font-size": "0.9em", 
	                        "margin-bottom": "0.5em" 
	                    });

	                let $item_price_dv = $("<div>").addClass("item-price-div")
	                    .text(formatNumber(e.pro_PRICE) + "원")
	                    .css({ "margin-left": "auto", "margin-right": "1em" });

	                let $item_review_wish_dv = $("<div>").addClass("d-flex flex-row justify-content-between")
	                    .attr('id', 'item-review-wish-div')
	                    .append(
	                        $("<div>").append(
	                            $("<img>").attr("src", "/images/utilities/star_icon.jpg").css("width", "1.5em"),
	                            $("<span>").text(e.avgeval)
	                        ),
	                        $("<div>").append(
	                            $("<span>").text(e.pro_WISH).css("color", "#f06575"),
	                            $("<img>").attr("src", "/images/utilities/wish_icon.png").css("width", "1.5em")
	                                .on("click", function(event) {
	                                    event.preventDefault();
	                                    let countwish = wish_click(e.pro_NO);
	                                    $(this).prev("span").text(countwish);
	                                    return false; // 상품상세 링크 이동 방지
	                                })
	                        )
	                    );

	                $item_info_dv.append($item_title_dv, $item_bizname_dv, $item_price_dv, $item_review_wish_dv);
	                $item_content_dv.append($item_img_dv, $item_info_dv);
	                $row.append($item_content_dv);
	            });
	        },
	        error: function(xhr, status, error) {
	            console.error("Error fetching vendor items:", error);
	        }
	    });
	}


	getVnerdorInfoTotal(bizname);
	getVendorItems(bizname, pageNum,start, end, order);
	
	$(document).ready(function() {
	  
	    $(window).scroll(function() {
	     
	    	if(moreNotExist){return;}
	    	
	        let scrollHeight = $(document).height();
	        let scrollPosition = $(window).height() + $(window).scrollTop();

	       
	        if (scrollPosition >= scrollHeight-400) {
	            pageNum++; 
	            getVendorItems(bizname, pageNum,start, end, order); 
	        }
	    });
	});
	$("#select_vItem_order").change(function() {
        let selectedValue = $(this).val();
        if(selectedValue == 0){return;}
        moreNotExist = false;
        
        if (selectedValue) {
            let range = selectedValue.split(" ");
            start = parseInt(range[0]) * 10000; 
            end = parseInt(range[1] || 0) * 10000;
        }
        $("#vItem_content").empty();
        pageNum = 1;
        getVendorItems(bizname, pageNum,start, end, order);
    });
	$("#select_vItem_price").change(function() {
        let selectedValue = $(this).val();
        if(selectedValue == 0){return;}
        moreNotExist = false;
        
        if (selectedValue) {
          order = selectedValue;
        }
        $("#vItem_content").empty();
        pageNum = 1;
        getVendorItems(bizname, pageNum,start, end, order);
    });
	
</script>


</html>