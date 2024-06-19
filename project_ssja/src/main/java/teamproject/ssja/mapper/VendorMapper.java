package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ProductImgDto;
import teamproject.ssja.dto.VendorSalesDto;
import teamproject.ssja.dto.vendor.VendorInfoDTO;
import teamproject.ssja.page.Criteria;

@Mapper
public interface VendorMapper {
	
	// 판매자 자신의 판매자 데이터 가져오기
	VendorInfoDTO selectVendor(long mNo);

	// 판매자 자신의 판매 물품 목록 가져오기
	List<ProductDto> selectVendorProducts(Criteria criteria);
	
	// 판매자 자신의 판매 물품 개수
	long selectVendorProductsCount(Criteria criteria);
	
	// 판매자 자신의 최근 일주일 동안의 매출 내액(sysdate - 7). 매개변수가 필요없음.
	List<VendorSalesDto> selectVendorSalesInWeek(long vno);
	
	// 판매자 자신이 입력했던 물품의 번호 가져오기
	long selectInsertedProNum(ProductDto product);
	
	// 상품 정보 집어넣기
	int insertProduct(ProductDto product);
	
	// 상품 이미지 경로 집어넣기
	int insertProductImgs(ProductImgDto productImg); 
	
	//////
	
	// 판매자 자신의 문의 목록 가져오기
	List<BoardDto> selectVendorQnas(Criteria criteria);
	
	// 판매자 자신의 총 문의 개수 가져오기
	long selectVendorQnaCount(Criteria criteria);
}
