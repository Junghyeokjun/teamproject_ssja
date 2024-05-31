
package teamproject.ssja.dto.login;

import java.util.Map;

//네이버 로그인 성공 시 받은 데이터를 토대로 만든 OAuth2Response구현체입니다.
//네이버 로그인 성공 해서 응답받은 데이터를 여기에 담습니다.
public class NaverResponse implements OAuth2Response{

    private final Map<String, Object> attribute;
    private long id;

    public NaverResponse(Map<String, Object> attribute) {
        this.attribute = (Map<String, Object>) attribute.get("response");
    }


    @Override
    public String getProvider() {
    		//네이버 소셜 로그인 구현체 이기에 네이버로 Set
        return "naver";
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
        return attribute.get("email").toString();
    }

    @Override
    public String getName() {
        return attribute.get("name").toString();
    }


	@Override
	public String getNickName() {
		// TODO Auto-generated method stub
		return attribute.get("nickname").toString();
	}


	

}