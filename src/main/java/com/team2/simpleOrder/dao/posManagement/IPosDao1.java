package com.team2.simpleOrder.dao.posManagement;

import java.util.List;

import com.team2.simpleOrder.dto.StoreManagement;

public interface IPosDao1 {

	List<StoreManagement> getStockList(StoreManagement sm);

	List<StoreManagement> getPstockList(String c_code);

	List<StoreManagement> getproductCategoryList(String c_code);

	List<StoreManagement> getProductList(String c_code);

	boolean updateStock(String c_code);

	List<StoreManagement> getSellProductList1(String c_code);

}
