package com.team2.simpleOrder.dto;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("product")
public class StoreManagement {

	private String c_code;

	private String pdc_code;
	private String pdc_date;
	private String pd_code;
	private Timestamp pd_date;
	private String pd_name;
	private String pd_imagename;
	private int pd_price;
	private int pd_status;
	
	private String pdc_name;
	private int pdc_status;
	
	
	private int stk_stock;
}
