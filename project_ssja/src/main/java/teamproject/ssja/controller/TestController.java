package teamproject.ssja.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import teamproject.ssja.dto.ProductDetailDto;
import teamproject.ssja.dto.ProductDto;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@RequestMapping("/sign_up_before")
	public String signUpBefore() {
		return "sign_up_terms";
	}
	@RequestMapping("/sign_up")
	public String signUp() {
		return "sign_up";
	}
	
	@RequestMapping("/listpage")
	public String listpage() {
		return "temp_listpage";
	}
	@RequestMapping("/login")
	public String login() {
		return "temp_login";
	}
	@RequestMapping("/purchase")
	public String purchase() {
		return "purchase";
	}
	@RequestMapping("/test_purchase")
	public ModelAndView testPurchase(ModelAndView mv) {
		List<ProductDto> dtos=new ArrayList<>();
		dtos.add(new ProductDto(1, 1, 11, 11000, 2, "222", 4, 2323, 222, "테스트", "침대"));
		dtos.add(new ProductDto(2, 1, 12, 12000, 2, "222", 4, 2323, 222, "테스트", "수납"));
		dtos.add(new ProductDto(3, 1, 21, 21000, 2, "222", 4, 2323, 222, "테스트", "침구"));
		mv.addObject("products", dtos);
		mv.setViewName("purchase");
		return mv;
	}
}
