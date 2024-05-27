package teamproject.ssja.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import teamproject.ssja.dto.ProductDetailDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.service.Purchase.PurchaseService;

@Controller
@RestController
@RequestMapping("/purchase")
public class PurchaseController {
	
	@Autowired
	PurchaseService purchaseService;
	
	@RequestMapping("")
	public ModelAndView purchase(ModelAndView mv) {
		mv.setViewName("purchase");
		return mv;
	}
	@RequestMapping("/test")
	public ModelAndView testPurchase(ModelAndView mv) {
		List<ProductDto> dtos=new ArrayList<>();
		dtos.add(new ProductDto(3899, 1, 11, 11000, 2, "/images/product_banner/product_banner_2.jpg", 4, 2323, 222, "SSJA", "침대","1111-11-11"));
		dtos.add(new ProductDto(3900, 1, 12, 12000, 2, "/images/product_banner/product_banner_2.jpg", 4, 2323, 222, "SSJA", "수납","1111-11-11"));
		dtos.add(new ProductDto(3901, 1, 13, 21000, 2, "/images/product_banner/product_banner_3.jpg", 4, 2323, 222, "SSJA", "침구","1111-11-11"));
		mv.addObject("products", dtos);
		mv.setViewName("purchase");
		return mv;
	}
	@GetMapping("/succese")
	public void succese(PurchaseDto purchase,@RequestParam(value="products")List<Map<String,Object>> products) {
		System.out.println(purchase);
		System.out.println(products);
//		purchaseService.Purchase(purchase);
	}
	@RequestMapping("/complete")
	public ModelAndView complete(ModelAndView mv) {
		System.out.println();
		mv.setViewName("purchase_complete");
		return mv;
	}
}
