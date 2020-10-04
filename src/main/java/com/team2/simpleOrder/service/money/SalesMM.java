package com.team2.simpleOrder.service.money;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.team2.simpleOrder.dao.money.ISalesDao;

@Service
public class SalesMM {
	
	@Autowired
	private ISalesDao sDao;
	
	public String getMonthSales(HttpSession session, HashMap<String, String> sam) {
		sam.put("c_code", session.getAttribute("c_code").toString());
		
		List<HashMap<String, String>> slist = sDao.getMonthSales(sam);
		System.out.println(slist);
		return new Gson().toJson(slist);
	}
	
}
