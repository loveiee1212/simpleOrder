package com.team2.simpleOrder.controller.kiosk;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.kiosk.KioskMM1;
import com.team2.simpleOrder.service.kiosk.KioskMM2;


@Controller
public class KioskController2 {
	//Only kiosk Controller Number2
	
	@Autowired
	KioskMM1 km1;
	
	@Autowired
	KioskMM2 km2;
	
	ModelAndView mav;

}
