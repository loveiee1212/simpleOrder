package com.team2.simpleOrder.controller.member;

import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.member.CompanyMemberMM1;

@RestController
@RequestMapping("/rest")
public class CompanyMemberRestController1 {
	
	
	@Autowired
	CompanyMemberMM1 mm;
	

	
	
	@GetMapping("/getClist") //사업체 리스트 가져오기
	public HashMap<String, String> getClist(String ce_email){
		return mm.getClist(ce_email);
	}

	@GetMapping("/emailAcountStatusChange/{cCode}") //이메일 계정 상태 변경
	public String emailAcountStatusChange(@PathVariable Long cCode) {
		mm.emailAcountStatusChange(cCode);
		return "Congratulations, your subscription is complete.\r\n";
	}
	@PostMapping("/addCAcount")
	public ModelAndView addCAcount(@RequestParam HashMap<String, String> EmailInfo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		return mav;
	}

}