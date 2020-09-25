package com.team2.simpleOrder.dao.money;

import java.util.HashMap;

public interface IVaultCashDao {

	String checkStartVC(String c_code);

	void insertBd_date(HashMap<String, String> bMap);

	String getBd_date(String c_code);

	String getStartVC(String c_code);

	String getEndVC(String string);
	
	boolean insertStartVC(HashMap<String, String> jMap);

	void insertStartVC_Cnt(HashMap<String, String> jMap);

	boolean insertEndVC(HashMap<String, String> jMap);

	void insertEndVC_Cnt(HashMap<String, String> jMap);


	


}
