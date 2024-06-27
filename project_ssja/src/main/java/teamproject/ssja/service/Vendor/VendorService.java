package teamproject.ssja.service.Vendor;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ProductImgDto;
import teamproject.ssja.dto.StatisticVO;
import teamproject.ssja.dto.VendorSalesDto;
import teamproject.ssja.dto.vendor.TotalVendorInfoDto;
import teamproject.ssja.dto.vendor.VendorInfoDTO;
import teamproject.ssja.dto.vendor.VendorItemCondition;
import teamproject.ssja.dto.vendor.VendorProfitDTO;
import teamproject.ssja.page.Criteria;

public interface VendorService {
	// 판매자 본인의 판매자 정보 가져오기
	public VendorInfoDTO getVendor(long mNo);

	// 데이터베이스에 상품 데이터 추가
	public void addProduct(ProductDto productDto, MultipartFile bannerFile);
	
	// 방금 입력한 상품의 상품 번호 가져오기
	public long getProNum(ProductDto productDto);
	
	// 상품 이미지 데이터 추가
	public void addProductImgs(List<MultipartFile> coverFile, 
							List<MultipartFile> explainFile, long pro_no);	
	
	// 상품 이미지 파일이 비어있는 경우 처리(DB 연동 아님)
	public String isEmpty(MultipartFile bannerFile, 
						 List<MultipartFile> coverFile, 
						 List<MultipartFile> explainFile,
						 Model model);
	
	// 이미지 파일명 변경하기(DB 연동 아님)
	public String ssjaFileNameFormat(String originalFileName, int num);
	
	// 상품 수정할 데이터를 보여주는 것
	public ProductDto getThisProduct(long proNo); 

	// 상품 검색 목록 및 개수
	public List<ProductDto> getSearchProducts(Criteria criteria, String option, String keyword);
	
	public long getSearchProductsCount(Criteria criteria, String option, String keyword);
	
	// 상품 수정
	public void modifyProduct(ProductDto productDto);	

	// 판매자의 문의 데이터 가져오기
	public List<BoardDto> getQnaLists(Criteria criteria, Long bcno, Long bmno);
	
	
	public long getQnaCounts(Criteria criteria);
	
	
	// 문의 검색 데이터
	public List<BoardDto> getQnaSearchLists(Criteria criteria, String option, String keyword);
	
	// 문의 검색 총 개수
	public long getQnaSearchCounts(Criteria criteria, String option, String keyword);
	
	public List<ProductDto> getProductList(Criteria criteria, Long vno);
	
	public long getProductCounts(Criteria criteria);
	
	// 판매자 홈에 쓰일, 해당 판매자의 최근 일주일 동안의 매출 내역 가져오기
	public List<VendorSalesDto> getWeeklySalesData(long vno);
	// 총계 가져오기
	public VendorSalesDto getTotalSalesData(long vno);
	
	// 연, 월, 일 매출 내역 가져오기
	public List<VendorSalesDto> getDaySalesData(StatisticVO statisticVO);	
	public List<VendorSalesDto> getMonthSalesData(StatisticVO statisticVO);
	public List<VendorSalesDto> getYearSalesData(StatisticVO statisticVO);
	
	//회원의 판매자 조회
	TotalVendorInfoDto getVendorTotalInfo(String bizname, int pageNum);
	List<ProductDto> getVendorItemList(VendorItemCondition condition);
	
	//엑셀 데이터 공급
	Map<String, List<VendorProfitDTO>> getDataForExcel(Long vno, String condition);
}

