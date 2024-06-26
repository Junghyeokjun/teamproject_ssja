package teamproject.ssja.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import teamproject.ssja.InfoProvider;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.service.Purchase.PurchaseService;

@Controller
@RestController
@RequestMapping("/purchase")
public class PurchaseController {
	
	@Autowired
	PurchaseService purchaseService;

	@RequestMapping("")
	public ModelAndView purchase(ModelAndView mv ,int quantity,long productNo) {
		long mno= InfoProvider.getM_NO();
		List<ProductDto> dtos=new ArrayList<>();

		ProductDto dto=purchaseService.getProduct(productNo);
		dto.setPRO_QUANTITY(quantity);
		dtos.add(dto);
		mv.addObject("products", dtos);
		mv.addObject("coupons", purchaseService.getUserCoupon(mno));
		mv.setViewName("purchase");
		return mv;
	}
	
	@PostMapping("/")
	public ModelAndView purchaseCart(ModelAndView mv,@RequestParam("deleteList") List<Integer> list) {
		long mno= InfoProvider.getM_NO();
		List<ProductDto> dtos=purchaseService.getProducts(list, mno);
		mv.addObject("products", dtos);
		mv.addObject("coupons", purchaseService.getUserCoupon(mno));
		mv.setViewName("purchase");
		return mv;
	}

	@RequestMapping("/success" )
	public String succese(@RequestParam Map<String, Object> data){
		purchaseService.Purchase(data);
		
		return "true"; 
	}
	@RequestMapping("/complete")
	public ModelAndView complete(ModelAndView mv,long price) {
		mv.addObject("price", price+"원");
		mv.setViewName("purchase_complete");
		return mv;
	}
}
