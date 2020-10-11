package com.team2.simpleOrder.dao.money;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


public interface IBillDao {

	//영수증 /주문증 조회
	List<HashMap<String, Object>> getBillList(HashMap<String, String> selectMap);

	//회사 정보
	@Select("SELECT * FROM COMPANY WHERE C_CODE = #{c_code}")
	HashMap<String, Object> getcompanyList(String c_code);

	//상품정보
	List<HashMap<String, Object>> getproductList(@Param("c_code") String c_code,@Param("bd_date") String bd_date,@Param("oac_num") String oac_num);

	//결제 정보
	@Select("SELECT * FROM PAYMENT_TYPE WHERE OAC_NUM = #{oac_num} AND C_CODE =#{c_code} AND BD_DATE =#{bd_date}")
	List<HashMap<String, Object>> getpayList(@Param("c_code") String c_code,@Param("bd_date") String bd_date,@Param("oac_num") String oac_num);

	//반품으로 변경
	@Update("UPDATE ORDER_AND_CREDIT SET OAC_STATUSCHANGETIME = NOW(),OAC_STATUS = -2 WHERE C_CODE = #{c_code} AND BD_DATE = #{bd_date} AND OAC_NUM = #{oac_num}")
	boolean cancelPay(@Param("c_code") String c_code,@Param("bd_date") String bd_date,@Param("oac_num") String oac_num);

	@Select("select PMT_CASH from payment_type WHERE C_CODE = #{c_code} AND BD_DATE = #{bd_date} AND OAC_NUM=#{oac_num} group by c_code,bd_date,oac_num")
	Integer getCashList(@Param("c_code") String c_code,@Param("bd_date") String bd_date,@Param("oac_num") String oac_num);

}
