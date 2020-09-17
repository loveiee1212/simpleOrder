package com.team2.simpleOrder.controller.member;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team2.simpleOrder.service.member.CompanyMemberMM1;

@RestController
@RequestMapping("/rest")
public class CompanyMemberRestController1 {

	@Autowired
	CompanyMemberMM1 mm;

	@GetMapping("/getClist") // 사업체 리스트 가져오기
	public HashMap<String, String> getClist(String ce_email) {
		return mm.getClist(ce_email);
	}

	@GetMapping("/emailAcountStatusChange/{cCode}") // 이메일 계정 상태 변경
	public String emailAcountStatusChange(@PathVariable Long cCode) {
		return mm.emailAcountStatusChange(cCode);
	}

	@GetMapping("/getEmpPostionList") //직원들의 직급 html 태그 가져오기
	public HashMap<String, String> getEmpPostionList(HttpSession session) {
		return mm.getEmpPostionList(session);
	}
	@GetMapping("/getPositionList")// 직원의 수정가능한 html 태그 가져오기
	public HashMap<String, String> getPositionList(HttpSession session , String empPosition) {
		return mm.getPositionList(session,empPosition);
	}

}