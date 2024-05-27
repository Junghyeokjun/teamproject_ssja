package teamproject.ssja.controller.product;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.product.ProductCondition;
import teamproject.ssja.service.Product.ProductService;

@RestController
@Slf4j
@RequestMapping("/product")
public class ProductReseachRestController {
	
	@Autowired
	ProductService productService;
	
	@PostMapping("/lists")
	ResponseEntity<List<ProductDto>> transProductList(@RequestBody ProductCondition productCondition){
		
		List<ProductDto> list = productService.getProductList();
		
		return ResponseEntity.ok().body(list);
	}

	
	
}
