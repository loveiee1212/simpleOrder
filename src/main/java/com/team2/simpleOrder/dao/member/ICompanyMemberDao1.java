
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
	
	@Insert ("INSERT INTO company VALUES (#{ce_email}, #{c_code}, #{c_pw}, 1, '0000', #{c_address}, #{c_name}, #{c_phone}, 0)") // 사업체 계정 생성
	boolean createCcodeAcount(HashMap<String, String> acountInfo);
	
	@Select ("SELECT CE_PW FROM company_email WHERE CE_EMAIL = #{value}") // 이메일로 인코딩된 비밀번호 가져오기
	String getEncodingPw(String string);
	
	@Select ("SELECT * FROM COMPANY WHERE C_CODE IN (SELECT C_CODE FROM company WHERE C_EMAIL = #{value})") // 이메일에 등록된 모든 사업자 코드 가져오기
	ArrayList<Member> getClist(String ce_email);
	
	@Select ("SELECT COUNT(*) FROM COMPANY WHERE C_CODE = #{c_code} AND C_PW = #{c_pw}") //사업체 로그인
	boolean cLogin(HashMap<String, String> cInfo);
	
	@Select ("SELECT CE_STATUS FROM company_email WHERE CE_EMAIL = #{value}")// 이메일 주소를 받아 해당 계정의 상태여부 확인
	boolean emailAcountStatusCheak(String string);
	
	@Update ("UPDATE COMPANY_EMAIL SET CE_STATUS  = '1' WHERE CE_EMAIL IN (SELECT C_EMAIL FROM COMPANY WHERE C_CODE = #{value})") //회원 상태 활성으로 변경
	boolean emailAcountStatusChange(long cCode);
	
	@Insert ("INSERT INTO POSITION VALUES (#{c_code},#{pst_position}, #{pst_name})") //사업체에 직급을 생성
	void creatPosition(HashMap<String, String> acountInfo);
	
	@Insert ("INSERT INTO GRANT_POSITION VALUES(#{c_code}, #{pst_position},LPAD(#{gpc_code},2,0) )") //직급에 권한부여
	void creatGrantPosition(HashMap<String, String> acountInfo);
	
	@Insert ("INSERT INTO EMP VALUES (#{c_code},LPAD(#{emp_code},5,0),#{pst_position},#{emp_pw},#{emp_name},1)") //emp 생성
	boolean creatEmp(HashMap<String, String> acountInfo);
	
	@Select ("SELECT COUNT(*) FROM GRANT_POSITION_CODE") //현재 플렛폼에서 가지고 있는 권한의 갯수를 get
	int getGrantPositionCodeSize();

	@Select("SELECT C_EMAIL FROM COMPANY WHERE C_CODE = #{value}") // 사업체 번호로 소속된 Email 가져오기
	String getcCodeEmailInfo(String cCode);

	@Select("SELECT COUNT(*) FROM EMP WHERE C_CODE = #{c_code} AND EMP_CODE = #{emp_code} AND EMP_PW = #{emp_pw}") // 직원 로그인
	boolean empAcountlogin(HashMap<String, String> empAcountInfo);
	
	@Select("SELECT EMP.EMP_NAME,EMP.EMP_CODE, EMP.EMP_PW,POSITION.PST_NAME "
			+ "FROM EMP INNER JOIN POSITION ON EMP.PST_POSITION = POSITION.PST_POSITION AND EMP.C_CODE = POSITION.C_CODE "
			+ "WHERE EMP.C_CODE = #{value} AND EMP.EMP_STATUS = 1")
	ArrayList<HashMap<String, String>> getEmpPostionList(Object c_code);

	@Select("SELECT PST_NAME, PST_POSITION FROM POSITION WHERE C_CODE = ${value}")
	ArrayList<HashMap<String, String>> getPositionList(Object c_code);
	
	@Update("UPDATE EMP SET PST_POSITION = #{empPosition}, EMP_NAME = #{empName}, EMP_PW = #{empPw} WHERE C_CODE = #{c_code} AND EMP_CODE = #{empCode}")
	boolean updateEmpInfo(HashMap<String, String> empInfo);


	
	

	

}
