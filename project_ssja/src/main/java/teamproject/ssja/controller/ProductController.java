package teamproject.ssja.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.service.ProductService;

@Slf4j
@Controller
public class ProductController {
	
	@Autowired 
	private ProductService productService;
		
	@GetMapping("/product_detail")
	public String product_detail(@RequestParam("PRO_NO") long PRO_NO,Model model) {
		log.info("product_detail()..");
		model.addAttribute("product_detail",productService.get(PRO_NO));		
		return "/product_detail";
	}	
	@GetMapping("/product_detail2")
	public String product_detail2(@RequestParam("PRO_NO") long PRO_NO,Model model) {
		log.info("product_detail2()..");
		model.addAttribute("product_detail",productService.get(PRO_NO));		
		return "/product_detail2";
	}

}
