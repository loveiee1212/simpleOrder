package com.team2.simpleOrder.controller.order;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dto.Order;
import com.team2.simpleOrder.service.order.OrderMM1;
import com.team2.simpleOrder.service.order.OrderMM2;
import com.team2.simpleOrder.service.order.OrderMM3;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/rest")
public class OrderRestController1 {
	// Only Order Rest Controller Number1

	@Autowired
	OrderMM1 om;
	//테이블정보가져오기
	@RequestMapping(value = "/gettablelist", method = RequestMethod.POST)
	public List<Order> getTablelist() {
		List<Order> tList = om.getTablelist();
		return tList;
	}
	
	//예약정보가져오기
	@RequestMapping(value = "/getreservlist", method = RequestMethod.GET)
	public HashMap<String, String> getReservList() {
		Order odr = new Order();
		String c_code = "123123123123";
		odr.setC_code(c_code);
		HashMap<String,String> hMap = om.getReservList(odr);
		return hMap;
	}
	
	//특정일에 대한 예약정보 가져오기
	@RequestMapping(value = "/searchreserv", method = RequestMethod.POST)
	public HashMap<String, String> searchReserv(String rsv_date) {
		log.info("rsv_date"+rsv_date);
		String c_code = "123123123123";
		Order odr = new Order();
		odr.setC_code(c_code);
		odr.setRsv_date(rsv_date);
		HashMap<String,String> hMap = om.getReservList(odr);
		return hMap;
	}
	
	
	@RequestMapping(value = "/updatereserv", method = RequestMethod.POST)
	public HashMap<String, String> updateReserv(String rsv_code,String rsv_name,String rsv_date,String rsv_phone,String rsvm_memo,HttpSession session) {
		Order odr = new Order();
		odr.setRsv_code(rsv_code);
		odr.setRsv_name(rsv_name);
		odr.setRsv_date(rsv_date);
		odr.setRsv_phone(rsv_phone);
		odr.setRsvm_memo(rsvm_memo);
		HashMap<String,String> hMap = om.updateReserv(session,odr);
		return hMap;
	}

	@RequestMapping(value = "/deletereserv", method = RequestMethod.POST)
	public HashMap<String, String> deleteReserv(HttpSession session, String rsv_code) {
		HashMap<String,String> hMap = om.deleteReserv(session,rsv_code);
		return hMap;
	}
	

	@Autowired
	OrderMM2 om2;

	@Autowired
	OrderMM3 om3;

	ModelAndView mav;

}
