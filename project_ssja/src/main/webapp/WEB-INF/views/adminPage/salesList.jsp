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
<link href="/css/barstyle.css?after" rel="stylesheet">

<link rel="stylesheet"
	href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">
<style>
@font-face {
	font-family: 'fonts';
	src: url("https://webfontworld.github.io/NanumSquare/NanumSquare.css")
		format('font1');
}

body {
	font-family: 'fonts', NanumSquare;
	background-color: #f7f0e8;
}

#logo_img {
	width: 3.5em;
	height: 3em;
}

.MyPage_btn {
	background-color: white;
	padding: 20px;
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

#event_banners {
	width: 100% auto;
	height: 30em;
}

#title_best_conner  button {
	width: 3em;
	background-color: white;
	border: none;
	font-size: 2.5em;
	color: #aaa;
}

#title_best_conner  button:hover {
	color: #333;
}

#title_best_conner {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
}

#show_more_bestItem {
	background-color: white;
	with: 100%;
	border: 1px solid #ddd;
	height: 5em;
}

h2, h4, p {
	display: inline;
	margin: 0;
	margin-right: 10px;
}

.table {
	width: 100%; /* 테이블이 페이지 전체 너비를 차지하도록 설정 */
	text-align: center; /* 테이블 텍스트 중앙 정렬 */
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@4.4.3/dist/chart.umd.min.js"></script>
</head>
<body>
	<header>
		<div id="title_bar" class=" fixed-top">
			<div class="py-2 px-1" id="top-bar">
				<button type="toggle-button" class="top_btn" id="top_btn"></button>
				<a id="logo_toHome" href=""><img id="logo_img"
					src="/images/utilities/logoSSJA.png"></a>
			</div>
		</div>
		<nav id="total_bar"></nav>
	</header>
	<div id="side_bar">
		<div id="side_links" class="w-100"></div>
	</div>
	<main>
	<br>
    <div class="row">
    <div class="col-sm-4 mb-3">
        <div class="card text-center" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">오늘 총 매출액</h5>
                <p class="card-text"></p>
            </div>
        </div>
    </div>

    <div class="col-sm-4 mb-3">
        <div class="card text-center" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">오늘 주문 건수</h5>
                <p class="card-text"></p>
            </div>
        </div>
    </div>

     <div class="col-sm-4 mb-3">
        <div class="card text-center" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">오늘 가입자 수</h5>
                <p class="card-text"></p>
            </div>
        </div>
    </div>
</div>
    

		<br> <input type="date" id="salesDateInput">
		<button id="fetchSalesData">조회</button>
		<div id="salesDataResult">
			<h2>매출 데이터</h2>
			<p id="totalSales"></p>
			<p id="transactionCount"></p>
		</div>
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<div class="col">
				<h1>일일매출(최근 일주일)</h1>
				<canvas id="dailySalesChart" width="400" height="200"></canvas>
			</div>
			<div class="col">
				<h1>월매출</h1>
				<canvas id="monthlySalesChart" width="400" height="200"></canvas>
			</div>
			<div class="col">
				<h1>년매출</h1>
				<canvas id="yearlySalesChart" width="400" height="200"></canvas>
			</div>
		</div>
		<br>
		<script>
        document.addEventListener('DOMContentLoaded', function() {
            var dailySalesString = '${dailySales}';
            console.log(dailySalesString); 

            // 1. 문자열에서 =를 :로 대체합니다.
            dailySalesString = dailySalesString.replace(/=/g, ':');

            // 2. DAYSALES 키와 값을 적절히 변경합니다.
            dailySalesString = dailySalesString.replace(/P_DATE:/g, '"P_DATE":"');
            dailySalesString = dailySalesString.replace(/, P_PRICE:/g, '", "P_PRICE":');
            
            // 3. 최종적으로 문자열을 JSON 형식으로 변환합니다.
            console.log(dailySalesString); 

            try {
                // JSON 형식의 문자열을 JavaScript 객체로 파싱합니다.
                var dailySales = JSON.parse(dailySalesString);

                // 날짜와 매출 데이터 추출
                var dates = dailySales.map(item => item.P_DATE.split(' ')[0]); // 날짜만 추출
                var totalPays = dailySales.map(item => item.P_PRICE);

                // Chart.js를 사용한 그래프 설정
                var ctx = document.getElementById('dailySalesChart').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: dates,
                        datasets: [{
                            label: '일일매출액',
                            data: totalPays,
                            backgroundColor: "#8e5ea2"
                        }]
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
                var totalmonthsPays = monthlySales.map(item => item.P_PRICE);

                // Chart.js를 사용한 그래프 설정
                var ctx = document.getElementById('monthlySalesChart').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: months,
                        datasets: [{
                            label: '월매출액',
                            data: totalmonthsPays,
                            backgroundColor: "#8e5ea2"
                        }]
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
                 type: 'line',
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
		<script>
	        // 조회 버튼 클릭 시
	        $('#fetchSalesData').click(function() {
	            // 선택한 날짜 가져오기
	            const selectedDate = $('#salesDateInput').val();
	            console.log('Selected Date:', selectedDate);

	            // AJAX 요청 보내기
	            $.ajax({
	                url: "/adminPage/salesData/"+selectedDate,
	                method: 'GET',
	                success: function(data) {
	                    console.log('Success:', data);
	                    // 서버로부터 받은 데이터를 처리하는 로직을 여기에 작성하세요
	                     $('#totalSales').text(data.DAYSALES);
	                     $('#transactionCount').text(data.DAYSTOTALPAY);
	                },
	                error: function(xhr, status, error) {
	                    console.error('Error:', error);
	                }
	            });
	        });
	    </script>

	</main>
	<footer>
		<div id="first_footer" class="p-3"></div>
		<div id="second_footer"></div>
		<div id="third_footer"></div>
	</footer>
</body>
</html>