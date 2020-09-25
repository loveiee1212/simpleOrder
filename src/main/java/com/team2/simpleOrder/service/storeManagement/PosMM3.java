package com.team2.simpleOrder.service.storeManagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.posManagement.IPosDao1;
import com.team2.simpleOrder.dao.posManagement.ITableDao2;
import com.team2.simpleOrder.dao.posManagement.IPosDao3;
import com.team2.simpleOrder.dto.StoreManagement;

@Service
public class PosMM3 {
	

	@Autowired
	private IPosDao1 pDao1;
	
	@Autowired
	private ITableDao2 pDao2;
	
	@Autowired
	private IPosDao3 pDao3;
	
	ModelAndView mav;
	
}
