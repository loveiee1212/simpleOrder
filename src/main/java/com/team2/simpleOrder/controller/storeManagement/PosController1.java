package com.team2.simpleOrder.controller.storeManagement;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.storeManagement.PosMM1;
import com.team2.simpleOrder.service.storeManagement.PosMM2;
import com.team2.simpleOrder.service.storeManagement.PosMM3;


@Controller
public class PosController1 {
	//Only Pos Controller Number1
	
	@Autowired
	PosMM1 pm1;
	
	@Autowired
	PosMM2 pm2;
	
	@Autowired
	PosMM3 pm3;
	
	ModelAndView mav;

}
