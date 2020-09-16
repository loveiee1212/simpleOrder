package com.team2.simpleOrder.service.member;

import java.util.HashMap;
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

	public String getTime(HashMap<String, String> mb) {
		List<HashMap<String, String>> mlist= mDao2.getTime(mb);
		String json = new Gson().toJson(mlist);
		return json;
	}

	public String insertAd_inTime(HashMap<String, String> mb) {
		String json = null;
		boolean result = mDao2.insertAd_inTime(mb);
		if (result) {
			json = new Gson().toJson("1");
		}
		return json;
	}

	public String insertAd_outTime(HashMap<String, String> mb) {
		String json = null;

		boolean result = mDao2.insertAd_outTime(mb);
		if (result) {
			json = new Gson().toJson("1");
		}
		return json;
	}

	public String getEmpList(HashMap<String, String> mb) {
		List<HashMap<String, String>> elist = mDao2.getEmpList(mb);
		String json = new Gson().toJson(elist);
		return json;
	}

	public String getEmpInfo(HashMap<String, String> mb) {
		HashMap<String,String> eInfo = mDao2.getEmpInfo(mb);
		String json = new Gson().toJson(eInfo);
		return json;
	}

	public String getAdTime(HashMap<String, String> mb) {
		HashMap<String,String> adTime = mDao2.getAdTime(mb);
		String json = new Gson().toJson(adTime);
		System.out.println(adTime);
		return json;
	}

}