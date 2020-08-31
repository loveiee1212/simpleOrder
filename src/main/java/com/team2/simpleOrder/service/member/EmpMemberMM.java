package com.team2.simpleOrder.service.member;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.team2.simpleOrder.dao.member.ICompanyMemberDao1;
import com.team2.simpleOrder.dao.member.IMemberDao2;
import com.team2.simpleOrder.dao.member.IMemberDao3;
import com.team2.simpleOrder.dto.Member;

@Service
public class EmpMemberMM {
	
	@Autowired
	private IMemberDao2 mDao2;
	
	@Autowired
	private IMemberDao3 mDao3;
	
	ModelAndView mav;

	public String getTime(int year, int month) {
		List<Member> bList = mDao2.getTime(year,month);
		String json = new Gson().toJson(bList);
		return json;
	}
}