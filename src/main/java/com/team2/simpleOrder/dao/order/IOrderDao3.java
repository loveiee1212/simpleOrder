package com.team2.simpleOrder.dao.order;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;



public interface IOrderDao3 {

	ArrayList<HashMap<String, String>> gropPayMent(HashMap hm);

	@Update("UPDATE ORDER_AND_CREDIT SET OAC_STATUS = 2 AND OAC_STATUSCHANGETIME = NOW() WHERE C_CODE = #{c_code} AND BD_DATE = #{bd_date} AND OAC_NUM =#{oac_num}")
	boolean changeOacStatus(@Param("oac_num") String oac_num,@Param("c_code") String c_code,@Param("bd_date") String bd_date);

	

}
