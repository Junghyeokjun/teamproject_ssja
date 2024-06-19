/**
 * 날짜 튜닝하기
 * - 오늘 날짜라면 hh시 mm분
 * - 이번 년도이지만, 오늘 날짜가 아니라면 mm월 dd일
 * - 이번 년도가 아니라면 yyyy년 mm월 dd일
 *
 * - 시, 분, 월, 일은 10 이하에서는 한 자리만 뜨고 10이상일 땐 두 자리가 뜬다. 
 */

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

	$('.form').on('submit', function(e){
		e.preventDefault();

		if($('input[name="btitle"]').val().trim() == ""){
			alert("제목을 작성해 주십시오.");
			return;
		}else if($('input[name="btitle"]').val().length < 5){
			alert("제목은 최소 5글자 이상 작성하시기 바랍니다.");
			return;
		}else if($('input[name="bcontent"]').val().trim() == ""){
			alert("내용을 작성해 주십시오.");
			return;
		}else if($('input[name="bcontent"]').val().length < 20){
			alert("내용이 너무 짧습니다. 좀 더 길게 작성하십시오.");
			return;
		}else{
			this.submit();
		}
	});
});