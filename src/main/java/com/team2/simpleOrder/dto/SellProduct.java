package com.team2.simpleOrder.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("sellProduct")
public class SellProduct {
	private int skc_code;
	private int pdc_code;
	private int pd_code;
	private String pd_imgName;
	private String pd_name;
	private int pd_price;
}
