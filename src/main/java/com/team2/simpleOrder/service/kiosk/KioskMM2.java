package com.team2.simpleOrder.service.kiosk;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class KioskMM2 {
	ModelAndView mav;

	public ModelAndView msgSave(String sc_code, String st_num, String text) {
		mav = new ModelAndView();
		mav.addObject("sc_code", sc_code);
		mav.addObject("st_num", st_num);
		mav.addObject("text", text);
		mav.setViewName("kiosk/request");
		return mav;
	}

}
