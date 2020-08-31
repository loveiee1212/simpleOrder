package com.team2.simpleOrder.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.member.IEmpMemberDao;
import com.team2.simpleOrder.dao.member.ICompanyMemberDao1;

import com.team2.simpleOrder.dao.member.IMemberDao3;

@Service
public class MemberMM3 {
	
	@Autowired
	private ICompanyMemberDao1 mDao1;
	
	@Autowired
	private IMemberDao3 mDao3;
	
	ModelAndView mav;
	
}
