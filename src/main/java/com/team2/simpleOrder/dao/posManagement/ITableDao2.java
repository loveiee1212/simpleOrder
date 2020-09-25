package com.team2.simpleOrder.dao.posManagement;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Select;

public interface ITableDao2 {

	@Select("SELECT * FROM SEAT_CT WHERE C_CODE = #{value}")
	ArrayList<HashMap<String, Object>> getSeatCategoriList(String c_code);

	@Select("SELECT * FROM SEAT WHERE C_CODE = #{C_CODE} AND SC_CODE = #{SC_CODE}")
	ArrayList<HashMap<String, String>> getSeatInfoList(HashMap<String, Object> seatCategoriList);

}
