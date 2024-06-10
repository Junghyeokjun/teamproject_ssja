
//금액 표현 포맷 함수
function formatNumber(num) {
	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
};

let payAccount = function(order){
	if(order.o_PAY === 0){
		return '전액 포인트사용';
	}else{
		return formatNumber(order.o_PRICE);
	}
}

let pageNum = 1;
$("#myPage_orderInfo_Select").on('click', function() {
	console.log($("#h2title").text());
	if($("#h2title").text() === '주문 사항')return false;
	myPageOrderInfo(pageNum);
});
 let myPageOrderInfo = function(pageNum) {
	

	$.ajax({
			type : "post",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			url : "/user/info/orders", 
			data: {'pageNum':pageNum},
			success : function(data) {
				const orderInfo = data;
				console.log(orderInfo);
				let $h2title = $("<h2>").attr('id','h2title').text("주문 사항");
				 $("#MyPage_content_container").empty();
				
				let $myPageTitle = $("#MyPage_content_name");
				$myPageTitle.empty().append($h2title);
				//주문 사항 전체 div
				let $orderInfoContainer = $("#MyPage_content_container").addClass("d-flex flex-column ");
				let orderStatusMap= new Map([
					['ingdv',0],//배송중
					['comdv',0],//배송완료
					['confbuy',0],//구매확정
					['combuy',0],//결제완료
					['refund',0],//환불
					['cancel',0]//취소
				]);
				 orderInfo.orderList.forEach(function(order) {
    					order.list.forEach(function(e) {
						   if (e.o_STATE === '배송중')  orderStatusMap.set('ingdv', orderStatusMap.get('ingdv') + 1);
					        
					        if (e.o_STATE === '배송완료')  orderStatusMap.set('comdv', orderStatusMap.get('comdv') + 1);
					        
					        if (e.o_STATE === '구매확정')   orderStatusMap.set('confbuy', orderStatusMap.get('confbuy') + 1);
					        
					        if (e.o_STATE === '결제완료')  orderStatusMap.set('combuy', orderStatusMap.get('combuy') + 1);
					        
					        if (e.o_STATE === '환불')  orderStatusMap.set('refund', orderStatusMap.get('refund') + 1);
					        
					        if (e.o_STATE === '취소')   orderStatusMap.set('cancel', orderStatusMap.get('cancel') + 1);
					        
					})
				}) 
				
				let $orderInfoTopDv = $("<div>");
				$("<h4>").text("주문 내역 조회").appendTo($orderInfoTopDv).addClass("my-3").css({'margin-right':'auto','margin-left':'2em'});
				let $status_dv = $("<div>").addClass("my-2").attr('id','status_dv').appendTo($orderInfoTopDv);
				
				$("<span>").text("배송 중"+orderStatusMap.get('ingdv')).appendTo($status_dv);
				$("<span>").text("배송 완료"+orderStatusMap.get('comdv')).appendTo($status_dv);
				$("<span>").text("구매 확정"+orderStatusMap.get('confbuy')).appendTo($status_dv);
				$("<span>").text("결제 완료"+orderStatusMap.get('combuy')).appendTo($status_dv);
				$("<span>").text("환불"+orderStatusMap.get('refund')).appendTo($status_dv);
				$("<span>").text("취소"+orderStatusMap.get('cancel')).appendTo($status_dv);
				
				$("<div>").css('border-bottom','4px solid #444').appendTo($orderInfoTopDv);
				let $noti_order = $("<div>").appendTo($orderInfoTopDv);
				let $noti_ul = $("<ul>").addClass("my-3").appendTo($noti_order);
				
				$("<li>").text('동일한 주문번호라도 2개 이상의 브랜드에서 주문하신 경우 출고지 주소가 달라 각각 출고됩니다. (택배 박스를 2개 이상 수령 가능)')
				.css('font-size','0.8em').appendTo($noti_ul);
				
				$("<li>").text('출고 완료 직후 교환 / 환불 요청을 하더라도 상품을 수령하신 후 택배 업체를 통해 보내주셔야 처리 가능합니다.')
				.css('font-size','0.8em').appendTo($noti_ul);
					let $classify_dv = $("<div>").css({'border-top':'3px solid black','border-bottom':'3px solid black','padding':'0.6em'})
					.addClass("d-flex flex-row justify-content-evenly").appendTo($orderInfoTopDv);
				$("<span>").text('주문 번호').appendTo($classify_dv);
				$("<span>").text('일자').appendTo($classify_dv);
				$("<span>").text('금액').appendTo($classify_dv);
				$("<span>").text('배송사').appendTo($classify_dv);
				
				//여기서 부터 주문 사항 내역 리스트 메인 div
				let $orderInfoMainDv = $("<div>").addClass("w-100 p-2 d-flex flex-column my-3").attr('id','orderInfoMainDv');
				
			$("<h4>").css({'font-weight':'bold','margin -left':'2em'}).appendTo($orderInfoMainDv);
			let $order_Info_Content = $("<div>").attr('id','order_Info_Content').appendTo($orderInfoMainDv);
			
			//구매 테이블 리스트 -> 리스트 요소 구매(1 대 다 관계로 주문 테이블 리스트를 소유 중)
			orderInfo.orderList.forEach(function(data, index1){
				let $orderContentContainer = $("<div>").addClass('d-flex flex-column').appendTo($order_Info_Content);
				let $ordercontent_div = $("<div>").addClass("p-3 d-flex flex-row justify-content-evenly align-items-center")
				.css({'border-top':'1px solid #444','border-bottom':'1px solid #444'}).appendTo($orderContentContainer);
				$("<span>").text('order No.'+data.pur_NO).appendTo($ordercontent_div);
				$("<span>").text(data.pur_DATE).appendTo($ordercontent_div);
				$("<span>").text(formatNumber(data.pur_TOT)).appendTo($ordercontent_div);
				$("<span>").text(data.pur_DV).appendTo($ordercontent_div);
				
				data.list.forEach(function(order, index2){
				    let $order_list_dv = $("<div>").attr('id','order_list_dv').addClass(' my-2')
				    .hover(
				    function(){
				    	$(this).css('background-color','#eee');
				    },
				    function(){
				    	
				    	$(this).css('background-color','white');
				    }
				    );
				    
				    let $orderInfo = $("<div>").addClass('d-flex flex-row align-items-center justify-content-evenly my-3');
				    $orderInfo.append($("<img>").css({'width':'15%','max-height':'15%'}).attr('src',order.pro_BANNERIMG));
				    
				   let $orders_product_Info= $("<div>").addClass('d-flex flex-column justify-content-center ').attr('id','orders_product_Info')
				   .css({ 'width': '25%',  'overflow': 'hidden',  'text-overflow': 'ellipsis', 'white-space': 'nowrap','margin-left':'1em'})
				   .appendTo($orderInfo);
				   
				   $orders_product_Info.append($("<span>").css({'font-weight':'bold'}).text(order.pro_BIZNAME));
				   
				   $orders_product_Info.append($("<a>").attr('href','/product_detail?PRO_NO='+order.pro_NO)
						   .text(order.pro_NAME).css({'color':'black','text-decoration':'none','font-weight':'bold'})
						   .hover(function(){
							   $(this).css('text-decoration','underline');
						   },
						   function(){
							   $(this).css('text-decoration','none'); 
							   }));
				   $orders_product_Info.append($("<span>").text('수량 : '+order.o_QUANTITY+" 개"));
				   
				   let $additionalInfo = $("<div>").css({'min-width':'20%','max-width':'20%','margin-left':'1em'}).addClass('d-flex flex-column').append(
					        $("<span>").text('쿠폰 :' + order.o_USECOUPON),
					        $("<span>").text(payAccount(order)),
					        $("<span>").text(order.o_STATE));
				   $orderInfo.append($additionalInfo);
				   
				   let $go_write_review = $("<button>")
				    .css({"border-radius": '0','width':'15%','height':'4em','margin-right':'auto','margin-left':'auto'})
				    .addClass(order.isWiriteReview === 0 ? 'btn btn-dark' : 'bg-body');
	
				if (order.isWiriteReview == 0) {
				    $go_write_review.text('리뷰 작성 하기').on('click', function() {
				        window.location.href = "/";
				    });
				} else {
				    $go_write_review.text('리뷰 작성 불가').hover(
				        function() {
				            $(this).css('cursor', 'auto');
				        }
				    );
				}
				   $orderInfo.append($go_write_review);
				   
				   
				    $order_list_dv.append($orderInfo);

				    $orderContentContainer.append($order_list_dv);
				});
				});
				let $paging_dv = $("<div>").attr('id','paging_dv')
				.addClass('my-3 p-4 d-flex flex-row justify-content-center align-items-center');
				
					$("<button >").appendTo($paging_dv).text("<<").on("click",function(){
					
					pageNum = 1;
					myPageOrderInfo(pageNum);
					$(window).scrollTop(350);
				});
				
				
				if (data.prev == true) {
					$("<button >").appendTo($paging_dv).text("<").on("click",function(){
						// 페이징 한단계 내리기
						pageNum = Math.floor((pageNum - 10 )/ 10)*10+1;
						myPageOrderInfo(pageNum);
						$(window).scrollTop(350);
					});
				}
				for (let i = data.startPage; i <= data.endPage; i++) {
					  let $button = $("<button>").appendTo($paging_dv).text(i).on("click", function() {
					    pageNum=i;
					    myPageOrderInfo(pageNum);
						$(window).scrollTop(350);
					  });
					  
					  if (i === data.pageNum) {
					    $button.css('background-color','#95857F').css('color','black');
					  }
					}
				
				if (data.next == true) {
					$("<button >").appendTo($paging_dv).text(">").on("click",function(){
						// 페이징 한단계 올리기
						pageNum = Math.floor((pageNum + 10 )/ 10)*10+1;
						myPageOrderInfo(pageNum);
						$(window).scrollTop(350);
					});
				}
				
				$("<button >").appendTo($paging_dv).text(">>").on("click",function(){
					pageNum = Math.ceil((data.total * 1.0)/10);
					myPageOrderInfo(pageNum);
					$(window).scrollTop(350);
				});
				
				$($orderInfoContainer).css('margin-bottom','3em').append($orderInfoTopDv,$orderInfoMainDv, $paging_dv);
				
			}
		});
	} 