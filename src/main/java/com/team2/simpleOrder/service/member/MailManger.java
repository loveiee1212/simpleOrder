package com.team2.simpleOrder.service.member;

import java.util.HashMap;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailManger {
	String mailAdreess;
	long cCode;
	@Autowired
	JavaMailSender MailSender; 
	
	public void acountApprovalMailSend(HashMap<String, String> acountInfo) throws MessagingException {
		mailAdreess = acountInfo.get("ce_email");
		cCode = Long.parseLong(acountInfo.get("c_code"))*7;
		MimeMessage message = MailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		messageHelper.setFrom(new InternetAddress("simpleOrder@icia.co.kr"));
		messageHelper.setTo(mailAdreess);
		messageHelper.setSubject("[simpleOrder] 심플오더 회원 가입을 감사드립니다.");
		messageHelper.setText(mesageMake(cCode),mesageMake(cCode));
		MailSender.send(message);
	}
	private String mesageMake(long cCodes) {
		StringBuilder mesage = new StringBuilder();
		mesage.append("<h2>저희 simpleOrder에 가입해 주셔서 감사합니다.</h2></br>");
		mesage.append("<h3>simpleOrder회원 인증을 진행하시려면 아래버튼을 입력하시거나 qr 코드를 찍어주세요 </h3></br>");
		mesage.append("http://121.65.47.76:3001/simpleOrder/emailAcountStatusChange/" + cCode + "</br>");
		mesage.append("<img src='https://chart.googleapis.com/chart?cht=qr&amp;chs=200x200&amp;chl=http://121.65.47.76:3001/simpleOrder/emailAcountStatusChange/"+cCode+" ' style ='float = left'></br>");
		mesage.append("<h3>simpleOrder 회원가입하지 않으셧다면 이 메일을 무시해 주시길 바랍니다.</h3></br>");
		mesage.append("타인이 고객님의 이메일 주소를 도용했을 수 도 있습니다.");
		return mesage.toString();
	}

}
