
package com.team2.simpleOrder.service.member;

import java.util.HashMap;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.chainsaw.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
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

	public String createEmailAcount(HashMap<String, String> acountInfo, HttpSession session, RedirectAttributes reat)
			throws MessagingException { // 새로운 이메일 계정 생성
		acountInfo.put("ce_pw", pse.encode(acountInfo.get("ce_pw"))); // 가져온 비밀번호를 인코딩 하여 다시 해쉬맵에 덮어 씌움
		try {
			if (cDao.createEmailAcount(acountInfo) && cDao.createCcodeAcount(acountInfo)) { // 이메일과 사업체가 둘다 문제없이 등록되었다면
				mailM.acountApprovalMailSend(acountInfo); // 회원가입 승인 메일을 가입한 메일로 발송함
				session.setAttribute("ce_email", acountInfo.get("ce_email"));
				return "redirect:cList";
			} else {
				acountInfo.put("error", "회원가입에 실패하였습니다 다시 시도해주세요.");
				reat.addFlashAttribute("acountInfo", acountInfo);
				return "redirect:joinEmailFrm";
			}
		} catch (Exception e) {
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
		System.out.println(cInfo.toString());
		if (cDao.emailAcountStatusCheak(cInfo.get("ce_email")) && cDao.cLogin(cInfo)) {// 해당 이메일의 상태와 로그인 여부를 확인
			session.removeAttribute("ce_email");
			session.setAttribute("c_code", cInfo.get("c_code"));
			return "mainskill";
		}else {
			cInfo.put("error", "사업체 번호와 비밀번호를 확인해주세요");
			reat.addFlashAttribute("cInfo",cInfo);
			return "redirect:/cList";
		}
		
	}

	public void emailAcountStatusChange(Long cCodes) {// 이메일 계정 상태 승인
		long cCode = cCodes / 7;
		System.out.println(cCode);
		cDao.emailAcountStatusChange(cCode);

	}

}