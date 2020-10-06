package com.team2.simpleOrder.controller.storeManagement;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.service.storeManagement.TableMM;


@Controller
public class TableController2 {
	@Autowired
	TableMM tm;
	
	@PostMapping("/updateSeatXYInfo")
	public String updateSeatXYInfo(@RequestParam HashMap<String, String> xyInfo, HttpSession session, RedirectAttributes reat){
		return tm.updateSeatXYInfo(xyInfo,session,reat);
	}
	@PostMapping("/updateSeatList")
	public String updateSeatList(@RequestParam HashMap<String, String>seatlist , HttpSession session, RedirectAttributes reat) {
		return tm.updateSeatList(seatlist,session,reat);
	}
	@PostMapping("/deleteSeatCT")
	public String deleteSeatCT(@RequestParam HashMap<String, String>seatCTInfo, HttpSession session, RedirectAttributes reat) {
		return tm.deleteSeatCT(seatCTInfo,session, reat);
	}
	@PostMapping("/updateSeatCT")
	public String updateSeatCT(@RequestParam HashMap<String, String>seatCTInfo, HttpSession session, RedirectAttributes reat) {
		return tm.updateSeatCT(seatCTInfo,session,reat);
	}
	@PostMapping("/createSeatCT")
	public String createSeatCT(@RequestParam HashMap<String, String>seatCTInfo, HttpSession session, RedirectAttributes reat) {
		return tm.createSeatCT(seatCTInfo,session,reat);
	}
	

}
