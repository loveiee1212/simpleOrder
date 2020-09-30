package com.team2.simpleOrder.controller.money;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.money.VaultCashMM;
import com.team2.simpleOrder.service.money.SalesMM;


@RestController
@RequestMapping("/rest")
public class SalesRestController {
	//Only Money Rest Controller Number2
	
	@Autowired
	SalesMM sm;
	
	@RequestMapping("/getdaysales")
	public String getDaySales(HttpSession session,@RequestParam HashMap<String, String> sam) {
		
		return sm.getDaySales(session,sam);
	}
}
