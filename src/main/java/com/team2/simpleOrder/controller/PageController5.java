package com.team2.simpleOrder.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController5 {

	
	@RequestMapping("testProducreagistraition")
	public String testProducreagistraition(HttpSession session) {
		session.setAttribute("c_code", "123123123123");
		return "storeManagement/testProducreagistraition";
	}
}
