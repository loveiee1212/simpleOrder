package com.team2.simpleOrder.controller.kiosk;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.team2.simpleOrder.dto.Review;
import com.team2.simpleOrder.service.kiosk.KioskMM1;

@RestController
@RequestMapping("/rest")
public class KioskMainRestController1 {

	@Autowired
	KioskMM1 km1;

	// 판매키에 올라가 있는 상품리스트 출력
	@PostMapping(value = "/getsellproductlist")
	public HashMap<String, Object> getSellProductList(HttpSession session) {
		return km1.getSellProductList(session);
	}

	// 리뷰리스트 출력
	@PostMapping(value = "/getreviewlist")
	public HashMap<String, String> getReviewList(HttpSession session) {
		return km1.getReviewList(session);
	}

	// 요청사항 리스트 출력
	@PostMapping(value = "/getrequestlist")
	public HashMap<String, String> getRequestList(HttpSession session) {
		return km1.getRequestList(session);
	}

	@PostMapping(value = "/getbilllist")
	public HashMap<String, String> getBillList(HttpSession session) {
		return km1.getBillList(session);
	}

	@PostMapping(value = "/insertorder")
	public String insertOrder(@RequestBody List<Map<String, String>> bArr, HttpSession session) {
		String result = km1.insertOrder(session, bArr);
		return new Gson().toJson(result);
	}

	@PostMapping(value = "/insertreview")
	public String insertreview(@RequestParam ArrayList<MultipartFile> rv_file, HttpSession session, Review rv) {
		rv.setC_code("123123123123").setBd_date("2020-08-29 14:19:00").setOac_num("0001");
		return km1.insertReview(rv_file, rv, session);
	}

	@PostMapping(value = "/kioskmainready")
	public HashMap<String, String> kioskMainReady(HttpSession session) {

		return km1.kioskMainReady(session);
	}

}