package com.team2.simpleOrder.dao.storeManagement;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ITableDao2 {

	@Select("SELECT * FROM SEAT_CT WHERE C_CODE = #{value}")
	ArrayList<HashMap<String, Object>> getSeatCategoriList(String c_code);

	@Select("SELECT * FROM SEAT WHERE C_CODE = #{C_CODE} AND SC_CODE = #{SC_CODE}")
	ArrayList<HashMap<String, String>> getSeatInfoList(HashMap<String, Object> seatCategoriList);

	@Update("UPDATE SEAT_CT SET SC_X =#{x}, SC_Y = #{y} WHERE C_CODE = #{c_code} AND SC_CODE = #{sc_code} ")
	boolean updateSeatXYInfo(HashMap<String, String> xyInfo);

	@Delete("DELETE FROM SEAT WHERE C_CODE = #{value}")
	boolean deleteSeatList(String c_code);

	@Insert("INSERT INTO SEAT VALUES (#{c_code}, #{sc_code}, #{st_num})")
	boolean insertSeatList(HashMap<String, String> hm);

}
