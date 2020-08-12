package com.team2.simpleOrder.service.member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.member.IMemberDao1;
import com.team2.simpleOrder.dao.member.IMemberDao2;
import com.team2.simpleOrder.dao.member.IMemberDao3;
import com.team2.simpleOrder.dto.Member;

@Service
public class MemberMM2 {
	
	@Autowired
	private IMemberDao1 mDao1;
	
	@Autowired
	private IMemberDao2 mDao2;
	
	@Autowired
	private IMemberDao3 mDao3;
	
	ModelAndView mav;
}