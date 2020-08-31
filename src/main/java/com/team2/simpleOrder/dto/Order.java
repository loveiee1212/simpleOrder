package com.team2.simpleOrder.dto;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("order")
public class Order {
	String category;
	 HashMap<String, Integer> tSize;
	 List<String> tnumList;
}
