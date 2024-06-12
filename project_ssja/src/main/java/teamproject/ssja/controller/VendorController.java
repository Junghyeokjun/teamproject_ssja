package teamproject.ssja.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.dto.vendor.VendorInfoDTO;
import teamproject.ssja.service.Product.ProductCategoryService;
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
	
	@GetMapping("")
	public String vendorHome() {
		return "redirect:/vendor/product/list";
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

	@GetMapping("/product/category")

	@PostMapping("/product/add")
	public String addOne() {
		log.info("addOne()..");
		//

		// 초기화면으로 돌아가기(해당 페이지는 초기 화면 역할을 하며, 이후 변경할 예정)
		return "/vendor/vendor_insert_product";
	}

	@GetMapping("/product/list")
	public String ProductList() {
		log.info("ProductList()..");
		//

		return "/vendor/vendor_product_list";
	}

	@GetMapping("/question/list")
	public String showProductList() {
		log.info("showProductList()..");

		//
		return "/vendor/vendor_qna_list";
	}

//	권한 처리 부분 우선 주석처리함
//	// 권한 처리 부분
//	private String vendorAuth(String mappingStr) {
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		if (authentication != null && authentication.isAuthenticated()) {
//			Object principal = authentication.getPrincipal();
//			if (principal instanceof CustomPrincipal) {
//				// 사용자가 로그인한 경우
//				CustomPrincipal userDetails = (CustomPrincipal) principal;
//				
//				if (!userDetails.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_VENDOR"))) {
//					// 사용자가 판매자 권한을 가지고 있지 않은 경우
//					log.info("권한이 없습니다.");
//					return "redirect:/";
//				}
//			}
//		} else {
//			// 사용자가 로그인하지 않은 경우
//			log.info("로그인이 되지 않았습니다.");
//			return "redirect:/login";
//		}
//		return mappingStr;
//	}
}
