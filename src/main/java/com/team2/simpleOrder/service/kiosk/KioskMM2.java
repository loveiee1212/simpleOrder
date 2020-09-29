package com.team2.simpleOrder.service.kiosk;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.kiosk.IKioskDao1;

@Service
public class KioskMM2 {
	ModelAndView mav;
	@Autowired
	private IKioskDao1 kDao1;

	public ModelAndView msgSave(HttpSession session, String text) {
		mav = new ModelAndView();
		String sc_name = kDao1.getSc_name(session.getAttribute("c_code").toString(),
				session.getAttribute("sc_code").toString());
		System.out.println(session.getAttribute("c_code").toString());
		System.out.println(session.getAttribute("sc_code").toString());
		System.out.println(sc_name);
		System.out.println(session.getAttribute("st_num").toString());
		System.out.println(text);
		mav.addObject("sc_name", sc_name);
		mav.addObject("st_num", session.getAttribute("st_num").toString());
		mav.addObject("text", text);
		mav.setViewName("kiosk/request");

		return mav;
	}

}
