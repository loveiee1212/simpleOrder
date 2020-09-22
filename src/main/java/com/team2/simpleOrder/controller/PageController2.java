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
		ModelAndView mav = new ModelAndView();
		//mav.addObject("empCode", session.getAttribute("emp_code").toString());
		mav.addObject("empCode", "00000");
		mav.setViewName("member/schedule");
		return mav;
	}
	
	@RequestMapping("/changeworktime")
	public String changeworktime() {
		return "member/changeworktime";
	}
}
