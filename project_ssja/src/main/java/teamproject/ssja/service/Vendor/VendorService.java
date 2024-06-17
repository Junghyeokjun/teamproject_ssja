package teamproject.ssja.service.Vendor;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.LikesVO;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ProductImgDto;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.dto.vendor.VendorInfoDTO;
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
}
