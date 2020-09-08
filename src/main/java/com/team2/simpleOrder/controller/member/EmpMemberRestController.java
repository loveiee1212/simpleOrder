package com.team2.simpleOrder.controller.member;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.member.EmpMemberMM;
import com.team2.simpleOrder.dto.Member;
import com.team2.simpleOrder.service.member.CompanyMemberMM1;
import com.team2.simpleOrder.service.member.MemberMM3;

@RestController
@RequestMapping("/rest")
public class EmpMemberRestController {
	//Only Member Rest Controller Number2
	
	@Autowired
	EmpMemberMM emm;
	
	@Autowired
	MemberMM3 mm3;
	
	ModelAndView mav;
	
	@RequestMapping("/getTime")
	public String getTime(Member mb, HttpSession session) {
		String json;
		//mb.setC_code(session.getAttribute("c_code").toString());
		//mb.setBd_date(session.getAttribute("bd_date").toString());
		//mb.setEmp_code((Integer)session.getAttribute("emp_code"));
		json = emm.getTime(mb);
		return json;
	}
	
	@RequestMapping("/insertAd_inTime")
	public String insertAd_inTime(Member mb, HttpSession session) {
		//mb.setC_code(session.getAttribute("c_code").toString());
		//mb.setBd_date(session.getAttribute("bd_date").toString());
		//mb.setEmp_code((Integer)session.getAttribute("emp_code"));
		String json = emm.insertAd_inTime(mb);
		return json;
	}
	
	@RequestMapping("/insertAd_outTime")
	public String insertAd_outTime(Member mb, HttpSession session) {
		//mb.setC_code(session.getAttribute("c_code").toString());
		//mb.setBd_date(session.getAttribute("bd_date").toString());
		//mb.setEmp_code((Integer)session.getAttribute("emp_code"));
		String json = emm.insertAd_outTime(mb);
		return json;
	}
}