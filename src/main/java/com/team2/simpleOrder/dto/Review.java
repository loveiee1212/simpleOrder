package com.team2.simpleOrder.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("review")
public class Review {
private int oac_num;
private String bd_date;
private String rv_date;
private String rv_text;
private String rv_score;
private List<ReviewFile> rvfList;

@Data
@ToString
@Alias("reviewFile")
public class ReviewFile{
	private String reviewImg; 
}
}
