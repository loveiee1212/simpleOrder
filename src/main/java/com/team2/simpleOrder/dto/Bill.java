package com.team2.simpleOrder.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("bill")
public class Bill {
	private String pd_name;
	private String pd_price;
	private int oh_cnt;
}
