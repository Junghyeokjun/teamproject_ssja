package teamproject.ssja.configure;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import teamproject.ssja.mapper.AdminPageMapper;
import teamproject.ssja.service.mypage.MyPageService;
import teamproject.ssja.service.scheduler.SchedulerService;

@Component
@EnableScheduling
public class ScheduledProcesser {
	@Autowired
	MyPageService myPageService;
	
	@Autowired
	SchedulerService schedulerService;
	
	@Scheduled(cron ="0 0 10 * * *")//매일 오전 10시에 내일 방문자 테이블에 컬럼 스케줄러
	void enrollTomorrowVisit() {
		schedulerService.enrollTomorrowV();
	}
	
	@Scheduled(cron ="0 10 0 * * *") // 매일 00시 10 분에 전날 이익 db에 등록 스케쥴러
	void calculateDailyProfit() {

			schedulerService.statisticProfit();
	
	}
	@Scheduled(cron ="0 5 0 * * *")// 매일 00시 05 분에 만료기간 지난 쿠폰 삭제
	void deleteExpiredCoupon() {
		
			schedulerService.deleteExpiredCoupon();
			
	}
	//그리고 스케쥴러를 통해 매 00시 00 분 마다 오늘 날짜를 지난 m_deletedate를 가진 유저의 id를 
	//deleted + 시퀀스 로 변경하여 정보는 유지하나 id가 바뀌어 로그인이 불가능하여
	//아이디 찾기를 통해 아이디를 변경하여 다시 들어오고 삭제된 권한을 재부여
	@Transactional
	@Scheduled(cron = "0 0 0 * * *")
	void deleteEnrolledUser() {
			myPageService.deleteUserProcess();
	}
}
