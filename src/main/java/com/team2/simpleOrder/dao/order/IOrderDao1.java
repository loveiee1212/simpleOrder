package com.team2.simpleOrder.dao.order;

import java.util.HashMap;
import java.util.List;

import com.team2.simpleOrder.dto.Order;

public interface IOrderDao1 {
	//좌석 카테고리 리스트
	List<Order> getTcList(String c_code);
	//좌석 리스트
	List<Order> getTList(String c_code);
	//예약정보 조회
	List<Order> getReservList(Order odr);

}
