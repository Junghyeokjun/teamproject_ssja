$(document).ready(function () {
  let $home_user_bar = $("#home_user_bar").addClass("nav");
  let $sub_bar = $("#sub_bar");
  let $total_bar = $("#total_bar");
  
//  //csrf추가
  let token = $("meta[name='_csrf']").attr("content");
  let header = $("meta[name='_csrf_header']").attr("content");
  console.log(token);
  console.log(header);
  $(document).ajaxSend(function(e, xhr, options) {
      xhr.setRequestHeader(header, token);
  });


  //상단 카테고리 바 분류
  let $ul = $("<ul>").attr("id", "list_category").appendTo($home_user_bar);
  let $li1 = $("<li>").css("order", "1").text("가구").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);
  let $li2 = $("<li>").css("order", "2").text("패브릭").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);
  let $li3 = $("<li>").css("order", "3").text("인테리어").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);
  let $li4 = $("<li>").css("order", "4").text("주방용품").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);
  let $li5 = $("<li>").css("order", "5").text("생활용품").addClass("px-3 py-2").attr("id", "nav-links").appendTo($ul);

//카테고리 별 링크 변수
  const  link1_1 = "https://www.naver.com";
  const  link1_2 = "https://www.naver.com";
  const  link1_3 = "https://www.naver.com";
  const  link2_1 = "https://www.google.com";
  const  link2_2 = "https://www.google.com";
  const  link2_3 = "https://www.google.com";
  const  link3_1 = "https://www.daum.net";
  const  link3_2 = "https://www.daum.net";
  const  link3_3 = "https://www.daum.net";
  const link4_1 = "https://store.ohou.se/exhibitions/12390";
  const  link4_2 = "https://store.ohou.se/exhibitions/12390";
  const link4_3 = "https://store.ohou.se/exhibitions/12390";
  const link5_1 = "https://velog.io/";
  const  link5_2 = "https://velog.io/";
  const link5_3 = "https://velog.io/";

  
  let $link1_1 = $("<a>").attr("href", link1_1).addClass("btn").text("침대").css("text-decoration", "none");
  let $link1_2 = $("<a>").attr("href", link1_2).addClass("btn").text("수납").css("text-decoration", "none");
  let $link1_3 = $("<a>").attr("href", link1_3).addClass("btn").text("책상·의자").css("text-decoration", "none");

  let $link2_1 = $("<a>").attr("href", link2_1).addClass("btn").text("침구").css("text-decoration", "none");
  let $link2_2 = $("<a>").attr("href", link2_2).addClass("btn").text("커튼").css("text-decoration", "none");
  let $link2_3 = $("<a>").attr("href", link2_3).addClass("btn").text("홈").css("text-decoration", "none");

  let $link3_1 = $("<a>").attr("href", link3_1).addClass("btn").text("데코·식물").css("text-decoration", "none");
  let $link3_2 = $("<a>").attr("href", link3_2).addClass("btn").text("장식품").css("text-decoration", "none");
  let $link3_3 = $("<a>").attr("href", link3_3).addClass("btn").text("조명").css("text-decoration", "none");

  let $link4_1 = $("<a>").attr("href", link4_1).addClass("btn").text("식기류").css("text-decoration", "none");
  let $link4_2 = $("<a>").attr("href", link4_2).addClass("btn").text("조리도구").css("text-decoration", "none");
  let $link4_3 = $("<a>").attr("href", link4_3).addClass("btn").text("주방잡화").css("text-decoration", "none");
  let $link4_4 = $("<a>").attr("href", link4_3).addClass("btn").text("냄비·팬·솥").css("text-decoration", "none");

  let $link5_1 = $("<a>").attr("href", link5_1).addClass("btn").text("욕실").css("text-decoration", "none");
  let $link5_2 = $("<a>").attr("href", link5_2).addClass("btn").text("청소").css("text-decoration", "none");
  let $link5_3 = $("<a>").attr("href", link5_3).addClass("btn").text("세탁").css("text-decoration", "none");
  let $link5_4 = $("<a>").attr("href", link5_3).addClass("btn").text("생활잡화").css("text-decoration", "none");

  let $searchForm = $("#searchForm");
  let $searchIn = $("<input>").attr("placeholder", "search").attr("id", "searchIn").appendTo($searchForm);
  let $searchBtn = $("<button>").attr("id", "searchBtn").attr("type", "submit");

  let $searchImg=$("<img>").attr("src", "/images/utilities/search-32.png").attr("id", "searchImg").appendTo($searchBtn);//검색창 돋보기 이미지 경로
  $searchBtn.appendTo($searchForm);
 
$("#logo_toHome").attr("href", "/home");//로고 링크
  let $cartLink = $("#cart_link").attr("href", " http://www.naver.com");//카트 이미지 버튼 링크
  let $userLink = $("#user_link").attr("href", "/myPage");//로그인 이미지 버튼 링크
  let $cartImgPath = $("#cart_img").attr("src", "/images/utilities/cartShop.png");//카트 이미지 경로
  let $loginImgPath = $("#login_img").attr("src", "/images/utilities/login.png");//로그인 이미지 경로


  
  let $search_icon = $("#search_icon").append($("<img>").attr("src", "/images/utilities/sear.png").attr("id", "searchImg"))
  .on('click', function(){

    e.stopPropagation();

    window.location.href = "https://www.google.com";
  });

  
  
  

  
  
  //사이드 관련
  let $side_container1 = $("<button>").addClass("side_containers").text("BEST");
  let $side_container2 = $("<button>").addClass("side_containers").text("커뮤니티");
  let $side_containerEx = $("<button>").addClass("side_containers").text("카테고리");
  let $side_container3 = $("<button>").addClass("side_containers").text("고객문의");
  let $side_container4 = $("<button>").addClass("side_containers").text("공지사항");

  // 클릭 이벤트 추가
  $side_container1.on('click', function(e){
      e.stopPropagation();
      window.location.href = "https://www.google.com";
  });
  $side_container2.on('click', function(e){
      e.stopPropagation();
      window.location.href = "https://www.naver.com";
  });
  $side_container3.on('click', function(e){
      e.stopPropagation();
      window.location.href = "https://www.daum.net";
  });
  $side_container4.on('click', function(e){
      e.stopPropagation();
      window.location.href = "https://store.ohou.se/exhibitions/12390";
  });
  
  
  let $cate_dv = $("<div>").attr("id","cate_container");
  let $category1 = $("<button>").addClass("category").text("가구").on('click',function(e){
    e.stopPropagation();

    if ($(this).children().length === 0) {
      remove_ct_detail();  
      $category1.append($link1_1,$link1_2,$link1_3);
  } else {
    remove_ct_detail();  
  }
  });

  let $category2 = $("<button>").addClass("category").text("패브릭").on('click',function(e){
    e.stopPropagation();
    if ($(this).children().length === 0) {
      remove_ct_detail();  
      $category2.append($link2_1,$link2_2,$link2_3);
    } else {
      remove_ct_detail();  }   
  
  });

  let $category3 = $("<button>").addClass("category").text("인테리어").on('click',function(e){
    e.stopPropagation();
    if ($(this).children().length === 0) {
      remove_ct_detail();  
      $category3.append($link3_1,$link3_2,$link3_3);
    } else {
      remove_ct_detail();
  }    
 
  });

  let $category4 = $("<button>").addClass("category").text("주방용품").on('click',function(e){
    e.stopPropagation();
    if ($(this).children().length === 0) {
      remove_ct_detail();  
      $category4.append($link4_1,$link4_2,$link4_3, $link4_4);
    } else {
      remove_ct_detail();  }   

  });

  let $category5 = $("<button>").addClass("category").text("생활용품").on('click',function(e){
    e.stopPropagation();
    if ($(this).children().length === 0) {
      remove_ct_detail();  
      $category5.append($link5_1,$link5_2,$link5_3,$link5_4);
  } else {
    remove_ct_detail();  }    
  });
 
  
  
  $cate_dv.append($category1, $category2, $category3, $category4, $category5);
  $side_containerEx.text("카테고리").append($cate_dv);
  
  

  let remove_ct_detail = function(){
    $category1.children().remove();
    $category2.children().remove();
    $category3.children().remove();
    $category4.children().remove();
    $category5.children().remove();
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
    }else{
      $cate_dv.css('display','none');

    }
  });

  let $barbtn = $(".top_btn").addClass("btn btn-ouyline-dark").attr("id", "barbtn").text("☰");
  let side_h = $(window).height();
  let $side_bar = $("#side_bar").css("height",side_h);


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
    } else {
      showSideBar();
    }
  });


  $(window).on("click", function (event) {

    if ($side_bar.css("display") === "block" && !$(event.target).closest('#barbtn').length) {
      hideSideBar();
    }
  });


  $total_bar.mouseleave(function () {
    $sub_bar.css("display", "none");
  });


  $(window).on('scroll', function () {
    let $side_bar = $('#side_bar');
    let scrollPosition = $(this).scrollTop();
    let $windowWidth = window.innerWidth;
    if (scrollPosition < 100 && $windowWidth >=780) {

      $side_bar.css('top', '181px');
    } else {

      $side_bar.css('top', '95px');
    }
  });

  $ul.append($li1, $li2, $li3);
  $side_bar.append($side_container1,$side_containerEx, $side_container2,$side_container3,$side_container4);

  let browserHeight = window.innerHeight;
let currentPosition = window.scrollY;
});