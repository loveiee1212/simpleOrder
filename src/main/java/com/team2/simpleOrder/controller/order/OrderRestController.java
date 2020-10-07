package com.team2.simpleOrder.controller.order;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team2.simpleOrder.dto.Order;
import com.team2.simpleOrder.service.order.OrderMM;


@RestController
@RequestMapping("/rest")
public class OrderRestController {

	@Autowired
	OrderMM om;

	// 테이블정보가져오기
	@RequestMapping(value = "/gettablelist", method = RequestMethod.POST)
	public HashMap<String, Object> getTablelist(HttpSession session) {
		return om.getTablelist(session);
	}

	// 예약정보가져오기, 예약 정보가 없다면
	@RequestMapping(value = "/getreservlist", method = RequestMethod.GET)
	public HashMap<String, String> getReservList(HttpSession session) {
		return om.getReservList(session,null);
	}

	// 특정일에 대한 예약정보 가져오기
	@RequestMapping(value = "/searchreserv", method = RequestMethod.POST)
	public HashMap<String, String> searchReserv(String rsv_date, HttpSession session) {
		return om.getReservList(session, rsv_date);
	}
	// 예약 정보 업데이트
	@RequestMapping(value = "/updatereserv", method = RequestMethod.POST)
	public HashMap<String, String> updateReserv(String rsv_code, String rsv_name, String rsv_date, String rsv_phone, String rsvm_memo, HttpSession session) {
		return om.updateReserv(session, rsv_code, rsv_name, rsv_date,rsv_phone,rsvm_memo);
	}
	// 예약 정보 삭제
	@RequestMapping(value = "/deletereserv", method = RequestMethod.POST)
	public HashMap<String, String> deleteReserv(HttpSession session, String rsv_code) {
		return om.deleteReserv(session, rsv_code);
	}
	// 주문 정보 가져오기
	@RequestMapping(value = "/getorderlist", method = RequestMethod.GET)
	public List<Order> getorderList(HttpSession session, int oac_status) {
		return om.getorderList(session, oac_status);
	}
	//자리 이동
	@RequestMapping(value = "/changeseat", method = RequestMethod.POST)
	public HashMap<String, String>changeSeat(HttpSession session, String fcode,String foac_num, String scode,String soac_num,int type) {
		return om.changeSeat(session,fcode,foac_num,scode,soac_num,type);
	}
}
