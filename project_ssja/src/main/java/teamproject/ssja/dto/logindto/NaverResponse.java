
package teamproject.ssja.dto.logindto;

import java.util.Map;

public class NaverResponse implements OAuth2Response{

    private final Map<String, Object> attribute;
    private long id;

    public NaverResponse(Map<String, Object> attribute) {
        this.attribute = (Map<String, Object>) attribute.get("response");
    }


    @Override
    public String getProvider() {

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