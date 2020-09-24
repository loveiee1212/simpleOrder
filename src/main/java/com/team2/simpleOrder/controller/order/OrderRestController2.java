package com.team2.simpleOrder.controller.order;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.service.order.OrderMM2;

@RestController
@RequestMapping("/rest")

public class OrderRestController2 {
	@Autowired
	OrderMM2 om;

//	@RequestMapping(value = "/sendsaolist", method = RequestMethod.POST)
//	public HashMap<String, String> getTablelist(HttpSession session, String oac_num,
//			@RequestParam(value = "pdc_code[]") List<String> pdc_code,
//			@RequestParam(value = "pd_code[]") List<String> pd_code,
//			@RequestParam(value = "oh_cnt[]") List<String> oh_cnt) {
//		System.err.println("oac_num :" + oac_num);
//		System.err.println("pdc_code :" + pdc_code);
//		System.err.println("pd_code :" + pd_code);
//		System.err.println("oh_cnt :" + oh_cnt);
//
//		HashMap<String, String> hMap = om.sendsaoList(session, oac_num, pdc_code, pd_code, oh_cnt);
//		return hMap;
//	}
	
	@PostMapping("/sendsaolist")
	public String sendsallist(String oac_num, HttpSession session, 
			@RequestParam(value ="pdc_code[]") ArrayList<String> pdc_code,
			@RequestParam(value ="pdc_date[]") ArrayList<String> pdc_date,
			@RequestParam(value ="pd_date[]") ArrayList<String> pd_date,
			@RequestParam(value ="pd_code[]") ArrayList<String> pd_code,
			@RequestParam(value ="oh_cnt[]") ArrayList<String> oh_cnt,
			RedirectAttributes reat
			) {
		return om.sendsaoList(session, oac_num, pdc_code,pdc_date,pd_date, pd_code, oh_cnt, reat);
	}


}
