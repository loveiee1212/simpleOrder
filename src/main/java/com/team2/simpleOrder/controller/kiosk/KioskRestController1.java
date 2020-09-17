package com.team2.simpleOrder.controller.kiosk;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team2.simpleOrder.service.kiosk.KioskMM1;

@RestController
@RequestMapping("/rest")
public class KioskRestController1 {

	@Autowired
	KioskMM1 km1;

	// 판매키에 올라가 있는 상품리스트 출력
	@PostMapping(value = "/getsellproductlist")
	public HashMap<String, Object> getSellProductList(HttpServletRequest req) {
//		세션에 저장된 사업자코드를 가져온다
//		HttpSession session= req.getSession();
//		String c_code = session.getAttribute("c_code").toString();
//		System.out.println(c_code);
		String c_code = "123123123123";
		HashMap<String, Object> sellProList = km1.getSellProductList(c_code);
		return sellProList;
	}
	// 리뷰리스트 출력
	@PostMapping(value = "/getreviewlist")
	public HashMap<String, String> getReviewList(HttpServletRequest req) {
//		세션에 저장된 사업자코드를 가져온다
//		HttpSession session= req.getSession();
//		String c_code = session.getAttribute("c_code").toString();
//		System.out.println(c_code);
		String c_code = "123123123123";
		HashMap<String, String> rvList = km1.getReviewList(c_code);
		System.out.println(rvList);
		return rvList;
	}

	// 요청사항 리스트 출력
	@PostMapping(value = "/getrequestlist")
	public HashMap<String, String> getRequestList() {
//		세션에 저장된 사업자코드를 가져온다
//		HttpSession session= req.getSession();
//		String c_code = session.getAttribute("c_code").toString();
		String c_code = "123123123123";
		// 사업자 번호와 사업자 이메일을 서비스 클래스로 넘긴다
		HashMap<String, String> reqList = km1.getRequestList(c_code);
		System.out.println(reqList);
		return reqList;
	}

	@PostMapping(value = "/getbilllist")
	public HashMap<String, String> getBillList() {
//		세션에 저장된 사업자코드, 테이블 번호, 영업날짜를 가져온다
//		HttpSession session= req.getSession();
//		String c_code = session.getAttribute("c_code").toString();
//		HttpSession session= req.getSession();
//		String sc_num = session.getAttribute("sc_num").toString();
//		HttpSession session= req.getSession();
//		String bd_date = session.getAttribute("bd_date").toString();
		String c_code = "123123123123";
		String st_num = "1";
		String bd_date = "2020-08-29 14:19:00";
		// 사업자 번호와 사업자 이메일을 서비스 클래스로 넘긴다
		HashMap<String, String> billList = km1.getBillList(c_code, st_num, bd_date);
		return billList;
	}

}