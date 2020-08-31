package com.team2.simpleOrder.controller.member;



import java.util.HashMap;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team2.simpleOrder.service.member.CompanyMemberMM1;

@RestController
@RequestMapping("/rest")
public class CompanyMemberRestController1 {
	
	@Autowired
	CompanyMemberMM1 mm;
	
	
	
	@Transactional
	@RequestMapping("/joinCmember")
	public String joinCmember(@RequestParam HashMap<String, String> company) throws MessagingException {
		System.out.println(company.get("ce_email"));
		return mm.joinCmember(company);
	}
	
	@GetMapping("/statuscheck/{memberCode}")
	public String statuscheck(@PathVariable Long memberCode) {
		mm.statusCheck(memberCode);

		return "회원 인증이 완료 되었습니다. 감사합니다.";
	}
	
}