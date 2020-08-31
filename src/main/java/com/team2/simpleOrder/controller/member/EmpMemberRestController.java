package com.team2.simpleOrder.controller.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.member.EmpMemberMM;
import com.team2.simpleOrder.service.member.CompanyMemberMM1;
import com.team2.simpleOrder.service.member.MemberMM3;

@RestController
@RequestMapping("/rest")
public class EmpMemberRestController {
	//Only Member Rest Controller Number2
	
	@Autowired
	EmpMemberMM emm;
	
	@Autowired
	MemberMM3 mm3;
	
	ModelAndView mav;
	
	@RequestMapping("/getTime")
	public String getTime(int year,int month) {
		System.out.println(year);
		System.out.println(month);
		String json;
		json = emm.getTime(year,month);
		return json;
	}
}