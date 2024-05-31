package teamproject.ssja.dto.login;

import java.util.Map;

public class GoogleResponse implements OAuth2Response{

    private final Map<String, Object> attribute;
    private long id;

    public GoogleResponse(Map<String, Object> attribute) {
        this.attribute = attribute;       		
    }

    @Override
    public String getProvider() {

        return "google";
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
        return attribute.get("sub").toString();
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
		return attribute.get("name").toString();
	}

}