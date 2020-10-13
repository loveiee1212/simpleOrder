package com.team2.simpleOrder.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class PageController4 {
	private static final Logger logger = LoggerFactory.getLogger(PageController4.class);

	ModelAndView mav;

	@RequestMapping(value = "/kioskmenu", method = RequestMethod.GET)
	public String kioskMenu(HttpSession session) {
		logger.info("kioskMenu.jsp으로 이동");
		return "kiosk/kioskMenu";
	}

	@RequestMapping(value = "/kioskorder", method = RequestMethod.GET)
	public String kioskOrder() {
		logger.info("kioskOrder.jsp으로 이동");
		return "kiosk/kioskOrder";
	}

	@RequestMapping(value = "/kioskrequest", method = RequestMethod.GET)
	public String kioskRequest() {
		logger.info("kioskRequest.jsp으로 이동");
		return "kiosk/kioskRequest";
	}

	@RequestMapping(value = "/kioskreview/{oac_num}", method = RequestMethod.GET)
	public String kioskReview_path(@PathVariable("oac_num") String oac_num, RedirectAttributes reat) {
		reat.addFlashAttribute("oac_num", oac_num);
		reat.addFlashAttribute("creditOk" , oac_num);
		return "redirect:/kioskreview";
	}
	@RequestMapping("/kioskreview")
	public String KioskReview() {
		return "kiosk/kioskReview";
	}

	@RequestMapping(value = "/kioskreviewwrite", method = RequestMethod.GET)
	public String kioskReviewWrite() {
		logger.info("kioskReviewWrite.jsp으로 이동");
		return "kiosk/kioskReviewWrite";
	}
	@RequestMapping("/kioskThanks")
	public String kioskThankyou(HttpSession session) {
		session.removeAttribute("oac_num");
		return "kiosk/kioskThanks";
	}
}
