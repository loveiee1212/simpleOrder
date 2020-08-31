
package com.team2.simpleOrder.service.member;

import java.util.HashMap;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


import com.team2.simpleOrder.dao.member.ICompanyMemberDao1;


@Service
public class CompanyMemberMM1 {
	
	@Autowired
	private ICompanyMemberDao1 mCDao;
	
	@Autowired
	private JavaMailSender MailSender;
	

	//E Mail 회원 가입
	public String joinCmember(HashMap<String, String> company) throws MessagingException {
		
		
		boolean cAcountResult = mCDao.joinCmember(company);//이메일로 회원 등록
		boolean cCodeInsertResult = mCDao.InsertCcode(company); 
		if(cAcountResult || cCodeInsertResult) //둘다 정상적으로 로그인 됐다면
			CmemberAcountMailSend(company);//계정 활성 이메일 발송
		return "true";
	}



	private void CmemberAcountMailSend(HashMap<String, String> company) throws MessagingException {
		MimeMessage message = MailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
		messageHelper.setFrom("simpleorder@HD7.vc.kr");
		messageHelper.setTo(company.get("ce_email"));
		messageHelper.setSubject("[simpleOrder]심플오더 회원 가입을 감사드립니다.");
		messageHelper.setText(mesageMake(company));
		
		MailSender.send(message);
	}



	private String mesageMake(HashMap<String, String> company) {
		Long memberCode = Long.parseLong(company.get("c_code"))*7;
		
		StringBuilder mesage = new StringBuilder();
		mesage.append("저희 simpleOrder에 가입해 주셔서 감사합니다.\r\n");
		mesage.append("simpleOrder회원 인증을 진행하시려면 아래버튼을 입력하시거나 qr 코드를 찍어주세요 \r\n");
		mesage.append("http://localhost:8080/simpleOrder/rest/statuscheck/"+memberCode+" \r\n");
		mesage.append("<img src=\"https://chart.googleapis.com/chart?cht=qr&amp;chs=200x200&amp;chl=http://ojava.tistory.com\">\r\n");
		mesage.append("simpleOrder 회원가입하지 않으셧다면 이 메일을 무시해 주시길 바랍니다.\r\n");
		mesage.append("타인이 고객님의 이메일 주소를 도용했을 수 도 있습니다.");
		
		
		return mesage.toString();
	}



	public void statusCheck(Long memberCode) {
		String c_code = (memberCode/7)+"";

		String ce_email = mCDao.getCompanyEmail(c_code);
		mCDao.updateStatus(ce_email);
	}

	
}