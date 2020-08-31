package com.team2.simpleOrder.service.kiosk;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.kiosk.IKioskDao1;
import com.team2.simpleOrder.dto.Review;

@Service
public class KioskMM1 {
	
	@Autowired
	private IKioskDao1 kDao1;
	
//	@Autowired
//	private IKioskDao2 kDao2;
	
	ModelAndView mav;

	public List<Review> getReviewList(String c_code) {
		
		List<Review> rList= null;
		rList= kDao1.getReviewList(c_code);
		System.out.println(rList);
//		System.out.println(rList);
		
		return null; 
	}
	
}
