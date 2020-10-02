package com.team2.simpleOrder.dao.storeManagement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.team2.simpleOrder.dto.StoreManagement;

public interface IProductDao {

	@Select("SELECT * "
			  + "FROM PRODUCT P "
			  + "JOIN PRODUCT_CT PC "
			  + "ON P.PDC_CODE = PC.PDC_CODE "
			  + "LEFT OUTER JOIN STOCK S "
			  + "ON P.PD_CODE = S.PD_CODE AND P.PDC_CODE = S.PDC_CODE "
			  + "WHERE P.C_CODE = #{value} AND P.PD_STATUS = '1'")
		List<StoreManagement> getsproductlist(String c_code);
	@Select("SELECT PDC_CODE,PDC_NAME FROM PRODUCT_CT WHERE C_CODE = #{c_code}")
	ArrayList<HashMap<String, Object>> getProCategoriList(String c_code);
	@Select("SELECT LPAD(COUNT(*)+1,5,0) FROM PRODUCT WHERE C_CODE = #{c_code} AND PDC_CODE =${pdc_code}")
	String getProductofNumber(HashMap<String, String> productCategori);
	@Select("SELECT LPAD(COUNT(*)+1,2,0) FROM PRODUCT_CT WHERE C_CODE = #{c_code}")
	String numberOfproCategori(String c_code);
	
	@Update("UPDATE PRODUCT SET PD_STATUS = '0' WHERE C_CODE =#{c_code} AND PDC_CODE = #{pdc_code} AND PD_CODE = #{pd_code} AND PD_DATE = #{pd_date} ")	
	boolean updateProductStatus(HashMap<String, String> proInfo);
	@Select("SELECT PD_IMGNAME FROM PRODUCT WHERE C_CODE =#{c_code} AND PDC_CODE = #{pdc_code} AND PD_CODE =#{pd_code} AND PD_DATE = #{pd_date}")
	String getProImgname(HashMap<String, String> proInfo);
	@Insert("INSERT INTO PRODUCT VALUES (#{c_code}, #{pdc_code}, #{pd_code}, #{pd_name}, #{pd_imgname}, #{pd_price},{pd_status})")
	boolean insertProduct(StoreManagement sm);
	@Select("SELECT PDC_CODE, PD_CODE, PD_DATE, PD_NAME, PD_PRICE FROM PRODUCT WHERE C_CODE = #{c_code} AND PD_STATUS = '1'")
	ArrayList<HashMap<String, Object>> getProList(String c_code);
	@Select("SELECT PDC_CODE, PD_CODE, PD_DATE FROM SELLKEY WHERE C_CODE = #{c_code}")
	ArrayList<HashMap<String, Object>> getSellKeyProList(String c_code);
	@Select("SELECT SKC_CODE,SKC_NAME,SKC_X,SKC_Y,C_CODE FROM SELLKEY_CT WHERE C_CODE = #{c_code}")
	ArrayList<HashMap<String, Object>> getSellKeyCatList(String c_code);
	@Select("SELECT P.PDC_CODE, P.PD_CODE, P.PD_DATE, S.SKC_CODE, S.SK_NUM, P.PD_NAME, P.PD_PRICE "
			+ "FROM SELLKEY S " + "JOIN PRODUCT P "
			+ "ON S.PDC_CODE = P.PDC_CODE AND S.PD_DATE = P.PD_DATE AND S.PD_CODE = P.PD_CODE "
			+ "WHERE P.C_CODE =#{c_code} AND S.SKC_CODE = #{skc_code}")
	ArrayList<HashMap<String, String>> getsellKeyInfo(HashMap<String, String> hm);
	@Delete("DELETE FROM PRODUCT WHERE C_CODE = #{c_code} AND PDC_CODE = #{pdc_code} AND PD_CODE = #{pd_code} AND PD_DATE = #{pd_date}")
	boolean deleteProduct(HashMap<String, String> proInfo);

	@Insert("INSERT INTO PRODUCT_CT VALUES(#{c_code},#{pdc_code},#{pdc_name})")
	boolean createProCategori(HashMap<String, String> categoriInfo);
	@Update("UPDATE PRODUCT SET PDC_CODE = '01' WHERE C_CODE = #{c_code} AND PDC_CODE =#{pdc_code}")
	void moveProinCategori(HashMap<String, String> categoriInfo);

	@Delete("DELETE FROM PRODUCT_CT WHERE C_CODE =  #{c_code} AND PDC_CODE =#{pdc_code}")
	void proCategoriDelete(HashMap<String, String> categoriInfo);

	@Update("UPDATE PRODUCT_CT SET PDC_NAME =#{pdc_name} WHERE C_CODE = #{c_code} AND pdc_code = #{pdc_code}")
	void proCategoriUpdate(HashMap<String, String> categoriInfo);

	@Insert("INSERT INTO PRODUCT VALUES(#{c_code}, #{pdc_code}, #{pd_code}, #{pd_date}, #{pd_name}, #{pd_imgname}, #{pd_price}, 1)")
	void createProduct(HashMap<String, String> proInfo);

	@Insert("INSERT INTO STOCK VALUES(#{c_code},#{pdc_code},#{pd_code},#{pd_date},#{stk_stock})")
	void createProStock(HashMap<String, String> proInfo);
	@Delete("DELETE FROM SELLKEY WHERE C_CODE = #{c_code}")
	void deletesellKey(String c_code);
	@Insert("INSERT INTO SELLKEY VALUES(#{c_code}, #{pdc_code},#{pd_code},#{pd_date},#{skc_code},#{sk_num})")
	void createsellKey(HashMap<String, String> hm);
	@Update("UPDATE SELLKEY_CT SET SKC_X = #{x}, SKC_Y =#{y} WHERE C_CODE = #{c_code} AND SKC_CODE = #{skc_code}")
	void updateSellKeySize(HashMap<String, String> sellKeySize);
	

	


	

	










}
