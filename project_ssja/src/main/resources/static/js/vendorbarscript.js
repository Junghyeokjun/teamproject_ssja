$(document).ready(function () {
  let $home_user_bar = $("#home_user_bar").addClass("nav");
  let $sub_bar = $("#sub_bar");
  let $total_bar = $("#total_bar");
  
//  //csrf추가
  let token = $("meta[name='_csrf']").attr("content");
  let header = $("meta[name='_csrf_header']").attr("content");
  /*$(document).ajaxSend(function(e, xhr, options) {
      xhr.setRequestHeader(header, token);
  });*/  

// html 상단에 받은 jstl 데이터 principal을 받는 변수  
  let getPrincipal = $("#getPrincipal").val();
  
  //상단 카테고리 바 분류
  let $ul = $("<ul>").attr("id", "list_category").appendTo($home_user_bar);
  let $li1 = $("<li>").css("order", "1").text("가구").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);
  let $li2 = $("<li>").css("order", "2").text("패브릭").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);
  let $li3 = $("<li>").css("order", "3").text("인테리어").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);
  let $li4 = $("<li>").css("order", "4").text("주방용품").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);
  let $li5 = $("<li>").css("order", "5").text("생활용품").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);

//카테고리 별 링크 변수
  const  link1_1 = "/product/search?category=11";
  const  link1_2 = "/product/search?category=12";
  const  link1_3 = "/product/search?category=13";
  const  link2_1 = "/product/search?category=21";
  const  link2_2 = "/product/search?category=22";
  const  link2_3 = "/product/search?category=23";
  const  link3_1 = "/product/search?category=31";
  const  link3_2 = "/product/search?category=32";
  const  link3_3 = "/product/search?category=33";
  const link4_1 = "/product/search?category=41";
  const  link4_2 = "/product/search?category=42";
  const link4_3 = "/product/search?category=43";
  const link4_4 = "/product/search?category=44";
  const link5_1 = "/product/search?category=51";
  const  link5_2 = "/product/search?category=52";
  const link5_3 = "/product/search?category=53";
  const link5_4 = "/product/search?category=54";

  
  let $link1_1 = $("<a>").attr("href", link1_1).addClass("btn w-100").text("침대").css("text-decoration", "none");
  let $link1_2 = $("<a>").attr("href", link1_2).addClass("btn w-100").text("수납").css("text-decoration", "none");
  let $link1_3 = $("<a>").attr("href", link1_3).addClass("btn w-100").text("책상·의자").css("text-decoration", "none");

  let $link2_1 = $("<a>").attr("href", link2_1).addClass("btn w-100").text("침구").css("text-decoration", "none");
  let $link2_2 = $("<a>").attr("href", link2_2).addClass("btn w-100").text("커튼").css("text-decoration", "none");
  let $link2_3 = $("<a>").attr("href", link2_3).addClass("btn w-100").text("홈").css("text-decoration", "none");

  let $link3_1 = $("<a>").attr("href", link3_1).addClass("btn w-100").text("데코·식물").css("text-decoration", "none");
  let $link3_2 = $("<a>").attr("href", link3_2).addClass("btn w-100").text("장식품").css("text-decoration", "none");
  let $link3_3 = $("<a>").attr("href", link3_3).addClass("btn w-100").text("조명").css("text-decoration", "none");

  let $link4_1 = $("<a>").attr("href", link4_1).addClass("btn w-100").text("식기류").css("text-decoration", "none");
  let $link4_2 = $("<a>").attr("href", link4_2).addClass("btn w-100").text("조리도구").css("text-decoration", "none");
  let $link4_3 = $("<a>").attr("href", link4_3).addClass("btn w-100").text("주방잡화").css("text-decoration", "none");
  let $link4_4 = $("<a>").attr("href", link4_3).addClass("btn w-100").text("냄비·팬·솥").css("text-decoration", "none");

  let $link5_1 = $("<a>").attr("href", link5_1).addClass("btn w-100").text("욕실").css("text-decoration", "none");
  let $link5_2 = $("<a>").attr("href", link5_2).addClass("btn w-100").text("청소").css("text-decoration", "none");
  let $link5_3 = $("<a>").attr("href", link5_3).addClass("btn w-100").text("세탁").css("text-decoration", "none");
  let $link5_4 = $("<a>").attr("href", link5_3).addClass("btn w-100").text("생활잡화").css("text-decoration", "none");

  let $searchForm = $("#searchForm");
  let $searchIn = $("<input>").attr("placeholder", "search").attr("id", "searchIn").appendTo($searchForm);
  let $searchBtn = $("<button>").attr("id", "searchBtn").attr("type", "submit");

  let $searchImg=$("<img>").attr("src", "/images/utilities/search-32.png").attr("id", "searchImg").appendTo($searchBtn);//검색창 돋보기 이미지 경로
  $searchBtn.appendTo($searchForm);
 
  $("#logo_img").parent().attr('href','/home');
  let $cartLink = $("#cart_link").attr("href", " http://www.naver.com");//카트 이미지 버튼 링크
  let $cartImgPath = $("#cart_img").attr("src", "/images/utilities/cartShop.png");//카트 이미지 경로
  let $loginImgPath = $("#login_img").attr("src", "/images/utilities/login.png");//로그인 이미지 경로

  let $userLink = $("#user_link").attr("href", "/myPage");//로그인 이미지 버튼 링크

  
  let $search_icon = $("#search_icon").append($("<img>").attr("src", "/images/utilities/sear.png").attr("id", "searchImg"))
  .on('click', function(){

    e.stopPropagation();

    window.location.href = "https://www.google.com";
  });
  //==============================
  

  if ($("#searchForm input[name='_csrf']").length === 0) {
      $("#searchForm").attr('action','/logout').attr('method','post').append($("<input>")
          .attr('type', 'hidden')
          .attr('name', '_csrf')
          .attr('value', token));
  }

  $(document).ajaxSend(function(e, xhr, options) {
      xhr.setRequestHeader(header, token);
  });
	
/*  $("#searchIn").on('click', function() {
      $.ajax({
          type: "POST",
          url: "/logout",
          beforeSend: function(xhr) {
              xhr.setRequestHeader(header, token);
          },
          dataType:'text',
          success: function(data) {
        	// window.location.href="/";
        	  console.log(data);
        	  console.log('로그아웃 눌림');
          },
          error: function(xhr, status, error) {
              console.error(xhr.responseText);
          }
      });
  });*/
  

  //======================
  
  //사이드 관련
  let $side_container1 = $("<button>").addClass("side_containers align-middle").text("회원정보");
  let $side_containerEx = $("<button>").addClass("side_containers align-middle").text("상품 관리");
  let $side_container2 = $("<button>").addClass("side_containers align-middle").text("문의 요청 내역");

  const sideLink1 = "/myPage";
  const sideLink2 = "/vendor/product/write";
  const sideLink3 = "/vendor/product/list";
  const sideLink4 = "/vendor/question/20";
  // 확장되는 사이드 영역
  // 사용은 안하지만 해당 부분은 나중을 위해 참조용으로 남겨두기

  
  // 클릭 이벤트 추가
  $side_container1.on('click', function(e){
      e.stopPropagation();
      window.location.href = sideLink1;
  });
  $side_container2.on('click', function(e){
      e.stopPropagation();
      window.location.href = sideLink4;
  });
//  $side_container3.on('click', function(e){
//      e.stopPropagation();
//      window.location.href = "https://www.daum.net";
//  });
//  $side_container4.on('click', function(e){
//      e.stopPropagation();
//      window.location.href = "https://store.ohou.se/exhibitions/12390";
//  });
  
  
  
  let $cate_dv = $("<div>").attr("id","cate_container");
  
  let $category1 = $("<button>").addClass("category align-middle").text("상품 등록").on('click',function(e){
	    e.stopPropagation();
	    window.location.href = sideLink2;
  });
  
  let $category2 = $("<button>").addClass("category align-middle").text("등록 상품 목록").on('click',function(e){
	    e.stopPropagation();
	    window.location.href = sideLink3;
  });
  
//  let $category1 = $("<button>").addClass("category").text("가구").on('click',function(e){
//    e.stopPropagation();
//
//    if ($(this).children().length === 0) {
//      remove_ct_detail();  
//      $category1.append($link1_1,$link1_2,$link1_3);
//  } else {
//    remove_ct_detail();  
//  }
//  });
//
//  let $category2 = $("<button>").addClass("category").text("패브릭").on('click',function(e){
//    e.stopPropagation();
//    if ($(this).children().length === 0) {
//      remove_ct_detail();  
//      $category2.append($link2_1,$link2_2,$link2_3);
//    } else {
//      remove_ct_detail();  }   
//  
//  });
//
//  let $category3 = $("<button>").addClass("category").text("인테리어").on('click',function(e){
//    e.stopPropagation();
//    if ($(this).children().length === 0) {
//      remove_ct_detail();  
//      $category3.append($link3_1,$link3_2,$link3_3);
//    } else {
//      remove_ct_detail();
//  }    
// 
//  });
//
//  let $category4 = $("<button>").addClass("category").text("주방용품").on('click',function(e){
//    e.stopPropagation();
//    if ($(this).children().length === 0) {
//      remove_ct_detail();  
//      $category4.append($link4_1,$link4_2,$link4_3, $link4_4);
//    } else {
//      remove_ct_detail();  }   
//
//  });
//
//  let $category5 = $("<button>").addClass("category").text("생활용품").on('click',function(e){
//    e.stopPropagation();
//    if ($(this).children().length === 0) {
//      remove_ct_detail();  
//      $category5.append($link5_1,$link5_2,$link5_3,$link5_4);
//  } else {
//    remove_ct_detail();  }    
//  });
 
  
  
//  $cate_dv.append($category1, $category2, $category3, $category4, $category5);
  $cate_dv.append($category1, $category2);
  $side_containerEx.text("상품 카테고리").append($cate_dv);
  

  let remove_ct_detail = function(){
    $category1.children().remove();
    $category2.children().remove();
//    $category3.children().remove();
//    $category4.children().remove();
//    $category5.children().remove();
  }


  $li1.mouseenter(function () {
    $sub_bar.css("display", "block");
    $("#sub_bar").children().remove();
    let $subUl = $("<ul>").addClass("sub-nav").appendTo($sub_bar);
    let $subLi1 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link1_1.appendTo($subLi1);
    let $subLi2 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link1_2.appendTo($subLi2);
    let $subLi3 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link1_3.appendTo($subLi3);
  });
  
  $li2.mouseenter(function () {
    $sub_bar.css("display", "block");
    $("#sub_bar").children().remove();
    let $subUl = $("<ul>").addClass("sub-nav").appendTo($sub_bar);
    let $subLi1 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link2_1.appendTo($subLi1);
    let $subLi2 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link2_2.appendTo($subLi2);
    let $subLi3 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link2_3.appendTo($subLi3);

  });
  $li3.mouseenter(function () {
    $sub_bar.css("display", "block");
    $("#sub_bar").children().remove();
    let $subUl = $("<ul>").addClass("sub-nav").appendTo($sub_bar);
    let $subLi1 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link3_1.appendTo($subLi1);
    let $subLi2 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link3_2.appendTo($subLi2);
    let $subLi3 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link3_3.appendTo($subLi3);

  });
  $li4.mouseenter(function () {
    $sub_bar.css("display", "block");
    $("#sub_bar").children().remove();
    let $subUl = $("<ul>").addClass("sub-nav").appendTo($sub_bar);
    let $subLi1 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link4_1.appendTo($subLi1);
    let $subLi2 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link4_2.appendTo($subLi2);
    let $subLi3 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link4_3.appendTo($subLi3);
    let $subLi4 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link4_4.appendTo($subLi4);

  });

  $li5.mouseenter(function () {
    $sub_bar.css("display", "block");
    $("#sub_bar").children().remove();
    let $subUl = $("<ul>").addClass("sub-nav").appendTo($sub_bar);
    let $subLi1 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link5_1.appendTo($subLi1);
    let $subLi2 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link5_2.appendTo($subLi2);
    let $subLi3 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link5_3.appendTo($subLi3);
    let $subLi4 = $("<li>").addClass("sub-px-3").appendTo($subUl);
    $link5_4.appendTo($subLi4);

  });

  $side_containerEx.on('click', function(e){
    e.stopPropagation();
    if($cate_dv.css('display') === "none"){
      $cate_dv.css('display','flex');
      $side_containerEx.css("color","brown");
    }else{
      $cate_dv.css('display','none');
      $side_containerEx.css("color","black");
    }
  });

  let $barbtn = $(".top_btn").addClass("btn btn-outline-dark").attr("id", "barbtn").text("☰");
  let side_h = $(window).height();
  let $side_bar = $("#side_bar").css("height",side_h);
  

	//top 값을 일일히 수정해줘야 하는 문제점이 발생
	//	-> 자동으로 top 값을 가져올 수 있도록 함수 제작
	
	function sidebarTop(){
		  let headerHeight = $('header').outerHeight();
		  
		  // 템플릿 리터럴을 사용할 때 작은 따옴표가 아닌 백틱()을 사용해야 함
		  // 템플릿 리터럴 :  백틱(`)으로 둘러싸인 문자열에서 ${} 구문을 사용하여 변수나 표현식을 삽입할 수 있는 JavaScript의 문자열 표기법
		  // JSP의 EL 문법과는 형태만 같지, 다른 것이므로 주의 요망
		  $side_bar.css('top',`${headerHeight}px`); 
	}
	
	sidebarTop();
	
	$(window).resize(sidebarTop);
  
  

  function hideSideBar() {
    $side_bar.css("animation", "slideLeftFromIn 0.3s ease-in-out forwards");
    setTimeout(function () {
      $side_bar.css("display", "none");
    }, 300);
  }
  function showSideBar() {
    $side_bar.css("animation", "slideInFromLeft 0.3s ease-in-out forwards");
    $side_bar.css("display", "block");
  }


  $barbtn.on("click", function () {

    if ($side_bar.css("display") === "block") {
    	hideSideBar();
    	// 포커스 상태 해제
    	$barbtn.removeClass("active");
    } else {
		showSideBar();
		$barbtn.addClass("active");
		
		let currentUrl = window.location.href;
		console.log("currentUrl : " + currentUrl);
		//
		if (currentUrl.includes(sideLink1)) {
			$side_container1.addClass("active");
		} else if (currentUrl.includes(sideLink2)) {
			$side_containerEx.css("color","brown");
			$category1.addClass("active");
		} else if (currentUrl.includes(sideLink3)) {
			$side_containerEx.css("color","brown");
			$category2.addClass("active");
		} else if (currentUrl.includes(sideLink4)) {
			$side_container2.addClass("active");
		}
		
    }
  });


  $(window).on("click", function (event) {

    if ($side_bar.css("display") === "block" && !$(event.target).closest('#barbtn').length) {
      hideSideBar();
    }
  });


  function hideSubBar(e) {
	    if (!$(e.relatedTarget).closest($total_bar).length && 
	            !$(e.relatedTarget).closest($sub_bar).length) {
	        e.stopPropagation();
	        $sub_bar.css("display", "none");
	    }
	}

//	$total_bar.on('mouseleave', hideSubBar);
//	$sub_bar.on('mouseleave', hideSubBar);
	
  $(window).on('scroll', function () {
    let $side_bar = $('#side_bar');
    let scrollPosition = $(this).scrollTop();
    let $windowWidth = window.innerWidth;
    $side_bar.css('top', '125px');
//    if (scrollPosition < 100 && $windowWidth >=780) {
//
//      $side_bar.css('top', '125px');
//    } else {
//
//      $side_bar.css('top', '95px');
//    }
  });
  
  
// 상품 관리 목록 추가
  $ul.append($li1, $li2, $li3);
  
// 사이드 바에 해당 컨테이너 추가
  $side_bar.append($side_container1,$side_containerEx,$side_container2);

  let browserHeight = window.innerHeight;
  let currentPosition = window.scrollY;
	

// 판매자 상호명 가져오기  
  
	let $vendorData = $('#vendorData').val();
	console.log("$vendorData : " + $vendorData);
	
	// value 기본값은 "" 이다. 빈 문자열이 아니라는 의미는, 값이 들어갔다는 의미이다.
	if($vendorData != ""){
		// 값이 들어온 상태라면, 판매자의 상호명을 노출시키는 ajax 실행
		$.ajax({
			type : "POST",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			url : "/api/vendor/vendorInfo",
			data : { 'vendorData' : $vendorData },
			success : function(response){
				console.log(response);
				if($vendorData == response.id){
					$('.vendorNames').append(' [ ' +  response.v_bizName + ' ]');
				}else{
					console.log("warning : " + vendorData + "와(과) 일치하지 않음");
				}
			},
			error : function(xhr, status, error){
				alert("판매자 정보를 가져오기가 실패했습니다");
				console.error(xhr.responseText);
			}
		});
	}
  
});