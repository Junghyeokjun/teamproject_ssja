package teamproject.ssja.service.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import teamproject.ssja.mapper.AdminPageMapper;

@Service
public  class SchedulerServiceImpl implements SchedulerService{
	
	@Autowired
	AdminPageMapper adminMapper;

	@Transactional
	@Override
	public void deleteExpiredCoupon() {
		try {
			
			adminMapper.deleteExpiredCoupon();
			
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

	@Transactional
	@Override
	public void statisticProfit() {
		try {

		adminMapper.renewYesterdayProfit();
	} catch (Exception e) {
		throw new RuntimeException();
	}
	}

	@Override
	public void enrollTomorrowV() {
		adminMapper.enrollTomorrowV();
	}


}
