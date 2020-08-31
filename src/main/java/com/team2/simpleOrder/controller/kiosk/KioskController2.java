package com.team2.simpleOrder.controller.kiosk;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//KioskMovingController
@Controller
public class KioskController2 {
	private static final Logger logger = LoggerFactory.getLogger(KioskController2.class);
//	@Autowired
//	KioskMM1 km1;
//	
//	@Autowired
//	KioskMM2 km2;

	ModelAndView mav;

	@RequestMapping(value = "/kioskmenu", method = RequestMethod.GET)
	public String kioskMenu() {
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

	@RequestMapping(value = "/kioskreview", method = RequestMethod.GET)
	public String kioskReview() {
		logger.info("kioskReview.jsp으로 이동");
		return "kiosk/kioskReview";
	}

	@RequestMapping(value = "/kioskreviewwrite", method = RequestMethod.GET)
	public String kioskReviewWrite() {
		logger.info("kioskReviewWrite.jsp으로 이동");
		return "kiosk/kioskReviewWrite";
	}
}
