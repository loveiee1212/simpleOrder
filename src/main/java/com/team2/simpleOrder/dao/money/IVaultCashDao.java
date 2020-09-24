package com.team2.simpleOrder.dao.money;

import java.util.HashMap;

public interface IVaultCashDao {

	String checkStartVC(String c_code);

	void insertBd_date(String c_code, String bd_date);

	String getBd_date(String c_code);

	String getStartVC(String c_code);

	boolean insertStartVC(HashMap<String, String> jMap);

	void insertStartVC_Cnt(HashMap<String, String> jMap);


}
