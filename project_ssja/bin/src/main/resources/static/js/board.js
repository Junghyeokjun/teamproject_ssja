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
	function getBdateStr(bdate) {
		// 오늘 날짜를 "yyyy-MM-dd" 형식으로 가져오기
		let today = new Date().toISOString().split('T')[0];

		// 입력 문자열에서 날짜와 시간을 분리
		let parts = bdate.split(" ", 2);
		if (parts.length < 2) {
			return bdate; // 형식이 맞지 않으면 원래 문자열 반환
		}

		let datePart = parts[0];
		let timePart = parts[1];

		// 날짜가 오늘과 일치하는지 확인
		if (datePart === today) {
			// 시간을 "HH:mm" 형식으로 변환
			let time = mTuning(timePart.substring(0, 2)) + "시";
			if (timePart.substring(3, 5) !== "00") {
				time += timePart.substring(3, 5) + "분";
			}
			return time;
		} else if (datePart.substring(0, 4) === today.substring(0, 4)) {
			// 연도를 뺀 날짜 반환
			let time = mTuning(datePart.substring(5, 7)) + "월"
					+ datePart.substring(8) + "일";
			return time;
		} else {
			// 날짜 반환
			let time = datePart.substring(0, 4) + "년"
					+ mTuning(datePart.substring(5, 7)) + "월"
					+ datePart.substring(8) + "일";
			return time;
		}
	}

	function mTuning(time) {
		let m = parseInt(time, 10);
		return m.toString();
	}
	
	$('.date_str').each(function() {
		let bdateStr = $(this).text();
		let formattedDate = getBdateStr(bdateStr);
		$(this).text(formattedDate);
	});
	
	
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
            beforeSend : function(xhr){
                //ajax호출 중 처리
                //글로벌 변수로 설정한 csrf token 셋팅
                xhr.setRequestHeader(header,token);
            },
            //contentType: 'application/json', // JSON 형식으로 요청을 보낼 것임을 명시
            //data: JSON.stringify({ no : bno, liked : liked }), // JSON 형식으로 데이터 전달
            data: {
            	'bno' : bno, 'mno' : likebmno	            	
            },
            success: function(response) {
            	console.log("successed");
            	console.log(response);
                $('#like-count').text(response.afterLikes);
                $('#board-like').attr(response.isLiked == 1  ? '좋아요 취소' : '좋아요');
            },
            error: function(xhr, status, error) {
                console.log("Error: " + error);
                console.log("Response: " + xhr.responseText);
                alert('좋아요를 할 수 없는 상태입니다. 로그인하십시오.');
            }
        });
    });
});