package teamproject.ssja.controller.adminpage;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import teamproject.ssja.page.ListObjectPagingDTO;
import teamproject.ssja.service.Admin.AdminService;

@ResponseBody
@RequiredArgsConstructor
public class AdminRestController {
	
	private final AdminService adminService;
	
	
	@GetMapping("/board/notice")
	public ResponseEntity<ListObjectPagingDTO> getListNotice(){
		
		ListObjectPagingDTO data = new ListObjectPagingDTO();
		
		return ResponseEntity.ok(data);
	}

}
