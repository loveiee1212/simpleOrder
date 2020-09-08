
package com.team2.simpleOrder.dao.member;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.team2.simpleOrder.dto.Member;


public interface ICompanyMemberDao1 {

	@Insert ("INSERT INTO company_email VALUES (#{ce_email}, #{ce_pw}, 0)")// email 계정 생성
	boolean createEmailAcount(HashMap<String, String> acountInfo);
	
	@Insert ("INSERT INTO company VALUES (#{ce_email}, #{c_code}, #{c_pw}, 1, 0000, #{c_address}, #{c_name}, #{c_phone}, 0)") // 사업체 계정 생성
	boolean createCcodeAcount(HashMap<String, String> acountInfo);
	
	@Select ("SELECT CE_PW FROM company_email WHERE CE_EMAIL = #{value}") // 이메일로 인코딩된 비밀번호 가져오기
	String getEncodingPw(String string);
	
	@Select ("SELECT * FROM COMPANY WHERE C_CODE IN (SELECT C_CODE FROM company WHERE C_EMAIL = #{value})") // 이메일에 등록된 모든 사업자 코드 가져오기
	ArrayList<Member> getClist(String ce_email);
	
	@Select ("SELECT COUNT(*) FROM COMPANY WHERE C_CODE = #{c_code} AND C_PW = #{c_pw}") //사업체 로그인
	boolean cLogin(HashMap<String, String> cInfo);
	
	@Select ("SELECT CE_STATUS FROM company_email WHERE CE_EMAIL = #{value}")// 이메일 주소를 받아 해당 계정의 상태여부 확인
	boolean emailAcountStatusCheak(String string);
	
	@Update ("UPDATE COMPANY_EMAIL SET CE_STATUS  = '1' WHERE CE_EMAIL IN (SELECT C_EMAIL FROM COMPANY WHERE C_CODE = #{value})")
	void emailAcountStatusChange(long cCode);

	
	

	

}
