package teamproject.ssja.dto.login;

//OAuth2 소셜로그인 전용 인터페이스입닏.
//카카오는 자세히 모르지만 구글에 경우 해당 인터페이스로 GoogleResponse를 구현하시고
//OAuth2UserService에 구글 if문에 넣어 로직만 잘 맞게 실행하시면 문제없이 구글 소셜로그인 구현 가능할 것 입니다.
public interface OAuth2Response {

	long getId();
	
	void setId(long id);
	
    String getProvider();
    //Provider는 로그인 access토큰을 넘겨주는 주체로
    //소셜 로그인에서 네이버, 구글, 카카오 등을 분류하기 위해 만든 변수

    String getProviderId();

    String getEmail();

    String getName();
    
    String getNickName();
}
