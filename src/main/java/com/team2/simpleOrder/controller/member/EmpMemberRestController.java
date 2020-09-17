package com.team2.simpleOrder.controller.member;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.member.EmpMemberMM;
import com.team2.simpleOrder.dto.Member;
import com.team2.simpleOrder.service.member.CompanyMemberMM1;
import com.team2.simpleOrder.service.member.MemberMM3;

@RestController
@RequestMapping("/rest")
public class EmpMemberRestController {
	// Only Member Rest Controller Number2

	@Autowired
	EmpMemberMM emm;

	@Autowired
	MemberMM3 mm3;

	ModelAndView mav;

	@RequestMapping("/getTime")
	public String getTime(@RequestParam HashMap<String, String> mb, HttpSession session) {
		//mb.put("c_code",session.getAttribute("c_code").toString());
		//mb.put("bd_date",session.getAttribute("bd_date").toString());
		//mb.put("emp_code",session.getAttribute("emp_code").toString());
		String json = emm.getTime(mb);
		return json;
	}

	@RequestMapping("/insertAd_inTime")
	public String insertAd_inTime(@RequestParam HashMap<String, String> mb, HttpSession session) {
		// mb.put("c_code",session.getAttribute("c_code").toString());
		// mb.put("bd_date",session.getAttribute("bd_date").toString());
		// mb.put("emp_code",session.getAttribute("emp_code").toString());
		String json = emm.insertAd_inTime(mb);
		return json;
	}

	@RequestMapping("/insertAd_outTime")
	public String insertAd_outTime(@RequestParam HashMap<String, String> mb, HttpSession session) {
		// mb.put("c_code",session.getAttribute("c_code").toString());
		// mb.put("bd_date",session.getAttribute("bd_date").toString());
		// mb.put("emp_code",session.getAttribute("emp_code").toString());
		String json = emm.insertAd_outTime(mb);
		return json;
	}

	@RequestMapping("/getemplist")
	public String getEmpList(@RequestParam HashMap<String, String> mb, HttpSession session) {
		// mb.put("c_code",session.getAttribute("c_code").toString());
		String json = emm.getEmpList(mb);
		return json;
	}
	
	@RequestMapping("/getempinfo")
	public String getEmpInfo(@RequestParam HashMap<String, String> mb, HttpSession session) {
		// mb.put("c_code",session.getAttribute("c_code").toString());
		String json = emm.getEmpInfo(mb);
		return json;
	}
	
	@RequestMapping("/getadtime")
	public String getAdTime (@RequestParam HashMap<String, String> mb, HttpSession session) {
		// mb.put("c_code",session.getAttribute("c_code").toString());
		String json = emm.getAdTime(mb);
		return json;
	}
	
	@PostMapping("/updateworktime")
	public String updateWorkTime (@RequestParam HashMap<String, String> mb, HttpSession session) {
		// mb.put("c_code",session.getAttribute("c_code").toString());
		String json = emm.updateWorkTime(mb);
		return json;
	}
}