package com.team2.simpleOrder.controller.storeManagement;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dto.StoreManagement;
import com.team2.simpleOrder.service.storeManagement.PosMM1;
import com.team2.simpleOrder.service.storeManagement.PosMM2;
import com.team2.simpleOrder.service.storeManagement.PosMM3;

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
		System.out.println("c_code" + c_code);
		return pm1.getsellproductlist1(c_code);
	}

//stockcontrol  오른쪽 재고상품리스트 출력
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
		System.out.println("c_code" + c_code);
		return pm1.getPstockList(c_code);
	}

	// productragistration 오른쪽 상품 출력
	@RequestMapping(value = "/getproductlist", method = RequestMethod.POST)
	public HashMap<String, String> getSellProductList() {
		String c_code = "123123123123";
		System.out.println("c_code" + c_code);
		return pm1.getSellProductList(c_code);
	}

	// productragistration 왼쪽 카테고리 별 상품 출력
	@RequestMapping(value = "/getproductcategorylist", method = RequestMethod.POST)
	public List<StoreManagement> getproductCategoryList() {
		return pm1.getproductCategoryList();
	}

//stockcontrol 날짜별 재고 검색
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
		@RequestParam(value = "stk_stock[]") List<String> stk_stock){

		StoreManagement sm = new StoreManagement();
		log.info("pdc_code는"+pdc_code);
		log.info("pd_code는"+pd_code);
		log.info("pd_name는"+pd_name);
		log.info("stk_stock는"+stk_stock);
		return pm1.updateStock(sm);
	}

	@Autowired
	PosMM2 pm2;

	@Autowired
	PosMM3 pm3;

	ModelAndView mav;

}
