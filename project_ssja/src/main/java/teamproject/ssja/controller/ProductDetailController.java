package teamproject.ssja.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.PageVO;
import teamproject.ssja.service.Product.ProductDetailService;

@Slf4j
@Controller
public class ProductDetailController {

	@Autowired
	private ProductDetailService productDetailService;

	@GetMapping("/product_detail")
	public String product_detail(@RequestParam("PRO_NO") long PRO_NO, Criteria criteria, Model model) {
		log.info("product_detail()..");
		model.addAttribute("productdetail", productDetailService.get(PRO_NO));
		
		long total = productDetailService.getTotal(PRO_NO);
		// 페이지 만들기 위한 정보를 가져오는데 PageVO변수를 통해 view로 전달?
		model.addAttribute("pageMaker", new PageVO(total, criteria));		
		model.addAttribute("productdetailreplys", productDetailService.getListWithPaging(criteria));

		return "/product_detail";
	}
	
}
