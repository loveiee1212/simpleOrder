package com.team2.simpleOrder.controller.money;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team2.simpleOrder.service.money.BillMM;

@RestController
@RequestMapping("/rest")
public class BillRestController {

	@Autowired
	BillMM bm;

	@PostMapping("/getdetailbill")
	public HashMap<String, String> getdetailbill(HttpSession session, String bd_date, String oac_num, int oac_status){
		return bm.getDetailBill(session, bd_date, oac_num, oac_status);
	}
}
