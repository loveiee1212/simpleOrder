package com.team2.simpleOrder.controller.kiosk;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.service.kiosk.KioskLoginMM;

@Controller
public class KioskLoginController {

	@Autowired
	KioskLoginMM km;

	@GetMapping("kioskLogin/{c_code}/{sc_code}/{st_num}")
	public String kioskLogin(@PathVariable String c_code, @PathVariable String sc_code, @PathVariable String st_num,
			HttpSession session, RedirectAttributes reat) {
		return km.kioskLogin(c_code, sc_code, st_num, session, reat);
	}

}
