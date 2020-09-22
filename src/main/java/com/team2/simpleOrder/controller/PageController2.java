package com.team2.simpleOrder.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController2 {
	//Only Paging Controller Number2
	
	ModelAndView mav;
	
	@RequestMapping("/schedule")
	public ModelAndView schedule(HttpSession session) {
		ModelAndView mav = new ModelAndView("member/schedule","empCode", session.getAttribute("emp_code").toString());
		return mav;
	}
	
	@RequestMapping("/changeworktime")
	public String changeworktime() {
		return "member/changeworktime";
	}
	
	@RequestMapping(value = "/sellpage")
	public String home() {
		
		return "seat/sellpage";
	}
}
