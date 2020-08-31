package com.team2.simpleOrder.controller.kiosk;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team2.simpleOrder.dto.Review;
import com.team2.simpleOrder.service.kiosk.KioskMM1;


@RestController
@RequestMapping("/rest")
public class KioskRestController1 {
	
	@Autowired
	KioskMM1 km1;
	
	@PostMapping(value = "/getreviewlist")
	public List<Review> getReviewList(){
		System.out.println("controller on");
//		세션에 저장된 사업자이메일과 사업자번호를 가져온다
//		HttpSession session= req.getSession();
//		String c_code = session.getAttribute("c_code").toString();
		String c_code = "123123123123";
		//사업자 번호와 사업자 이메일을 서비스 클래스로 넘긴다
		System.out.println(c_code);
		List<Review> rList= km1.getReviewList(c_code);
		System.out.println(rList);
		return rList;
	}

}