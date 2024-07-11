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
  
  let $vendorData = $('#vendorData').val();

  //("$vendorData : " + $vendorData);
  
  // 사이드 링크 관련
  const sideLink1 = "/vendor";
  const sideLink2 = "/vendor/product/write";
  let sideLink3 = "";
  //("sideLink3 : " + sideLink3);
  let sideLink4 = "/vendor/question/20";
  let vendorNo = '';
  function getVno(vno){
    vendorNo = vno;
    sideLink3 = "/vendor/product/list/" + vendorNo;
  }

  // 통합 정보
  function totals(vendorNo){
    $.ajax({
      type: "GET",
      url: '/api/vendor/total/' + vendorNo,     
      success: function(response){

        $('#ssja-vendor-datas').empty();
  
        $('#ssja-vendor-datas').append($('<tbody>').append($('<tr>').append($('<th>').addClass('w-25').text('누적 판매 건')).append($('<th>').addClass('w-25').text('누적 판매가')).append($('<th>').addClass('w-25').text('누적 판매 개수')))
                                                   .append($('<tr>').append($('<td>').text(response.purchaseCount.toLocaleString() + '건')).append($('<td>').text(response.totalSales.toLocaleString() + '원')).append($('<td>').text(response.productSoldCount.toLocaleString()+'개'))) );                             
      },
      error : function(xhr, status, error){
        alert("판매자 통합 통계 정보를 가져오지 못했습니다");
        console.error(xhr.responseText);
      }
    });
  }

  function setVendor(callback) {
    //  판매자 상호명 가져오기  
    
    //  상단에 필요해져서 해당 부분은 위에 추가
    //	let $vendorData = $('#vendorData').val();
    //	//("$vendorData : " + $vendorData);
    
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
            //("response : " + response);
            if($vendorData == response.id){
              $('.vendorNames').append(' [ ' +  response.v_bizName + ' ]');
              $('#vendorNo').val(response.v_no);
              //("#vendorNo : " +  response.v_no);
            }else{
              //("warning : " + vendorData + "와(과) 일치하지 않음");
            } 
            
            totals(response.v_no);

            if($('#vendorNo').length != 0){
              setCharts(response.v_no, 7, "/api/vendor/salesdata/" + response.v_no);
            }

            callback(response.v_no);
          },
          error : function(xhr, status, error){
            alert("판매자 정보를 가져오기가 실패했습니다");
            console.error(xhr.responseText);
          }
        });
      }
    }
  
  setVendor(getVno);  

  // overlay를 추가하는 함수
  function addOverlay() {
    // 이미 존재할 경우 추가하지 않음
    if ($('.overlay').length > 0) return;

    // .show-chart 요소에 대한 위치 정보 가져오기
    let showChart = $('.d-flex.show-chart');
    let position = showChart.position();

    // 초기 너비 값을 0으로 설정
    let totalWidth = 0;

    // .show-chart 자식 요소들의 너비 합산
    showChart.children().each(function() {
        totalWidth += $(this).outerWidth(true); // true를 전달하여 마진을 포함한 전체 너비를 계산
    });

    // overlay 요소 생성 및 스타일 적용
    let overlay = $('<div class="overlay"></div>');
    overlay.css({
        position: 'absolute',
        top: showChart.top,
        width: totalWidth,
        height: showChart.outerHeight(),
        backgroundColor: 'rgba(0, 0, 0, 0.5)',
        zIndex: 10,
        pointerEvents: 'none'
    });

    // overlay를 show-chart 요소에 추가
    showChart.append(overlay);
    
    // show-chart의 자식 요소들에 비활성화 스타일 추가
    $('.show-chart').children().css({
      'user-select': 'none', /* 텍스트 선택 불가 */
      'pointer-events': 'none', /* 클릭 이벤트 무시 */
    });
  }

  // overlay를 제거하는 함수
  function removeOverlay() {
    $('.overlay').remove();

    // show-chart의 자식 요소들에 비활성화 스타일 제거
    $('.show-chart').children().css({
      'user-select': '', /* 기본 값으로 되돌림 */
      'pointer-events': '', /* 기본 값으로 되돌림 */
  });
  }
  
  // 총 통계 부분 줄 그어주기
  $('#total-statistics').prepend($('<div>').append($('<hr>').addClass('border border-2 opacity-75')));

  // 차트 추가
  function setCharts(vendorNo, dataLength, url){   
    $.ajax({
      type: "GET",
      url: url,     
      success: function(response) {
        // 기존에 있는 자식 요소들을 제거하기. 
        
        $('#sales').empty();

        // //(response);

        if (!$('#chart-table').hasClass('border')) {
          $('#chart-table').addClass('border');
        }
  
        // table thead 추가
        let thead = $('<thead>').append($('<tr>').append($('<th>').text('매출일')).append($('<th>').text('매출')).append($('<th>').text('주문 건수')));
        $('#sales').append(thead);
        let tbody = $('<tbody>');
        
        let sum = 0;

        let orderSum = 0;

        let lastTotalSales = 0;

        let lastPurchaseCount = 0;

        for(let i=0; i< response.length; i++){
          // trTag 추가
          let trTag = $('<tr>');
          if(Number(response[i].orderDate.substring(5,7)) < 10){
            trTag.append($('<td>').text(response[i].orderDate.substring(6,7) + '월 ' + response[i].orderDate.substring(8,10) + '일'));
          }else{
            trTag.append($('<td>').text(response[i].orderDate.substring(5,7) + '월 ' + response[i].orderDate.substring(8,10) + '일'));
          }          
          trTag.append($('<td>').addClass('text-end').text(response[i].totalSales.toLocaleString() + ' 원'));
          // 추후 추가한 내용
          trTag.append($('<td>').addClass('text-end').text(response[i].purchaseCount.toLocaleString() + ' 번'));
          // table에 추가
          tbody.append(trTag);					
          sum += response[i].totalSales;
          orderSum += response[i].purchaseCount;

          if( lastTotalSales != response[i].lastTotalSales){
            lastTotalSales = response[i].lastTotalSales;
          }
          
          if(lastPurchaseCount != response[i].lastPurchaseCount){
            lastPurchaseCount = response[i].lastPurchaseCount;
          }          
        }	

        
        // 일주일 평균
        let avg = sum / dataLength ;
        let ordersAvg = orderSum / dataLength;

        // 평균은 소수 첫번째 자리까지 보여주기. 해당 처리를 하지 않으면 소수 세번째 자리까지 보여주는 상황임.(toLocalString()이 처리해줌.)
        let tfooter = $('<tfoot>').append($('<tr>').append($('<th>').text('합계')).append($('<td>').addClass('text-end').text(sum.toLocaleString() + ' 원')).append($('<td>').addClass('text-end').text(orderSum.toLocaleString() + ' 번')))
              .append($('<tr>').append($('<th>').text('평균')).append($('<td>').addClass('text-end').text(Number(avg.toFixed(0)).toLocaleString() + ' 원')).append($('<td>').addClass('text-end').text(Number(ordersAvg.toFixed(0)).toLocaleString() + '  번')));
              
        $('#sales').append(tfooter);

        // 차트를 만들기 위한 변수들 선언
        let labels = [];
        // 이후 추가된 객체... 
        let datasets = [{
          label: '단위별 매출',
          type: 'line',
          backgroundColor: 'rgb(1, 124, 198)',
          borderColor: 'rgb(1, 124, 198)',
          data : [],
          yAxisID : 'dayTotalSales'
        },{ 
          label: '주문 건수',
          type: 'bar',
          backgroundColor: 'rgb(214, 78, 9)',
          borderColor: 'rgb(214, 78, 9)',
          borderWidth: 1,
          data: [],
          yAxisID : 'dayPurchaseCount'
        }];

        let data = {
          labels: labels,
          datasets: datasets
        };
        
        // 데이터가 7개 미만일 때 sysdate - 7 부터 sysdate까지의 날짜와 매출 데이터 채우기
        let currentDate = new Date();
        let pastDate = new Date(currentDate);
        pastDate.setDate(currentDate.getDate() - dataLength);				

        // label에 넣기 전, 본래 값을 비교하기 위해 사용하는 배열 선언 및 사용.
        // label에 사용될 문자열은 고칠 예정
        let labelsOrigin = [];

        // 데이터가 7개가 될 때까지 데이터 추가
        while (data.labels.length < dataLength) {
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
            data.datasets[1].data.push(foundData.purchaseCount);
          } else {
            data.datasets[0].data.push(0);
            data.datasets[1].data.push(0);
          }

          // 날짜 문자열을 원하는 형식으로 보이도록 변경
          // 월과 일을 추출하여 변수에 저장
          let year = originDate.slice(0, 4);

          let month = parseInt(originDate.slice(5, 7), 10); // '06'을 숫자로 변환
          
          let day = parseInt(originDate.slice(8, 10), 10); // 숫자로 변환

          let formattedDate = '';
          // 받는 데이터 종류에 따라 
          if(day != 0){
            formattedDate = month + '월' + day + '일';
          }else if(day == 0 && month != 0){
            formattedDate = year + '년' + month + '월';
          }else{
            formattedDate = year + '년';
          }          
          data.labels.push(formattedDate);
        }

        //(labels);
        //(data.datasets[0].data);
        $('#sales').append(tbody);

        //("label : " + labels);
        //(data);


        // 차트 옵션 설정
        let options = {
          responsive: true,
          scales: {
            //Chart.js 3.x 버전
            dayTotalSales: {
              position: 'left',
              ticks: {
                beginAtZero: true
                
              },
              grid: {
                display: false
              }
            }, 

            //3.x 버전에서는 막대 그래프를 구현할 때 데이터셋에 backgroundColor와 borderColor 속성을 설정하여 막대 그래프를 표현
            // 물론 여기다가 type 지정했다간 제대로 작동 안함. datasets 배열 내 객체에 type 설정하면 잘 됨. 여기는 주로 position 설정을 위해 남겨두기.
            dayPurchaseCount: {              
              position: 'right',
              ticks: {
                beginAtZero: true
              },
              grid: {
                display: false
              }
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
        
        if(dataLength != 7){
          $('.h5.chart-title').empty();
        }

        if(dataLength == 30){
          $('.h5.chart-title').text('한달 간 매출 데이터(' + labelsOrigin[0].slice(0,4)+'년 ' + labelsOrigin[0].slice(5,7)+'월)');
        }else if(dataLength == 12){
          $('.h5.chart-title').text('1년 간 매출 데이터 ');
        }else if(dataLength == 5){
          $('.h5.chart-title').text('연간 매출 데이터');
        }else{
          $('.h5.chart-title').text('최근 일주일 간 매출 데이터');
        }
        
        $('.h5.years').text('[' + labelsOrigin[0] + ' ~ ' + labelsOrigin[labelsOrigin.length-1] + ']');

        let comparisonH5Ments = $('<h5>').addClass('h5 text-center');
        if(dataLength == 7){
          comparisonH5Ments.text('전 주 대비 상승률');
        }else{// 기본 설정
          comparisonH5Ments.text('전 주 대비 상승률');
        }
        

        if(dataLength == 7){
          let comparisonTable = $('<table>').addClass('table text-center').append($('<tr>').append($('<td>').text('')).append($('<th>').text('단위 판매가')).append($('<th>').text('단위 주문 건수')))
          .append($('<tr>').addClass('comparison').append($('<th>').text('상승률')));

          //('lastTotalSales : ' + lastTotalSales);
          //('lastPurchaseCount : ' + lastPurchaseCount);

          if(lastTotalSales < sum && lastTotalSales != 0){          
          //('매출 증가 퍼센트 : ' + ((sum-lastTotalSales)/lastTotalSales * 100).toFixed(2));
          comparisonTable.find('.comparison').first().append($('<td>').addClass('text-info table-light border-black').text(((sum-lastTotalSales)/lastTotalSales * 100).toFixed(2) + '% UP'));
          }else if(lastTotalSales == 0 && (sum- lastTotalSales) > 500){
          comparisonTable.find('.comparison').first().append($('<td>').addClass('text-info table-light border-black').text('500% 이상 UP'));
          }else{
          //('매출 감소 퍼센트 : ' + ((sum-lastTotalSales)/lastTotalSales * 100).toFixed(2));
          comparisonTable.find('.comparison').first().append($('<td>').addClass('text-danger table-light border-end border-black').text(((sum-lastTotalSales)/lastTotalSales * 100).toFixed(2) + '% DOWN'));
          }        


          if(lastPurchaseCount < orderSum && lastPurchaseCount != 0){          
          //('주문 증가 퍼센트 : ' + ((orderSum-lastPurchaseCount)/lastPurchaseCount * 100).toFixed(2));
          comparisonTable.find('.comparison').first().append($('<td>').addClass('text-info table-light border-black').text(((orderSum-lastPurchaseCount)/lastPurchaseCount * 100).toFixed(2) + '% UP'));
          }else if(lastPurchaseCount == 0 && (orderSum-lastPurchaseCount) > 500){
          comparisonTable.find('.comparison').first().append($('<td>').addClass('text-info table-light border-black').text('500% 이상 UP'));
          }else{
          //('주문 감소 퍼센트: ' + ((orderSum-lastPurchaseCount)/lastPurchaseCount * 100).toFixed(2));
          comparisonTable.find('.comparison').first().append($('<td>').addClass('text-danger table-light border-end border-black').text(((orderSum-lastPurchaseCount)/lastPurchaseCount * 100).toFixed(2) + '% DOWN'));
          }
                    
          let compareDiv = $('<div>').addClass('px-5 py-1');
          compareDiv.append(comparisonH5Ments);
          compareDiv.append(comparisonTable);
          $('#chart-table').append(compareDiv);
        }
       

        if(response.length == 0 && dataLength == 7 ){
          addOverlay();
          $('.overlay').addClass('d-flex align-items-center justify-content-center').append($('<h2>').addClass('h2 text-center').css('color','white').text('최근 일주일 간 매출 데이터가 없습니다.'))
        }else{
          removeOverlay();
        }
        // 단락을 구분하기 위해 사용할 hr 태그
        let divHr1 = $('<div>').append($('<hr>').addClass('border border-2 opacity-75'));
        let divHr2 = $('<div>').append($('<hr>').addClass('border border-2 opacity-75'));
       
        $('#main_container').prepend(divHr1);
        $('#main_container').append(divHr2);
      },
      error: function(xhr, status, error) {
          //("가져오기 실패");
          alert("매출 내역을 가져오는데 실패했습니다.");
          console.error(xhr.responseText);
        }
      });
  }

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
 
  // 판매자의 경우 로고 클릭 시 판매자 홈으로 이동.
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
        	  //(data);
        	  //('로그아웃 눌림');
          },
          error: function(xhr, status, error) {
              console.error(xhr.responseText);
          }
      });
  });*/
  

  //======================
  
  //사이드 관련
  let $side_container1 = $("<button>").addClass("side_containers align-middle").text("판매자 정보");
  let $side_containerEx = $("<button>").addClass("side_containers align-middle").text("상품 관리");
  let $side_container2 = $("<button>").addClass("side_containers align-middle").text("문의 요청 내역");

  
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
      // //("click... vendorNo :" + vendorNo);
      // //(typeof vendorNo);
      // //('sideLink3 : ' + sideLink3);
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
		//("currentUrl : " + currentUrl);
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
});