package com.team2.simpleOrder.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("sellProduct")
public class SellProduct {
	private int skc_code;
	private String pdc_code;
	private String pd_code;
	private String pd_imgName;
	private String pd_name;
	private int pd_price;
}
