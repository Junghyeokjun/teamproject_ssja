package teamproject.ssja.service.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.mapper.AdminPageMapper;

@Service
public  class SchedulerServiceImpl implements SchedulerService{
	
	@Autowired
	AdminPageMapper adminMapper;

	@Override
	public void deleteExpiredCoupon() {

		adminMapper.deleteExpiredCoupon();
	}

	@Override
	public void statisticProfit() {
		adminMapper.renewYsterdayProfit();
	}


}
