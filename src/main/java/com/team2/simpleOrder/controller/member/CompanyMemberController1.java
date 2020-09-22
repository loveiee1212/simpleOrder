package com.team2.simpleOrder.controller.member;


import java.util.HashMap;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.service.member.CompanyMemberMM1;

@Controller
public class CompanyMemberController1 {
	
	@Autowired
	CompanyMemberMM1 mm;
	
	@PostMapping("/cEmailLogin") //Email 로그인
	public String cEmailLogin(@RequestParam HashMap<String, String> emailIdPw,HttpSession session, RedirectAttributes reat) {
		return mm.cEmailLogin(emailIdPw, session,reat);
	}
	

	@PostMapping("/createEmailAcount") //새로운 Email 계정 생성
	public String createEmailAcount(@RequestParam HashMap<String, String> acountInfo,HttpSession session, RedirectAttributes reat) throws MessagingException {
		return mm.createEmailAcount(acountInfo, session, reat);
	}
	
	@PostMapping("/cLogin") //사업체 로그인 
	public String cLogin( HttpSession session, RedirectAttributes reat, @RequestParam HashMap<String, String> cInfo) {
		return mm.cLogin(cInfo, session, reat);
	}
	
	@PostMapping("/createCcodeAcount")//사업체 추가 ! jsp에서 도로명주소 검색 api검색시 세션이 만료되어 cCodeInfo에 있는 cEmail정보를 세션에 다시 넣어줌
	public String createCcodeAcount(@RequestParam HashMap<String, String> cCodeInfo, HttpSession session, RedirectAttributes reat) {
		return mm.createCcodeAcount(cCodeInfo,session,reat);
	}
	
	@GetMapping("/emailLogout")//모든 세션 초기화
	public String emailLogout(HttpSession session) {
		System.out.println("이메일 로그아웃");
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
		System.out.println("로그아웃입니다.");
		return mm.cCodeAcountLogout(session);
	}
	
	@PatchMapping("/updateEmpInfo")
	public String updateEMpInfo(HttpSession session, @RequestParam HashMap<String, String> empInfo, RedirectAttributes reat) {
		return mm.updateEmpInfo(empInfo, session, reat);
	}
	
	@PostMapping("/createEmpInfo")
	public String createEmpInfo(HttpSession session, @RequestParam HashMap<String, String> empInfo, RedirectAttributes reat) {
		return mm.createEmpInfo(session, empInfo,reat);
	}
	
	@PatchMapping("/fireEmpInfo")
	public String deleteEmpInfo(HttpSession session, @RequestParam HashMap<String, String> empInfo, RedirectAttributes reat) {
		return mm.fireEmpInfo(session, empInfo,reat);
	}
	
	@RequestMapping("/updatePositionGrant") // 직급 변경
	public String updateGrantPosition(@RequestParam HashMap<String, String> positionInfo, HttpSession session, RedirectAttributes reat) {
		mm.updatePositionGrant(positionInfo,session,reat);
		
		return "redirect:/posSetting";
	}
	
	@PostMapping("/cAcountDelect") // 사업자 계정 삭제
	public String cAcountDelect(@RequestParam HashMap<String, String> cAcountInfo, HttpSession session) {
		return mm.cAcountDelect(cAcountInfo,session);
	}
	@PostMapping("/updatePosition") // 직급 정보 수정
	public String updatePosition(@RequestParam HashMap<String, String> positionInfo, HttpSession session, RedirectAttributes reat) {
		return mm.updatePosition(positionInfo, session, reat);
	}
	@PostMapping("/deletePosition") // 직급 삭제
	public String deletePosition(@RequestParam HashMap<String, String> positionInfo, HttpSession session, RedirectAttributes reat) {
		return mm.deletePosition(positionInfo, session, reat);
		
	}
	@PostMapping("/createPosition") // 직급 생성
	public String createPosition(@RequestParam HashMap<String, String> positionInfo, HttpSession session, RedirectAttributes reat) {
		return mm.createPosition(positionInfo, session, reat);
	}
	@PostMapping("/ChangeSecurityCode") // 보안코드 변경 // 나중에 위치 변경
	public String ChangeSecurityCode(@RequestParam HashMap<String, String> securityCode, RedirectAttributes reat, HttpSession session) {
		return mm.ChangeSecurityCode(securityCode,reat, session);
	}

	
}
