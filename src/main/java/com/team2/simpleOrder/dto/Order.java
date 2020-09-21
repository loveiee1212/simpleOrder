package com.team2.simpleOrder.dto;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("order")
public class Order {
	 String c_code;
	 String sc_name;
	 int sc_x;
	 int sc_y;
	 int st_num;
	 List<Integer> tList;
	 String bd_date;
	 String rsv_code;
	 String rsv_name;
	 String rsv_phone;
	 String rsv_date;
	 String rsvm_memo;
	 String oac_num;
	 String sc_code;
	 String pdc_code;
	 String pd_code;
	 int oh_cnt;
	 String pd_name;
	 int pd_price;
	 HashMap<String, List<String>> pdMap;
	 List<Integer> cntList;
	 

	 
}
