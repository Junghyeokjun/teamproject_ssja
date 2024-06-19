package teamproject.ssja.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.MembersSearchDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ProductsSearchDto;
import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.dto.PurchaseSearchDto;
import teamproject.ssja.dto.userinfo.CouponDTO;
import teamproject.ssja.page.Criteria;

@Mapper
public interface AdminPageMapper {

	long getMemberListTotalCount();

	List<MembersDto> getMemberListWithPaging(Criteria criteria);
	//검색
	List<MembersSearchDto> getMemberSearchList(String type, String keyword);
	
	long getProductListTotalCount();

	List<ProductDto> getProductListWithPaging(Criteria criteria);
	//검색
	List<ProductsSearchDto> getProductsSearchList(String type, String keyword);

	long getPerchaseListTotalCount();

	List<PurchaseDto> getPerchaseListWithPaging(Criteria criteria);

	//검색
	List<PurchaseSearchDto> getPurchasesSearchList(String type, String keyword);

	long getCouponListTotalCount();

	List<CouponDTO> getCouponListWithPaging(Criteria cri);

	int insertCoupon(CouponDTO couponDto);

	int deleteCoupon(CouponDTO couponDto);
	
	 CouponDTO read(int c_no); // read 쿼리 메서드

	  void updateCoupon(CouponDTO couponDto); // updateCoupon 쿼리 메서드

		List<Map<String, Object>> getDailySalesList();

		List<Map<String, Object>> getMonthlySalesList();
		
		List<Map<String, Object>> getYearlySalesList();

		Map<String, Object> getSalesDataByDate(@Param("date") String date);


}
