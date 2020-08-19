package com.team2.simpleOrder.controller.money;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.money.VaultCashMM;
import com.team2.simpleOrder.service.money.SalesMM;


@RestController
@RequestMapping("/rest")
public class SalesRestController {
	//Only Money Rest Controller Number2
	
	@Autowired
	VaultCashMM mom1;
	
	@Autowired
	SalesMM mom2;
	
	ModelAndView mav;

}
