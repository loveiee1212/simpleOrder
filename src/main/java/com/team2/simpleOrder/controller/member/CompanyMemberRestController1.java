package com.team2.simpleOrder.controller.member;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.service.member.CompanyMemberMM;

@RestController
@RequestMapping("/rest")
public class CompanyMemberRestController1 {

	@Autowired
	CompanyMemberMM mm;

	@GetMapping("/getClist") // 사업체 리스트 가져오기
	public HashMap<String, String> getClist(String ce_email) {
		return mm.getClist(ce_email);
	}

	
	@GetMapping("/getEmpList") //직원들의 직급 html 태그 가져오기
	public HashMap<String, String> getEmpPostionList(HttpSession session, @RequestParam HashMap<String, String> empinfo) {
		return mm.getEmpList(session,empinfo);
	}
	@GetMapping("/getPositionList")// 직원의 수정가능한 html 태그 가져오기
	public HashMap<String, String> getPositionList(HttpSession session , String empPosition) {
		return mm.getPositionList(session,empPosition);
	}
	@GetMapping("/createEmpSetting") // 직원 생성 폼 만들기
	public HashMap<String, String> createEmpSetting(HttpSession session){
		return mm.createEmpSetting(session);
	}
	@GetMapping("/getPositionGrant") // 등급별 권한 가져오기
	public HashMap<String, String> getPositionGrant(HttpSession session){
		return mm.getPositionGrant(session);
	}
	@GetMapping("/getPosition") // 직급 가져오기
	public HashMap<String, String> getPosition(HttpSession session){
		return mm.getPosition(session);
	}
	@GetMapping("/getCSecurityCode") // 사업장 인증 코드 가져오기
	public HashMap<String, String> getCSecurityCode(HttpSession session){
		return mm.getCSecurityCode(session);
	}

	@GetMapping("/test") // 테스트
	public String test(@RequestParam HashMap<String, String> aa) {
		return null;
	}

}