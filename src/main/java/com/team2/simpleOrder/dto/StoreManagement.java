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

	private int c_code;
	private String pd_name;
	private String pd_imagename;
	private int pd_price;
	
	List<String> productList;
}
