$(document).ready(function () {
let $fir_ft = $("#first_footer");
let $sec_ft = $("#second_footer");
let $thd_ft = $("#third_footer");
let $footer = $("footer").css("background", "#ffffff");

$("<p>").text("상호명 : SSJA").attr("id", "biz_name").css("font-weight", "bold").appendTo($fir_ft);
$("<p>").text("대표 : 홍길동").appendTo($fir_ft);
$("<p>").text("주소 : 경기도 성남시 수정구 수정로 167(태평동) 6층").appendTo($fir_ft)
$("<p>").text("전화번호 : 123-456-789").appendTo($fir_ft);
$("<p>").text("(주)SSJA는 통신판매중개자로 거래 당사자가 아니므로, 판매자가 등록한 상품정보 및 거래 등에 대해 책임을 지지 않습니다. " +
  "단, (주)SSJA가 판매자로 등록 판매한 상품은 판매자로서 책임을 부담합니다.").appendTo($fir_ft);
$("<p>").text("© Copyright 2024. SSJA Co., Ltd. all rights reserved.").appendTo($fir_ft);

let $sec_ft_dv1 = $("<div>").attr("id", "s_f_d1");
let $sec_ft_dv2 = $("<div>").attr("id", "s_f_d2");

$("<a>").attr("href", "www.naver.com").text("회사 소개").appendTo($sec_ft_dv1);
$("<p>").text("채용정보").appendTo($sec_ft_dv1);
$("<p>").text("이용약관").appendTo($sec_ft_dv1);
$("<p>").text("개인정보 처리방침").css("font-weight", "bold").appendTo($sec_ft_dv1);
$("<p>").text("안전거래센터").appendTo($sec_ft_dv1);
$("<a>").attr("href", "www.naver.com").text("공지사항").appendTo($sec_ft_dv1);


$("<a>").attr("href", "www.naver.com").text("판매자 신청").appendTo($sec_ft_dv2);
$("<a>").attr("href", "www.naver.com").text("신고센터").appendTo($sec_ft_dv2);
$("<a>").attr("href", "www.naver.com").text("고객센터").appendTo($sec_ft_dv2);
$("<p>").text("배송파트너 안내").appendTo($sec_ft_dv2);
$("<p>").text("상품 광고 소개").appendTo($sec_ft_dv2);
$("<a>").attr("href", "www.naver.com").text("고객문의").appendTo($sec_ft_dv2);

$sec_ft.append($sec_ft_dv1, $sec_ft_dv2);

let footerHeight = $("footer").outerHeight();
let $thd_dv = $("<div>").appendTo($thd_ft);

$("<a>").attr("href", "www.naver.com").text("고객 문의 >").attr("id", "customer_QnA").appendTo($thd_dv);
 let span1= $("<span>").text("1234-5678").css("font-weight","bold").css("font-size","1.5em");
  let span2=$("<span>").text("09:00 ~ 18:00").css("font-weight","bold").css("margin-left","10px");
  $("<p>").append(span1, span2).appendTo($thd_dv);
    $("<p>").text("평일 : 전체 문의 상담").appendTo($thd_dv);
      $("<p>").text("토요일 :  배송 문의 상담").appendTo($thd_dv);
        $("<p>").text(" 일요일 : 휴무").appendTo($thd_dv);
          $("<button>").attr("onclick","location.href='http://m.goso.co.kr/'").attr("type","button").css("font-size","0.5em").text("소비자고발센터")
            .addClass("btn btn-outline-secondary btn-sm w-50").css("margin-bottom","10px").appendTo($thd_dv);
            $("<br>").appendTo($thd_dv);
          $("<button>").attr("onclick","location.href='www.naver.com'").attr("type","button").css("font-size","0.5em").text("이메일 문의")
            .addClass("btn btn-outline-secondary btn-sm w-50").appendTo($thd_dv);


$("#first_footer, #second_footer, #third_footer").css("height", footerHeight + "px");
});