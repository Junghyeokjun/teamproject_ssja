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
	
	
	@GetMapping("/page")
	public String venderPage() {
		log.info("venderPage()..");
		return "/vender_page";
	}
}
