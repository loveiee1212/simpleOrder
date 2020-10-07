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
	
	
	@RequestMapping(value = "/sellpage")
	public String sellpage() {
		
		return "seat/sellpage";
	}
	@RequestMapping(value = "/creditcontrol")
	public String creditcontrol() {
		
		return "money/creditControl";
	}
}
