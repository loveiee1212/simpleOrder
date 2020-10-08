package com.team2.simpleOrder.controller.money;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dto.Order;
import com.team2.simpleOrder.service.money.CreditAndPaymentMM;

@RestController
@RequestMapping("/rest")
public class CreditAndPaymentRestController {

	@Autowired
	CreditAndPaymentMM cm;

	@RequestMapping(value = "/getcreditlist", method = RequestMethod.POST)
	public HashMap<String, String> getcreditList(HttpSession session, int oac_status) {
		return cm.getcreditList(session, oac_status);
	}

	@RequestMapping(value = "/showdetailcredit", method = RequestMethod.POST)
	public HashMap<String, Object> getdetailCredit(HttpSession session, String bd_date, String oac_num,
			int oac_status) {
		return cm.getdetailCredit(session, bd_date, oac_num, oac_status);
	}

	@RequestMapping(value = "/moneypayment", method = RequestMethod.POST)
	public HashMap<String, String> moneyPayment(HttpSession session, String bd_date, String oac_num, int getmoney,
			int paymoney, int paytype) {
		return cm.moneyPayment(session, bd_date, oac_num, getmoney, paymoney, paytype);
	}

	@RequestMapping(value = "/updateoac", method = RequestMethod.POST)
	public HashMap<String, String> updateOac(HttpSession session, String bd_date, String oac_num) {
		return cm.updatOac(session, bd_date, oac_num);
	}
	
	@RequestMapping(value = "/addcreditlist", method = RequestMethod.POST)
	public HashMap<String, String> addcreditList(HttpSession session, String oac_num,String crd_name,String crd_phone){
		return cm.addcreditList(session, oac_num,crd_name,crd_phone);
	}
	
	@RequestMapping(value = "/getpayamount", method = RequestMethod.POST)
	public HashMap<String, Object> getpayAmount(HttpSession session, String oac_num) {
		return cm.getpayAmount(session, oac_num);
	}
	
	@RequestMapping(value = "/cancelcredit", method = RequestMethod.POST)
	public HashMap<String, String> cancelCredit(HttpSession session, String bd_date, String oac_num, int sendpay) {
		return cm.cancelCredit(session,bd_date, oac_num,sendpay);
	}
}
