package teamproject.ssja.service.Vendor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.LikesVO;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.dto.vendor.VendorInfoDTO;
import teamproject.ssja.mapper.VendorMapper;
import teamproject.ssja.page.Criteria;

@Service
public class VendorServiceImpl implements VendorService{
	
	@Autowired
	VendorMapper vendorMapper;
	
	@Override
	public VendorInfoDTO getVendor(long mNo) {
		return vendorMapper.selectVendor(mNo);
	}


}
