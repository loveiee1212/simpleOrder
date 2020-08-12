package com.team2.simpleOrder.service.money;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.money.IMoneyDao1;
import com.team2.simpleOrder.dao.money.IMoneyDao2;
import com.team2.simpleOrder.dto.Money;

@Service
public class MoneyMM1 {
	
	@Autowired
	private IMoneyDao1 moDao1;
	
	@Autowired
	private IMoneyDao2 moDao2;
	
	ModelAndView mav;
	
}
