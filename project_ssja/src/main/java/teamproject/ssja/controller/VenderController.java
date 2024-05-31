package teamproject.ssja.controller;

import java.lang.reflect.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.PageVO;
import teamproject.ssja.service.Board.BoardService;

@Slf4j
@Controller
@RequestMapping("/vender")
public class VenderController {

	//vender, product를 가져오는 service autowired해야 함

	@Autowired
	
	
	@GetMapping("/product/write")
	public String writeProduct() {
		log.info("writeProduct()..");
		// 
		
		return "/vender/vender_write_product";
	}
	
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
