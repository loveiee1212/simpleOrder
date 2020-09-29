package com.team2.simpleOrder.controller.money;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("/insertvc")
	public String insertStartVC(HttpSession session ,@RequestBody List<Map<String,String>> jArr) throws Exception {
		
		return vm.insertVC(session,jArr);
	}
	
	@RequestMapping("/insertchangevc")
	public String insertChangeVC(HttpSession session, @RequestBody List<Map<String,String>> jArr) {
		
		return vm.insertChangeVC(session,jArr);
	}
	
	@RequestMapping("/getstartvc")
	public String getStartVC(HttpSession session) {
		
		return vm.getStartVC(session);
	}
	
	@RequestMapping("/getendvc")
	public String getEndVC(HttpSession session) {
		
		return vm.getEndVC(session);
	}
	
	@RequestMapping("/getmonthvc")
	public String getMonthVC(HttpSession session, @RequestParam HashMap<String,String> vcm) {
		
		return vm.getMonthVC(session,vcm);
	}
	
	@RequestMapping("/getdayvclog")
	public String getDayVCLog(HttpSession session, @RequestParam HashMap<String,String> vcm) {
		
		return vm.getDayVCLog(session,vcm);
	}
}
