package com.team2.simpleOrder.controller.order;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.service.order.OrderMM2;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/rest")
@Log4j
public class OrderRestController2 {
	@Autowired
	OrderMM2 om;
	
	@PostMapping("/sendsaolist")
	public String sendsaolist(String oac_num,String sc_code,String st_num, HttpSession session,
			@RequestParam(value = "pdc_code[]") ArrayList<String> pdc_code,
			@RequestParam(value = "pd_date[]") ArrayList<String> pd_date,
			@RequestParam(value = "pd_code[]") ArrayList<String> pd_code,
			@RequestParam(value = "oh_cnt[]") ArrayList<String> oh_cnt, RedirectAttributes reat) {
		return om.sendsaoList(session,sc_code, oac_num,st_num,pdc_code, pd_date, pd_code, oh_cnt, reat);
	}
	
	@PostMapping("/getsellkeylist")
	public HashMap<String, Object> getsellkeyList(HttpSession session) {
		return om.getsellkeyList(session);
	}

}
