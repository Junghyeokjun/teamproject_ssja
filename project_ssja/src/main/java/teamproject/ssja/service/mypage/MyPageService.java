package teamproject.ssja.service.mypage;





import java.util.*;

import teamproject.ssja.dto.userinfo.AddressForm;
import teamproject.ssja.dto.userinfo.UserInfoDTO;
import teamproject.ssja.dto.vendor.VendorInfoDTO;
import teamproject.ssja.page.ListObjectPaging5DTO;
import teamproject.ssja.page.ListObjectPagingDTO;
import teamproject.ssja.dto.userinfo.MyPageOrdersDTO;
public interface MyPageService {

	
	UserInfoDTO getUserInfo(long username);
	void changeAddress(AddressForm addressForm);
	String deleteUserEnroll(long userId);

	void modifyUserEmail(String email, String username);
	
	void deleteUserProcess();
	
	MyPageOrdersDTO getPurchaseData(long id, int PageNum);
	
	boolean checkEMail(String address);
	boolean checkDuplicatedBizname(String bizName);
	void enrollVendor(VendorInfoDTO vendorInfo);
	VendorInfoDTO getVendorInfo();
	int isAppliedVendor();
	
	ListObjectPagingDTO getcartItems(int pageNum);
	void deleteItemFromCart(List<Integer> deletList);
	void cancelDelete();
	
	ListObjectPagingDTO getMyQnA(Integer PageNum);
	ListObjectPaging5DTO getMyCommus(Integer PageNum);
	
}
