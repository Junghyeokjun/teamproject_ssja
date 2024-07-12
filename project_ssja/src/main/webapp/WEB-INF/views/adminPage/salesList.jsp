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
<script src="/js/barscript_admin.js"></script>
<script src="/js/footer.js"></script>
<link href="/css/footerstyle.css?after" rel="stylesheet">
<link href="/css/barstyle_admin.css?after" rel="stylesheet">
<link rel="stylesheet"
	href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@4.4.3/dist/chart.umd.min.js"></script>
	<style>	
	#adminPage_Info_Select{
padding:0;
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
				onclick="location.href='/adminPage/ordersList'">주문 목록</button>
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
					<h2 id="AdminPageTitle">매출 현황</h2>
				</div>
			
				<div id="adminInfo_dv3" class="my-3 mx-3"
					style="display: flex; flex-wrap: nowrap; justify-content: center;">
					<div style="flex: 1; margin-right: 10px; text-align: center;">
						<h4 class="mx-5 my-3">
							주간 매출
							<p style="font-size: 0.8em; display: inline;">(최근 4주차)</p>
						</h4>
						<canvas id="weeklySalesChart" width="50" height="50"></canvas>
					</div>
					<div
						style="flex: 1; margin-left: 10px; margin-right: 10px; text-align: center;">
						<h4 class="mx-5 my-3">월 매출</h4>
						<canvas id="monthlySalesChart" width="50" height="50"></canvas>
					</div>
					<div style="flex: 1; margin-left: 10px; text-align: center;">
						<h4 class="mx-5 my-3">년 매출</h4>
						<canvas id="yearlySalesChart" width="50" height="50"></canvas>
					</div>
				</div>
				<div style="display: flex; justify-content: flex-end; margin-right:3em;">
					<!-- 매출엑셀버튼 -->
				<button type="button" id="salesListUp" class="btn " style="margin-left:auto;color:white;background-color:#95857F;">
					다운로드 .xsl <img src="/images/utilities/excel_icon.png" alt="Excel 아이콘" onclick="">
				</button>
				</div>
			</div>
		</div>
<script>
        document.addEventListener('DOMContentLoaded', function() {
            var weeklySalesString = '${weeklySales}';
            console.log('Original string:', weeklySalesString); 

            // 1. 문자열에서 =를 :로 대체합니다.
            weeklySalesString = weeklySalesString.replace(/=/g, ':');

            // 2. DAYSALES 키와 값을 적절히 변경합니다.
            weeklySalesString = weeklySalesString.replace(/WEEK:/g, '"WEEK":"');
            weeklySalesString = weeklySalesString.replace(/, WEEKLYTOTALPAY:/g, '", "WEEKLYTOTALPAY":');

            // 최종적으로 문자열을 JSON 형식으로 변환합니다.
            console.log('Formatted string:', weeklySalesString);

            try {
                // JSON 형식의 문자열을 JavaScript 객체로 파싱합니다.
                var weeklySales = JSON.parse(weeklySalesString);
                console.log('Parsed dailySales:', weeklySales);

                // 날짜와 매출 데이터 추출
                var dates = weeklySales.map(item => item.WEEK); // 날짜만 추출
                var totalPays = weeklySales.map(item => item.WEEKLYTOTALPAY);
                console.log('Dates:', dates);
                console.log('Total Pays:', totalPays);

                // Chart.js를 사용한 그래프 설정
                var ctx = document.getElementById('weeklySalesChart').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: dates,
                        datasets: [{
                            label: '주간매출액',
                            data: totalPays,
                            backgroundColor: "#8e5ea2"
                        }]
                    },
                    options: {
                        scales: {
                            xAxes: [{
                                scaleLabel: {
                                    display: true,
                                    labelString: '주차' // X 축 레이블 설정
                                }
                            }],
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true // Y 축 시작값을 0으로 설정
                                }
                            }]
                        }
                    }
                });
            } catch (error) {
                console.error('Error parsing JSON:', error);
            }
        });
    </script>
		<script>
		document.addEventListener('DOMContentLoaded', function() {
		    var monthlySalesString = '${monthlySales}';

		    // 1. 문자열에서 =를 :로 대체합니다.
		    monthlySalesString = monthlySalesString.replace(/=/g, ':');

		    // 2. DAYSALES 키와 값을 적절히 변경합니다.
		    monthlySalesString = monthlySalesString.replace(/MONTH:/g, '"MONTH":"');
		    monthlySalesString = monthlySalesString.replace(/, MONTHLYTOTALPAY:/g, '", "MONTHLYTOTALPAY":');
		    
		    // 3. 최종적으로 문자열을 JSON 형식으로 변환합니다.
		    console.log(monthlySalesString); 

		    try {
		        // JSON 형식의 문자열을 JavaScript 객체로 파싱합니다.
		        var monthlySales = JSON.parse(monthlySalesString);

		        // 날짜와 매출 데이터 추출
		        var months = monthlySales.map(item => item.MONTH.split(' ')[0]); // 날짜만 추출
		        var totalmonthsPays = monthlySales.map(item => item.MONTHLYTOTALPAY); // 월매출액 추출

		        // Chart.js를 사용한 그래프 설정
		        var ctx = document.getElementById('monthlySalesChart').getContext('2d');
		        var myChart = new Chart(ctx, {
		            type: 'bar',
		            data: {
		                labels: months,
		                datasets: [{
		                    label: '월매출액',
		                    data: totalmonthsPays,
		                    backgroundColor: "#8e5ea2"
		                }]
		            },
		            options: {
		                scales: {
		                    yAxes: [{
		                        ticks: {
		                            beginAtZero: true,
		                            callback: function(value, index, values) {
		                                // 값이 숫자인 경우에만 포맷팅
		                                if (Number.isInteger(value)) {
		                                    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		                                } else {
		                                    return value;
		                                }
		                            }
		                        }
		                    }]
		                }
		            }
		        });
		    } catch (error) {
		        console.error('Error parsing JSON:', error);
		    }
		});

    </script>
		<script>
     document.addEventListener('DOMContentLoaded', function() {
         var yearlySalesString = '${yearlySales}';
         console.log(yearlySalesString); 

         // 1. 문자열에서 =를 :로 대체합니다.
         yearlySalesString = yearlySalesString.replace(/=/g, ':');


         // 2. DAYSALES 키와 값을 적절히 변경합니다.
         yearlySalesString = yearlySalesString.replace(/YEARLYTOTALPAY:/g, '"YEARLYTOTALPAY":"');
         yearlySalesString = yearlySalesString.replace(/, YEAR:/g, '", "YEAR":');
         
         // 3. 최종적으로 문자열을 JSON 형식으로 변환합니다.
         console.log(yearlySalesString); 

         try {
             // JSON 형식의 문자열을 JavaScript 객체로 파싱합니다.
             var yearlySales = JSON.parse(yearlySalesString);

             // 날짜와 매출 데이터 추출
            var years = yearlySales.map(item => item.YEAR);
             var totalYearsPays = yearlySales.map(item => item.YEARLYTOTALPAY);

             // Chart.js를 사용한 그래프 설정
             var ctx = document.getElementById('yearlySalesChart').getContext('2d');
             var myChart = new Chart(ctx, {
                 type: 'bar',
                 data: {
                     labels: years,
                     datasets: [{
                         label: '년매출액',
                         data: totalYearsPays,
                         backgroundColor: "#8e5ea2"
                     }]
                 }
             });
         } catch (error) {
             console.error('Error parsing JSON:', error);
         } 
     });
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
	 
  <script src="/js/login_user_tab.js"> </script>
  <script src="/js/user_cart_tab.js"> </script>
</sec:authorize>
	
	<script>
	$("#salesListUp").on('click', function(){
		downloadExcel();
	});
	
	function downloadExcel() {
	    var downloadUrl = "/adminPage/download/profit";
	    
	    window.open(downloadUrl, "_blank");
	}
	</script>
</body>
</html>