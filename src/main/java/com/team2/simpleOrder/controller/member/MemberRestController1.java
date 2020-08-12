package com.team2.simpleOrder.controller.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.member.MemberMM1;
import com.team2.simpleOrder.service.member.MemberMM2;
import com.team2.simpleOrder.service.member.MemberMM3;

@RestController
@RequestMapping("/rest")
public class MemberRestController1 {
	//Only Member Rest Controller Number1
	
	@Autowired
	MemberMM1 mm1;
	
	@Autowired
	MemberMM2 mm2;
	
	@Autowired
	MemberMM3 mm3;
	
	ModelAndView mav;
	
}