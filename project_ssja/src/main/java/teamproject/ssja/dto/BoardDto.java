package teamproject.ssja.dto;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//이름        널?       유형             
//--------- -------- -------------- 
//B_NO      NOT NULL NUMBER(20)     
//M_NO      NOT NULL NUMBER(20)     
//B_C_NO    NOT NULL NUMBER(20)     
//B_WRITER  NOT NULL VARCHAR2(30)   
//B_TITLE   NOT NULL VARCHAR2(250)  
//B_CONTENT NOT NULL VARCHAR2(4000) 
//B_DATE    NOT NULL TIMESTAMP(6)   
//B_LIKE    NOT NULL NUMBER(10)     
//B_HIT     NOT NULL NUMBER(10)     
//B_EVAL             NUMBER(3)      
//PRO_NO             NUMBER(20)

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BoardDto {
	private long bno;
	private long bmno;
	private long bbcno;
	private String bwriter;
	private String btitle;
	private String bcontent;
	private String bdate;
	private long blike;
	private long bhit;
	private long beval;
	private long prono;
	
	// 자바 스크립트 버전으로 할지, 자바로 할지 선택하는 '날짜 형태 변환'
	// 자바 스크립트로 하기 싫다면 아래 메서드를 활용해서 날짜를 가져오기
	// 자바 스크립트로 하겠다면 자바 스크립트 부분을 참조하여 날짜를 반영하기 - td class도 부여한 상태
	
	public String getBdateStr() {
        // 오늘 날짜를 "yyyy-MM-dd" 형식으로 가져오기
        String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        
        // 입력 문자열에서 날짜와 시간을 분리        
        String[] parts = bdate.split(" ", 2);
        if (parts.length < 2) {
            return bdate; // 형식이 맞지 않으면 원래 문자열 반환	
        }

        String datePart = parts[0];
        String timePart = parts[1];

        // 날짜가 오늘과 일치하는지 확인
        if (datePart.equals(today)) {
            // 시간을 "HH:mm" 형식으로 변환
        	String time = null;
        	if(timePart.substring(3,5).equals("00")) {
        		time = mTuning(timePart.substring(0, 2))  + "시";
        	}else {
        		time = mTuning(timePart.substring(0, 2))  + "시" + mTuning(timePart.substring(3,5)) + "분";
        	}             
            return time;
        } else if(datePart.substring(0, 4).equals(today.substring(0, 4))){
            // 연도를 뺀 날짜 반환
        	String time = mTuning(datePart.substring(5,7)) + "월" + mTuning(datePart.substring(8)) + "일";
            return time;
        } else {
        	// 날짜 반환
        	String time = datePart.substring(0, 4)+ "년" + mTuning(datePart.substring(5,7)) + "월" + datePart.substring(8) + "일";
        	return time;
        }
	}
	
	private String mTuning(String time) {
		int m = Integer.valueOf(time);
		if(m < 10) {
			return String.valueOf(m);
		}else {
			return String.valueOf(m);
		}
	}
}
