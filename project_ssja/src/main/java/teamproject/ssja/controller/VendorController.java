package teamproject.ssja.controller;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.dto.vendor.VendorInfoDTO;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.Page10VO;
import teamproject.ssja.page.PageVO;
import teamproject.ssja.service.Admin.ProductListService;
import teamproject.ssja.service.Board.BoardService;
import teamproject.ssja.service.Product.ProductCategoryService;
import teamproject.ssja.service.Product.ProductDetailService;
import teamproject.ssja.service.Vendor.VendorService;

@Slf4j
@Controller
@RequestMapping("/vendor")
public class VendorController {

	// vendor, product를 가져오는 service autowired해야 함
	// 상품 카테고리를 가져오는 서비스
	@Autowired
	ProductCategoryService productCategoryService;

	@Autowired
	VendorService vendorService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	ProductListService productListService;
	
	@Autowired
	ProductDetailService productDetailService; 
	
	@GetMapping("")	
	public String vendorHome() {
		return "/vendor/vendor_view";
	}
	
//	@PostMapping("/vendorInfo")
//	public String getVendorInfo(@RequestParam("vendorData") long vendorNo, Model model) {
//		model.addAttribute("vendorObj", vendorService.getVendor(vendorNo));
//	}
	

	@GetMapping("/product/write")
	public String writeProduct(Model model) {
		log.info("writeProduct()..");
		// 카테고리
		model.addAttribute("pcMains", productCategoryService.getPCMain());

		return "/vendor/vendor_write_product";
	}
		
	// 파일 업로드
	@PostMapping("/product/add")
	public String addOne(MultipartFile bannerFile, 
						 List<MultipartFile> coverFile, 
						 List<MultipartFile> explainFile,
						 ProductDto productDto,
						 Model model) {
		log.info("addOne()..");	
		
//		// 데이터 넘어오는 것은 확인함
//		log.info("bannerFile : {} " , bannerFile);
//		log.info("coverFiles : {} " , coverFile);
//		log.info("explainFiles : {} " , explainFile);
//		
//		log.info("Cover Files:");
//		for (MultipartFile file : coverFile) {
//		    log.info("File Name: " + file.getOriginalFilename());
//		    log.info("Content Type: " + file.getContentType());
//		    log.info("File Size: " + file.getSize());
//		}
//
//		log.info("Explain Files:");
//		for (MultipartFile file : explainFile) {
//		    log.info("File Name: " + file.getOriginalFilename());
//		    log.info("Content Type: " + file.getContentType());
//		    log.info("File Size: " + file.getSize());
//		}
		
		if(bannerFile.isEmpty() || coverFile.isEmpty() || explainFile.isEmpty()) {
			vendorService.isEmpty(bannerFile, coverFile, explainFile, model);
		}		
		
		// 배너 이미지 처리 및 물품 추가
		vendorService.addProduct(productDto, bannerFile);

		// 물품 이미지들 처리 및 추가
		vendorService.addProductImgs(coverFile, explainFile, vendorService.getProNum(productDto));

		// 초기화면으로 돌아가기(해당 페이지는 초기 화면 역할을 하며, 이후 변경할 예정)
		return "/vendor/vendor_view";
	}

	@GetMapping("/product/list/{vno}")
	public String showProductList(@AuthenticationPrincipal CustomPrincipal principal, Model model, Criteria criteria, @PathVariable("vno") long vno) {
		log.info("ProductList()..");
		if(principal != null) {
			criteria.setBmno(principal.getMemberNum());
			// 일시적으로 목록을 불러오기 위해 사용. 판매자 자신의 상품 목록 리스트는 요구 메서드가 다름
			// long Productstotal = productListService.getProductListTotalCount();
			// model.addAttribute("productpageMaker", new Page10VO(Productstotal, criteria));
			// model.addAttribute("products", productListService.getProductListWithPaging(criteria));
			long Productstotal = vendorService.getProductCounts(criteria);
			model.addAttribute("productpageMaker", new Page10VO(Productstotal, criteria));
			model.addAttribute("products", vendorService.getProductList(criteria, vno));
			model.addAttribute("vno", vno);
			return "/vendor/vendor_product_list";
		}else {
			return "/login";
		}
	}

	@GetMapping("/product/modify_view")
	public String ShowThisProduct(@RequestParam("proNo")long proNo, Model model) {
		model.addAttribute("pcMains", productCategoryService.getPCMain());
		model.addAttribute("product", productDetailService.get(proNo));
		model.addAttribute("pcMains", productCategoryService.getPCMain());
		return "/vendor/vendor_modify_product";
	}
	
	@GetMapping("/question/{category}")
	public String showQnaList(@AuthenticationPrincipal CustomPrincipal principal, Model model, Criteria criteria,@PathVariable("category") long bcno) {
		log.info("showProductList()..");	
		criteria.setBmno(principal.getMemberNum());
		model.addAttribute("bc", boardService.showBoardCategory(bcno));
		criteria.setBcno(bcno);
		// 일시적으로 목록을 불러오기 위해 사용. 판매자 자신의 문의 내역 리스트는 요구 메서드가 다름 
		//model.addAttribute("boards",  boardService.showListWithPaging(criteria));
		model.addAttribute("boards",  vendorService.getQnaLists(criteria, bcno, criteria.getBmno()));
		
		//model.addAttribute("pageMaker", new PageVO(boardService.getTotal(criteria.getBcno()), criteria));
		model.addAttribute("pageMaker", new PageVO(vendorService.getQnaCounts(criteria), criteria));
		
		return "/vendor/vendor_qna_list";
	}
	
	@GetMapping("/question/content_view/{category}")
	public String showView(@PathVariable("category") long bcno,HttpServletRequest request, HttpServletResponse response, Model model) {
		log.info("showView()..");
		model.addAttribute("content_view", boardService.showContent(request, response));
		model.addAttribute("bcNo", bcno);		
		return "/vendor/content_view";
	}

	@GetMapping("/question/write_view/{category}")
	public String writeView(Model model, @PathVariable("category") long bcno) {
		log.info("writeView()..");
		model.addAttribute("bcno", bcno);
		return "/vendor/write_view";
	}

	@PostMapping("/question/write")
	public String addOne(@AuthenticationPrincipal CustomPrincipal principal, BoardDto boardDto) {
		log.info("addOne()..");		
		// 관리자 영역. 추후 수정이 필요하거나, 수정하지 않아도 됨.
		return "redirect:/vendor/question/" + boardDto.getBbcno();
	}

	@PostMapping("/question/modify_view")
	public String modifyView(@AuthenticationPrincipal CustomPrincipal principal, BoardDto boardDto, Model model) {
		log.info("modifyView()..");
		model.addAttribute("modify_view", boardDto);
		return "/vendor/modify_view";
	}

	@PostMapping("/question/modify")
	public String modify(BoardDto boardDto) {
		boardService.modifyBoard(boardDto);
		return "redirect:/vendor/question/20";
	}

	@GetMapping("/delete")
	@PostMapping("/question/delete")
	public String removeOne(BoardDto boardDto) {
		log.info("removeOne()..");
		boardService.removeBoard(boardDto);
		return "redirect:/vendor/question/20" ;
	}
}
