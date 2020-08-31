
package com.team2.simpleOrder.dao.member;

import java.util.HashMap;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ICompanyMemberDao1 {

	@Insert ("INSERT INTO COMPANY_EMAIL VALUES (#{ce_email},#{ce_pw},0)")
	boolean joinCmember(HashMap<String, String> company);

	@Insert ("INSERT INTO COMPANY VALUES(#{ce_email},#{c_code},#{c_pw},1,0000,#{c_address},#{c_name},#{c_phone},1)")
	boolean InsertCcode(HashMap<String, String> company);

	@Select ("SELECT C_EMAIL FROM COMPANY WHERE C_CODE = #{c_code}")
	String getCompanyEmail(String c_code);
	
	
	@Update ("UPDATE COMPANY_EMAIL SET CE_STATUS = '1' WHERE CE_EMAIL = #{ce_email}")
	void updateStatus(String ce_email);
	
	

}
