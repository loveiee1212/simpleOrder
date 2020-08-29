package com.team2.simpleOrder.controller.kiosk;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.kiosk.KioskMM1;
import com.team2.simpleOrder.service.kiosk.KioskMM2;


@RestController
@RequestMapping("/rest")
public class KioskRestController1 {
	//Only kiosk Rest Controller Number1
	
	@Autowired
	KioskMM1 km1;
	
	@Autowired
	KioskMM2 km2;
	
	ModelAndView mav;
	@PostMapping(value = "/getreviewlist")
	public String getReviewList(HttpServletRequest req){
		//세션에 저장된 사업자이메일과 사업자번호를 가져온다
		HttpSession session= req.getSession();
		String c_email = session.getAttribute("c_email").toString();
		String c_code = session.getAttribute("c_code").toString();
		//사업자 번호와 사업자 이메일을 서비스 클래스로 넘긴다
		km1.getReviewList(c_email, c_code);
		return null;
		
	}

}