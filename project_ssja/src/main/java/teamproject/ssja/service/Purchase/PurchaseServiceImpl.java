package teamproject.ssja.service.Purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.mapper.PurchaseMapper;

@Service
public class PurchaseServiceImpl implements PurchaseService {	

	@Autowired
	PurchaseMapper purchaseMapper;
	
	@Override
	public int Purchase(PurchaseDto purchase) {
		return purchaseMapper.insertPurchase(purchase); 
	}
	
}

