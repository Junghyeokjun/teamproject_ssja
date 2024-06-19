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
  
	<!-- 그래프를 그리기 위해, Chart.js를 포함시킵니다. -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

   <meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>

  <script src="/js/vendorbarscript.js">

  </script>

  <script src="/js/footer.js">

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

	header, main, footer{
		height: auto;
		overflow : hidden;
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
		
	</div>
    <div id="main_container" class="d-flex flex-row align-items-center justify-content-center" >      	
		
        <div id="MyPage_content_container" class="p-5">
			<div class="text-center col-16">
				<h5 class="h5"> 최근 일주일 간 매출 데이터 </h5>
				<h5 class="h5 years"></h5>
			</div>
			<div class="d-flex">
				<div class="border">
					<div class="p-5">
						<table id="sales" class="table table-striped text-center ">

						</table>
					</div>
				</div>
				<div class="border p-3">				
					<div>
						<canvas id="salesChart" width="400px" height="300px"></canvas>
					</div>
				</div>
			</div>
      	</div>    
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
<script src="/js/vendor_login_user_tab.js"> </script>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			type: "GET",
			url: "/api/vendor/salesdata",     
			success: function(response) {
				// 기존에 있는 자식 요소들을 제거하기. 
				$('#sales').empty();
				
				// console.log(response);
				
				// table thead 추가
				let thead = $('<thead>').append($('<tr>').append($('<th>').text('매출일')).append($('<th>').text('매출')));
				$('#sales').append(thead);
				let tbody = $('<tbody>');
				
				let sum = 0;


				for(let i=0; i< response.length; i++){
					// trTag 추가
					let trTag = $('<tr>');
					trTag.append($('<td>').text(response[i].orderDate.substring(5,10)));
					trTag.append($('<td>').text(response[i].totalSales + ' 원'));
					// table에 추가
					tbody.append(trTag);					
					sum += response[i].totalSales;
				}	

				let avg = sum / 7 ;

				let tfooter = $('<tfoot>').append($('<tr>').append($('<th>').text('합계')).append($('<td>').text(sum + ' 원')))
											.append($('<tr>').append($('<th>').text('평균')).append($('<td>').text(avg + ' 원')));
				$('#sales').append(tfooter);

				// 차트를 만들기 위한 변수들 선언
				let labels = [];
				let datasets = [{
					label: '일별 매출',
					backgroundColor: 'rgb(85, 160, 50)',
					borderColor: 'rgb(85, 160, 50)',
					data : []
				}];

				let data = {
					labels: labels,
					datasets: datasets
				};

				// 데이터가 7개 미만일 때 sysdate - 7 부터 sysdate까지의 날짜와 매출 데이터 채우기
				let currentDate = new Date();
				let pastDate = new Date(currentDate);
				pastDate.setDate(currentDate.getDate() - 7);				

				// label에 넣기 전, 본래 값을 비교하기 위해 사용하는 배열 선언 및 사용.
				// label에 사용될 문자열은 고칠 예정
				let labelsOrigin = [];

				// 데이터가 7개가 될 때까지 데이터 추가
				while (data.labels.length < 7) {
					

					let dateToFill = new Date(pastDate);
					dateToFill.setDate(dateToFill.getDate() + data.labels.length); // 7일 이전 날짜에 더해주기
					
					// labels 배열의 앞쪽에 추가
					// data.labels.push(dateToFill.toISOString().slice(0, 10)); 

					let originDate = dateToFill.toISOString().slice(0, 10);

					labelsOrigin.push(originDate);

					// response에 해당 날짜의 데이터가 있으면 데이터 추가, 아니면 0 추가
					// let foundData = response.find(item => item.orderDate.substring(0, 10) === data.labels[data.labels.length - 1]);

					let foundData = response.find(item => item.orderDate.substring(0, 10) === labelsOrigin[labelsOrigin.length - 1]);
					// let foundData = response.find(function(item) {
					// 	return item.orderDate.substring(0, 10) === data.labels[data.labels.length - 1];
					// });

					if (foundData) {
						data.datasets[0].data.push(foundData.totalSales);
					} else {
						data.datasets[0].data.push(0);
					}

					// 날짜 문자열을 원하는 형식으로 보이도록 변경
					// 월과 일을 추출하여 변수에 저장
					let year = originDate.slice(0, 4);

					let month = parseInt(originDate.slice(5, 7), 10); // '06'을 숫자로 변환
					let formattedDate = month + '월' + parseInt(originDate.slice(8, 10), 10) + '일';

					data.labels.push(formattedDate);
				}

				console.log(labels);
				console.log(data.datasets[0].data);
				$('#sales').append(tbody);

				console.log("label : " + labels);
				console.log(data);
				// 차트 데이터 준비
				// const labels = ['1일', '2일', '3일', '4일', '5일', '6일', '7일'];
				// const data = {
				// 	labels: labels,
				// 	datasets: [{
				// 		label: '일별 매출',
				// 		backgroundColor: 'rgb(54, 162, 235)',
				// 		borderColor: 'rgb(54, 162, 235)',
				// 		data: [100, 150, 200, 180, 250, 300, 280],
				// 	}]
				// };

				// 차트 옵션 설정
				let options = {
					responsive: true,
					scales: {
						y: {
							beginAtZero: true
						}
					}
				};

				// 차트 생성
				let ctx = document.getElementById('salesChart').getContext('2d');
				let myChart = new Chart(ctx, {
					type: 'line',
					data: data,
					options: options
				});
				
				$('.h5.years').text('[' + labelsOrigin[0] + ' ~ ' + labelsOrigin[6] + ']');
			},
			error: function(xhr, status, error) {
				console.log("가져오기 실패");
				alert("매출 내역을 가져오는데 실패했습니다.");
				console.error(xhr.responseText);
			}
		});
	}); 

</script>

<script>
					 
  let select_dv = $("#select_content");
    
    $("#select_mp_top").on('click', function() {
        select_dv.toggle();
    });



</script>

</html>