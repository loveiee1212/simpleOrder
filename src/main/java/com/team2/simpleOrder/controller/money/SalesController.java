package com.team2.simpleOrder.controller.money;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.money.VaultCashMM;
import com.team2.simpleOrder.service.money.SalesMM;


@Controller
public class SalesController {
	//Only Money Controller Number2

	@Autowired
	SalesMM sm;
	
	ModelAndView mav;

	@RequestMapping ("/salescontrol")
	public String salesControl() {
		
		return "money/salescontrol";
	}
}
