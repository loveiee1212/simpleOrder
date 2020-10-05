package com.team2.simpleOrder.dao.money;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


public interface IBillDao {

	//영수증 /주문증 조회
	List<HashMap<String, Object>> getBillList(String c_code);

	@Select("SELECT * FROM COMPANY WHERE C_CODE = #{c_code}")
	HashMap<String, Object> getcompanyList(String c_code);

	List<HashMap<String, Object>> getproductList(@Param("c_code") String c_code,@Param("bd_date") String bd_date,@Param("oac_num") String oac_num);

}
