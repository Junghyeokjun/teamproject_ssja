package teamproject.ssja.service.Vendor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.LikesVO;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.dto.vendor.VendorInfoDTO;
import teamproject.ssja.page.Criteria;

public interface VendorService {
	// 판매자 본인의 판매자 정보 가져오기
	public VendorInfoDTO getVendor(long mNo);

}
