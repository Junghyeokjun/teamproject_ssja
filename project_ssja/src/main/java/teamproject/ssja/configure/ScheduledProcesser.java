package teamproject.ssja.configure;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import teamproject.ssja.service.mypage.MyPageService;

@Component
@EnableScheduling
public class ScheduledProcesser {
	@Autowired
	MyPageService myPageService;

	//@Scheduled(fixedRate = 86400000)
	@Transactional
	@Scheduled(cron = "0 0 0 * * *")
	void deleteEnrolledUser() {
		try {
		List<String> enrolledDeleteUsers = myPageService.findDeleteEnrolledUsers();

		if (enrolledDeleteUsers.size() > 0) {
			myPageService.deleteEnrolledUsersAuth(enrolledDeleteUsers);

			myPageService.deleteEnrolled();
		}
			
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

}
