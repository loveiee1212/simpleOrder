package com.team2.simpleOrder.controller.money;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.money.MoneyMM1;
import com.team2.simpleOrder.service.money.MoneyMM2;


@Controller
public class MoneyController1 {
	//Only Money Controller Number1
	
	@Autowired
	MoneyMM1 mom1;
	
	@Autowired
	MoneyMM2 mom2;
	
	ModelAndView mav;

}
