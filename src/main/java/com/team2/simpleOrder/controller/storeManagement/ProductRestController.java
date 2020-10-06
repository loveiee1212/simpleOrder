package com.team2.simpleOrder.controller.storeManagement;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team2.simpleOrder.service.storeManagement.ProductMM;

@RestController
@RequestMapping("/rest")
public class ProductRestController {
	// Only Pos Rest Controller Number1

	@Autowired
	ProductMM pm;

	// productcontrol 왼쪽 상품 정보 출력
	@GetMapping("/getsproductlist")
	public HashMap<String, String> getsellproductlist(HttpSession session) {
		return pm.getsproductlist(session.getAttribute("c_code").toString());
	}
	
	@GetMapping("/getProCategoriList")
	public HashMap<String, String> getProCategoriList(HttpSession session){
		return pm.getProCategoriList(session.getAttribute("c_code").toString());
	}
	@GetMapping("/getProductofNumber")
	public String getProductofNumber(@RequestParam HashMap<String, String> productCategori,HttpSession session) {
		return pm.getProductofNumber(session.getAttribute("c_code").toString(),productCategori);
	}
	@GetMapping("/getProList")
	public HashMap<String, String> getProList(HttpSession session) {
		return pm.getProList(session);
	}
	@GetMapping("/getSellKeyCatList")
	public HashMap<String, String> getProCatList(HttpSession session) {
		return pm.getSellKeyCatList(session);
	}
	@GetMapping("/getSellKeyCategoriList")
	public HashMap<String, String> getSellKeyCategoriList(HttpSession session) {
		return pm.getSellKeyCategoriList(session);
	}
	@GetMapping("/getStockList")
	public HashMap<String, String> getStockList(HttpSession session){
		return pm.getStockList(session);
	}
	@GetMapping("/getStockRecord")
	public HashMap<String, String> getStockRecord(@RequestParam HashMap<String, String> stockInfo, HttpSession session){
		return pm.getStockRecord(stockInfo,session);
	}
	@PostMapping("/updateStock")
	public HashMap<String, String> updateStock(@RequestParam HashMap<String, String> stockInfo,HttpSession session){
		return pm.updateStock(stockInfo,session);
	}

}
