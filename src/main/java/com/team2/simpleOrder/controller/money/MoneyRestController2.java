package com.team2.simpleOrder.controller.money;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.money.MoneyMM1;
import com.team2.simpleOrder.service.money.MoneyMM2;


@RestController
@RequestMapping("/rest")
public class MoneyRestController2 {
	//Only Money Rest Controller Number2
	
	@Autowired
	MoneyMM1 mom1;
	
	@Autowired
	MoneyMM2 mom2;
	
	ModelAndView mav;

}
