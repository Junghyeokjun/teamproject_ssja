let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
	
let $product_content = $("#product_content");
let $paging_dv = $("#paging_dv")
const url = new URL(window.location.href);
const params = new URLSearchParams(url.search);

let category = params.get('category');

class ProductCondition {
	  constructor(startPage, endPage, total, prev, next, conditionSelect, conditionName, 
			  conditionStart, conditionEnd, category, pageNum, amount) {
		  
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
	  setPageNum(pageNum){
		  this.pageNum = pageNum
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
			data: condition,
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
					let $item_price_dv = $("<div>").attr("id", "item_price_dv").text(formatNumber(e.pro_PRICE)+"원").css('margin-left','auto').css('margin-right','1em');
					let $item_review_wish_dv = $("<div>").addClass("d-flex flex-row justify-content-between").attr("id", "item_review_wish_dv")
				    .append(
				        $("<div>").append(   $("<img>").attr('src', '/images/utilities/star_icon.jpg').css("width","1.5em"), 
				        		 $("<span>").text(e.rating_avg)),
				        $("<div>").append($("<span>").text(e.pro_WISH).css('color', "#f06575"),
				            $("<img>").attr('src', '/images/utilities/wish_icon.png').css("width","1.5em").on('click',function(event){
				            	event.preventDefault();
				            	let countwish = wish_click(e.pro_NO);
				            	$(this).prev("span").text(countwish);
				            	
				            })  )
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
				console.log("Error:", xhr.responseText);
			}
		})
		
		
}

let wish_click = function(productnumber) {
	let count = 0;
    $.ajax({
        type: "PUT",
        beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
        data: JSON.stringify({"pro_no": productnumber}),
        url: "/wishlist",
        async:false,
        contentType: "application/json",
        success: function(data) {
            count = data;
        }, error : function(e) {
        	console.log(e);
        	//window.location.href="/login";
        }
    });
    return count;
};
		


function fontBoldResetDiv1(){
    $("#select_name_asc, #select_name_desc, #select_name_long, #select_name_short")
        .css("font-weight", '').css('font-size', '1em');
}

function fontBoldResetDiv2(){
    $("#select_price_0to3, #select_price_3to5, #select_price_5to10, #select_price_10to20")
        .css("font-weight", '').css('font-size', '1em');
}

function fontBoldResetDiv3(){
    $("#select_hot, #select_rowPrice, #select_rating, #select_review, #select_wish, #select_new")
        .css("font-weight", '').css('font-size', '1em');
}

function handleClick(selector, resetFunc, conditionSetter) {
    $(selector).on('click', function() {
        resetFunc();
        conditionSetter();
        getListProductToServer(product_condition);
        $(window).scrollTop(200);
        $(this).css("font-weight", 'bold').css('font-size', '1.2em');
    });
}
handleClick("#select_name_asc", fontBoldResetDiv1, function() {
    product_condition.setConditionName('pro_name asc');
});

handleClick("#select_name_desc", fontBoldResetDiv1, function() {
    product_condition.setConditionName('pro_name desc');
});

handleClick("#select_name_long", fontBoldResetDiv1, function() {
    product_condition.setConditionName('LENGTH(pro_name) desc');
});

handleClick("#select_name_short", fontBoldResetDiv1, function() {
    product_condition.setConditionName('LENGTH(pro_name) asc');
});
handleClick("#select_price_0to3", fontBoldResetDiv2, function() {
    product_condition.setConditionStart(0);
    product_condition.setConditionEnd(30000);
});

handleClick("#select_price_3to5", fontBoldResetDiv2, function() {
    product_condition.setConditionStart(30000);
    product_condition.setConditionEnd(50000);
});

handleClick("#select_price_5to10", fontBoldResetDiv2, function() {
    product_condition.setConditionStart(50000);
    product_condition.setConditionEnd(100000);
});

handleClick("#select_price_10to20", fontBoldResetDiv2, function() {
    product_condition.setConditionStart(100000);
    product_condition.setConditionEnd(200000);
});

handleClick("#select_hot", fontBoldResetDiv3, function() {
    product_condition.setConditionSelect('pro_sellcount desc');
});

handleClick("#select_rowPrice", fontBoldResetDiv3, function() {
    product_condition.setConditionSelect('pro_price asc');
});

handleClick("#select_rating", fontBoldResetDiv3, function() {
    product_condition.setConditionSelect('rating_avg desc');
});

handleClick("#select_review", fontBoldResetDiv3, function() {
    product_condition.setConditionSelect('REVIEW_COUNT desc');
});

handleClick("#select_wish", fontBoldResetDiv3, function() {
    product_condition.setConditionSelect('RATING_AVG desc');
});

handleClick("#select_new", fontBoldResetDiv3, function() {
    product_condition.setConditionSelect('pro_date desc');
});

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


