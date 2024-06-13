let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");
let pageNum = 1;
let keyword = '';
let $adimnPage_notic_content = $("#adimnPage_notic_content");

let getNoticeList = function(pageNum, keyword){
	
	$.ajax({
		url:"/adminPage/notice/list",
		type:"get",
		contentType:"application/json",
		data:{pageNum:pageNum,
			keyword:keyword},
		success:function(data){
			console.log(data);
			$adimnPage_notic_content.empty();
			let $notice_content = $("<div>").addClass("px-3").appendTo($adimnPage_notic_content);
			
			let $paging_dv = $("<div>").attr('id','paging_dv').addClass("d-flex flex-row justify-content-center py-3")
			.appendTo($adimnPage_notic_content);
			
			if (data.objectList === undefined ) {
				$notice_content.css({'width':'100%','min-height':'300px'})
				.addClass("d-flex flex-row justify-content-center align-items-center").append(
				$("<h2>").css({'color':'#ccc','font-weight':'bold'})
				.text("해당하는 공지사항글이 없습니다.")		
				);
				return false;
			}
			
			data.objectList.forEach(function(notice, index){
				let $noitce_item=$('<div>').attr('id','notice_content_dv').addClass('d-flex flex-column').append(
				$("<div>").addClass("my-2 d-flex flex-row justify-content-evenly align-items-center p-2 text-center")
				.hover(
						function(){
							$(this).css({'cursor':'pointer','background':'#eee'});
						},function(){
							$(this).css({'cursor':'auto','background':'white'});
						}
				).on('click', function(){
					 let $noticeContentAndLike = $(this).next('.notice_content');
					    $('.notice_content').not($noticeContentAndLike).css('display', 'none');
					    $noticeContentAndLike.toggle();
				})
				.css({'border-bottom':'1px solid #ccc'})
				.append(
						$('<span>').css({'width':'8%'}).text(notice.bno),
						
						 $('<span>').text(notice.btitle)
						.css({ 'white-space':' nowrap', 'overflow': 'hidden','width':'30%'}),
						
						$('<span>').css({'width':'18%'}).text(notice.bwriter),
						
						$('<span>').css({'width':'26%'}).text(notice.bdate.split(" ")[0]),
						
						$('<span>').css({'width':'8%'}).text(notice.bhit),
						
						$('<button>').css({'width':'10%'}).text('삭제').addClass('btn')
						.css({'background':'#bbb','width':'4em'})
						.on('click', function(){
							deleteNotice(notice.bno);
							getNoticeList(pageNum, keyword);
						})
						
						)
				).appendTo($notice_content);
				let $noticeContentAndLike = $("<div>").addClass('notice_content').css({'display': 'none','padding':'1.5em'})
		        .append( 
		        		 $("<div>").text(notice.bcontent)
		        		.css({'min-height':'5em','margin-right':"1em","widnth":"70%",'padding':'1em'}), 
		        		
		        		$("<div>").addClass('d-flex flex-row justify-content-end').append(
		        		$("<div>").text("좋아요 \n"+notice.blike)
		        		.css({'text-align':'right','margin-right':'3em','width':'auto'}) ,
		        		$('<button>').text('수정').addClass("btn btn-dark").on('click', function(){
		        			window.location.href="/adminPage/notice/"+ notice.bno +"/renew"
		        		})
		        		)
		        		);

		    $noitce_item.append($noticeContentAndLike).appendTo('#notice_content');
			})
			$("<button >").appendTo($paging_dv).text("<<").on("click",function(){
				
				pageNum=1;
				getNoticeList(pageNum, keyword);
			});
			
			
			if (data.prev == true) {
				$("<button >").appendTo($paging_dv).text("<").on("click",function(){
					// 페이징 한단계 내리기
					pageNum = Math.floor((pageNum - 10 )/ 10)*10+1;
					getNoticeList(pageNum, keyword);
				});
			}
			for (let i = data.startPage; i <= data.endPage; i++) {
				  let $button = $("<button>").appendTo($paging_dv).text(i).on("click", function() {
				    pageNum=i;
				    getNoticeList(pageNum, keyword);
				  });
				  
				  if (i === pageNum) {
				    $button.css('background-color','#95857F').css('color','black');
				  }
				}
			
			if (data.next == true) {
				$("<button >").appendTo($paging_dv).text(">").on("click",function(){
					// 페이징 한단계 올리기
					pageNum=((pageNum + 10)/ 10)*10+1;
					getNoticeList(pageNum, keyword);
				});
			}
			
			$("<button >").appendTo($paging_dv).text(">>").on("click",function(){
				
				pageNum = (Math.ceil((data.total * 1.0) / 40));
				getNoticeList(pageNum, keyword);				
			});
			
			},
		error:function(xhr,status,e){
		alrt("문제가 생겼습니다. \n 원인 : " + e)	
		}
	})
};

let $searchnoticebtn = $('#search_notice_btn');
$searchnoticebtn.on('click', function(event){
	searchNotice()
});
$('#search_notice_input').keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
    	searchNotice()
    }
});

function searchNotice() {
    let inputsearchval = $('#search_notice_input').val();
    if(inputsearchval === '' || inputsearchval === null){
        getNoticeList(1, '');
    } else {
        keyword = inputsearchval;
        pageNum = 1;
        getNoticeList(pageNum, keyword);
        $('#search_notice_input').val('');
    }
}

let deleteNotice = function(boardNum){
	
	$.ajax({
		url:"/adminPage/notice/list",
		type:"delete",
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		async:false,
		contentType:"application/json",
		data:JSON.stringify(boardNum),
		success:function(data){
			
		},
		error:function(xhr,status,e){
			alert('문제가 생겼습니다. \n 원인 : e');
			window.location.href="";
		}
	})
}



$("#search_enroll_newnotice").on('click', function(event){
	event.preventDefault();
	window.location.href="/adminPage/notice/form";
})

getNoticeList(pageNum, keyword);