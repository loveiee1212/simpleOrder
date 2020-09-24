package com.team2.simpleOrder.controller.money;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.money.VaultCashMM;
import com.team2.simpleOrder.service.money.SalesMM;


@Controller
public class VaultCashController {
	//Only Money Controller Number1
	
	@Autowired
	VaultCashMM vcm;
	
	@Autowired
	SalesMM slm;
	
	ModelAndView mav;
	
	@RequestMapping("/startVC")
	public ModelAndView startVC() {
		mav = new ModelAndView("money/vaultcash","vc_status","start");
		return mav;
	}
	
	@RequestMapping("/endvc")
	public ModelAndView endVC(HttpSession session) {
		
		return vcm.checkEndVC(session);
	}
	
	@RequestMapping("/checkstartvc")
	public String checkStartVC(HttpSession session) throws Exception {
		
		return vcm.checkStartVC(session);
	}


}
