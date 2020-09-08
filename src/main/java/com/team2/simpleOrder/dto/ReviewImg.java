package com.team2.simpleOrder.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("reviewImg")
public class ReviewImg {
	private String bd_date;
	private int oac_num;
	private String rvImg_sysName;
}
