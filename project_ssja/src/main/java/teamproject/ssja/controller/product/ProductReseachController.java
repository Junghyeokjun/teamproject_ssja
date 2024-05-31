package teamproject.ssja.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductReseachController {

	@GetMapping("/search")
	public String getSearchProductList(@RequestParam("category")int categoryNum ){
		
		return "/product/search_products";
	}
	@GetMapping("/best-list")
	public String showBestListProduct() {
		return "/product/best-items-page";
	}
	
}
