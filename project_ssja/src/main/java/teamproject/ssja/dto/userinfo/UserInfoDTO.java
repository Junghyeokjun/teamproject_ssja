package teamproject.ssja.dto.userinfo;

import java.sql.Date;

import lombok.Data;
@Data
public class UserInfoDTO {
	
	
	private long m_No;
    private String m_Id;
    private String m_Pw;
    private String m_Name;
    private String m_Address1;
    private String m_Address2;
    private String m_ZipCode;
    private Date m_Birth;
    private String m_Grade;
    private String m_Email;
    private String m_Phone;
    private int m_Point;
    private Date m_Date;
    private String auth;
    private String m_NickName;
    private int countCoupon;
    private int countWish;
    private int countPurchase;
    private Date m_deletedate;
	
}
