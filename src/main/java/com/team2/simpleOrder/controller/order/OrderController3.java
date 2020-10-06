package com.team2.simpleOrder.controller.order;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.order.OrderMM;
import com.team2.simpleOrder.service.order.DetailOrderMM;
import com.team2.simpleOrder.service.order.OrderMM3;


@Controller
public class OrderController3 {
	//Only Order Controller Number3
	
	@Autowired
	OrderMM om1;
	
	@Autowired
	DetailOrderMM om2;
	
	@Autowired
	OrderMM3 om3;
	
	ModelAndView mav;

}
