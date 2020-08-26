package com.team2.simpleOrder.controller.order;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.order.OrderMM1;
import com.team2.simpleOrder.service.order.OrderMM2;
import com.team2.simpleOrder.service.order.OrderMM3;


@RestController
@RequestMapping("/rest")
public class OrderRestController1 {
	//Only Order Rest Controller Number1
	
	@Autowired
	OrderMM1 om1;
	
	@Autowired
	OrderMM2 om2;
	
	@Autowired
	OrderMM3 om3;
	
	ModelAndView mav;

}