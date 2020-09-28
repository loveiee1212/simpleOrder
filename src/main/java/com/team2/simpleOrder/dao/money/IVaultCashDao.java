package com.team2.simpleOrder.dao.money;

import java.util.HashMap;
import java.util.List;

public interface IVaultCashDao {

	Object checkVc_code(String c_code);

	String getBd_date(String c_code);

	void insertBd_date(HashMap<String, Object> jMap);
	
	boolean insertVC(HashMap<String, Object> jMap);

	void insertVC_Cnt(HashMap<String, Object> jMap);

	void insertVCChangeMemo(HashMap<String, Object> jMap);

	String getStartVC(String c_code);
	
	String getEndVC(String string);
	
	List<HashMap<String, String>> getMonthVC(HashMap<String, String> vcm);

	List<HashMap<String, String>> getDayVCLog(HashMap<String, String> vcm);



}
