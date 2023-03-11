package kh.project.stayfit.member.model.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;


@Service
@Component
public class MemberMailServiceImpl implements MemberMailService {
	
	@Autowired
	private JavaMailSenderImpl emailSender;
	@Autowired
	private JavaMailSender mailSender;
	private int authNum;
	
	//이메일 보낼 양식
	@Override
	public String EmailForm(String memail) {
		mailCode();
		String setFrom = ".com";
		String toMail = memail;
		String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목 
		String content = 
				"홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 " + authNum + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNum);
	}
	
	//인증번호 난수 생성
	@Override
	public void mailCode() {
		//6자리 난수 발생
			Random r = new Random();
			int cdNum = r.nextInt(888888) + 111111;
			System.out.println("인증번호 : " + cdNum);
//			authNum = cdNum;
	}
	
	//이메일 전송
	@Override
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
	
	@Override
	public int codeChk(String a, String b) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
