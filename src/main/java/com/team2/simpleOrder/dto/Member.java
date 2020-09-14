package com.team2.simpleOrder.dto;


import org.apache.ibatis.type.Alias;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("member")
public class Member {
	private String ce_email;
	private String ce_pw;
	private String c_code;
	private String cnum_pw;
	
	private int c_reviewuse;
	private int c_securitycode;
	private String c_address;
	private String c_name;
	private String c_phone;
	private int c_status;
	
	private int emp_code;
	private int emp_pw;
	private String emp_name;
	private int emp_status;
	
	private int pst_position;
	private int gpc_code;
	
	
	private String bd_date;
	private String f_date;
	private String ad_inTime;
	private String ad_outTime;
}
