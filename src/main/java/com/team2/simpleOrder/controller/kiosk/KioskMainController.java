package com.team2.simpleOrder.controller.kiosk;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dto.Review;
import com.team2.simpleOrder.service.kiosk.KioskMM2;

@Controller
public class KioskMainController {
	@Autowired
	private KioskMM2 km;

	@PostMapping(value = "/insertreview")
	public ModelAndView insertreview(@RequestParam ArrayList<MultipartFile> rv_file, @RequestParam String oac_num,
			HttpSession session, Review rv) {
		rv.setOac_num(oac_num);
		return km.insertReview(rv_file, rv, session);
	}

	@PostMapping(value = "/requestcall")
	public ModelAndView requestCall(HttpSession session, @RequestParam HashMap<String, String> requestInfo,
			ModelAndView mav) {
		return km.msgSave(session, requestInfo);
	}
}
