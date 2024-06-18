let commu_pageNum = 1;
let qna_pageNum = 1;
let $myPageContent = $("#MyPage_content_container");

let getBoardInfoCommus = function(commu_pageNum) {

	$.ajax({
		type : "get",
		url : "/user/info/community?pageNum=" + commu_pageNum,
		contentType : "application/json",
		success : function(data) {
			console.log("commu : ");
			console.log(data);
			let commuInfoContainer = $("<div>").addClass("d-flex flex-column w-100").appendTo($myPageContent);
		},
		error : function(xhr, status, ex) {

		}
	})
}
let getBoardInfoQnAs = function(qna_pageNum) {

	$.ajax({
		type : "get",
		url : "/user/info/qna?pageNum=" + qna_pageNum,
		contentType : "application/json",
		success : function(data) {
			console.log("qna : ");
			console.log(data);
			let qnaInfoContainer = $("<div>").addClass("d-flex flex-column w-100").appendTo($myPageContent);
		},
		error : function(xhr, status, ex) {

		}

	})
}

$('#myPage_boardInfo_Select').on('click', function() {
	if($($myPageContent).text() == "내가 쓴 글"){
		console.log('내가 쓴 글 이미 눌림')
		return false;
	}
	let $h2title = $("<h2>").attr('id','myPageTitle').text("내가 쓴 글");
	 $myPageContent.removeClass().empty();
	let $myPageTitle = $("#MyPage_content_name");
	
	$myPageTitle.empty().append($h2title);
	getBoardInfoCommus(1);
	getBoardInfoQnAs(1);
})