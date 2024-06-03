package teamproject.ssja.service.mypage;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.InfoProvider;
import teamproject.ssja.dto.email.MailDTO;
import teamproject.ssja.dto.userinfo.AddressForm;
import teamproject.ssja.dto.userinfo.MyPageOrdersDTO;
import teamproject.ssja.dto.userinfo.UserInfoDTO;
import teamproject.ssja.dto.vendor.VendorInfoDTO;
import teamproject.ssja.mapper.MyPageMapper;

@Slf4j
@Service
@RequiredArgsConstructor
public class MyPageUserInfoService implements MyPageService{

	private final MyPageMapper myPageMapper;
	private final PasswordEncoder passwordEncoder;
	

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
		
		MyPageOrdersDTO ordersInfo = 
				new MyPageOrdersDTO(myPageMapper.getProductCount(id),pageNum);
		Map<String,Long> params = new HashMap<>();
		params.put("id",id);
		params.put("pageNum",Long.valueOf(pageNum));
		
		ordersInfo.setOrderList(myPageMapper.getPurchaseData(params));
		return ordersInfo;
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

	@Override
	public VendorInfoDTO getVendorInfo() {
		long id = InfoProvider.getM_NO();
		return myPageMapper.getVendoInfo(id);
	}

	

}