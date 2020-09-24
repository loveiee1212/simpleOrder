package com.team2.simpleOrder.dao.order;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.simpleOrder.dto.Order;


public interface IOrderDao2 {

	List<Order> getsaoList(Order odr);
	
	List<Order> selectsaoList(@Param("c_code") String c_code,@Param("oac_num") String oac_num, @Param("bd_date") String bd_date);

	boolean sendsaoList(List<Order> oList);
	
	boolean updatestkList(List<Order> oList);

	@Insert("INSERT INTO ORDER_HISTORY VALUES (#{c_code}, #{bd_date}, #{oac_num}, #{pdc_code}, #{pdc_date}, #{pd_code}, #{pd_date}, default, #{oh_cnt})")
	boolean sendsaoList(HashMap<String, String> oacInfo);




}
