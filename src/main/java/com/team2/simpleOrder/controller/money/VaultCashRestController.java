package com.team2.simpleOrder.controller.money;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team2.simpleOrder.service.money.VaultCashMM;


@RestController
@RequestMapping("/rest")
public class VaultCashRestController {
	//Only Money Rest Controller Number1
	
	@Autowired
	VaultCashMM vm;
	
	@RequestMapping("/checkbd_date")
	public String checkBd_date(HttpSession session) throws Exception {
		
		return vm.checkBd_date(session);
	}
	
	@RequestMapping("/getstartvc")
	public String getStartVC(HttpSession session) {
		
		return vm.getStartVC(session);
	}
	
	@RequestMapping("/getendvc")
	public String getEndVC(HttpSession session) {
		
		return vm.getEndVC(session);
	}
	
	@RequestMapping("/insertstartvc")
	public String insertStartVC(HttpSession session ,@RequestBody List<Map<String,String>> jArr) throws Exception {
		
		return vm.insertStartVC(session,jArr);
	}
	
	@RequestMapping("/insertendvc")
	public String insertEndVC(HttpSession session, @RequestBody List<Map<String, String>> jArr) {
		
		return vm.insertEndVC(session,jArr);
	}
}
