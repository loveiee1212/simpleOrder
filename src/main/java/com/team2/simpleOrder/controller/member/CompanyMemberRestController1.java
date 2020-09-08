package com.team2.simpleOrder.controller.member;

import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.MessagingException;
import javax.swing.text.html.HTML;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team2.simpleOrder.dto.Member;
import com.team2.simpleOrder.service.member.CompanyMemberMM1;

@RestController
@RequestMapping("/rest")
public class CompanyMemberRestController1 {
	
	
	@Autowired
	CompanyMemberMM1 mm;
	

	@Transactional
	@PostMapping("/createEmailAcount") //새로운 Email 계정 생성
	public boolean createEmailAcount(@RequestParam HashMap<String, String> acountInfo) throws MessagingException {
		return mm.createEmailAcount(acountInfo);
	}
	
	@GetMapping("/cEmailLogin") //Email 로그인
	public boolean cEmailLogin(@RequestParam HashMap<String, String> emailIdPw) {
		return mm.cEmailLogin(emailIdPw);
	}
	@GetMapping("/getClist") //사업체 리스트 가져오기
	public HashMap<String, String> getClist(String ce_email){
		return mm.getClist(ce_email);
	}
	@GetMapping("/cLogin") //사업체 로그인
	public boolean cLogin(@RequestParam HashMap<String, String> cInfo) {
		return mm.cLogin(cInfo);
	}
	@GetMapping("/emailAcountStatusChange/{cCode}") //이메일 계정 상태 변경
	public String emailAcountStatusChange(@PathVariable Long cCode) {
		mm.emailAcountStatusChange(cCode);
		return "Congratulations, your subscription is complete.\r\n";
	}

}