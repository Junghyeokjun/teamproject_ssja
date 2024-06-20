package teamproject.ssja.service.Vendor;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ProductImgDto;
import teamproject.ssja.dto.VendorSalesDto;
import teamproject.ssja.dto.vendor.TotalVendorInfoDto;
import teamproject.ssja.dto.vendor.VendorEtcInfoDTO;
import teamproject.ssja.dto.vendor.VendorInfoDTO;
import teamproject.ssja.dto.vendor.VendorItemCondition;
import teamproject.ssja.mapper.VendorMapper;
import teamproject.ssja.page.Criteria;

@Slf4j
@Service
public class VendorServiceImpl implements VendorService{
	
	@Autowired
	VendorMapper vendorMapper;
	
	
	// 파일을 저장할 디렉터리 경로
	private String productImgDir = System.getProperty("user.dir") + "/src/main/resources/static/images/";
			
	// 폴더명
	private String bannerDir = "product_banner";
	private String coverDir = "product_cover";
	private String explainDir = "product_details";
	
	@Override
	public VendorInfoDTO getVendor(long mNo) {
		return vendorMapper.selectVendor(mNo);
	}

	@Override
	public void addProduct(ProductDto productDto, MultipartFile bannerFile) {
		// System.getProperty("user.dir") : 현재 작업 디렉토리를 반환하는 Java 시스템 프로퍼티
		log.info("addProduct()..");
		String bannerFileDir = productImgDir + bannerDir;
		
		
		// java.io
		// 디렉터리 생성
//		File directoryBanner = new File(bannerFileDir);
//		
//		if(!directoryBanner.exists()) {
//			directoryBanner.mkdirs();
//		}
		
		// 파일 처리
		fileTransferTo(bannerFileDir, bannerFile, 1);
		
		// /images/product_banner/파일명.확장자
		productDto.setPRO_BANNERIMG(bannerDir.replace("/images/", "") + "/" + ssjaFileNameFormat(bannerFile.getOriginalFilename(),1));
		vendorMapper.insertProduct(productDto);
	}

	@Override
	public long getProNum(ProductDto productDto) {
		return vendorMapper.selectInsertedProNum(productDto);
	}
	
	@Override
	public void addProductImgs(List<MultipartFile> coverFile, List<MultipartFile> explainFile, long pro_no) {
		log.info("addProductImgs()..");
		String coverFileDir = productImgDir + coverDir;
		String explainFileDir = productImgDir + explainDir;
		
		// 디렉터리 파일
		File directoryCover = new File(coverFileDir);
		File directoryExplain = new File(explainFileDir);
		
		log.info("cover : " + directoryCover);
		log.info("explain : " + directoryExplain);
		
		// 디렉터리 파일을 담는 배열
		File[] productDirectorys = {directoryCover,directoryExplain};
		
//		// 디렉터리 파일 없으면 만드는 로직
//		Arrays.stream(productDirectorys).forEach(directory -> {
//			if(!directory.exists()) {
//				directory.mkdirs();
//			}
//		});

		log.info(coverFile.size() + "개의 커버 파일이 있음");
		
		for(int i=0; i < coverFile.size(); i++) {
			fileTransferTo(coverFileDir, coverFile.get(i), i);
			ProductImgDto pImgDto = new ProductImgDto();
			pImgDto.setPNo(pro_no);
			pImgDto.setPiPath(coverDir + "/" + ssjaFileNameFormat(coverFile.get(i).getOriginalFilename(),i+1));
			vendorMapper.insertProductImgs(pImgDto);
		}
		
		for(int i=0; i< explainFile.size(); i++) {
			fileTransferTo(explainFileDir, explainFile.get(i), i);
			ProductImgDto pImgDto = new ProductImgDto();
			pImgDto.setPNo(pro_no);
			pImgDto.setPiPath(explainDir + "/" + ssjaFileNameFormat(explainFile.get(i).getOriginalFilename(),i+1));
			vendorMapper.insertProductImgs(pImgDto);
		}
	}

	@Override
	public String isEmpty(MultipartFile bannerFile, List<MultipartFile> coverFile, List<MultipartFile> explainFile, Model model) {
		// 셋 중 하나라도 파일이 비어있을 때 진행하는 처리
		model.addAttribute("message", "파일을 업로드하시지 않았습니다. 홈 화면으로 돌아갑니다.");
		return "redirect:/vendor";
	}

	
	// 파일명 + 확장자가 나오는 originalFileName을 활용하여 이름 재설정
	@Override
	public String ssjaFileNameFormat(String originalFileName, int num) {
		// 확장자를 담을 변수
		String extension = "";
				
		// 구분자(.) 인덱스 
		int dotIndex = originalFileName.lastIndexOf('.');
		
		String formatFileName = "";
		
		if (dotIndex != -1 && dotIndex < originalFileName.length() - 1) {
			extension = originalFileName.substring(dotIndex);
			formatFileName = originalFileName.substring(0, dotIndex);
		}else {
			formatFileName = originalFileName;
		}

		return formatFileName + "_" + num + extension;
	}
	
	void fileTransferTo(String fileDir, MultipartFile file, int i) {		
		try {
			String originalFileName = file.getOriginalFilename();
			String formatBannerfileName = ssjaFileNameFormat(originalFileName, 1);

			String filePath = fileDir + "/" + formatBannerfileName; 
			log.info("filePath : " + filePath);
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<BoardDto> getQnaLists(Criteria criteria, Long bcno, Long bmno) {
		criteria.setBcno(bcno);
		criteria.setBmno(bmno);
		return vendorMapper.selectVendorQnas(criteria);
	}

	@Override
	public List<ProductDto> getProductList(Criteria criteria, Long vno) {
		criteria.setVno(vno);
		return vendorMapper.selectVendorProducts(criteria);
	}

	@Override
	public long getQnaCounts(Criteria criteria) {
		return vendorMapper.selectVendorQnaCount(criteria);
	}

	@Override
	public long getProductCounts(Criteria criteria) {
		// TODO Auto-generated method stub
		return vendorMapper.selectVendorProductsCount(criteria);
	}

	//회원의 판매자 조회
	@Override
	public TotalVendorInfoDto getVendorTotalInfo(String bizname, int pageNum) {
		TotalVendorInfoDto data = new TotalVendorInfoDto();
		data.setCommuList(vendorMapper.getVendorInfoCommu(bizname));
		VendorEtcInfoDTO info =vendorMapper.getVendorInfoEtc(bizname);
		data.setInfo(info);
		
		return data;
		
	}

	@Override
	public List<ProductDto> getVendorItemList(VendorItemCondition condition) {
		return vendorMapper.getVendorItemList(condition);
	}


	@Override
	public List<VendorSalesDto> getWeeklySalesData() {
		// TODO Auto-generated method stub
		return vendorMapper.selectVendorSalesInWeek();
	}
}
