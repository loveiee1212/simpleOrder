package com.team2.simpleOrder.controller.money;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
}
