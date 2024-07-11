let commu_pageNum = 1;
let qna_pageNum = 1;
let $myPageContent = $("#MyPage_content_container");

let getBoardInfoCommus = function(commu_pageNum) {

	$.ajax({
		type : "get",
		url : "/user/info/community?pageNum=" + commu_pageNum,
		contentType : "application/json",
		async:false,
		success : function(data) {
			//("commu : " );
			//(data);
			let $commuDV = $myPageContent.find('#commuDV');
			if ($commuDV.length) {
			    $commuDV.empty();
			} else {
			    $commuDV = $('<div>').attr('id', 'commuDV').appendTo($myPageContent);
			}
			
			let commuInfoContainer = $("<div>").attr('id','commuInfoContainer');
			
			commu_pageNum = data.pageNum;
			commuInfoContainer.append(
					$("<div>").attr('id','commuInfoTitle').append(
							$("<h4>").text('내가 쓴 글 - 커뮤니티')
					),
					
					$("<div>").attr('id','commuInfoContent').css('width','100%'),	
					$("<div>").attr('id','commuInfoPaging')	
			).appendTo($commuDV);
			if(data === null || data === ''){
				//('data is null')
				return;
				}
			goScrollFunction('#commuInfoTitle')
			data.objectList.forEach(function(board, index){
				$("<div>").attr('id','commuContetnts').addClass("d-flex flex-row justify-content-between align-items-center")
				.css({'padding':'1em','padding-right':'2em','padding-left':'2em'}).append(
						
						$("<img>").attr('src',board.img_path),
						
						$("<div>").attr('id', 'commuInfoDiv').addClass('d-flex flex-column mx-3 align-items-start').append(
							    $('<span>').text("NO." + board.bno),
							    $('<span>').text(board.btitle).css({'font-weight':'bold'}),
							    $('<span>').text(board.bwriter)	
							),
								
						$("<div>").attr('id','commuEtcInfo').addClass('d-flex flex-column mx-3').append(
								$('<span>').text( board.bdate.split(' ')[0] ),
								$('<span>').text(board.bdateStr),
								$('<span>').text( '조회 수 ' + board.bhit),
								$('<span>').text('좋아요 ' +board.blike),
								$('<span>').text('댓글 '+board.countrv)	
								)
								
				).hover(
						function () {
                            $(this).css('background-color', '#eee').css('cursor', 'pointer');
                        },
                        function () {
                            $(this).css('background-color', 'white').css('cursor', 'auto');
                        }
				).on('click', function(){
					
				window.location.href="/community/content/"+board.bno;
				}).appendTo("#commuInfoContent");
			});
			
			pageMaker(data.next, data.prev, data.pageNum, data.startPage, 
					data.endPage, data.total, getBoardInfoCommus, 5, 'commuInfoPaging');
			

		},error : function(xhr, status, ex) {

		}
	})
};

let getBoardInfoQnAs = function(qna_pageNum) {

	$.ajax({
		type : "get",
		url : "/user/info/qna?pageNum=" + qna_pageNum,
		contentType : "application/json",
		async:false,
		success : function(data) {
			//("qna : " );
			//(data)
			
			let $qnaDV = $myPageContent.find('#qnaDV');
			
			if ($qnaDV.length) {
			    $qnaDV.empty();
			} else {
			    $qnaDV = $('<div>').attr('id', 'qnaDV').appendTo($myPageContent);
			}
			
			let qnaInfoContainer = $("<div>").attr('id','qnaInfoContainer');
			
			qna_pageNum = data.pageNum;
			qnaInfoContainer.append(
					$("<div>").attr('id','qnaInfoTitle').append(
							$("<h4>").text('내가 쓴 글 - 고객문의')
					),
					
					$("<div>").attr('id','qnaInfoContent').css('width','100%'),	
					$("<div>").attr('id','qnaInfoPaging')	
			).appendTo($qnaDV);
			if(data === null || data === ''){
				//('data is null')
				return;
				}
			goScrollFunction('#qnaInfoTitle')
			$("<div>").css({'border-top':'2px solid black','border-bottom':'2px solid black','width':'100%','text-align':'center'})
			.addClass('d-flex flex-row justify-content-evenly  align-items-center py-3').append(
					$('<span>').css('width','8%').text('번호'),
					$('<span>').css('width','35%').text('제목'),
					$('<span>').css('width','18%').text('답변'),
					$('<span>').css('width','30%').text('날짜')
			).appendTo('#qnaInfoContent');
			data.objectList.forEach(function(board, index){
				
				$("<div>").addClass('d-flex flex-row justify-content-evenly text-center align-items-center py-2')
				.css({'width':'100%'}).append(
						$('<span>').css('width','8%').text(((data.pageNum - 1) * 10) + (index + 1)),
						$('<span>').css('width','35%').text(board.btitle),
						$('<span>').css('width','18%').text((board.existAns > 0 ? '수신':'대기')),
						$('<span>').css('width','30%').text(board.bdate)		
				).hover(
						function () {
                            $(this).css('background-color', '#eee').css('cursor', 'pointer');
                        },
                        function () {
                            $(this).css('background-color', 'white').css('cursor', 'auto');
                        }
				).on('click', function(){
					
				window.location.href="/board/content_view/20?bno="+board.bno;
				}).appendTo('#qnaInfoContent');
			})
				
			
			pageMaker(data.next, data.prev, data.pageNum,data.startPage, data.endPage,
					data.total, getBoardInfoQnAs,10, 'qnaInfoPaging')
					
		},
		error : function(xhr, status, ex) {

		}

	})
}

$('#myPage_boardInfo_Select').on('click', function() {
	if($($myPageContent).text() == "내가 쓴 글"){
		//('내가 쓴 글 이미 눌림')
		return false;
	}
	//('내가 쓴 글 눌림')
	let $h2title = $("<h2>").attr('id','myPageTitle').text("내가 쓴 글");
	let $myPageTitle = $("#MyPage_content_name");
	$("#MyPage_content_container").empty();
	
	$myPageTitle.empty().append($h2title);
	getBoardInfoCommus(1);
	
	getBoardInfoQnAs(1);
	
})

let pageMaker = function(next, prev, pageNum, startPage, endPage, total, callback, number, div) {
    $("#" + div).empty();
    let $paging_dv = $("<div>").attr('id', 'paging_' + div + '_dv')
        .addClass('d-flex flex-row justify-content-center align-items-center').appendTo("#" + div);

    if (prev == true) {
        $("<button>").appendTo($paging_dv).text("<<").on("click", function() {
            callback(1);
        });

        $("<button>").appendTo($paging_dv).text("<").on("click", function() {
            pageNum = Math.floor((pageNum - number) / number) * number + 1;
            callback(pageNum);
        });
    }

    for (let i = startPage; i <= endPage; i++) {
        let $button = $("<button>").appendTo($paging_dv).text(i).on("click", function() {
            callback(i);
        });

        if (i === pageNum) {
            $button.css('background-color', '#ddd').css('color', 'black');
        }
    }

    if (next == true) {
        $("<button>").appendTo($paging_dv).text(">").on("click", function() {
            callback(Math.floor((pageNum + number) / number) * number + 1);
        });

        $("<button>").appendTo($paging_dv).text(">>").on("click", function() {
            pageNum = Math.ceil((total * 1.0) / number);
            callback(pageNum);
        });
    }
}

let goScrollFunction = function(container) {
    $(container).animate({ scrollTop: 100 }, "slow");
}