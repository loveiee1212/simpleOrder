package com.team2.simpleOrder.controller.money;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team2.simpleOrder.service.money.VaultCashMM;
import com.google.gson.Gson;


@RestController
@RequestMapping("/rest")
public class VaultCashRestController {
	//Only Money Rest Controller Number1
	
	@Autowired
	VaultCashMM vm;
	
	@RequestMapping("/getsatrtvc")
	public String getStartVC(HttpSession session) {
		
		return vm.getStartVC(session);
	}
	
	@RequestMapping("/insertstartvc")
	public String insertStartVC(HttpSession session ,@RequestBody List<Map<String,String>> jArr) throws Exception {
		
		return vm.insertStartVC(session,jArr);
	}
}
