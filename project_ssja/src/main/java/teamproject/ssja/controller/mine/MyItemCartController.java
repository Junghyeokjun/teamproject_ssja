package teamproject.ssja.controller.mine;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import teamproject.ssja.InfoProvider;
import teamproject.ssja.dto.userinfo.CartItemsDTO;
import teamproject.ssja.service.Product.ProductService;

@RestController
@RequiredArgsConstructor
@RequestMapping("/item_cart")
public class MyItemCartController {
	
	private final ProductService productoService;
	
	@GetMapping("")
	public ResponseEntity<List<CartItemsDTO>> getItemCart() {
		
		List<CartItemsDTO> list = productoService.getYourItemCrat();
		if(list == null) {
			return ResponseEntity.ok(null);
		}else {
		
		return ResponseEntity.ok(list);
		}
	}
	@GetMapping("/{productNum}/add")
	public ResponseEntity<String> addCart(@PathVariable("productNum")Long productNum,@RequestParam("quantity") int quantity){
		try {
		Long id = InfoProvider.getM_NO();
		boolean already = productoService.checkUserAddCart(id, productNum);
		productoService.addCart(id, productNum, quantity, already);
		if(already) {
			return ResponseEntity.ok("Renew");
		}else {
			return ResponseEntity.ok("Add");
		}
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("failed");
		}
	}
	
	
	

}
