let $best_item_content = $("#best_item_content");

function formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

let getListBestToServer = function(){
	 $.ajax({
			type : "get",
			contentType:"application/json",
			url : "/product/best-mainpage",
			success : function(data){  
				console.log(data);
				$best_item_content.empty();
				
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

			},error: function(xhr, status, error) {
				console.log("Error:", xhr.responseText);
			}
		})
		
		
}

getListBestToServer();


