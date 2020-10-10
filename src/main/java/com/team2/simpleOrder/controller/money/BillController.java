package com.team2.simpleOrder.controller.money;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.money.BillMM;

@Controller
public class BillController {

	@Autowired
	BillMM bm;
	
	@RequestMapping(value = "/billcontrol")
	public ModelAndView getBillList(HttpSession session) {
		return bm.getBillList(session);
	}
	
	@RequestMapping(value = "/print")
	public ModelAndView printForEmp(HttpSession session, String bd_date, String oac_num, int oac_status,int ptype) {
		System.out.println(bd_date+oac_num+oac_status);
		return bm.popupForPrint(session,bd_date,oac_num,oac_status,ptype);
	}
}
