/**
 * 날짜 튜닝하기
 * - 오늘 날짜라면 hh시 mm분
 * - 이번 년도이지만, 오늘 날짜가 아니라면 mm월 dd일
 * - 이번 년도가 아니라면 yyyy년 mm월 dd일
 *
 * - 시, 분, 월, 일은 10 이하에서는 한 자리만 뜨고 10이상일 땐 두 자리가 뜬다. 
 */

//  //csrf추가
  let token = $("meta[name='_csrf']").attr("content");
  let header = $("meta[name='_csrf_header']").attr("content");


$(document).ready(function() {    	
	// 글 좋아요 처리
    let bno = $('#like-button').data('likebno');
    console.log(bno);
    let likebmno = $('#like-button').data('likebmno'); // 현재 상태 확인
	console.log(likebmno);
	
	let likeImage = '/images/board/before_boardlike.png';
	let isLikedImage = '/images/board/after_boardlike.png';
	let likeHoverImage = '/images/board/hover_before_boardlike.png';
	let isLikedHoverImage = '/images/board/hover_after_boardlike.png';
	
	let bLikeText = '/api/likes/btoggle/';
	let rLikeText = '/api/likes/rtoggle/';
	
	// 좋아요 이미지 바꾸기
	function likeImages(response){
	    let likeImg = $('.board-like');

	    if (response.isLiked == 1) {
	        likeImg.attr('src', isLikedImage);
	        likeImg.hover(function() {
	            likeImg.attr('src', isLikedHoverImage); // 마우스 오버 시 hover 이미지 설정
	        }, function() {
	            likeImg.attr('src', isLikedImage); // 마우스 아웃 시 기본 이미지로 되돌리기
	        });
	    } else {
	        likeImg.attr('src', likeImage);
	        likeImg.hover(function() {
	            likeImg.attr('src', likeHoverImage); // 마우스 오버 시 hover 이미지 설정
	        }, function() {
	            likeImg.attr('src', likeImage); // 마우스 아웃 시 기본 이미지로 되돌리기
	        });
	    }
	};	
	
	$.ajax({
        url: bLikeText + bno,
        type: 'GET',
        //contentType: 'application/json', // JSON 형식으로 요청을 보낼 것임을 명시
        //data: JSON.stringify({ no : bno, liked : liked }), // JSON 형식으로 데이터 전달
        data: {
        	'bno' : bno, 'mno' : likebmno	            	
        },
        success: function(response) {
        	console.log("successed");
        	console.log(response);
            $('#like-count').text(response.afterLikes);
            likeImages(response);
        },
        error: function(xhr, status, error) {
            console.log("Error: " + error);
            console.log("Response: " + xhr.responseText);
            alert('좋아요를 할 수 없는 상태입니다. 로그인하십시오.');
            $(location).attr('href','/login');
        }
    });
	
	$('#like-button').click(function(event) {
    	// 기본 제출 동작 방지
    	event.preventDefault();
    	

	        // console.log(JSON.stringify({ no : bno, liked : liked })); 
	        // console.log(liked);
        $.ajax({
            url: bLikeText + bno,
            type: 'POST',
//            beforeSend : function(xhr){
//                //ajax호출 중 처리
//                //글로벌 변수로 설정한 csrf token 셋팅
//                xhr.setRequestHeader(header,token);
//            },
            //contentType: 'application/json', // JSON 형식으로 요청을 보낼 것임을 명시
            //data: JSON.stringify({ no : bno, liked : liked }), // JSON 형식으로 데이터 전달
            data: {
            	'bno' : bno, 'mno' : likebmno	            	
            },
            success: function(response) {
            	console.log("successed");
            	console.log(response);
                $('#like-count').text(response.afterLikes);
                likeImages(response);
            },
            error: function(xhr, status, error) {
                console.log("Error: " + error);
                console.log("Response: " + xhr.responseText);
                alert('좋아요를 할 수 없는 상태입니다. 로그인하십시오.');
                $(location).attr('href','/login');
            }
        });
    });
});