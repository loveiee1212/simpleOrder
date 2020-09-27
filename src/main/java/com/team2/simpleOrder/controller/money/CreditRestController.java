package com.team2.simpleOrder.controller.money;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team2.simpleOrder.dto.Order;
import com.team2.simpleOrder.service.money.CreditMM;

@RestController
@RequestMapping("/rest")
public class CreditRestController {

	@Autowired
	CreditMM cm;
	
	@RequestMapping(value = "/getcreditlist", method = RequestMethod.POST)
	public HashMap<String, String> getcreditList(HttpSession session, int oac_status) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		return cm.getcreditList(session,oac_status);
	}
	
	@RequestMapping(value = "/showdetailcredit", method = RequestMethod.POST)
	public HashMap<String, String> getdetailCredit(HttpSession session,String bd_date, String oac_num,int oac_status) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		return cm.getdetailCredit(session,bd_date,oac_num,oac_status);
	}
}
