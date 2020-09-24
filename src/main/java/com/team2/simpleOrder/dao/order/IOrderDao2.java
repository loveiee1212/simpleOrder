package com.team2.simpleOrder.dao.order;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.simpleOrder.dto.Order;


public interface IOrderDao2 {

	List<Order> getsaoList(Order odr);
	
	List<Order> selectsaoList(@Param("c_code") String c_code,@Param("oac_num") String oac_num, @Param("bd_date") String bd_date);

	boolean sendsaoList(List<Order> oList);
	
	boolean updatestkList(List<Order> oList);

	@Insert("INSERT INTO ORDER_HISTORY VALUES (#{c_code}, #{bd_date}, #{oac_num}, #{pdc_code}, #{pdc_date}, #{pd_code}, #{pd_date}, default, #{oh_cnt})")
	boolean sendsaoList(HashMap<String, String> oacInfo);

	@Select("SELECT LPAD(COUNT(OAC_NUM)+1,4,0) AS OAC_NUM FROM ORDER_AND_CREDIT WHERE C_CODE = #{c_code} AND BD_DATE = #{bd_date} AND OAC_STATUS = '1'")
	String getNewOacCode(String c_code,String bd_date);
	
	@Insert("INSERT INTO ORDER_AND_CREDIT VALUES(#{c_code}, #{bd_date},#{oac_num},#{sc_code},#{st_num},DEFAULT,DEFAULT)")
	boolean createoacList(HashMap<String, String> hMap);

	




}
