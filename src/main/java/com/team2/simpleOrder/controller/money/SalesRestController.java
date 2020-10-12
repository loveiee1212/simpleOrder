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
	
	@RequestMapping("/getmonthsales")
	public String getMonthSales(HttpSession session,@RequestParam HashMap<String, String> smap) {
		
		return sm.getMonthSales(session,smap);
	}
	
	@RequestMapping("/getmonthdetail")
	public String getMonthDetail(HttpSession session, @RequestParam HashMap<String,String> smap) throws Exception {

		return sm.getMonthDetail(session,smap);
	}
	
	@RequestMapping("/getdaysales")
	public String getDaySales(HttpSession session, @RequestParam HashMap<String,String> smap) throws Exception {

		return sm.getDaySales(session,smap);
	}
	
	@RequestMapping("/getcashsales")
	public String getCashSales(HttpSession session) {
		
		return sm.getCashSales(session);
	}
	
	@RequestMapping("/getmonthemailsales")
	public String getMonthEmailSales(HttpSession session,@RequestParam HashMap<String,String> smap) {
		
		return sm.getMonthEmailSales(session,smap);
	}
	
	@RequestMapping("/getmonthemaildetail")
	public String getMonthEmailDetail(HttpSession session,  @RequestParam HashMap<String,String> smap) throws Exception {

		return sm.getMonthEmailDetail(session,smap);
	}
	
	@RequestMapping("/getdayemailsales")
	public String getDayEmailSales(HttpSession session, @RequestParam HashMap<String,String> smap) throws Exception {

		return sm.getDayEmailSales(session,smap);
	}
	
}
