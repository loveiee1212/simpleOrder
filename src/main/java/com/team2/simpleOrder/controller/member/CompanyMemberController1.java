package com.team2.simpleOrder.controller.member;


import java.util.HashMap;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
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
	
	@Transactional
	@PostMapping("/createCcodeAcount")//사업체만 추가 
	public String createCcodeAcount(@RequestParam HashMap<String, String> cCodeInfo, HttpSession session, RedirectAttributes reat) {
		return mm.createCcodeAcount(cCodeInfo,session,reat);
	}
	@GetMapping("/emailLogout")//모든 세션 초기화
	public String emailLogout(HttpSession session) {
		return mm.emailLogout(session);
	}
	@GetMapping("/backClist")//다시 사업체 정보 가져오기
	public String backClist(HttpSession session) {
		return mm.backClist(session);
	}
	@PostMapping("/empAcountlogin") //직원 로그인
	public String empAcountlogin(@RequestParam HashMap<String, String> empAcountInfo, HttpSession session, RedirectAttributes reat){
		return mm.empAcountlogin(empAcountInfo,session,reat);
	}
	@GetMapping("/empLogOut") // 
	public String empLogOut(HttpSession session) {
		return mm.cCodeAcountLogout(session);
	}
	@PatchMapping("/updateEmpInfo")
	public String updateEMpInfo(HttpSession session, @RequestParam HashMap<String, String> empInfo, RedirectAttributes reat) {
		mm.updateEmpInfo(empInfo, session, reat);
		return "redirect:posSetting";
	}
	
	@PostMapping("/createEmpInfo")
	public String createEmpInfo(HttpSession session, @RequestParam HashMap<String, String> empInfo, RedirectAttributes reat) {
		return mm.createEmpInfo(session, empInfo,reat);
	}
	@PatchMapping("/fireEmpInfo")
	public String deleteEmpInfo(HttpSession session, @RequestParam HashMap<String, String> empInfo, RedirectAttributes reat) {
		return mm.fireEmpInfo(session, empInfo,reat);
	}
	

	
}
