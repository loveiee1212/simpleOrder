package com.team2.simpleOrder.dto.entity;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("adTime")
public class adTime {
	
	private int emp_code;
	private Timestamp bd_date;
	private Timestamp ad_inTime;
	private Timestamp ad_outTime;
}
