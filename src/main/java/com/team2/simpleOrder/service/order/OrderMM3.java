package com.team2.simpleOrder.service.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.order.IOrderDao;
import com.team2.simpleOrder.dao.order.IDetailOrderDao;
import com.team2.simpleOrder.dao.order.IOrderDao3;
import com.team2.simpleOrder.dto.Order;

@Service
public class OrderMM3 {
	
	@Autowired
	private IOrderDao oDao1;
	
	@Autowired
	private IDetailOrderDao oDao2;
	
	@Autowired
	private IOrderDao3 oDao3;
	
	ModelAndView mav;
	
}
