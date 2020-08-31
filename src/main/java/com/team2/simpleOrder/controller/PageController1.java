package com.team2.simpleOrder.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController1 {
	//Only Paging Controller Number1

	ModelAndView mav;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	@RequestMapping("/schedule")
	public String schedule() {
		return "member/schedule";
	}
	@RequestMapping("/changeWorkTime")
	public String changeWorkTime() {
		return "member/changeWorkTime";
	}
	@RequestMapping("/joincmember")
	public String joinCmember() {
		return "member/joinCmemberFrm";
	}
}
