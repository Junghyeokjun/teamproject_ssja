package teamproject.ssja.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.product.ProductDetailTotalInfoDTO;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.ListObjectPagingDTO;
import teamproject.ssja.page.PageVO;
import teamproject.ssja.service.Product.ProductDetailService;

@Slf4j
@Controller
public class ProductDetailController {

	@Autowired
	private ProductDetailService productDetailService;
	
	

	@GetMapping("/product_detail")	
	public String product_detail(@RequestParam("PRO_NO") Long productNum, Integer pageNum, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		if(productNum == null) {
			//비정상적인 접근
			return "redirect:/unusualApproach"; }
		
		if(pageNum == null) {
			pageNum = 1; }
		
		validViewAgain(productNum, request, response);
		ListObjectPagingDTO reviewData = productDetailService.getItemsReview(productNum, pageNum);
		model.addAttribute("reviewData", reviewData);
		ProductDetailTotalInfoDTO productData = productDetailService.getProductDetailInfo(productNum);
		model.addAttribute("productData",productData);

		return "/product_detail_refacto";
	}
	
	
	
	//상품상세 조회수 어뷰징 방지 - 쿠키 기반
	private void validViewAgain(Long productNum, HttpServletRequest request, HttpServletResponse response) {
		Cookie beforeCookie = null;
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			 for (Cookie cookie : cookies) {
	                if (cookie.getName().equals("boardView")) {
	                	beforeCookie = cookie;
	                }
	            }
		}
		if (beforeCookie != null) {
            if (!beforeCookie.getValue().contains("[" + productNum + "]")) {
            	beforeCookie.setValue(beforeCookie.getValue() + "_[" + productNum + "]");
            	productDetailService.addCountViewProduct(productNum);
            	beforeCookie.setPath("/");
            	beforeCookie.setMaxAge(60 * 60 * 24);
            	response.addCookie(beforeCookie);
            }
        } else {
            Cookie newCookie = new Cookie("boardView","[" + productNum + "]");
            
            productDetailService.addCountViewProduct(productNum);
            newCookie.setPath("/");
            newCookie.setMaxAge(60 * 60 * 24);
            response.addCookie(newCookie);
        }
    }
	
	
	
	@GetMapping("/unusualApproach")
	public String unusualApproachP() {
		return "/ex/unusualApproach";
	}
	
	
	//리팩토링 후 안씀 혹시 몰라 지우진 않았습니다.
	//@GetMapping("/product_detail")
	public String product_detail(@RequestParam("PRO_NO") long PRO_NO, Criteria criteria, Model model) {
		//("product_detail()..");
		model.addAttribute("productdetail", productDetailService.get(PRO_NO));
		
		long total = productDetailService.getTotal(PRO_NO);
		model.addAttribute("pageMaker", new PageVO(total, criteria));		
		model.addAttribute("productdetailreplys", productDetailService.getListWithPaging(criteria));
		
		return "/product_detail";
	}
}
