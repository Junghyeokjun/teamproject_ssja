let $product_content = $("#product_content");
let $paging_dv = $("#paging_dv");
let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");


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
		  null,    // category
		  1,    // pageNum
		  40    // amount
		);

function formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

let getListProductToServer = function (condition) {
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
				
				//상품이 존재하지 않을 경우
				if(data.itemList.length == 0){
					console.log('없음');
					$("#product_search_select").empty();
					let $logo_img = $("<img>").css({'width':'10em','height': '7em','margin-left':'4em','margin-right':'auto'}).attr('src','/images/utilities/logoSSJA.png');
					
					let $noneProductImg = $("<img>").css({'width':'13em','height': '13em','margin-bottom':'2em'})
					.attr('src','/images/utilities/warn_icon.png');
					
					let $notice_none = $("<h2>").css({'text-align':'center','font-weight':'bold'}).text('상품이 존재하지 않습니다.');
					
					let $goBack_btn = $("<button>").addClass('btn btn-dark my-3').css({'border':'none','width':'14em','height':'5em'})
					.text('홈으로 돌아가기').on('click',function(){window.location.href="/home";});					
					$("#product_content").css({'display':'flex','flex-direction':'column','align-items':'center','justify-content':'between'})
					.append($logo_img, $noneProductImg, $notice_none, $goBack_btn);
					return;
					};
				
				let $list_content_dv = $("<div>").attr("id","list_content_dv").addClass("d-flex flex-column");
				let $row;
				data.itemList.forEach(function(e, index){
					
					 if (index % 4 === 0) {
		                    $row = $("<div>").addClass("d-flex flex-row w-100 mb-5"); 
		                    $list_content_dv.append($row); 
		                }
					
					  let $item_content_dv = $("<div>").addClass("item-content-div")
	                    .css({ "max-width": "25%","min-width": "25%", 'height': '20em','margin-bottom':'1em' })
	                    .hover(
	                        function () {
	                            $item_img_dv.css('background-size', '115%');
	                            $(this).css('background-color', 'white').css('cursor', 'pointer');
	                            $item_title_dv.css({ "text-overflow": "clip", "white-space": "normal" });
	                        },
	                        function () {
	                            $item_img_dv.css('background-size', 'cover');
	                            $(this).css('background-color', 'white').css('cursor', 'auto');
	                            
	                            $item_title_dv.css({"text-overflow": "ellipsis",  "white-space": "nowrap"  });
	                        }
	                    ).on('click', function () {
	                        window.location.href = '/product_detail?PRO_NO=' + e.pro_NO;
	                    });

	                let $item_img_dv = $("<div>").addClass("item-img-div mx-1")
	                    .css({
	                        "max-width": "100%", "min-height": "55%", "background-image": 'url(' + e.pro_BANNERIMG + ')',
	                        "background-size": "cover", "background-position": "center", "overflow": "hidden"
	                    });


	                let $item_info_dv = $("<div>").addClass("m-0 mx-1").attr('id', 'item-info-div')
	                    .css({ "margin": "1em", "width": "100%", 'height': '10em', "padding-bottom": "1em" ,'padding':'1em'});

	                let $item_title_dv = $("<div>").addClass("item-title-div").attr("id",'item_title_dv')
	                .css({  "font-size": "1em",  "overflow": "hidden",  "text-overflow": "ellipsis",  "white-space": "nowrap"  })
	                .append($("<p>").text(e.pro_NAME));
	                
	                let $item_bizname_dv = $("<div>").addClass("item-bizname-div")
	                    .text(e.pro_BIZNAME )
	                    .css({ "font-weight": "bold", "font-size": "0.9em", "margin-bottom": "0.5em" }); 

	                let $item_price_dv = $("<div>").addClass("item-price-div")
	                    .text(formatNumber(e.pro_PRICE) + "원")
	                    .css({ "margin-left": "auto", "margin-right": "1em" });

	                let $item_review_wish_dv = $("<div>").addClass("d-flex flex-row justify-content-between")
	                .attr('id', 'item-review-wish-div')
	                    .append(
	                        $("<div>").append($("<img>").attr("src", "/images/utilities/star_icon.jpg")
	                        		.css("width", "1.5em"), $("<span>").text(e.rating_avg)),
	                        		
	                        $("<div>").append($("<span>").text(e.pro_WISH).css("color", "#f06575"),
	                        		
	                            $("<img>").attr("src", "/images/utilities/wish_icon.png").css("width", "1.5em")
	                            .on("click", function (event) {
	                                event.preventDefault();
	                                let countwish = wish_click(e.pro_NO);
	                                $(this).prev("span").text(countwish);
	                                return false;//상품상세 링크 이동 방지
	                            })
	                        )
	                    );
	                $item_info_dv.append($item_title_dv, $item_bizname_dv, $item_price_dv, $item_review_wish_dv);
	                $item_content_dv.append($item_img_dv, $item_info_dv);
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
        type: "patch",
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
    product_condition.setConditionSelect('pro_wish desc');
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
