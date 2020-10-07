
package com.team2.simpleOrder.dao.member;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.team2.simpleOrder.dto.Member;


public interface ICompanyMemberDao1 {

	@Insert ("INSERT INTO company_email VALUES (#{ce_email}, #{ce_pw}, 0)")// email 계정 생성
	boolean createEmailAcount(HashMap<String, String> acountInfo);
	
	@Insert ("INSERT INTO company VALUES (#{ce_email}, #{c_code}, #{c_pw}, 1, '0000', #{c_address}, #{c_name}, #{c_phone}, 1)") // 사업체 계정 생성
	boolean createCcodeAcount(HashMap<String, String> acountInfo);
	
	@Select ("SELECT CE_PW FROM company_email WHERE CE_EMAIL = #{value}") // 이메일로 인코딩된 비밀번호 가져오기
	String getEncodingPw(String string);
	
	@Select ("SELECT * FROM COMPANY WHERE C_CODE IN (SELECT C_CODE FROM company WHERE C_EMAIL = #{value} AND C_STATUS = '1')") // 이메일에 등록된 활성화 상태의 사업자 코드 가져오기
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

	@Select("SELECT COUNT(*) FROM EMP WHERE C_CODE = #{c_code} AND EMP_CODE = #{emp_code} AND EMP_PW = #{emp_pw} AND EMP_STATUS = '1'") // 직원 로그인
	boolean empAcountlogin(HashMap<String, String> empAcountInfo);
	
	@Select("SELECT EMP.EMP_NAME,EMP.EMP_CODE, EMP.EMP_PW,POSITION.PST_NAME "
			+ "FROM EMP INNER JOIN POSITION ON EMP.PST_POSITION = POSITION.PST_POSITION AND EMP.C_CODE = POSITION.C_CODE "
			+ "WHERE EMP.C_CODE = #{c_code} AND EMP.EMP_STATUS = #{emp_status}")
	ArrayList<HashMap<String, String>> getEmpList(HashMap<String, String> empinfo);

	@Select("SELECT PST_NAME, PST_POSITION FROM POSITION WHERE C_CODE = ${value}")
	ArrayList<HashMap<String, String>> getPositionList(Object c_code); // 사업체의 직금과 직급 코드 출력
	
	@Update("UPDATE EMP SET PST_POSITION = #{pst_position}, EMP_NAME = #{emp_name}, EMP_PW = #{emp_pw} WHERE C_CODE = #{c_code} AND EMP_CODE = #{emp_code}")
	boolean updateEmpInfo(HashMap<String, String> empInfo); // emp 정보 업데이트

	@Select("SELECT LPAD(COUNT(*),5,0) FROM EMP WHERE C_CODE = #{value}") // 새로운 emp code 발급
	String createEmpSetting(Object c_code);

	@Update("UPDATE EMP SET EMP_STATUS = '-1' WHERE C_CODE = #{c_code} AND EMP_CODE = #{emp_code}") // 직원 퇴사 처리
	void fireEmpInfo(HashMap<String, String> empInfo);

	@Update("UPDATE COMPANY SET C_STATUS = '-1' WHERE C_CODE = #{c_code} AND C_EMAIL = #{ce_email}") // 사업체 계정 삭제 처리
	boolean cAcountDelect(HashMap<String, String> cAcountInfo);

	@Select("SELECT * FROM position where c_code = #{c_code}")
	ArrayList<HashMap<String, Object>> getPositionGrant(String c_code); // 코드에 맞는 등급 가져오기

	@Select("SELECT GPC_CODE FROM GRANT_POSITION WHERE C_CODE = #{C_CODE} AND PST_POSITION = #{PST_POSITION}")
	ArrayList<String> getGrantKind(HashMap<String, Object> hashMap);
	
	@Select("SELECT COUNT(*) FROM GRANT_POSITION_CODE") 
	int numberOfGrant();	// 플렛폼의 모든 권한 코드 갯수 출력
	
	@Delete("DELETE FROM GRANT_POSITION WHERE C_CODE = #{c_code}")
	void PositionGrantDataDelect(String c_code);
	
	@Insert("INSERT INTO GRANT_POSITION VALUES(#{c_code},#{pst_position},LPAD(#{gpc_code},2,0) )")
	void createPositionGrant(HashMap<String, String> positionAndGranthm);

	@Select("SELECT PST_POSITION, PST_NAME FROM POSITION WHERE C_CODE = #{c_code}")
	ArrayList<HashMap<String, String>> getPosition(String c_code);

	@Update("UPDATE POSITION SET PST_NAME = #{pst_name} WHERE C_CODE = #{c_code} AND PST_POSITION = #{pst_position}")
	boolean updatePosition(HashMap<String, String> positionInfo);
	
	@Delete("DELETE FROM POSITION WHERE C_CODE = #{c_code} AND PST_POSITION = #{pst_position}")
	void deletePosition(HashMap<String, String> positionInfo);

	@Insert("INSERT INTO POSITION VALUES (#{c_code}, #{pst_position}, #{pst_name})")
	void createPosition(HashMap<String, String> positionInfo);

	@Select("SELECT LPAD(COUNT(*),2,0) FROM POSITION WHERE C_CODE = ${value}")
	String getNewPositionCode(String c_code);

	@Update("UPDATE EMP SET PST_POSITION = '00' WHERE C_CODE = #{c_code} AND PST_POSITION = #{pst_position}")
	void allPositionUpdate(HashMap<String, String> positionInfo);

	@Select("SELECT C_SECURITYCODE FROM COMPANY WHERE C_CODE = #{c_code}")
	String getCSecurityCode(String attribute);

	@Update("UPDATE COMPANY SET C_SECURITYCODE = #{securityCode} WHERE C_CODE = #{c_code}")
	void ChangeSecurityCode(HashMap<String, String> securityCodeInfo);

	@Select("SELECT PST_POSITION FROM EMP WHERE C_CODE = #{c_code} AND EMP_CODE = #{emp_code}")
	String getempPosition(HashMap<String, String> empAcountInfo);
	
	@Select("SELECT COUNT(*) FROM GRANT_POSITION WHERE C_CODE = #{c_code} AND PST_POSITION = #{pst_position} AND GPC_CODE = LPAD(#{gpc_code},2,0)")
	Boolean getGrantActivestatus(HashMap<String, String> hm);

	@Insert("INSERT INTO PRODUCT_CT VALUES (#{c_code}, '01', '기본')")
	void createBasicProCategori(HashMap<String, String> acountInfo);
	@Insert("INSERT INTO SELLKEY_CT VALUES (#{c_code}, 0, '기본', 4, 3)")
	void createBasicSkct(HashMap<String, String> acountInfo);
	@Insert("INSERT INTO SEAT_CT VALUES (#{c_code}, '01', '기본', 4, 3)")
	void createBasicSeatCt(HashMap<String, String> acountInfo);
	@Insert("INSERT INTO REQUEST VALUES (#{c_code}, 1, '물')")
	void createBasicRequest(HashMap<String, String> acountInfo);



	


	
	

	

}
