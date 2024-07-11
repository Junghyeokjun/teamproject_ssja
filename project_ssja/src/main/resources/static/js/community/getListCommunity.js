let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");
	
let community_content = $("#community_content");
let $paging_dv = $("#paging_dv")

let search_opt =$ ("#search_opt");
let search_keyword = $("#search_keyword");
let search_btn = $("#search_btn");

class PostCondition {
	  constructor(startPage, endPage, total, prev, next, pageNum, amount) {
		  
	    this.startPage = startPage;
	    this.endPage = endPage;
	    this.total = total;
	    this.prev = prev;
	    this.next = next;
	    this.pageNum = pageNum;
	    this.amount = amount;
	  }

	  setPageNum(pageNum){
		  this.pageNum = pageNum
	  }
	  
	}
let post_condition = new PostCondition(
		  null, // startPage
		  null, // endPage
		  null, // total
		  null, // prev
		  null, // next
		  1,    // pageNum
		  20    // amount
		);

function formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

let getListPostToServer = function(condition){
	
	
	$.ajax({
		   type : "GET",
		   data: post_condition,
		   dataType:"json",
		   url : "/community/post",
		   success : function(data){  
			   //(data);
			   community_content.empty();
			   $paging_dv.empty();
			   let $list_content_dv = $("<div>").attr("id","list_content_dv").addClass("d-flex flex-column");
			   let $row;
			   data.postList.forEach(function(e, index){
				   
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
				   ).on("click",function(){
					   window.location="/community/content/"+e.bno;
				   });
				   
				   let $item_img_dv = $("<div>").attr("id", "item_img_dv").css("width","100%").append($("<img>").attr("src", e.img_path)
						   .css('width', '100%') .css('height', '10em').css('overflow', 'hidden'));
				   
				   let $item_title_dv=$("<div>").attr("id",'$item_title_dv').text("").css('font-size','1em');
				   
				   let $item_bizname_dv=$("<div>").attr("id",'$item_bizname_dv')
				   .text(e.btitle).css("text-bold",'weight').css('font-size','1.5em');

				   let $item_price_dv = $("<div>").attr("id", "item_price_dv").text("작성자 : "+e.bwriter).css('margin-left','auto').css('margin-right','1em');
				   let $item_review_wish_dv = $("<div>").addClass("d-flex flex-row justify-content-between").attr("id", "item_review_wish_dv")
				   .append(
					   $("<div>").append(   $("<img>").attr('src', '/images/utilities/like.png').css("width","1.5em"), 
								$("<span>").text(e.blike)),
					   // $("<div>").append($("<span>").text(e.pro_WISH).css('color', "#f06575"),
					   //     $("<img>").attr('src', '/images/utilities/wish_icon.png').css("width","1.5em").on('click',function(event){
					   //     	event.preventDefault();
					   //     	let countwish = wish_click(e.pro_NO);
					   //     	$(this).prev("span").text(countwish);
							   
					   //     })  )
					   //찜관련 이벤트 커뮤니티에선 사용용도가 발견될시 수정예정
				   );

				   
				   let $item_info_dv = $("<div>").attr("id","item_info_dv").addClass("d-flex flex-column w-100")
				   .append($item_bizname_dv,$item_title_dv ,$item_price_dv,$item_review_wish_dv);
				   
					   
				   
				   $items_container_dv.append($item_img_dv,$item_info_dv);
				   $item_content_dv.append($items_container_dv);
				   $row.append($item_content_dv);
			   });
			   $("<button >").appendTo($paging_dv).text("<<").on("click",function(){
				   
				   post_condition.setPageNum(1);
				   getListPostToServer(post_condition);
				   $(window).scrollTop(350);
			   });
			   
			   
			   if (data.page.prev == true) {
				   $("<button >").appendTo($paging_dv).text("<").on("click",function(){
					   // 페이징 한단계 내리기
					   post_condition.setPageNum(Math.floor((condition.pageNum - 10 )/ 10)*10+1);
					   getListPostToServer(post_condition);
					   $(window).scrollTop(350);
				   });
			   }
			   for (let i = data.page.startPage; i <= data.page.endPage; i++) {
					 let $button = $("<button>").appendTo($paging_dv).text(i).on("click", function() {
					   post_condition.setPageNum(i);
					   getListPostToServer(post_condition);
					   $(window).scrollTop(350);
					 });
					 
					 if (i === condition.pageNum) {
					   $button.css('background-color','#95857F').css('color','black');
					 }
				   }
			   
			   if (data.page.next == true) {
				   $("<button >").appendTo($paging_dv).text(">").on("click",function(){
					   // 페이징 한단계 올리기
					   post_condition.setPageNum(Math.floor((condition.pageNum + 10)/ 10)*10+1);
					   getListPostToServer(post_condition);
					   $(window).scrollTop(350);
				   });
			   }
			   
			   $("<button >").appendTo($paging_dv).text(">>").on("click",function(){
				   
				   post_condition.setPageNum(Math.ceil((data.page.total * 1.0) / 20));
				   getListPostToServer(post_condition);
				   $(window).scrollTop(350);
			   });
			   
			   community_content.append($list_content_dv);
			   
			   //게시글이 존재하지 않을시 
			   //추후에 회의후 이미지 추가 예정
			   if(data.page.total==0){
				   
				   $paging_dv.empty();
				   community_content.css('height','500px');
				   community_content.append('<h1 class="text-center mt-4"> 게시글이 존재하지 않습니다</h1>');
			   }
		   },error: function(xhr, status, error) {
			   //("Error:", error);
		   }
	   })
	   
	   
}
let getListSearchPostToServer = function(condition,option,keyword){
	
	
	$.ajax({
		   type : "GET",
		   data: {
			pageNum : post_condition.pageNum,
			amount : post_condition.amount,
			keyword : keyword,
			option : option },
		   dataType:"json",
		   url : "/community/search",
		   success : function(data){  
			   //(data);
			   community_content.empty();
			   $paging_dv.empty();
			   let $list_content_dv = $("<div>").attr("id","list_content_dv").addClass("d-flex flex-column");
			   let $row;
			   data.postList.forEach(function(e, index){
				   
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
				   ).on("click",function(){
					   window.location="/community/content/"+e.bno;
				   });
				   
				   let $item_img_dv = $("<div>").attr("id", "item_img_dv").css("width","100%").append($("<img>").attr("src", e.img_path)
						   .css('width', '100%') .css('height', '10em').css('overflow', 'hidden'));
				   
				   let $item_title_dv=$("<div>").attr("id",'$item_title_dv').text("").css('font-size','1em');
				   
				   let $item_bizname_dv=$("<div>").attr("id",'$item_bizname_dv')
				   .text(e.btitle).css("text-bold",'weight').css('font-size','1.5em');

				   let $item_price_dv = $("<div>").attr("id", "item_price_dv").text("작성자 : "+e.bwriter).css('margin-left','auto').css('margin-right','1em');
				   let $item_review_wish_dv = $("<div>").addClass("d-flex flex-row justify-content-between").attr("id", "item_review_wish_dv")
				   .append(
					   $("<div>").append(   $("<img>").attr('src', '/images/utilities/like.png').css("width","1.5em"), 
								$("<span>").text(e.blike)),
					   // $("<div>").append($("<span>").text(e.pro_WISH).css('color', "#f06575"),
					   //     $("<img>").attr('src', '/images/utilities/wish_icon.png').css("width","1.5em").on('click',function(event){
					   //     	event.preventDefault();
					   //     	let countwish = wish_click(e.pro_NO);
					   //     	$(this).prev("span").text(countwish);
							   
					   //     })  )
					   //찜관련 이벤트 커뮤니티에선 사용용도가 발견될시 수정예정
				   );

				   
				   let $item_info_dv = $("<div>").attr("id","item_info_dv").addClass("d-flex flex-column w-100")
				   .append($item_bizname_dv,$item_title_dv ,$item_price_dv,$item_review_wish_dv);
				   
					   
				   
				   $items_container_dv.append($item_img_dv,$item_info_dv);
				   $item_content_dv.append($items_container_dv);
				   $row.append($item_content_dv);
			   });
			   $("<button >").appendTo($paging_dv).text("<<").on("click",function(){
				   
				   post_condition.setPageNum(1);
				   getListPostToServer(post_condition);
				   $(window).scrollTop(350);
			   });
			   
			   
			   if (data.page.prev == true) {
				   $("<button >").appendTo($paging_dv).text("<").on("click",function(){
					   // 페이징 한단계 내리기
					   post_condition.setPageNum(Math.floor((condition.pageNum - 10 )/ 10)*10+1);
					   getListPostToServer(post_condition);
					   $(window).scrollTop(350);
				   });
			   }
			   for (let i = data.page.startPage; i <= data.page.endPage; i++) {
					 let $button = $("<button>").appendTo($paging_dv).text(i).on("click", function() {
					   post_condition.setPageNum(i);
					   getListPostToServer(post_condition);
					   $(window).scrollTop(350);
					 });
					 
					 if (i === condition.pageNum) {
					   $button.css('background-color','#95857F').css('color','black');
					 }
				   }
			   
			   if (data.page.next == true) {
				   $("<button >").appendTo($paging_dv).text(">").on("click",function(){
					   // 페이징 한단계 올리기
					   post_condition.setPageNum(Math.floor((condition.pageNum + 10)/ 10)*10+1);
					   getListPostToServer(post_condition);
					   $(window).scrollTop(350);
				   });
			   }
			   
			   $("<button >").appendTo($paging_dv).text(">>").on("click",function(){
				   
				   post_condition.setPageNum(Math.ceil((data.page.total * 1.0) / 20));
				   getListPostToServer(post_condition);
				   $(window).scrollTop(350);
			   });
			   
			   community_content.append($list_content_dv);
			   
			   //게시글이 존재하지 않을시 
			   //추후에 회의후 이미지 추가 예정
			   if(data.page.total==0){
				   
				   $paging_dv.empty();
				   community_content.css('height','500px');
				   community_content.append('<h1 class="text-center mt-4"> 게시글이 존재하지 않습니다</h1>');
			   }
		   },error: function(xhr, status, error) {
			   //("Error:", error);
		   }
	   })
	   
	   
}
search_btn.on("click",function(){
	post_condition.pageNum=1;
	getListSearchPostToServer(post_condition,$('#search_opt option:selected').val(),search_keyword.val());
})


//찜 관련 이벤트 차후 쓸모가 있을시 사용
// let wish_click = function(productnumber) {
// 	let count = 0;
//     $.ajax({
//         type: "PUT",
//         beforeSend: function(xhr) {
//             xhr.setRequestHeader(header, token);
//         },
//         data: JSON.stringify({"pro_no": productnumber}),
//         url: "/wishlist",
//         async:false,
//         contentType: "application/json",
//         success: function(data) {
//             count = data;
//         }, error : function(e) {
//         	//(e);
//         	//window.location.href="/login";
//         }
//     });
//     return count;
// };
		

getListPostToServer(post_condition);


