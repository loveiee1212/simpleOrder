package com.team2.simpleOrder.dao.order;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.team2.simpleOrder.dto.Order;

public interface IOrderDao2 {

	List<Order> getsaoList(Order odr);

	List<Order> selectsaoList(@Param("c_code") String c_code, @Param("oac_num") String oac_num,
			@Param("bd_date") String bd_date);

	boolean sendsaoList(List<Order> oList);

	boolean updatestkList(List<Order> oList);

	// 주문번호 만들기
	@Select("SELECT LPAD(COUNT(OAC_NUM)+1,4,0) AS OAC_NUM FROM ORDER_AND_CREDIT WHERE C_CODE = #{c_code} AND BD_DATE = #{bd_date} AND OAC_STATUS = '1'")
	String getNewOacCode(@Param("c_code") String c_code, @Param("bd_date") String bd_date);

	// order_and_credit 인서트
	@Insert("INSERT INTO ORDER_HISTORY VALUES (#{c_code}, #{bd_date}, #{oac_num}, #{pdc_code}, #{pd_code}, #{pd_date}, default, #{oh_cnt})")
	boolean sendsaoList(HashMap<String, String> oacInfo);

	// order_history 인서트
	@Insert("INSERT INTO ORDER_AND_CREDIT VALUES(#{c_code}, #{bd_date},#{oac_num},#{sc_code},#{st_num},DEFAULT,DEFAULT)")
	boolean createoacList(HashMap<String, String> hMap);

}
