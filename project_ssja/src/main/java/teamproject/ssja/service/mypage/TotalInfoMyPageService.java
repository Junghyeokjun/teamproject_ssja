package teamproject.ssja.service.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.InfoProvider;
import teamproject.ssja.dto.PointDTO;
import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.dto.userinfo.PointProvideDTO;
import teamproject.ssja.dto.userinfo.WishProductDTO;
import teamproject.ssja.mapper.totalInfoMyPageMapper;
import teamproject.ssja.page.ListObjectPaging5DTO;
import teamproject.ssja.page.ListObjectPagingDTO;

@Service
public class TotalInfoMyPageService {
	
	
	@Autowired
	totalInfoMyPageMapper totalMapper;
	
	public ListObjectPagingDTO getInfoOrders(int pageNum){
		long id = InfoProvider.getM_NO();
		int total = totalMapper.getMyPurchaseCount(id);
		List<PurchaseDto> list = totalMapper.getMyPurchaseList(id, pageNum);
		
		ListObjectPagingDTO data =new ListObjectPagingDTO(total, pageNum);
		data.setObjectList(list);
		return data;
	}
	
	
	public ListObjectPaging5DTO getInfoWish(int pageNum) {
		long id = InfoProvider.getM_NO();
		int total = totalMapper.getMyWishCount(id);
		List<WishProductDTO> list = totalMapper.getMyWishProducts(id, pageNum);
		ListObjectPaging5DTO data = new ListObjectPaging5DTO(total, pageNum);
		data.setObjectList(list);
		return data;
		
	}
	public ListObjectPaging5DTO getInfoPoint(int pageNum) {
		long id = InfoProvider.getM_NO();
		int total = totalMapper.getMyPointCount(id);
		List<PointDTO> list = totalMapper.getMyPointInfo(id, pageNum);
		ListObjectPaging5DTO data = new ListObjectPaging5DTO(total, pageNum);
		data.setObjectList(list);
		return data;
		
	}
	
	public ListObjectPagingDTO getMyCouponInfo(int pageNum, String condition) {
		long id = InfoProvider.getM_NO();
		int total = totalMapper.getMyCouponCount(id);
		ListObjectPagingDTO data = new ListObjectPagingDTO(total, pageNum);
		
		String orderSecond = "";
		if (condition.equals("d")) {
			condition = "c_duedate";
			orderSecond = "c_dcper";
		} else {
			condition = "c_dcper";
			orderSecond = "c_duedate";
		}

		data.setObjectList(totalMapper.getMyCouponInfo(id, pageNum, condition, orderSecond));
		return data;
	}

}
