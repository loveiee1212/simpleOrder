package com.team2.simpleOrder.controller.member;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dto.Member;
import com.team2.simpleOrder.service.member.CompanyMemberMM;
import com.team2.simpleOrder.service.member.EmpMemberMM;
import com.team2.simpleOrder.service.member.MemberMM3;

@Controller
public class EmpMemberController {
	//Only Member Controller Number2

	@Autowired
	EmpMemberMM emm;
	
	@RequestMapping("/schedule")
	public ModelAndView schedule(HttpSession session) {
		ModelAndView mav = new ModelAndView("member/schedule","position", emm.getPST_NAME(session));
		return mav;
	}
	
	@RequestMapping("/changeworktime")
	public String changeworktime() {
		return "member/changeworktime";
	}

}
