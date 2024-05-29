package teamproject.ssja.dto.logindto;

import java.util.Map;

public class KakaoResponse implements OAuth2Response{

    private final Map<String, Object> attribute;
    private Map<String, Object> attributesAccount;
    private Map<String, Object> attributesProfile;
    private long id;

    public KakaoResponse(Map<String, Object> attribute) {
//        this.attribute = (Map<String, Object>) attribute.get("id");    	 

        this.attribute = attribute;
        this.attributesAccount = (Map<String, Object>) attribute.get("kakao_account");
        this.attributesProfile = (Map<String, Object>) attributesAccount.get("profile");
    }

    @Override
    public String getProvider() {

        return "kakao";
    }
    @Override
    public long getId() {
		return id;
	}

    @Override
	public void setId(long id) {
		this.id = id;
	}

	@Override
    public String getProviderId() {
        return attribute.get("id").toString();
    }

    @Override
    public String getEmail() {
        return attributesAccount.get("email").toString();
    }

    @Override
    public String getName() {
        return attributesProfile.get("nickname").toString();
    }

	@Override
	public String getNickName() {
        return attributesProfile.get("nickname").toString();
	}
}