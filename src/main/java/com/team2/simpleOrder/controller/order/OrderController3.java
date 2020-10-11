package com.team2.simpleOrder.controller.order;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.order.OrderMM;
import com.team2.simpleOrder.service.order.DetailOrderMM;
import com.team2.simpleOrder.service.order.OrderMM3;


@Controller
public class OrderController3 {
	
	@Autowired
	OrderMM3 om;
	
	
	
	@PostMapping("/gropPayMent")
	String gropPayMent(@RequestParam HashMap<String, String> oac_num, HttpSession session) {
		return om.gropPayMent(oac_num, session);
	}

}
