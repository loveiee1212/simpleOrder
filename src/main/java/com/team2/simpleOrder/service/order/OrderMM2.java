package com.team2.simpleOrder.service.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.order.IOrderDao1;
import com.team2.simpleOrder.dao.order.IOrderDao2;
import com.team2.simpleOrder.dao.order.IOrderDao3;
import com.team2.simpleOrder.dto.Order;
import com.team2.simpleOrder.dto.StoreManagement;

@Service
public class OrderMM2 {
	
	@Autowired
	private IOrderDao2 oDao;
	
	@Autowired
	private IOrderDao3 oDao3;
	
	ModelAndView mav;

	public ModelAndView getsaoList(Order odr) {
		ModelAndView mav = new ModelAndView();
		StoreManagement stmm = new StoreManagement();
		List<Order> stList = oDao.getsaoList(odr);
		return null;
	}
	
}
