package com.team2.simpleOrder.controller.storeManagement;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sun.mail.handlers.multipart_mixed;
import com.team2.simpleOrder.dto.StoreManagement;
import com.team2.simpleOrder.service.storeManagement.PosMM1;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/rest")
public class PosRestController1 {
	// Only Pos Rest Controller Number1

	@Autowired
	PosMM1 pm1;

	// productcontrol 왼쪽 상품 정보 출력
	@RequestMapping(value = "/getsellproductlist1", method = RequestMethod.POST)
	public HashMap<String, String> getsellproductlist() {
		String c_code = "123123123123";
		return pm1.getsellproductlist1(c_code);
	}

	// stockcontrol 오른쪽 재고상품리스트 출력
	@RequestMapping(value = "/getstocklist", method = RequestMethod.POST)
	public HashMap<String, String> getStockList() {
		String c_code = "123123123123";
		StoreManagement sm = new StoreManagement();
		sm.setC_code(c_code);
		return pm1.getStockList(sm);
	}

	// stockcontrol 왼쪽 재고상품리스트 출력
	@RequestMapping(value = "/getpstocklist", method = RequestMethod.POST)
	public HashMap<String, String> getPstockList() {
		String c_code = "123123123123";
		return pm1.getPstockList(c_code);
	}

	// productragistration 오른쪽 상품 출력
	@RequestMapping(value = "/getproductlist", method = RequestMethod.POST)
	public HashMap<String, String> getSellProductList() {
		String c_code = "123123123123";

		return pm1.getSellProductList(c_code);
	}

	// productragistration 왼쪽 카테고리 별 상품 출력
	@RequestMapping(value = "/getproductcategorylist", method = RequestMethod.POST)
	public List<StoreManagement> getproductCategoryList() {
		return pm1.getproductCategoryList();
	}

	// stockcontrol 날짜별 재고 검색
	@RequestMapping(value = "/searchdatestock", method = RequestMethod.POST)
	public HashMap<String, String> searchDateStock(String pd_date) {
		log.info("pd_date" + pd_date);
		String c_code = "123123123123";
		StoreManagement sm = new StoreManagement();
		sm.setC_code(c_code);
		sm.setPd_date(pd_date);
		return pm1.getStockList(sm);
	}

	@RequestMapping(value = "/updatestock", method = RequestMethod.POST)
	public HashMap<String, String> updateStock(HttpSession session,
			@RequestParam(value = "pdc_code[]") List<String> pdc_code,
			@RequestParam(value = "pd_code[]") List<String> pd_code,
			@RequestParam(value = "pd_name[]") List<String> pd_name,
			@RequestParam(value = "stk_stock[]") List<String> stk_stock) {

		StoreManagement sm = new StoreManagement();
		log.info("pdc_code는" + pdc_code);
		log.info("pd_code는" + pd_code);
		log.info("pd_name는" + pd_name);
		log.info("stk_stock는" + stk_stock);
		HashMap<String, String> hMap = pm1.updateStock(session, pdc_code, pd_code, pd_name, stk_stock);
		return hMap;
	}

	@RequestMapping(value = "/updatesellkey", method = RequestMethod.POST)
	public String updateSellKey(@RequestParam HashMap<String, String> sm, HttpSession session) {

		return pm1.updateSellKey(sm, session);
	}

	

	@GetMapping("getProList")
	public HashMap<String, String> getProList(HttpSession session) {
		return pm1.getProList(session);
	}

	@GetMapping("getSellKeyCatList")
	public HashMap<String, String> getProCatList(HttpSession session) {
		return pm1.getSellKeyCatList(session);
	}

}
