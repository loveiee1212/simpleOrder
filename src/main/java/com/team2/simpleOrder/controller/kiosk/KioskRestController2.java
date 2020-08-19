package com.team2.simpleOrder.controller.kiosk;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.kiosk.KioskMM1;
import com.team2.simpleOrder.service.kiosk.KioskMM2;


@RestController
@RequestMapping("/rest")
public class KioskRestController2 {
	//Only kiosk Rest Controller Number2
	
	@Autowired
	KioskMM1 km1;
	
	@Autowired
	KioskMM2 km2;
	
	ModelAndView mav;

}