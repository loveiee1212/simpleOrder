package com.team2.simpleOrder.dao.posManagement;

import java.util.List;

import com.team2.simpleOrder.dto.StoreManagement;

public interface IPosDao1 {

	List<StoreManagement> getProductList(String c_code);
	List<StoreManagement> getStockList(String c_code);
	List<StoreManagement> getPstockList(String c_code);


}
