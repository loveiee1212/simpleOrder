package com.team2.simpleOrder.controller.kiosk;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team2.simpleOrder.service.kiosk.KioskMM1;

@RestController
@RequestMapping("/rest")
public class KioskMainRestController {

	@Autowired
	KioskMM1 km;

	// 판매키에 올라가 있는 상품리스트 출력
	@PostMapping(value = "/getsellproductlist")
	public HashMap<String, Object> getSellProductList(HttpSession session) {
		return km.getSellProductList(session);
	}

	// 리뷰리스트 출력
	@PostMapping(value = "/getreviewlist")
	public HashMap<String, String> getReviewList(HttpSession session, int rvNum) {
		return km.getReviewList(session, rvNum);
	}

	// 요청사항 리스트 출력
	@PostMapping(value = "/getrequestlist")
	public HashMap<String, String> getRequestList(HttpSession session) {
		return km.getRequestList(session);
	}

	// 주문한 내역 리스트 출력
	@PostMapping(value = "/getbilllist")
	public HashMap<String, String> getBillList(HttpSession session) {
		return km.getBillList(session);
	}

	// 주문하기
	@PostMapping(value = "/insertorder")
	public HashMap<String, String> insertOrder(@RequestBody List<Map<String, String>> bArr, HttpSession session) {
		return km.insertOrder(session, bArr);
	}

	// 메뉴페이지 정보 로딩
	@PostMapping(value = "/kioskmainready")
	public HashMap<String, String> kioskMainReady(HttpSession session) {
		return km.kioskMainReady(session);
	}

	// 주문상태 확인하기(setInterval)
	@PostMapping(value = "/getoacstatus")
	public HashMap<String, String> getOac_status(HttpSession session) {
		return km.getOac_status(session);
	}
	
	@GetMapping("/getOrderNum")
	public String getOrderNum(HttpSession session){
		return km.getOrderNum(session);
	}
}