package com.team2.simpleOrder.dao.money;

import java.util.HashMap;
import java.util.List;

import com.google.gson.JsonElement;

public interface ISalesDao {

	List<HashMap<String, String>> getMonthSales(HashMap<String, String> smap);

	List<HashMap<String, String>> getDaySales(HashMap<String, String> smap);

	List<HashMap<String, String>> getDayTotalSales(HashMap<String, String> smap);
	
	List<HashMap<String, String>> getDayProduct(HashMap<String, String> smap);

	List<HashMap<String, String>> getDayRefundProduct(HashMap<String, String> smap);

	List<HashMap<String, String>> getMonthDetail(HashMap<String, String> smap);

	List<HashMap<String, String>> getMonthDetailTotalSales(HashMap<String, String> smap);

	List<HashMap<String, String>> getMonthDetailProduct(HashMap<String, String> smap);

	List<HashMap<String, String>> getMonthDetailRefundProduct(HashMap<String, String> smap);

	String getCashSales(HashMap<String, String> smap);

}
