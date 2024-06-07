package teamproject.ssja.controller.mine;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import teamproject.ssja.dto.userinfo.CartItemsDTO;
import teamproject.ssja.service.Product.ProductService;

@RestController
@RequiredArgsConstructor
public class MyItemCartController {
	
	private final ProductService productoService;
	
	@GetMapping("/item_cart")
	public ResponseEntity<List<CartItemsDTO>> getItemCart() {
		
		List<CartItemsDTO> list = productoService.getYourItemCrat();
		if(list == null) {
			return ResponseEntity.ok(null);
		}else {
		
		return ResponseEntity.ok(list);
		}
	}
	
	
	

}
