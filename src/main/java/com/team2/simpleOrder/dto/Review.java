package com.team2.simpleOrder.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

@Data
@ToString
@Alias("review")
@Accessors(chain=true)
public class Review {
	private String c_code;
	private String bd_date;
	private String oac_num;
	private String rv_date;
	private String rv_text;
	private int rv_score;
	private String rvImg_sysName;
}
