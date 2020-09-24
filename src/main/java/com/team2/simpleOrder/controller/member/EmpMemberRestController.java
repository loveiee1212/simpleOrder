package com.team2.simpleOrder.controller.member;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.member.EmpMemberMM;
import com.team2.simpleOrder.dto.Member;
import com.team2.simpleOrder.service.member.CompanyMemberMM;
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
		
		return emm.getTime(mb,session);
	}

	@RequestMapping("/insertAd_inTime")
	public String insertAd_inTime(@RequestParam HashMap<String, String> mb, HttpSession session) {

		return emm.insertAd_inTime(mb,session);
	}

	@RequestMapping("/insertAd_outTime")
	public String insertAd_outTime(@RequestParam HashMap<String, String> mb, HttpSession session) {

		return emm.insertAd_outTime(mb,session);
	}

	@RequestMapping("/getemplist")
	public String getEmpList(@RequestParam HashMap<String, String> mb, HttpSession session) {

		return emm.getEmpList(mb,session);
	}
	
	@RequestMapping("/getempinfo")
	public String getEmpInfo(@RequestParam HashMap<String, String> mb, HttpSession session) {

		return emm.getEmpInfo(mb,session);
	}
	
	@RequestMapping("/getadtime")
	public String getAdTime (@RequestParam HashMap<String, String> mb, HttpSession session) {

		return emm.getAdTime(mb,session);
	}
	
	@PostMapping("/updateworktime")
	public String updateWorkTime (@RequestParam HashMap<String, String> mb, HttpSession session) {

		return emm.updateWorkTime(mb,session);
	}
	
	@GetMapping("/showworktime")
	public String showWorkTime(@RequestParam HashMap<String, String> mb, HttpSession session) {

		return emm.showWorkTime(mb,session);
	}
	
	@GetMapping("/showallworktime")
	public String showAllWorkTime(@RequestParam HashMap<String, String> mb, HttpSession session) {

		return emm.showAllWorkTime(mb,session);
	}
}