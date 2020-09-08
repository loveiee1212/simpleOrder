package com.team2.simpleOrder.controller.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.member.CompanyMemberMM1;
import com.team2.simpleOrder.service.member.EmpMemberMM;
import com.team2.simpleOrder.service.member.MemberMM3;

@Controller
public class MemberController3 {
	//Only Member Controller Number3
	
	@Autowired
	CompanyMemberMM1 mm1;
	
	@Autowired
	EmpMemberMM mm2;
	
	@Autowired
	MemberMM3 mm3;
	
	ModelAndView mav;

}
