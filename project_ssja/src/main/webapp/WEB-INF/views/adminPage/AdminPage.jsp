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
#adminPage_Info_Select {
	padding: 0;
}
/* 모달 중앙 정렬 */
.modal-dialog {
    position: fixed;
    top: 30%;
    left: 30%;
    transform: translate(-50%, -50%);
    max-width: 90%; /* 모달의 최대 너비 설정 */
}

</style>
</head>
<body>
	<header>
		<div id="title_bar" class=" fixed-top">
			<div class="py-2 px-1" id="top-bar">
				<button type="toggle-button" class="top_btn" id="top_btn"></button>
				<a id="logo_toHome" href=""><img id="logo_img"
					src="/images/utilities/logoSSJA.png"></a> <a id="user_link"
					href="/login" style="margin-left: auto;"><img id="login_img"></a>
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
				onclick="location.href='/adminPage/purchasesList'">주문 목록</button>
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
					<h2 id="AdminPageTitle">SSJA 현황</h2>
				</div>
				<div id=main_div>
					<div id="AdminPage_content_container">
						<div id="adminInfo_dv2" class="my-3 mx-3"
							style="background-color: rgb(238, 238, 238);">
							<div id="dailyPrice" style="cursor: auto;">
								<h4>TODAY 총 매출액</h4>
								<fmt:formatNumber value="${dailyPrice}" pattern="#,###원" />
							</div>
							<div id="dailyPurcount" style="cursor: auto;"
								data-bs-toggle="modal" data-bs-target="#exampleModal">
								<h4>TODAY 주문 건수</h4>
								<span>${dailyPurcount}건</span>
							</div>
							<div id="dailyQnaCount" style="cursor: auto;">
								<h4>TODAY 문의 건수</h4>
								<span>${dailyQnaCount}건</span>
							</div>
							<div id="dailyMCount" style="cursor: auto;">
								<h4>TODAY 가입자</h4>
								<span>${dailyMCount}명</span>
							</div>
						</div>
						<div id="adminInfo_dv3" class="my-3 mx-3"
							style="display: flex; flex-wrap: nowrap; justify-content: center;">
							<div style="flex: 1; margin-right: 10px; text-align: center;">
								<h4 class="mx-5 my-3">
									일일매출
									<p style="font-size: 0.5em; display: inline;">(최근일주일)</p>
								</h4>
								<canvas id="dailySalesChart" width="50" height="50"></canvas>
							</div>
							<div
								style="flex: 1; margin-left: 10px; margin-right: 10px; text-align: center;">
								<h4 class="mx-5 my-3">
									일일가입자
									<p style="font-size: 0.5em; display: inline;">(최근일주일)</p>
								</h4>
								<canvas id="dailyMCountsChart" width="50" height="50"></canvas>
							</div>
							<div
								style="flex: 1; margin-left: 10px; margin-right: 10px; text-align: center;">
								<h4 class="mx-5 my-3">
									일일방문자
									<p style="font-size: 0.5em; display: inline;">(최근일주일)</p>
								</h4>
								<canvas id="dailyVisitCountsChart" width="50" height="50"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
		 <!-- 주문 목록 모달 -->
    <div id="orderListModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">주문 목록</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <table class="table" id="orderCountTable" style="text-align: center;">
                    <thead>
                        <tr>
                           <td scope="col">주문번호</td>
								<td scope="col">회원번호</td>
								<td scope="col">총 금액</td>
								<td scope="col">결제수단</td>
								<td scope="col">주문일자</td>
								<td scope="col">주소</td>
								<td scope="col">배송업체</td>
                        </tr>
                    </thead>
                    <tbody id="orderCountTableBody">
                        <!-- 여기에 데이터가 동적으로 추가됩니다 -->
                    </tbody>
                </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 문의건수 모달 -->
    <div id="qnaCountModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">문의 건수</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                <table class="table" id="qnaCountTable" style="text-align: center;">
                    <thead>
                        <tr>
                           <td scope="col">글번호</td>
								<td scope="col">회원번호</td>
								<td scope="col">작성자</td>
								<td scope="col">제목</td>
								<td scope="col">내용</td>
								<td scope="col">날짜</td>
                        </tr>
                    </thead>
                    <tbody id="qnaCountTableBody">
                        <!-- 여기에 데이터가 동적으로 추가됩니다 -->
                    </tbody>
                </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 가입자 수 모달 -->
    <div id="mCountModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">가입자 수</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
 <table class="table" id="MCountTable" style="text-align: center;">
                    <thead>
                        <tr>
                            <td scope="col">회원번호</td>
								<td scope="col">아이디</td>
								<td scope="col">이름</td>
								<td scope="col">주소</td>
								<td scope="col">생일</td>                                                       
                        </tr>
                    </thead>
                    <tbody id="MCountTableBody">
                        <!-- 여기에 데이터가 동적으로 추가됩니다 -->
                    </tbody>
                </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
	</main>
	<script>
    // 주문 목록 클릭 시 모달에 데이터 동적으로 로드
    $('#dailyPurcount').on('click', function (event) {
        // 서버에서 주문 목록 데이터를 가져오는 API 호출 예시
        $.ajax({
            url: '/adminPage/dailyPurList',  // API 엔드포인트 URL
            method: 'GET',
            success: function (data) {
                var modal = $('#orderListModal');
                var tableBody = modal.find('#orderCountTableBody');
                tableBody.empty(); // 기존 목록 초기화
                
                //수정해야함
                /* data.forEach(function (order) {
                    var row = '<tr><td>' + order.orderNumber 
                    + '</td><td>' + order.memberNumber 
                    + '</td><td>' + order.totalAmount 
                    + '</td><td>' + order.paymentMethod 
                    + '</td><td>' + order.orderDate + '</td><td>' 
                    + order.address + '</td><td>' 
                    + order.deliveryCompany + '</td></tr>';
                    tableBody.append(row);
                }); */
                modal.modal('show'); // 모달 열기
            },
            error: function () {
                console.error('Failed to fetch order list.');
            }
        });
    });

 // 문의 건수 클릭 시 모달에 데이터 동적으로 로드
    $('#dailyQnaCount').on('click', function (event) {
        $.ajax({
            url: '/adminPage/dailyQnaList',  // API 엔드포인트 URL
            method: 'GET',
            success: function (data) {
                var modal = $('#qnaCountModal');
                var tableBody = modal.find('#qnaCountTableBody');
                tableBody.empty(); // 기존 목록 초기화
                data.forEach(function (qna) {
                    var row = '<tr><td>' + qna.b_NO + '</td><td>' + qna.m_NO + '</td><td>' + qna.b_WRITER 
                    + '</td><td>' + qna.b_TITLE + '</td><td>' + qna.b_CONTENT + '</td><td>' + qna.b_DATE + '</td></tr>';

                    tableBody.append(row);
                });
                modal.modal('show'); // 모달 열기
            },
            error: function () {
                console.error('Failed to fetch qna count.');
            }
        });
    });
    // 가입자 수 클릭 시 모달에 데이터 동적으로 로드
    $('#dailyMCount').on('click', function (event) {
        // 서버에서 가입자 수 데이터를 가져오는 API 호출 예시
        $.ajax({
            url:  '/adminPage/dailyMList',  // API 엔드포인트 URL
            method: 'GET',
            success: function (data) {
                var modal = $('#mCountModal');
                var tableBody = modal.find('#MCountTableBody');
                tableBody.empty(); // 기존 목록 초기화
                data.forEach(function (member) {
                    var row = '<tr><td>' + member.m_NO 
                    + '</td><td>' + member.m_ID 
                    + '</td><td>' + member.m_NAME 
                    + '</td><td>' + member.m_ADDRESS1 
                    + '</td><td>' + member.m_BIRTH + '</td></tr>';
                    tableBody.append(row);
                });
                modal.modal('show'); // 모달 열기
            },
            error: function () {
                console.error('Failed to fetch member count.');
            }
        });
    });
</script>
	
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
                    type: 'bar',
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
            var dailyMCountsString = '${dailyMCounts}';
            console.log(dailyMCountsString); 

           dailyMCountsString = dailyMCountsString.replace(/\{([^=]+)=([^,]+),\s*([^=]+)=([^}]+)\}/g, '{"$1":$2,"$3":"$4"}');

            // 3. 최종적으로 문자열을 JSON 형식으로 변환합니다.
            console.log(dailyMCountsString); 

            try {
                // JSON 형식의 문자열을 JavaScript 객체로 파싱합니다.
                var dailyMCounts = JSON.parse(dailyMCountsString);

                // 날짜와 매출 데이터 추출
                var dates = dailyMCounts.map(item => item.M_DATE.split(' ')[0]); // 날짜만 추출
                var totalMs = dailyMCounts.map(item => item.M_COUNT);

                // Chart.js를 사용한 그래프 설정
                var ctx = document.getElementById('dailyMCountsChart').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: dates,
                        datasets: [{
                            label: '일일가입자수',
                            data: totalMs,
                            backgroundColor: "#8e5ea2"
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                            	max:10,
                                beginAtZero: true,  // 축의 최소값을 0으로 설정
                                ticks: {
                                    stepSize: 1,    // 간격을 1로 설정하여 정수 값만 표시
                                    precision: 0    // 정수 값만 표시하도록 설정
                                }
                            }
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
            var dailyVCountsString = '${dailyVCounts}';
            console.log(dailyVCounts); 

            dailyVCountsString = dailyVCountsString.replace(/\{([^=]+)=([^,]+),\s*([^=]+)=([^}]+)\}/g, '{"$1":$2,"$3":"$4"}');

            // 3. 최종적으로 문자열을 JSON 형식으로 변환합니다.
            console.log(dailyVCountsString); 

            try {
                // JSON 형식의 문자열을 JavaScript 객체로 파싱합니다.
                var dailyVCounts = JSON.parse(dailyVCountsString);

                // 날짜와 매출 데이터 추출
                var dates = dailyVCounts.map(item => item.VISIT_DATE.split(' ')[0]); // 날짜만 추출
                var countVs = dailyVCounts.map(item => item.VISIT_COUNT);

                // Chart.js를 사용한 그래프 설정
                var ctx = document.getElementById('dailyVisitCountsChart').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: dates,
                        datasets: [{
                            label: '일일방문자수',
                            data: countVs,
                            backgroundColor: "#8e5ea2"
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                            	max:10,
                                beginAtZero: true,  // 축의 최소값을 0으로 설정
                                ticks: {
                                    stepSize: 1,    // 간격을 1로 설정하여 정수 값만 표시
                                    precision: 0    // 정수 값만 표시하도록 설정
                                }
                            }
                        }
                    }
                });
            } catch (error) {
                console.error('Error parsing JSON:', error);
            }
        });
    </script>
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
<!-- <script src="/js/adminPage/adminInfoPage.js"></script> -->
</html>