package com.team2.simpleOrder.dao.kiosk;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface KioskLoginAndSettingDao {

	@Select("SELECT C_SECURITYCODE FROM COMPANY WHERE C_CODE = #{c_code}")
	String getSecurityCode(HashMap<String, String> securityCode);
	
	@Select("SELECT RQ_NUM, RQ_KIND FROM REQUEST WHERE C_CODE = #{value}")
	ArrayList<HashMap<String, Object>> getRequsetList(String c_code);
	
	@Delete("DELETE FROM REQUEST WHERE C_CODE = #{value}")
	void deleteAllRequsetList(String c_code);

	@Insert("INSERT INTO REQUEST VALUES (#{c_code}, #{rq_num}, #{rq_kind})")
	boolean insertRequset(HashMap<String, String> hm);
	@Select("SELECT OAC_NUM FROM ORDER_AND_CREDIT WHERE C_CODE=#{c_code} AND BD_DATE=#{bd_date} AND SC_CODE=#{sc_code} AND ST_NUM=#{st_num} AND OAC_STATUS='1'")
	String checkOac_num(@Param("c_code") String c_code,@Param("bd_date") String bd_date,@Param("sc_code") String sc_code,@Param("st_num") String st_num);

	@Select("SELECT C_REVIEWUSE FROM COMPANY WHERE C_CODE = #{value}")
	int getreveiwUsagestatus(String c_code);

	@Update("UPDATE COMPANY SET C_REVIEWUSE = #{c_reviewuse} WHERE C_CODE = #{c_code}")
	void updatereveiwUsagestatus(HashMap<String, String> hm);

}
