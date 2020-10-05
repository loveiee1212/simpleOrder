package com.team2.simpleOrder.controller.storeManagement;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team2.simpleOrder.service.storeManagement.TableMM;


@RestController
@RequestMapping("/rest")

public class TableRestController2 {
	@Autowired
	TableMM tm;

	@GetMapping("/getSeatList")
	public HashMap<String, String> getSeatList(HttpSession session) {
		return tm.getSeatList(session);
	}

}
