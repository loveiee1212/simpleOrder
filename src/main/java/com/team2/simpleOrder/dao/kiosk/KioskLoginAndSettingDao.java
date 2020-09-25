package com.team2.simpleOrder.dao.kiosk;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface KioskLoginAndSettingDao {

	@Select("SELECT C_SECURITYCODE FROM COMPANY WHERE C_CODE = #{c_code}")
	String getSecurityCode(HashMap<String, String> securityCode);
	
	@Select("SELECT RQ_NUM, RQ_KIND FROM REQUEST WHERE C_CODE = #{value}")
	ArrayList<HashMap<String, Object>> getRequsetList(String c_code);
	
	@Delete("DELETE FROM REQUEST WHERE C_CODE = #{value}")
	void deleteAllRequsetList(String c_code);

	@Insert("INSERT INTO REQUEST VALUES (#{c_code}, #{rq_num}, #{rq_kind})")
	boolean insertRequset(HashMap<String, String> hm);

}
