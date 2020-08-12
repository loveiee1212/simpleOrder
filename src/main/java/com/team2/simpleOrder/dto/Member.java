package com.team2.simpleOrder.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("member")
public class Member {
	private String id;
	private String pw;
	private String name;
}
