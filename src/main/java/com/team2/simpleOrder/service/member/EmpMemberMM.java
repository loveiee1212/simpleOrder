package com.team2.simpleOrder.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import com.team2.simpleOrder.dao.member.IEmpMemberDao;
import com.team2.simpleOrder.dao.member.ICompanyMemberDao1;
import com.team2.simpleOrder.dao.member.IMemberDao3;
import com.team2.simpleOrder.dto.Member;

@Service
public class EmpMemberMM {

	@Autowired
	private IEmpMemberDao mDao2;

	ModelAndView mav;

	public String getTime(Member mb) {
		List mlist = mDao2.getTime(mb);
		String json = new Gson().toJson(mlist);
		System.out.println(mlist);
		return json;
	}

	public String insertAd_inTime(Member member) {
		String json = null;
		boolean result = mDao2.insertAd_inTime(member);
		if (result) {
			json = new Gson().toJson("1");
		}
		return json;
	}

	public String insertAd_outTime(Member member) {
		String json = null;

		boolean result = mDao2.insertAd_outTime(member);
		if (result) {
			json = new Gson().toJson("1");
		}
		return json;
	}
}