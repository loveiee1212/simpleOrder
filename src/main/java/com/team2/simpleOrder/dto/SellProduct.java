package com.team2.simpleOrder.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("sellProduct")
public class SellProduct {
	private String skc_code;
	private String pdc_code;
	private String pdc_date;
	private String pd_code;
	private String pd_date;
	private String pd_imgName;
	private String pd_name;
	private int pd_price;
	private int stk_stock;
	private int sk_num;
	private int sc_x;
	private int sc_y;
	private List<Integer> tList;
}
