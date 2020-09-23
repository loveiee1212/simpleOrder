package com.team2.simpleOrder.dao.order;

import java.util.List;

import com.team2.simpleOrder.dto.Order;


public interface IOrderDao2 {

	List<Order> getsaoList(Order odr);

	boolean sendsaoList(Order order);

	boolean updatestkList(List<Order> oList);


}
