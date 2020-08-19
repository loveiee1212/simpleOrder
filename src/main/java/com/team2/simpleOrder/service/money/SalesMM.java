package com.team2.simpleOrder.service.money;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.money.IVaultCashDao;
import com.team2.simpleOrder.dao.money.ISalesDao;
import com.team2.simpleOrder.dto.Money;

@Service
public class SalesMM {
	
	@Autowired
	private IVaultCashDao moDao1;
	
	@Autowired
	private ISalesDao moDao2;
	
	ModelAndView mav;
	
}
