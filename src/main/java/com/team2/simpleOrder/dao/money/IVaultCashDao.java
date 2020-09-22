package com.team2.simpleOrder.dao.money;


public interface IVaultCashDao {

	String checkStartVC(String c_code);

	void insertBd_date(String c_code, String bd_date);

	String getBd_date(String c_code);

}
