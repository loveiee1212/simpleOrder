package com.team2.simpleOrder.dto;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.team2.simpleOrder.dto.entity.adTime;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("member")
public class Member {
	private String c_code;
	private String pw;
	private String name;
	
	
	private List<adTime> adList;
}
