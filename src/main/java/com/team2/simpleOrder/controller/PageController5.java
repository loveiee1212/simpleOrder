package com.team2.simpleOrder.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team2.simpleOrder.service.storeManagement.ProductMM;

@Controller
public class PageController5 {
	@Autowired
	ProductMM pm1;
	
	@RequestMapping("testProducreagistraition")
	public String testProducreagistraition(HttpSession session) {
		session.setAttribute("c_code", "123123123123");
		return "storeManagement/testProducreagistraition";
	}
	@RequestMapping(value = "/productcontrol", method = RequestMethod.GET)
	public String productcontrol() {
		return "/storeManagement/productcontrol";
	}
	@RequestMapping(value = "/stockcontrol", method = RequestMethod.GET)
	public String stockcontrol() {
		return "/storeManagement/stockcontrol";
	}
	@RequestMapping(value = "/productragistration", method = RequestMethod.GET)
	public String productragistration() {
		return "/storeManagement/productragistration";
	}
}
