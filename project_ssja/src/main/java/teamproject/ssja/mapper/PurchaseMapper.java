package teamproject.ssja.mapper;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.PurchaseDto;

@Mapper
public interface PurchaseMapper {
	
	int insertPurchase(PurchaseDto dto);
}
