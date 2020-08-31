package com.team2.simpleOrder.controller.storeManagement;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dto.StoreManagement;
import com.team2.simpleOrder.service.storeManagement.PosMM1;
import com.team2.simpleOrder.service.storeManagement.PosMM2;
import com.team2.simpleOrder.service.storeManagement.PosMM3;


@Controller
public class PosController1 {
	//Only Pos Controller Number1
	
	@Autowired
	PosMM1 pm1;
	ModelAndView mav;
	@RequestMapping(value = "/productcontrol", method = RequestMethod.GET)
	public String productcontrol() {
		return "/storeManagement/productcontrol";
	}
	@RequestMapping(value = "/stockcontrol", method = RequestMethod.GET)
	public String stockcontrol() {
		return "/storeManagement/stockcontrol";
	}
	
	/*
	 * @RequestMapping(value = "/insertproduct", method = RequestMethod.POST) public
	 * ModelAndView memberJoin(StoreManagement sm) {
	 * 
	 * mav=pm1.insertProduct(sm); return mav; }
	 */
	@Autowired
	PosMM2 pm2;
	
	@Autowired
	PosMM3 pm3;
	

}
