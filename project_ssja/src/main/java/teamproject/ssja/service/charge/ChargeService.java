package teamproject.ssja.service.charge;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import teamproject.ssja.mapper.ChargePointMapper;

@Service
public class ChargeService {
	
	@Autowired
	ChargePointMapper chargeMapper;
	
	@Transactional
	public void chargePoint(Long id, Long money){
	try {
		chargeMapper.addChargeRecod(id, money);
		chargeMapper.renewUserPoint(id, money);
		
	} catch (Exception e) {
		
		throw new RuntimeException("포인트 충전에 문제가 생겼습니다." + e);
	}
		
	}

}
