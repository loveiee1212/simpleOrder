package com.team2.simpleOrder.service.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

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

	public String getTime(HashMap<String, String> mb, HttpSession session) {
		mb.put("c_code",session.getAttribute("c_code").toString());
		mb.put("bd_date",session.getAttribute("bd_date").toString());
		if(mb.get("emp_code")==null) {
			mb.put("emp_code",session.getAttribute("emp_code").toString());
		}
		List<HashMap<String, String>> mlist= mDao2.getTime(mb);
		String json = new Gson().toJson(mlist);
		return json;
	}

	public String insertAd_inTime(HashMap<String, String> mb, HttpSession session) {
		String json = null;
		mb.put("c_code",session.getAttribute("c_code").toString());
		mb.put("bd_date",session.getAttribute("bd_date").toString());
		mb.put("emp_code",session.getAttribute("emp_code").toString());
		boolean result = mDao2.insertAd_inTime(mb);
		if (result) {
			json = new Gson().toJson("1");
		}
		return json;
	}

	public String insertAd_outTime(HashMap<String, String> mb, HttpSession session) {
		String json = null;
		mb.put("c_code",session.getAttribute("c_code").toString());
		mb.put("bd_date",session.getAttribute("bd_date").toString());
		mb.put("emp_code",session.getAttribute("emp_code").toString());
		System.out.println(mb.toString());
		boolean result = mDao2.insertAd_outTime(mb);
		System.out.println(result);
		if (result) {
			json = new Gson().toJson("1");
			System.out.println(json);
		}
		return json;
	}

	public String getEmpList(HashMap<String, String> mb, HttpSession session) {
		mb.put("c_code",session.getAttribute("c_code").toString());
		List<HashMap<String, String>> elist = mDao2.getEmpList(mb);
		String json = new Gson().toJson(elist);
		return json;
	}

	public String getEmpInfo(HashMap<String, String> mb, HttpSession session) {
		mb.put("c_code",session.getAttribute("c_code").toString());
		HashMap<String,String> eInfo = mDao2.getEmpInfo(mb);
		String json = new Gson().toJson(eInfo);
		return json;
	}

	public String getAdTime(HashMap<String, String> mb, HttpSession session) {
		mb.put("c_code",session.getAttribute("c_code").toString());
		HashMap<String,String> adTime = mDao2.getAdTime(mb);
		String json = new Gson().toJson(adTime);
		return json;
	}

	public String updateWorkTime(HashMap<String, String> mb, HttpSession session) {
		mb.put("c_code",session.getAttribute("c_code").toString());
		String json = null;
		boolean result = mDao2.updateWorkTime(mb);
		System.out.println(result);
		if (result) {
			json = new Gson().toJson("1");
		}
		return json;
	}

	public String showWorkTime(HashMap<String, String> mb, HttpSession session) {
		mb.put("c_code",session.getAttribute("c_code").toString());
		List<HashMap<String,String>> elist = mDao2.showWorkTime(mb);
		String json = new Gson().toJson(elist);
		return json;
	}

	public String showAllWorkTime(HashMap<String, String> mb, HttpSession session) {
		mb.put("c_code",session.getAttribute("c_code").toString());
		List<HashMap<String,String>> elist = mDao2.showAllWorkTime(mb);
		String json = new Gson().toJson(elist);
		return json;
	}

}