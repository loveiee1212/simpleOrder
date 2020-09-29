package com.team2.simpleOrder.dao.posManagement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.team2.simpleOrder.dto.StoreManagement;

public interface IPosDao1 {

	List<StoreManagement> getStockList(StoreManagement sm);

	List<StoreManagement> getPstockList(String c_code);

	List<StoreManagement> getproductCategoryList(String c_code);

	List<StoreManagement> getProductList(String c_code);

	boolean updateStock(List<StoreManagement> sList);

	@Select("SELECT * "
		  + "FROM PRODUCT P "
		  + "JOIN PRODUCT_CT PC "
		  + "ON P.PDC_CODE = PC.PDC_CODE "
		  + "LEFT OUTER JOIN STOCK S "
		  + "ON P.PD_CODE = S.PD_CODE AND P.PDC_CODE = S.PDC_CODE "
		  + "WHERE P.C_CODE = #{value} AND P.PD_STATUS = '1'")
	List<StoreManagement> getsproductlist(String c_code);

	@Insert("INSERT INTO PRODUCT VALUES (#{c_code}, #{pdc_code}, #{pdc_date}, #{pd_code}, #{pdc_date}, #{pd_name}, #{pd_imgname}, #{pd_price},{pd_status})")
	boolean insertProduct(StoreManagement sm);

	@Select("SELECT PDC_CODE, PDC_DATE, PD_CODE, PD_DATE, PD_NAME, PD_PRICE FROM PRODUCT WHERE C_CODE = #{c_code} AND PD_STATUS = '1'")
	ArrayList<HashMap<String, Object>> getProList(String c_code);

	@Select("SELECT PDC_CODE, PDC_DATE, PD_CODE, PD_DATE FROM SELLKEY WHERE C_CODE = #{c_code}")
	ArrayList<HashMap<String, Object>> getSellKeyProList(String c_code);

	@Select("SELECT SKC_CODE,SKC_NAME,SKC_X,SKC_Y,C_CODE FROM SELLKEY_CT WHERE C_CODE = #{c_code}")
	ArrayList<HashMap<String, Object>> getSellKeyCatList(String c_code);

	@Select("SELECT P.PDC_CODE, P.PDC_DATE, P.PD_CODE, P.PD_DATE, S.SKC_CODE, S.SK_NUM, P.PD_NAME, P.PD_PRICE "
			+ "FROM SELLKEY S " + "JOIN PRODUCT P "
			+ "ON S.PDC_DATE = P.PDC_DATE AND S.PDC_CODE = P.PDC_CODE AND S.PD_DATE = P.PD_DATE AND S.PD_CODE = P.PD_CODE "
			+ "WHERE P.C_CODE =#{c_code} AND S.SKC_CODE = #{skc_code}")
	ArrayList<HashMap<String, String>> getsellKeyInfo(HashMap<String, String> hm);

	boolean updateSellKey(HashMap<String, String> sm);

}
