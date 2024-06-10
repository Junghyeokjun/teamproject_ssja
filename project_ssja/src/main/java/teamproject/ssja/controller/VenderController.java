package teamproject.ssja.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.service.Product.ProductCategoryService;

@Slf4j
@Controller
@RequestMapping("/vender")
public class VenderController {

	//vender, product를 가져오는 service autowired해야 함
	//상품 카테고리를 가져오는 서비스 
	@Autowired
	ProductCategoryService productCategoryService;
	
	@GetMapping("")
	public String venderHome() {
		return "redirect:/vender/product/list";
	}
	
	@GetMapping("/product/write")
	public String writeProduct(Model model) {
		log.info("writeProduct()..");
		// 카테고리
		model.addAttribute("pcMains", productCategoryService.getPCMain());
		
		return "/vender/vender_write_product";
	}
	
	@GetMapping("/product/category")
	
	@PostMapping("/product/add")
	public String addOne() {
		log.info("addOne()..");
		// 
		
		// 초기화면으로 돌아가기(해당 페이지는 초기 화면 역할을 하며, 이후 변경할 예정)
		return "/vender/vender_insert_product";
	}
	
	@GetMapping("/product/list")
	public String ProductList() {
		log.info("ProductList()..");
		// 
		
		return "/vender/vender_product_list";
	}
	
	@GetMapping("/question/list")
	public String showProductList() {
		log.info("showProductList()..");
		
		//		
		return "/vender/vender_qna_list";
	}
}
