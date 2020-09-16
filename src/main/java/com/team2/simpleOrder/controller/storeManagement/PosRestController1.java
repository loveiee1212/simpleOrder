package com.team2.simpleOrder.controller.storeManagement;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dto.Order;
import com.team2.simpleOrder.dto.StoreManagement;
import com.team2.simpleOrder.service.storeManagement.PosMM1;
import com.team2.simpleOrder.service.storeManagement.PosMM2;
import com.team2.simpleOrder.service.storeManagement.PosMM3;

@RestController
@RequestMapping("/rest")
public class PosRestController1 {
	// Only Pos Rest Controller Number1

	@Autowired
	PosMM1 pm1;

	@RequestMapping(value = "/getproductlist", method = RequestMethod.POST)
	public HashMap<String, String> getProductList() {
		String c_code = "123123123123";
		System.out.println("c_code" + c_code);
		HashMap<String, String> hMap = pm1.getProductList(c_code);
		return hMap;
	}

	@RequestMapping(value = "/getstocklist", method = RequestMethod.POST)
	public HashMap<String, String> getStockList() {
		String c_code = "123123123123";
		System.out.println("c_code" + c_code);
		HashMap<String, String> hMap = pm1.getStockList(c_code);
		return hMap;
	}

	@RequestMapping(value = "/getpstocklist", method = RequestMethod.POST)
	public HashMap<String, String> getPstockList() {
		String c_code = "123123123123";
		System.out.println("c_code" + c_code);
		HashMap<String, String> hMap = pm1.getPstockList(c_code);
		return hMap;
	}
	@RequestMapping(value = "/getproductlist2", method = RequestMethod.POST)
	public HashMap<String, String> getProductList2() {
		String c_code = "123123123123";
		System.out.println("c_code" + c_code);
		HashMap<String, String> hMap = pm1.getProductList2(c_code);
		return hMap;
	}
	
	@RequestMapping(value = "/getproductcategorylist", method = RequestMethod.POST)
	public List<StoreManagement> getproductCategoryList() {
		List<StoreManagement> pdcList = pm1.getproductCategoryList();
		return pdcList;
	}
	@Autowired
	PosMM2 pm2;

	@Autowired
	PosMM3 pm3;

	ModelAndView mav;

}
