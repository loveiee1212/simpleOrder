package com.team2.simpleOrder.controller.storeManagement;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.storeManagement.PosMM1;
import com.team2.simpleOrder.service.storeManagement.PosMM2;
import com.team2.simpleOrder.service.storeManagement.PosMM3;


@RestController
@RequestMapping("/rest")
public class PosRestController2 {
	//Only Pos Rest Controller Number2
	
	@Autowired
	PosMM1 pm1;
	
	@Autowired
	PosMM2 pm2;
	
	@Autowired
	PosMM3 pm3;
	
	ModelAndView mav;

}
