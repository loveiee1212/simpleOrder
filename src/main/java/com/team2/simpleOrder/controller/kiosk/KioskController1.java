package com.team2.simpleOrder.controller.kiosk;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.service.kiosk.KioskMM2;

@Controller
public class KioskController1 {
	@Autowired
	private KioskMM2 km2;

	@PostMapping(value = "/requestcall")
	public ModelAndView requestCall(HttpSession session, @RequestParam(value = "text") String text, ModelAndView mav) {
//		String sc_code = session.getAttribute("sc_code").toString();
//		String st_num = session.getAttribute("st_num").toString();
		String sc_code = "03";
		String st_num = "1";
		return km2.msgSave(sc_code, st_num, text);
	}
}
