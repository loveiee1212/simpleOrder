
package com.team2.simpleOrder.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

<<<<<<< HEAD:src/main/java/com/team2/simpleOrder/service/member/MemberMM1.java
import com.team2.simpleOrder.dao.member.IMemberDao1;
import com.team2.simpleOrder.dao.member.IEmpMemberDao;
=======
import com.team2.simpleOrder.dao.member.ICompanyMemberDao1;
import com.team2.simpleOrder.dao.member.IMemberDao2;
>>>>>>> fbda3e4c7433ffdcf7cc6287b9548454e12304df:src/main/java/com/team2/simpleOrder/service/member/CompanyMemberMM1.java
import com.team2.simpleOrder.dao.member.IMemberDao3;
import com.team2.simpleOrder.dto.Member;

@Service
public class CompanyMemberMM1 {
	
	@Autowired
	private ICompanyMemberDao1 mDao1;
	
	@Autowired
	private IEmpMemberDao mDao2;
	
	@Autowired
	private IMemberDao3 mDao3;
	
	ModelAndView mav;

	public ModelAndView insertMember(Member mb) {
		mav = new ModelAndView();
		
		String path;
		
		if(mDao1.insertMember(mb)) {
			path ="/";
		}else {
			System.out.println("실패요");
		}
		return null;
	}
}