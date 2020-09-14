package com.team2.simpleOrder.controller;




import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController1 {

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home() {
		
		return "main";
	}
	
	@RequestMapping("/schedule")
	public String schedule() {
		return "member/schedule";
	}
	@RequestMapping("/changeWorkTime")
	public String changeWorkTime() {
		return "member/changeWorkTime";
	}
	@RequestMapping("/joinEmailFrm")
	public String joinEmailFrm() {
		return "member/joinEmailFrm";
	}
	@RequestMapping("/cList")
	public String cList(){
		return "member/cList";
	}
	@RequestMapping("/mainskill")
	public String mainskill(){
		return "mainskill";
	}
	@RequestMapping("/productinfo")
	public String productinfo() {
		return "productinfo";
	}
	
}
