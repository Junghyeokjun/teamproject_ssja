package teamproject.ssja.service.mypage;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.management.RuntimeErrorException;
import javax.print.attribute.HashAttributeSet;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.InfoProvider;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.community.CommunityBoardDto;
import teamproject.ssja.dto.email.MailDTO;
import teamproject.ssja.dto.product.ProductNumberDTO;
import teamproject.ssja.dto.userinfo.AddressForm;
import teamproject.ssja.dto.userinfo.CartItemsDTO;
import teamproject.ssja.dto.userinfo.MyPageOrdersDTO;
import teamproject.ssja.dto.userinfo.OrderInfoDTO;
import teamproject.ssja.dto.userinfo.UserInfoDTO;
import teamproject.ssja.dto.vendor.VendorInfoDTO;
import teamproject.ssja.mapper.BoardMapper;
import teamproject.ssja.mapper.MyPageMapper;
import teamproject.ssja.page.ListObjectPaging5DTO;
import teamproject.ssja.page.ListObjectPagingDTO;

@Slf4j
@Service
@RequiredArgsConstructor
public class MyPageUserInfoService implements MyPageService{

	private final MyPageMapper myPageMapper;
	private final PasswordEncoder passwordEncoder;
	private final BoardMapper boardMapper;
	

@Override
	public UserInfoDTO getUserInfo(long username) {
		
		return myPageMapper.getUserInfoInMyPage(username);

	}

	@Override
	public void changeAddress(AddressForm addressForm) {
		
		myPageMapper.changeAddress(addressForm);
	}

	@Override
	public String deleteUserEnroll(long userId) {
		
		myPageMapper.deleteUserEnroll(userId);
			 
			LocalDate today = LocalDate.now();
			log.info("오늘{}",today);
			LocalDate EnrollDeleteDate = today.plusDays(7);
			DateTimeFormatter formatString = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			 String EnrollDelDate = EnrollDeleteDate.format(formatString);
			 log.info("EnrollDelDate {}",EnrollDelDate);
			 
			 return EnrollDelDate;
	
	}
	@Override
	public void deleteEnrolled() {
		// TODO Auto-generated method stub
		myPageMapper.deleteEnrolled();
		
	}

	@Override
	public List<String> findDeleteEnrolledUsers() {
		List<String> enrolledDeleteUsers=myPageMapper.findDeleteEnrolledUsers();
		return enrolledDeleteUsers;
	}

	@Override
	public void deleteEnrolledUsersAuth(List<String> enrolledDeleteUsers) {
		myPageMapper.deleteEnrolledUsersAuth(enrolledDeleteUsers);
		
	}

	@Override
	public void modifyUserEmail(String email, String username) {
		Map<String,String> params = new HashMap<>();
		
		params.put("userId",username);
		params.put("email",email);
		myPageMapper.modifyUserEmail(params);
		
	}

	@Override
	public MyPageOrdersDTO getPurchaseData(long id, int pageNum) {
		
		
		Map<String,Long> params = new HashMap<>();
		params.put("id",id);
		params.put("pageNum",Long.valueOf(pageNum));
		List<OrderInfoDTO> orderList =myPageMapper.getPurchaseData(params);
		
		int total = orderList.get(0).getList().get(0).getTotalCount();
		MyPageOrdersDTO orderDTO = new MyPageOrdersDTO(total,pageNum);
		orderDTO.setOrderList(orderList);
		return orderDTO;
	}

	@Override
	public boolean checkEMail(String address) {
	long id =	InfoProvider.getM_NO();
	String email = myPageMapper.checkEmail(id);
	if(address.equals(email)) {
		
		return true;
	}else {
		return false;
	}
	}

	@Override
	public boolean checkDuplicatedBizname(String bizName) {
		
		int num = myPageMapper.checkDuplicatedBizname(bizName);
		if(num >= 1) {
			return false;
		}
		return true;
	}

	@Override
	public void enrollVendor(VendorInfoDTO vendorInfo) {
		vendorInfo.setId(InfoProvider.getM_NO());
		myPageMapper.enrollVendor(vendorInfo);
	}

	@Transactional
	@Override
	public VendorInfoDTO getVendorInfo() {
		try {
			
			long id = InfoProvider.getM_NO();
			String username = InfoProvider.userId();
			//myPageMapper.renewRoleToVnedor(username);
			return myPageMapper.getVendoInfo(id);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}

	@Override
	public int isAppliedVendor() {
		long id = InfoProvider.getM_NO();
		return myPageMapper.isAppliedVendor(id);
	}

	@Override
	public ListObjectPagingDTO getcartItems(int pageNum) {
		
		long id = InfoProvider.getM_NO();
		int total = myPageMapper.getTotalCartItems(id);
		
		Map<String , Long> params = new HashMap<>();
		params.put("pageNum",(long)pageNum);
		params.put("m_no",id);
		List<CartItemsDTO> list = myPageMapper.getMyCartItems(params);
		ListObjectPagingDTO data = new ListObjectPagingDTO(total,pageNum);
		data.setObjectList(list);
		return data;
	}

	@Override
	public void deleteItemFromCart(List<Integer> deleteList) {
		long id = InfoProvider.getM_NO();
		ProductNumberDTO data = new ProductNumberDTO(id, deleteList);
		myPageMapper.deleteCartItem(data);
		
	}

	@Override
	public void cancelDelete() {
		Long id = InfoProvider.getM_NO();
		
		myPageMapper.cancelDelete(id);
	}

	@Override
	public ListObjectPagingDTO getMyQnA(Integer pageNum) {
		Long id = InfoProvider.getM_NO();
		List<BoardDto> list = boardMapper.getMyQnAs(id, pageNum);
		if(list == null || list.isEmpty()) return null;
		long total = list.get(0).getTotal();
		ListObjectPagingDTO data = new ListObjectPagingDTO(total, pageNum);
		data.setObjectList(list);
		return data;
	}

	@Override
	public ListObjectPaging5DTO getMyCommus(Integer pageNum) {
		
		Long id = InfoProvider.getM_NO();
		List<CommunityBoardDto> list = boardMapper.getMyCommus(id, pageNum);
		if(list == null || list.isEmpty()) return null;
		long total = list.get(0).getTotal();
		ListObjectPaging5DTO data = new ListObjectPaging5DTO(total, pageNum);
		data.setObjectList(list);
		return data;
	}

	

}