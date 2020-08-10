package com.team2.simpleOrder;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dto.Member;
import com.team2.simpleOrder.service.MemberMM;


@Controller
public class HomeController {
	
	@Autowired
	private MemberMM mm;
	
	ModelAndView mav;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	@RequestMapping(value="/insertMember")
	public ModelAndView insertMember(Member mb) {
		ModelAndView mav = mm.insertMember(mb);
		
		return mav;
		
	}
	
}
