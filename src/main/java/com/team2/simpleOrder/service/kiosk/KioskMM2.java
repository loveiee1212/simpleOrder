package com.team2.simpleOrder.service.kiosk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.kiosk.IKioskDao1;
import com.team2.simpleOrder.dao.kiosk.IKioskDao2;

@Service
public class KioskMM2 {
	
	@Autowired
	private IKioskDao1 kDao1;
	
	@Autowired
	private IKioskDao2 kDao2;
	
	ModelAndView mav;
	
}
