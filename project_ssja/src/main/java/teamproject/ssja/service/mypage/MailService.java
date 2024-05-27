package teamproject.ssja.service.mypage;

import java.util.UUID;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import teamproject.ssja.dto.email.MailDTO;
import teamproject.ssja.mapper.LoginMapper;

@Service
@RequiredArgsConstructor
public class MailService {
	
	 private final JavaMailSender javaMailSender;
	 
	   private static final String senderEmail="ssja@gmail.com";
	 
	   @Autowired
	   LoginMapper loginMapper;

	   public MailDTO CreateMailRequestAuth(MailDTO mail){
		   mail.setTitle("SSJA 이메일 변경 인증");
		   String authNum = UUID.randomUUID().toString().substring(0, 6);
		   mail.setAuthNum(authNum);
		   
		   mail.setContent("안녕하세요 SSJA 쇼핑몰입니다. \n 계정에서 현재 이메일로 변경을 위한 인증번호를 보내드립니다. 인증을 마쳐주세요.\n" + authNum);

	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(mail.getReceiver());
	        message.setFrom(senderEmail);
	        message.setSubject(mail.getTitle());
	        message.setText(mail.getContent());

	        javaMailSender.send(message);
	        return mail;
	    }
	   

	   public void findIDMail(MailDTO mail){
		   mail.setTitle("SSJA 아이디 메일");
		   String authNum = UUID.randomUUID().toString().substring(0, 6);
		   mail.setAuthNum(authNum);
		   String id=loginMapper.findId(mail.getReceiver());
		   
		   mail.setContent("안녕하세요 SSJA 쇼핑몰입니다. \n 회원님의 이메일로 존재하는 아이디는 "+id+" 입니다");

	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(mail.getReceiver());
	        message.setFrom(senderEmail);
	        message.setSubject(mail.getTitle());
	        message.setText(mail.getContent());

	        javaMailSender.send(message);
	    }


		public String randomNumMail(MailDTO mail) {
			String randNum=String.format("%06d", (int)(Math.random()*999999)+1);
			mail.setTitle("SSJA 인증번호 메일");
		   String authNum = UUID.randomUUID().toString().substring(0, 6);
		   mail.setAuthNum(authNum);		   
		   mail.setContent("안녕하세요 SSJA 쇼핑몰입니다. \n 인증번호는 "+randNum+" 입니다");

	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(mail.getReceiver());
	        message.setFrom(senderEmail);
	        message.setSubject(mail.getTitle());
	        message.setText(mail.getContent());

	        javaMailSender.send(message);
	        return randNum;
		}
}
