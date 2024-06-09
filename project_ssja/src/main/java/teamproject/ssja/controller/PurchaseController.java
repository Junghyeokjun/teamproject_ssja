package teamproject.ssja.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.service.Purchase.PurchaseService;

@Controller
@RestController
@RequestMapping("/purchase")
public class PurchaseController {
	
	@Autowired
	PurchaseService purchaseService;

	
//	principal편집용 코드
//	@RequestMapping("aab")
//	public ModelAndView aab(ModelAndView mv) {
//	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//	    if (authentication != null) {
//	    	((CustomUserDetailsDTO) authentication.getPrincipal()).getUserInfo().setM_No(1);
//	    	mv.addObject("pri",authentication.getPrincipal());
//	    }
//		mv.setViewName("aaa");
//		return mv;
//	}
	@RequestMapping("")
	public ModelAndView purchase(ModelAndView mv ) {
		List<ProductDto> dtos=new ArrayList<>();
		
		mv.addObject("products", dtos);
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
//	@RequestMapping("/success")
//	public void succese(@RequestParam("M_NO") long M_NO,
//			            @RequestParam("PUR_TOT") long PUR_TOT,
//			            @RequestParam("PUR_DC") long PUR_DC,
//			            @RequestParam("PUR_PAY") long PUR_PAY,
//			            @RequestParam("PUR_PAYMENT") String PUR_PAYMENT,
//			            @RequestParam("PUR_DVADDRESS") String PUR_DVADDRESS,
//			            @RequestParam("PUR_DV") String PUR_DV,
//			            @RequestParam("products") List<Map<String, Object>> products) {
//		PurchaseDto purchase=new PurchaseDto(0, M_NO, PUR_TOT, PUR_DC, PUR_PAY, PUR_PAYMENT, null, PUR_DVADDRESS, PUR_DV);
//		System.out.println(purchase); 
//		System.out.println(products);
////		purchaseService.Purchase(purchase);
//	}
	@RequestMapping("/success" )
	public String succese(@RequestParam Map<String, Object> data){
		
		purchaseService.Purchase(data);
		
		return "true"; 
//		purchaseService.Purchase(purchase);
	}
	@RequestMapping("/complete")
	public ModelAndView complete(ModelAndView mv,long price) {
		mv.addObject("price", price+"원");
		mv.setViewName("purchase_complete");
		return mv;
	}
}
