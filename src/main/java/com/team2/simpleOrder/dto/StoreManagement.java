package com.team2.simpleOrder.dto;

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
	private String pd_code;
	private String pd_date;
	private String pd_name;
	private String pd_imagename;
	private int pd_price;
	private int pd_status;
	
	
	private String skc_code;
	private String skc_name;
	private int skc_x;
	private int skc_y;
 	
	private String pdc_name;
	private int pdc_status;
	List<String> cpList;
	
	private String stk_stock;
}
