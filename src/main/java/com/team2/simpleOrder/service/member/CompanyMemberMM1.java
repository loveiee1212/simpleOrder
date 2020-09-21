
package com.team2.simpleOrder.service.member;

import java.awt.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.dao.member.ICompanyMemberDao1;

@Service
public class CompanyMemberMM1 {

	@Autowired
	private ICompanyMemberDao1 cDao;

	@Autowired
	private MailManger mailM;

	@Autowired
	private PasswordEncoder pse;

	@Transactional
	public String createEmailAcount(HashMap<String, String> acountInfo, HttpSession session, RedirectAttributes reat)
			throws MessagingException { // 새로운 이메일 계정 생성
		acountInfo.put("ce_pw", pse.encode(acountInfo.get("ce_pw"))); // 가져온 비밀번호를 인코딩 하여 다시 해쉬맵에 덮어 씌움
		try {
			acountInfo.put("emp_code", "0");
			acountInfo.put("pst_position", "00");
			acountInfo.put("emp_pw", "0000");
			acountInfo.put("emp_name", "대표");
			acountInfo.put("pst_name", "대표");

			if (cDao.createEmailAcount(acountInfo) && cDao.createCcodeAcount(acountInfo)) { // 이메일과 사업체가 둘다 문제없이 등록되었다면
				cDao.creatPosition(acountInfo); // 해당 사업체 번호로 대표 직급 생성
				for (int i = 0; i < cDao.getGrantPositionCodeSize(); i++) {
					acountInfo.put("gpc_code", "" + i);
					cDao.creatGrantPosition(acountInfo);// 반복문돌며 모든 권한의 갯수만큼 해당 직급에 계급 부여
				}
				cDao.creatEmp(acountInfo);// 해당 직급을 가진 대표 계정 생성

				mailM.acountApprovalMailSend(acountInfo); // 회원가입 승인 메일을 가입한 메일로 발송함

				session.setAttribute("ce_email", acountInfo.get("ce_email"));
				return "redirect:cList";
			} else {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				acountInfo.put("error", "회원가입에 실패하였습니다 다시 시도해주세요.");
				reat.addFlashAttribute("acountInfo", acountInfo);
				return "redirect:joinEmailFrm";
			}
		} catch (Exception e) {
			System.out.println("오류 발생");
			System.err.println(e);
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			reat.addFlashAttribute("acountInfo", acountInfo);
			acountInfo.put("error", "회원가입에 실패하였습니다 다시 시도해주세요.");
			return "redirect:joinEmailFrm";
		}

	}

	public String cEmailLogin(HashMap<String, String> emailIdPw, HttpSession session, RedirectAttributes reat) { // 이메일
																													// 계정
																													// 로그인
		String encodingPw = cDao.getEncodingPw(emailIdPw.get("ce_email")); // 해당 계정으로 인코딩된 비밀번호 가져옴
		if (pse.matches(emailIdPw.get("ce_pw"), encodingPw) && emailIdPw.get("ce_pw") != "") {
			// 인코딩된 비밀번호와 입력한 비밀번호가 일치하는지 확인, 비밀번호는 공백이 아니여야함
			session.setAttribute("ce_email", emailIdPw.get("ce_email"));
			return "redirect:/cList";
		} else {
			reat.addFlashAttribute("ce_email", emailIdPw.get("ce_email"));
			reat.addFlashAttribute("errorDiv", "아이디와 비밀번호가 일치하지 않습니다.");
			return "redirect:/main";
		}
	}

	public HashMap<String, String> getClist(String ce_email) { // 사업체 리스트 가져오기
		CMemberHtmlMaker hM = new CMemberHtmlMaker(); // html 메이커 생성
		HashMap<String, String> map = new HashMap<String, String>(); // 해쉬맵 생성
		map.put("cListInfoHtml", hM.Clist(cDao.getClist(ce_email))); // 맵에 만든 html 코드 입력
		return map;
	}

	public String cLogin(HashMap<String, String> cInfo, HttpSession session, RedirectAttributes reat) { // 사업체 로그인
		if (cDao.emailAcountStatusCheak(cInfo.get("ce_email")) && cDao.cLogin(cInfo)) {// 해당 이메일의 상태와 로그인 여부를 확인
			session.removeAttribute("ce_email");
			session.setAttribute("c_code", cInfo.get("c_code"));
			return "redirect:/poslogin";
		} else {
			cInfo.put("error", "사업체 번호와 비밀번호를 확인해주세요");
			reat.addFlashAttribute("cInfo", cInfo);
			return "redirect:/cList";
		}

	}

	public String emailAcountStatusChange(Long cCodes) {// 이메일 계정 상태 승인
		long cCode = cCodes / 7;
		if (cDao.emailAcountStatusChange(cCode)) { // 계정에서 email Acount Status 변경
			return "Congratulations, your subscription is complete.\r\n";
		}
		;
		return "sorry";

	}

	@Transactional
	public String createCcodeAcount(HashMap<String, String> cCodeInfo, HttpSession session, RedirectAttributes reat) { // 사업체
																														// 계정
																														// 생성,
																														// emp0000
																														// 까지
																														// 같이
																														// 생성
		try {
			session.setAttribute("ce_email", cCodeInfo.get("ce_email"));
			cCodeInfo.put("ce_email", session.getAttribute("ce_email") + "");
			cCodeInfo.put("pst_position", "00");
			cCodeInfo.put("emp_pw", "0000");
			cCodeInfo.put("emp_code", "0");
			cCodeInfo.put("pst_name", "대표");

			if (cDao.createCcodeAcount(cCodeInfo)) {
				cDao.creatPosition(cCodeInfo);
				for (int i = 0; i < cDao.getGrantPositionCodeSize(); i++) {
					cCodeInfo.put("gpc_code", "" + i);
					cDao.creatGrantPosition(cCodeInfo);
				}
				cDao.creatEmp(cCodeInfo);
				return "redirect:/cList";
			} else {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				cCodeInfo.put("error", "가입에 실패하였습니다. 다시 시도해주세요");
				reat.addFlashAttribute("cCodeInfo", cCodeInfo);
				return "redirect:/createccodefrm";
			}
		} catch (Exception e) {
			System.out.println("에러");
			System.err.println(e);
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			cCodeInfo.put("error", "가입에 실패하였습니다. 다시 시도해주세요");
			reat.addFlashAttribute("cCodeInfo", cCodeInfo);
			return "redirect:/createccodefrm";
		}

	}

	public String emailLogout(HttpSession session) {
		try {
			session.invalidate();
			return "redirect:/main";
		} catch (Exception e) {
			return "redirect:/main";

		}
	}

	public String backClist(HttpSession session) {
		try {
			session.setAttribute("ce_email", cDao.getcCodeEmailInfo((String) session.getAttribute("c_code")));
			return "redirect:/cList";
		} catch (Exception e) {
			return "redirect:/cList";
		}
	}

	public String empAcountlogin(HashMap<String, String> empAcountInfo, HttpSession session, RedirectAttributes reat) {
		System.out.println(empAcountInfo.toString());
		try {
			empAcountInfo.put("c_code", (String) session.getAttribute("c_code"));
			if (cDao.empAcountlogin(empAcountInfo)) { // 직원 계정 로그인 성공
				session.setAttribute("emp_code", empAcountInfo.get("emp_code"));
				return "redirect:/posmain";
			} else { // 직원 계정 로그인 실패
				empAcountInfo.put("error", "회원 코드와 비밀번호가 일치하지 않습니다.");
				reat.addFlashAttribute("empAcountInfo", empAcountInfo);
				return "redirect:/poslogin";
			}
		} catch (Exception e) {
			System.out.println(e);
			empAcountInfo.put("error", "회원 코드와 비밀번호가 일치하지 않습니다.");
			reat.addFlashAttribute("empAcountInfo", empAcountInfo);
			return "redirect:/poslogin";
		}
	}

	public String cCodeAcountLogout(HttpSession session) {
		try {
			session.setAttribute("ce_email", cDao.getcCodeEmailInfo((String) session.getAttribute("c_code")));
			session.removeAttribute("emp_code");
			return "redirect:/poslogin";
		} catch (Exception e) {
			return "redirect:/poslogin";
		}
	}

	public HashMap<String, String> getEmpList(HttpSession session, HashMap<String, String> empinfo) {
		CMemberHtmlMaker hm = new CMemberHtmlMaker();
		empinfo.put("c_code", (String) session.getAttribute("c_code"));
		ArrayList<HashMap<String, String>> empPostionList = cDao.getEmpList(empinfo); // 회원
																						// 별
																						// 직급
																						// 조인하여
																						// select
		HashMap<String, String> empHtmlList = new HashMap<String, String>();
		empHtmlList.put("empList", hm.empList(empPostionList));// html 만들어 캡슐화

		return empHtmlList;
	}

	public HashMap<String, String> getPositionList(HttpSession session, String empPosition) { // 포지션 리스트 가져오기
		HashMap<String, String> pL = new HashMap<String, String>();
		ArrayList<HashMap<String, String>> positionList = cDao.getPositionList(session.getAttribute("c_code"));
		CMemberHtmlMaker hm = new CMemberHtmlMaker();
		pL.put("positionList", hm.positionList(positionList, empPosition));
		return pL;
	}

	public String updateEmpInfo(HashMap<String, String> empInfo, HttpSession session, RedirectAttributes reat) { // emp
																													// 정보
																													// 수정
		reat.addFlashAttribute("basicPath", "empSettingDivOn()");
		empInfo.put("c_code", (String) session.getAttribute("c_code"));
		if (!cDao.updateEmpInfo(empInfo)) {
			reat.addFlashAttribute("error", "수정에실패하였습니다.");
		}
		return "redirect:posSetting";
	}

	public HashMap<String, String> createEmpSetting(HttpSession session) { // 새로운 데이터 입력을 위한 코드 가져오기 & 직급 리스트 가져오기
		HashMap<String, String> empSettingInfo = getPositionList(session, null); // 내부 함수 호출 포지션 리스트 가져와서 HashMap에 넣어두기
																					// !empList
		empSettingInfo.put("emp_code", cDao.createEmpSetting(session.getAttribute("c_code")));
		return empSettingInfo;
	}

	public String createEmpInfo(HttpSession session, HashMap<String, String> empInfo, RedirectAttributes reat) {
		try {
			empInfo.put("c_code", (String) session.getAttribute("c_code"));
			cDao.creatEmp(empInfo);
			reat.addFlashAttribute("basicPath", "empSettingDivOn()");
			return "redirect:/posSetting";
		} catch (Exception e) {
			System.out.println(e);
			return "redirect:/posSetting";
		}
	}

	public String fireEmpInfo(HttpSession session, HashMap<String, String> empInfo, RedirectAttributes reat) {
		try {
			empInfo.put("c_code", (String) session.getAttribute("c_code"));
			cDao.fireEmpInfo(empInfo);
			reat.addFlashAttribute("basicPath", "empSettingDivOn()");
			return "redirect:/posSetting";
		} catch (Exception e) {
			reat.addFlashAttribute("basicPath", "empSettingDivOn()");
			return "redirect:/posSetting";
		}
	}

	public String cAcountDelect(HashMap<String, String> cAcountInfo, HttpSession session) {
		try {
			cAcountInfo.put("ce_email", (String) session.getAttribute("ce_email"));
			cDao.cAcountDelect(cAcountInfo);
			return "redirect:/cList";
		} catch (Exception e) {
			System.err.println(e);
			return "redirect:/cList";
		}

	}

	public HashMap<String, String> getPositionGrant(HttpSession session) { // ccode 기준 등급, 해당 등급 권한 get
		HashMap<String, String> HtmlSorce = new HashMap<String, String>();
		try {
			ArrayList<HashMap<String, Object>> positionGrantKind = cDao
					.getPositionGrant((String) session.getAttribute("c_code"));// 등급과 등급명 get
			for (int i = 0; i < positionGrantKind.size(); i++) { // 등급의 갯수에 따라 반복
				boolean[] grantBooleanList = new boolean[cDao.numberOfGrant()]; // 권한 여부에 따른 boolean 값을 저장하기 위한 배열 생성
				ArrayList<String> grantList = cDao.getGrantKind(positionGrantKind.get(i)); // 등급의 권한리스트 만들기
				for (int j = 0; j < cDao.numberOfGrant(); j++) { // 서버의 모든 권한 코드 수량
					for (String z : grantList) { // 0
						if (j == Integer.parseInt(z)) {
							grantBooleanList[j] = true;
							break;
						} else {
							grantBooleanList[j] = false;
						}
					}
				}
				positionGrantKind.get(i).put("grantBooleanList", grantBooleanList); // positionKind에 권한 리스트까지 입력
			}

			CMemberHtmlMaker cmh = new CMemberHtmlMaker();
			HtmlSorce.put("positionGrantCheckBoxHtml", cmh.makeHtmlPostionGrnat(positionGrantKind));
			return HtmlSorce;

		} catch (Exception e) {
			System.err.println(e);
			return HtmlSorce;
		}

	}

	@Transactional
	public void updatePosition(HashMap<String, String> positionInfo, HttpSession session, RedirectAttributes reat) {
		reat.addFlashAttribute("basicPath", "postionGrantSettingFrmon()");
		try {
			cDao.PositionGrantDataDelect((String) session.getAttribute("c_code"));
			Iterator<String> pgI = positionInfo.keySet().iterator();
			while (pgI.hasNext()) {
				HashMap<String, String> positionAndGranthm = new HashMap<String, String>();
				String[] positionAndGrant = pgI.next().split("#");
				positionAndGranthm.put("pst_position", positionAndGrant[0]);
				positionAndGranthm.put("gpc_code", positionAndGrant[1]);
				positionAndGranthm.put("c_code", (String) session.getAttribute("c_code"));
				cDao.createPositionGrant(positionAndGranthm);
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.out.println(e);
		}

	}

	public HashMap<String, String> getPosition(HttpSession session) {
		try {
			HashMap<String, String> hm = new HashMap<String, String>();
			CMemberHtmlMaker cmh = new CMemberHtmlMaker();
			hm.put("positionList", cmh.getPositionHtml(cDao.getPosition((String) session.getAttribute("c_code"))));
			
			return hm;

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

}