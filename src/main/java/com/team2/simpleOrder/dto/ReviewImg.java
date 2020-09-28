package com.team2.simpleOrder.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

@Data
@ToString
@Alias("reviewImg")
@Accessors(chain=true)
public class ReviewImg {
	private String c_code;
	private String bd_date;
	private String oac_num;
	private String rvImg_sysName;
}
