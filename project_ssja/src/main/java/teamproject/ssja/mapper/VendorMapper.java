package teamproject.ssja.mapper;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.vendor.VendorInfoDTO;

@Mapper
public interface VendorMapper {
	
	// 판매자 자신의 판매자 데이터 가져오기
	VendorInfoDTO selectVendor(long mNo);
	
	
	
	
	//
	// 관리자가 활용하는 sql
	//
	
	// 모든 판매자 데이터 가져오기
	// List<VenderDto> selectAllVendors();
}
