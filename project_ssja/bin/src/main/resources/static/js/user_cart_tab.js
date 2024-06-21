function formatterPrice(num) {
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
	};
  
   let $user_itemcart_div = $("<div>").attr("id", "user_itemcart_div")
  .css({'border-radius':'5px','display':'none'}).appendTo($("#cart_link"));
   
   let $cartTitle_btn  =$("<button>").addClass("mx-3 mb-3")
   .css({'border-bottom':'1px solid #ccc',
	   	 'font-size':'1.2em',
	  	 'font-weight':'bold'})
   .text("장바구니").appendTo($user_itemcart_div);
   
   $("<div>").attr('id',"cart_content").css({"padding":"5px"}).appendTo($user_itemcart_div);
   
   $(document).ready(function() {
	   if($('#cart_link').length > 0){
		   let cartLinkPosition = $('#cart_link').offset();
		    let cartItemCartDivWidth = $('#user_itemcart_div').outerWidth();
		    
		    let leftPosition = cartLinkPosition.left - (cartItemCartDivWidth / 2);
		    $('#user_itemcart_div').css({ 'left': leftPosition });   
	   } 
	});
   
   $(window).on('scroll resize', function() {
	   if($('#cart_link').length > 0){
	    cartLinkPosition = $('#cart_link').offset();
	    cartItemCartDivWidth = $('#user_itemcart_div').outerWidth();
	    leftPosition = cartLinkPosition.left - (cartItemCartDivWidth / 2);
	   
	      $('#user_itemcart_div').css({
	          'left': leftPosition
	      });
	   }
	  });
   
   let getItemCart = function(){
	   $.ajax({
		   type : "get",
			url : "/item_cart",
			success : function(data){  
				if(Array.isArray(data) && data.length === 0){
					$("<div>").css({'width': '100%', 'height': '120px', 'text-align': 'center'})
					    .append($("<h4>").text("상품이 없습니다.").css('line-height', '75px'))
					    .appendTo($user_itemcart_div);
					$("<button>").text("상품 보기").css('border','1px solid #ccc').on('click',function(e){
						e.preventDefault();
						window.location.href="/product/best-list";
					}).appendTo($user_itemcart_div);
					return;
		        }
		    	
		    	let totalCartPrice = 0;
		    	let cartItemPrice = 0;
		    	
		    	data.forEach(function(item, index){
		    		 cartItemPrice = item.pro_price * item.i_quantity;
	    			    totalCartPrice += cartItemPrice;
		    		$("<div>").attr('id','cart_item_info_dv').addClass("d-flex flex-row  align-items-center my-1 w-100").on('click', function(e){
		    			e.preventDefault();
		    			window.location.href="/product_detail?PRO_NO=" + item.pro_no;
		    		}).append(
		    			    $("<img>").css({'width': '72px','height':'72px'}).attr('src', item.pro_bannerimg),
		    			    $("<div>").addClass("d-flex flex-column").css('width','40%').append(
		    			    		 $("<span>").addClass("product-name").text(item.pro_name),
		    			    		 $("<span>").text(item.i_quantity+'개').css('margin','auto')
		    			    		),
		    			    	
		    			    		 $("<span>").text(formatterPrice(cartItemPrice))
		    			).appendTo($user_itemcart_div);

		    	})
		    		$("<div>").addClass('d-flex flex-row justify-content-between w-100 p-3').css({'border-top':'1px solid #ccc'}).append(
		    		$("<span>").text('Total : '),
		    		$("<span>").text(formatterPrice(totalCartPrice))
		    		).appendTo($user_itemcart_div);
		    }
   })
   }
   getItemCart();
   
   $("#cart_link").hover(
   	    function() {
   	        $user_itemcart_div.show();
   	    },function() {
               $user_itemcart_div.hide();
           }
   	);