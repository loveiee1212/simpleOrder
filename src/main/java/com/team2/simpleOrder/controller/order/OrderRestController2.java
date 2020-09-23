package com.team2.simpleOrder.controller.order;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dto.Order;
import com.team2.simpleOrder.service.order.OrderMM1;
import com.team2.simpleOrder.service.order.OrderMM2;
import com.team2.simpleOrder.service.order.OrderMM3;

@RestController
@RequestMapping("/rest")
public class OrderRestController2 {
	// Only Order Rest Controller Number2

	@Autowired
	OrderMM2 om;

	@RequestMapping(value = "/sendsaolist", method = RequestMethod.POST)
	public HashMap<String, String> getTablelist(HttpSession session, String oac_num,
			@RequestParam(value = "pdc_code[]") List<String> pdc_code,
			@RequestParam(value = "pd_code[]") List<String> pd_code,
			@RequestParam(value = "oh_cnt[]") List<String> oh_cnt) {
		System.out.println("oac_num :" + oac_num);
		System.out.println("pdc_code :" + pdc_code);
		System.out.println("pd_code :" + pd_code);
		System.out.println("oh_cnt :" + oh_cnt);

		HashMap<String, String> hMap = om.sendsaoList(session, oac_num, pdc_code, pd_code, oh_cnt);
		return hMap;
	}

	@Autowired
	OrderMM3 om3;

	ModelAndView mav;

}
