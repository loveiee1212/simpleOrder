package com.team2.simpleOrder.dao.kiosk;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Select;

public interface KioskLoginAndSettingDao {

	@Select("SELECT C_SECURITYCODE FROM COMPANY WHERE C_CODE = #{c_code}")
	String getSecurityCode(HashMap<String, String> securityCode);
	
	@Select("SELECT RQ_NUM, RQ_KIND FROM REQUEST WHERE C_CODE = #{value}")
	ArrayList<HashMap<String, Object>> getRequsetList(String c_code);

}
