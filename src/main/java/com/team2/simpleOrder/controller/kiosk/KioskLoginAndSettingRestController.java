package com.team2.simpleOrder.controller.kiosk;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team2.simpleOrder.service.kiosk.KioskLoginAndSettingMM;


@RestController
@RequestMapping("/rest")
public class KioskLoginAndSettingRestController {
	
	
	@Autowired
	KioskLoginAndSettingMM km;
	
	@GetMapping("/getQrCodeList")
	public HashMap<String, String> getQrCodeList(HttpSession session) {
		return km.getQrCodeList((String) session.getAttribute("c_code"));
	}
	@GetMapping("/getRequsetList")
	public HashMap<String, String> getRequsetList(HttpSession session){
		return km.getRequsetList(session.getAttribute("c_code").toString());
	}

}