package com.team2.simpleOrder.controller.kiosk;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.service.kiosk.KioskLoginAndSettingMM;

@Controller
public class KioskLoginAndSettingController {

	@Autowired
	KioskLoginAndSettingMM km;

	@GetMapping("kioskLogin/{c_code}/{sc_code}/{st_num}") //qr 코드 인식시 사업자 코드, 
	public String kioskLogin(@PathVariable String c_code, @PathVariable String sc_code, @PathVariable String st_num,
			HttpSession session, RedirectAttributes reat) {
		return km.kioskLogin(c_code, sc_code, st_num, session, reat);
	}
	@PostMapping("accessSecurityCode")
	public String accessSecurityCode(@RequestParam HashMap<String, String> securityCode, HttpSession session, RedirectAttributes reat ) {
		return km.accessSecurityCode(securityCode, session, reat);
	}
	@PostMapping("/updateRequestList")
	public String updateRequestList(@RequestParam HashMap<String, String>reqList, HttpSession session, RedirectAttributes reat) {
		return km.updateRequestList(reqList,session, reat);
	}
	
}
