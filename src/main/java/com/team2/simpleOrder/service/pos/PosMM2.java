package com.team2.simpleOrder.service.pos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.pos.IPosDao1;
import com.team2.simpleOrder.dao.pos.IPosDao2;
import com.team2.simpleOrder.dao.pos.IPosDao3;
import com.team2.simpleOrder.dto.Pos;

@Service
public class PosMM2 {
	

	@Autowired
	private IPosDao1 pDao1;
	
	@Autowired
	private IPosDao2 pDao2;
	
	@Autowired
	private IPosDao3 pDao3;
	
	ModelAndView mav;
	
}
