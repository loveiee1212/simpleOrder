package com.team2.simpleOrder.controller.money;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.money.BillMM;

@RestController
@RequestMapping("/rest")
public class BillRestController {

	@Autowired
	BillMM bm;

	@RequestMapping(value = "/getdetailbill", method = RequestMethod.POST)
	public HashMap<String, Object> getdetailbill(HttpSession session, String bd_date, String oac_num, int oac_status){
		return bm.getDetailBill(session, bd_date, oac_num, oac_status);
	}
	
	@RequestMapping(value = "/cancelpay", method = RequestMethod.POST)
	public HashMap<String, String> cancelPay(HttpSession session, String bd_date, String oac_num, int oac_status){
		return bm.cancelPay(session, bd_date, oac_num, oac_status);
	}
	
	
	@RequestMapping(value = "/searchbills", method = RequestMethod.POST)
	public HashMap<String, String> searchBills(HttpSession session, String date, String code){
		return bm.searchBills(session,date, code);
	}
	
	
	
	
}
