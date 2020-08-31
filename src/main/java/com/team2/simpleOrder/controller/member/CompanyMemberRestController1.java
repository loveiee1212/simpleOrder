package com.team2.simpleOrder.controller.member;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.member.MemberMM1;
import com.team2.simpleOrder.service.member.EmpMemberMM;
import com.team2.simpleOrder.service.member.MemberMM3;

@RestController
@RequestMapping("/rest")
public class CompanyMemberRestController1 {
	//Only Member Rest Controller Number1
	
	@Autowired
	MemberMM1 mm1;
	
	@Autowired
	EmpMemberMM mm2;
	
	@Autowired
	MemberMM3 mm3;
	
	@Autowired
	private JavaMailSender MailSender;
	
	ModelAndView mav;
	
	
	@RequestMapping("/joinCmember")
	public String joinCmember() throws MessagingException {
		MimeMessage message = MailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");
		messageHelper.setFrom("guswns2fkrh2@gmail.com");
		messageHelper.setTo("guswns2fkrh2@naver.com");
		messageHelper.setSubject("메일 테스토");
		messageHelper.setText("메일 내용은 테스트 입니당");
		
		//MailSender.send(message);
		return "aa";
	}
	
}