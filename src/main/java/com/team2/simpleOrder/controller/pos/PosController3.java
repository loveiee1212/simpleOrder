package com.team2.simpleOrder.controller.pos;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.pos.PosMM1;
import com.team2.simpleOrder.service.pos.PosMM2;
import com.team2.simpleOrder.service.pos.PosMM3;


@Controller
public class PosController3 {
	//Only Pos Controller Number3
	
	@Autowired
	PosMM1 pm1;
	
	@Autowired
	PosMM2 pm2;
	
	@Autowired
	PosMM3 pm3;
	
	ModelAndView mav;

}
