package com.team2.simpleOrder.service.kiosk;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.simpleOrder.dao.kiosk.IKioskDao1;
import com.team2.simpleOrder.dto.Review;

@Service
public class KioskMM1 {
	@Autowired
	private IKioskDao1 kDao1;
	
	public List<Review> getReviewList(String c_code) {
		System.out.println("service on");
		List<Review> rList= kDao1.getReviewList(c_code);
		System.out.println(rList);
//		for(int i=0; i<rList.size(); i++) {
//			System.out.println(rList.get(i).toString());
//		}
//		System.out.println("for문 돌림");
		
		return rList; 
	}
	
}
