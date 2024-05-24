/**
 * 날짜 튜닝하기
 * - 오늘 날짜라면 hh시 mm분
 * - 이번 년도이지만, 오늘 날짜가 아니라면 mm월 dd일
 * - 이번 년도가 아니라면 yyyy년 mm월 dd일
 *
 * - 시, 분, 월, 일은 10 이하에서는 한 자리만 뜨고 10이상일 땐 두 자리가 뜬다. 
 */

$(document).ready(function() {
	// 글 좋아요 처리
	$('#like-button').click(function(event) {
    	// 기본 제출 동작 방지
    	event.preventDefault();
    	
        let bno = $(this).data('likebno');
        console.log(bno);
        let likebmno = $(this).data('likebmno'); // 현재 상태 확인
		console.log(likebmno);
	        // console.log(JSON.stringify({ no : bno, liked : liked })); 
	        // console.log(liked);
        $.ajax({
            url: '/api/likes/toggle/' + bno,
            type: 'POST',
            //contentType: 'application/json', // JSON 형식으로 요청을 보낼 것임을 명시
            //data: JSON.stringify({ no : bno, liked : liked }), // JSON 형식으로 데이터 전달
            data: {
            	'bno' : bno, 'mno' : likebmno	            	
            },
            success: function(response) {
            	console.log("successed");
            	console.log(response);
                $('#like-count').text(response.afterLikes);
                $('#like-button').text(response.isLiked == 1  ? '좋아요 취소' : '좋아요');
            },
            error: function(xhr, status, error) {
                console.log("Error: " + error);
                console.log("Response: " + xhr.responseText);
                alert('좋아요를 할 수 없는 상태입니다. 로그인하십시오.');
            }
        });
    });
});