package teamproject.ssja.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.MembersSearchDto;
import teamproject.ssja.dto.OrderDetailsDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ProductsSearchDto;
import teamproject.ssja.dto.ProfitDto;
import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.dto.PurchaseSearchDto;
import teamproject.ssja.dto.QnaBoardDto;
import teamproject.ssja.dto.QnaSearchDto;
import teamproject.ssja.dto.VendorDetailsDto;
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
	
	 CouponDTO readCoupon(int c_no); // read 쿼리 메서드

	  void updateCoupon(CouponDTO couponDto); // updateCoupon 쿼리 메서드

		List<Map<String, Object>> getDailySalesList();
		
		List<Map<String, Object>> getWeeklySalesList();

		List<Map<String, Object>> getMonthlySalesList();
		
		List<Map<String, Object>> getYearlySalesList();
		
		void deleteExpiredCoupon();// 스케쥴러 시간 만료기간 초과된 쿠폰 삭제


		ProfitDto getSalesDataByDate();
		
		int getDailyPrice();

		int getDailyPurcount();

		int getDailyMcount();

		int getDailyQnaCount();

		List<Map<String, Object>> dailyMCountsList();

		long getQnaListTotalCount();

		List<QnaBoardDto> getQnaListWithPaging(Criteria cri);

		List<QnaSearchDto> getQnaSearchList(String type, String keyword);
		
		QnaBoardDto readQna(int qnaId);
		
		void updateQna(QnaBoardDto qnaBoardDto);

		int deleteQna(QnaBoardDto qnaBoardDto);	
		
		List<Map<String, Object>> dailyVisitCountsList();

		void renewYesterdayProfit();//스케줄러 전날 매출 insert
		
		//방문자 수 쿼리
		@Update("UPDATE visitor_count SET visit_count = visit_count + 1 WHERE TRUNC(visit_date) = TRUNC(sysdate)")
		void addVisitCount();
		//내일 방문자 컬럼 추가 퀄리
		@Insert("Insert into visitor_count values (trunc(sysdate) + 1, 0)")
		void enrollTomorrowV();

		void deleteMember(MembersDto membersDto);
		
		MembersDto readMemberId(int memberId);
		
		void updateMember(MembersDto membersDto);
		
		List<ProfitDto> totalDailyProfitData();
		List<ProfitDto> totalMonthlyProfitData();
		List<ProfitDto> totalYearlyProfitData();
		
		List<Long> getListMemberNo();
		
		void insertCouponToMembers(List<Long> list);

		void deleteProduct(ProductDto productDto);

		ProductDto readProductId(int productId);

		void updateProduct(ProductDto productDto);

		int insertAdminProduct(ProductDto productDto);

		//일일 조회 리스트들
		List<OrderDetailsDto> getDailyPurList();

		List<MembersDto> getDailyMList();

		List<QnaBoardDto> getDailyQnaList();

		List<VendorDetailsDto> getVendorsList();

}
