let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
let $product_content = $("#product_content");
let $paging_dv = $("#paging_dv")
const url = new URL(window.location.href);
const params = new URLSearchParams(url.search);

let category = params.get('category');



class ProductCondition {
	  constructor(startPage, endPage, total, prev, next, conditionSelect, conditionName, conditionStart, conditionEnd, category, pageNum, amount) {
	    this.startPage = startPage;
	    this.endPage = endPage;
	    this.total = total;
	    this.prev = prev;
	    this.next = next;
	    this.conditionSelect = conditionSelect;
	    this.conditionName = conditionName;
	    this.conditionStart = conditionStart;
	    this.conditionEnd = conditionEnd;
	    this.category = category;
	    this.pageNum = pageNum;
	    this.amount = amount;
	  }
	  
	  setStartPage(startPage) {
	    this.startPage = startPage;
	  }
	  
	  setEndPage(endPage) {
	    this.endPage = endPage;
	  }
	  
	  setTotal(total) {
	    this.total = total;
	  }
	  
	  setPrev(prev) {
	    this.prev = prev;
	  }
	  
	  setNext(next) {
	    this.next = next;
	  }
	  
	  setConditionSelect(conditionSelect) {
	    this.conditionSelect = conditionSelect;
	  }
	  
	  setConditionName(conditionName) {
	    this.conditionName = conditionName;
	  }
	  
	  setConditionStart(conditionStart) {
	    this.conditionStart = conditionStart;
	  }
	  
	  setConditionEnd(conditionEnd) {
	    this.conditionEnd = conditionEnd;
	  }
	  
	  setCategory(category) {
	    this.category = category;
	  }
	  
	  setPageNum(pageNum) {
	    this.pageNum = pageNum;
	  }
	  
	  setAmount(amount) {
	    this.amount = amount;
	  }
	}
let product_condition = new ProductCondition(
		  null, // startPage
		  null, // endPage
		  null, // total
		  null, // prev
		  null, // next
		  'pro_sellcount desc', // conditionSelect
		  null, // conditionName
		  null, // conditionStart
		  null, // conditionEnd
		  category,    // category
		  1,    // pageNum
		  40    // amount
		);

function formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

let getListProductToServer = function(condition){
	
	
	 $.ajax({
			type : "post",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			data: JSON.stringify(condition),
			contentType:"application/json",
			dataType:"json",
			url : "/product/lists",
			success : function(data){  
				console.log(data);
				$product_content.empty();
				$paging_dv.empty();
				let $list_content_dv = $("<div>").attr("id","list_content_dv").addClass("d-flex flex-column");
				let $row;
				data.itemList.forEach(function(e, index){
					
					  if (index % 4 === 0) {
		                    $row = $("<div>").addClass("d-flex flex-row w-100 mb-5"); 
		                    $list_content_dv.append($row); 
		                }
					
					let $item_content_dv = $("<div>").attr("id","item_content_dv").css("max-width",'25%').css("min-width",'25%').css('height','20em').addClass(" d-flex flex-column ")
					.attr("id","item_content_dv");
					
					let $items_container_dv = $("<div>").css("margin", "1em").css("width", "100%").attr("id","items_container_dv").addClass("p-2  d-flex flex-column justify-content-center align-items-center")
				    .css('background-color', 'white')
				    .hover(
				        function() {
				            $(this).css('background-color', '#eee').css('cursor', 'pointer');
				        },
				        function() {
				            $(this).css('background-color', 'white').css('cursor', 'auto');
				        }
				    );
					
					let $item_img_dv = $("<div>").attr("id", "item_img_dv").css("width","100%").append($("<img>").attr("src", e.pro_BANNERIMG)
						    .css('width', '100%') .css('height', '10em').css('overflow', 'hidden'));
					
					let $item_title_dv=$("<div>").attr("id",'$item_title_dv').text(e.pro_NAME ).css('font-size','1em');
					
					let $item_bizname_dv=$("<div>").attr("id",'$item_bizname_dv')
					.text(e.pro_BIZNAME+ " " +" 확인용 상품번호: "+e.pro_NO).css("text-bold",'weight').css('font-size','1.5em');
					//여기 확인 값 지워야함
					let $item_price_dv = $("<div>").attr("id", "item_price_dv").text(formatNumber(e.pro_PRICE)).css('margin-left','auto').css('margin-right','1em');
					let $item_review_wish_dv = $("<div>").addClass("d-flex flex-row justify-content-between").attr("id", "item_review_wish_dv")
				    .append(
				        $("<div>").append(   $("<img>").attr('src', '/images/utilities/star_icon.jpg').css("width","1.5em"), 
				        		 $("<span>").text(e.rating_avg)),
				        $("<div>").append(
				            $("<img>").attr('src', '/images/utilities/wish_icon.png').css("width","1.5em"), 
				            $("<span>").text(e.pro_WISH).css('color',"#f06575"))
				    );

					
					let $item_info_dv = $("<div>").attr("id","item_info_dv").addClass("d-flex flex-column")
					.append($item_bizname_dv,$item_title_dv ,$item_price_dv,$item_review_wish_dv);
					
						
					
					$items_container_dv.append($item_img_dv,$item_info_dv);
					$item_content_dv.append($items_container_dv);
					$row.append($item_content_dv);
				});
				$("<button >").appendTo($paging_dv).text("<<").on("click",function(){
					
					product_condition.setPageNum(1);
					getListProductToServer(product_condition);
					$(window).scrollTop(350);
				});
				
				
				if (data.prev == true) {
					$("<button >").appendTo($paging_dv).text("<").on("click",function(){
						// 페이징 한단계 내리기
						product_condition.setPageNum(Math.floor((condition.pageNum - 10 )/ 10)*10+1);
						getListProductToServer(product_condition);
						$(window).scrollTop(350);
					});
				}
				for (let i = data.startPage; i <= data.endPage; i++) {
					  let $button = $("<button>").appendTo($paging_dv).text(i).on("click", function() {
					    product_condition.setPageNum(i);
					    getListProductToServer(product_condition);
					    $(window).scrollTop(350);
					  });
					  
					  if (i === condition.pageNum) {
					    $button.css('background-color','#95857F').css('color','black');
					  }
					}
				
				if (data.next == true) {
					$("<button >").appendTo($paging_dv).text(">").on("click",function(){
						// 페이징 한단계 올리기
						product_condition.setPageNum(Math.floor((condition.pageNum + 10)/ 10)*10+1);
						getListProductToServer(product_condition);
						$(window).scrollTop(350);
					});
				}
				
				$("<button >").appendTo($paging_dv).text(">>").on("click",function(){
					
					product_condition.setPageNum(Math.ceil((data.total * 1.0) / 40));
					getListProductToServer(product_condition);
					$(window).scrollTop(350);
				});
				
				$product_content.append($list_content_dv);
			},error: function(xhr, status, error) {
				//console.log("Error:", xhr.responseText);
			}
		})
		
		
}
function fontBoldResetDiv1(){
	$("#select_name_asc").css("font-weight",'').css('font-size','1em');
	$("#select_name_desc").css("font-weight",'').css('font-size','1em');
	$("#select_name_long").css("font-weight",'').css('font-size','1em');
	$("#select_name_short").css("font-weight",'').css('font-size','1em');
}
function fontBoldResetDiv2(){
	$("#select_price_0to3").css("font-weight",'').css('font-size','1em');
	$("#select_price_3to5").css("font-weight",'').css('font-size','1em');
	$("#select_price_5to10").css("font-weight",'').css('font-size','1em');
	$("#select_price_10to20").css("font-weight",'').css('font-size','1em');
	
}
function fontBoldResetDiv3(){
	$("#select_hot").css("font-weight",'').css('font-size','1em');
	$("#select_rowPrice").css("font-weight",'').css('font-size','1em');
	$("#select_rating").css("font-weight",'').css('font-size','1em');
	$("#select_review").css("font-weight",'').css('font-size','1em');
	$("#select_wish").css("font-weight",'').css('font-size','1em');
	$("#select_new").css("font-weight",'').css('font-size','1em');
}

$("#select_price_3to5").on('click',function(){
	//완
	fontBoldResetDiv2();
	product_condition.setConditionStart(30000);
	product_condition.setConditionEnd(50000);
	getListProductToServer(product_condition);
	$(window).scrollTop(200);
	$(this).css("font-weight",'bold').css('font-size','1.2em');
})
$("#select_name_asc").on('click',function(){
	fontBoldResetDiv1();
	product_condition.setConditionName('pro_name asc');
	getListProductToServer(product_condition);
	$(window).scrollTop(200);
	$(this).css("font-weight",'bold').css('font-size','1.2em');
	//완
})
$("#select_name_desc").on('click',function(){
	//완
	fontBoldResetDiv1();

	product_condition.setConditionName('pro_name desc');
	getListProductToServer(product_condition);
	$(window).scrollTop(200);
	$(this).css("font-weight",'bold').css('font-size','1.2em');
})
$("#select_name_long").on('click',function(){
	//완
	fontBoldResetDiv1();
	product_condition.setConditionName('LENGTH(pro_name) desc');
	getListProductToServer(product_condition);
	$(window).scrollTop(200);
	$(this).css("font-weight",'bold').css('font-size','1.2em');
})
$("#select_name_short").on('click',function(){
	fontBoldResetDiv1();
	//완
	product_condition.setConditionName('LENGTH(pro_name) asc');
	getListProductToServer(product_condition).css('font-size','1.2em');
	$(window).scrollTop(200);
	$(this).css("font-weight",'bold');
})
$("#select_price_0to3").on('click',function(){
	fontBoldResetDiv2();
	product_condition.setConditionStart(0);
	product_condition.setConditionEnd(30000);
	getListProductToServer(product_condition);
	$(window).scrollTop(200);
	$(this).css("font-weight",'bold').css('font-size','1.2em');
})
$("#select_price_5to10").on('click',function(){
	fontBoldResetDiv2();
	product_condition.setConditionStart(50000);
	product_condition.setConditionEnd(100000);
	getListProductToServer(product_condition);
	$(window).scrollTop(200);
	$(this).css("font-weight",'bold').css('font-size','1.2em');
	//완
})
$("#select_price_10to20").on('click',function(){
	//완
	fontBoldResetDiv2();
	product_condition.setConditionStart(100000);
	product_condition.setConditionEnd(200000);
	getListProductToServer(product_condition);
	$(window).scrollTop(200);
	$(this).css("font-weight",'bold').css('font-size','1.2em');
})
$("#select_hot").on('click',function(){
	
	product_condition.setConditionSelect('pro_sellcount desc');
	getListProductToServer(product_condition);
	$(window).scrollTop(200);
	$(this).css("font-weight",'bold').css('font-size','1.2em');
})
$("#select_rowPrice").on('click',function(){
	fontBoldResetDiv3();
	product_condition.setConditionSelect('pro_price asc');
	getListProductToServer(product_condition);
	$(window).scrollTop(200);
	$(this).css("font-weight",'bold').css('font-size','1.2em');
})
$("#select_rating").on('click',function(){
	fontBoldResetDiv3();
	product_condition.setConditionSelect('rating_avg desc');
	getListProductToServer(product_condition);
	$(window).scrollTop(200);
	$(this).css("font-weight",'bold').css('font-size','1.2em');
})
$("#select_review").on('click',function(){
	fontBoldResetDiv3();
	product_condition.setConditionSelect('REVIEW_COUNT desc');
	getListProductToServer(product_condition);
	$(window).scrollTop(200);
	$(this).css("font-weight",'bold').css('font-size','1.2em');
})
$("#select_wish").on('click',function(){
	product_condition.setConditionSelect('RATING_AVG desc');
	fontBoldResetDiv3();
	getListProductToServer(product_condition);
	$(window).scrollTop(200);
	$(this).css("font-weight",'bold').css('font-size','1.2em');
})
$("#select_new").on('click',function(){
	fontBoldResetDiv3();
	product_condition.setConditionSelect('pro_date desc');
	getListProductToServer(product_condition);
	$(window).scrollTop(200);
	$(this).css("font-weight",'bold').css('font-size','1.2em');
})
$('#search_custom_money_btn').on('click',function(){
	if($("#end_price").val() === '' || $("#end_price").val()===0){
		alert('금액을 제대로 입력해주세요');
	return;
	}
	fontBoldResetDiv2();
	product_condition.setConditionStart($("#start_price").val());
	product_condition.setConditionEnd($("#end_price").val());
	getListProductToServer(product_condition);
	$(window).scrollTop(200);
})


getListProductToServer(product_condition);


