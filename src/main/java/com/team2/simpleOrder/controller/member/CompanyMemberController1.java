package com.team2.simpleOrder.controller.member;


import java.util.HashMap;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.service.member.CompanyMemberMM1;

@Controller
public class CompanyMemberController1 {
	//Only Member Controller Number1
	
	@Autowired
	CompanyMemberMM1 mm;
	
	@PostMapping("/cEmailLogin") //Email 로그인
	public String cEmailLogin(@RequestParam HashMap<String, String> emailIdPw,HttpSession session, RedirectAttributes reat) {
		return mm.cEmailLogin(emailIdPw, session,reat);
	}
	
	@Transactional
	@PostMapping("/createEmailAcount") //새로운 Email 계정 생성
	public String createEmailAcount(@RequestParam HashMap<String, String> acountInfo,HttpSession session, RedirectAttributes reat) throws MessagingException {
		return mm.createEmailAcount(acountInfo, session, reat);
	}
	
	@PostMapping("/cLogin") //사업체 로그인
	public String cLogin(@RequestParam HashMap<String, String> cInfo, HttpSession session, RedirectAttributes reat) {
		return mm.cLogin(cInfo, session, reat);
	}
	

	
}
