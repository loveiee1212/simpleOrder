package com.team2.simpleOrder.controller.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.member.MemberMM1;
import com.team2.simpleOrder.service.member.MemberMM2;
import com.team2.simpleOrder.service.member.MemberMM3;

@Controller
public class MemberController2 {
	//Only Member Controller Number2
	
	@Autowired
	MemberMM1 mm1;
	
	@Autowired
	MemberMM2 mm2;
	
	@Autowired
	MemberMM3 mm3;
	
	ModelAndView mav;

}
