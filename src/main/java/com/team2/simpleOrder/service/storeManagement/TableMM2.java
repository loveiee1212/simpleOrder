package com.team2.simpleOrder.service.storeManagement;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.posManagement.ITableDao2;

@Service
public class TableMM2 {
	

	
	@Autowired
	private ITableDao2 tDao;
	
	
	ModelAndView mav;

	public HashMap<String, String> getSeatList(HttpSession session) {
		TableHtmlMaker thm = new TableHtmlMaker();
		ArrayList<HashMap<String, Object>> seatCategoriList = tDao.getSeatCategoriList(session.getAttribute("c_code").toString());
		for (HashMap<String, Object> seatCategori : seatCategoriList) {
			seatCategori.put("sc_codeInfo", tDao.getSeatInfoList(seatCategori));
		}
		thm.getSeatList(seatCategoriList);
		
		
		
		
		return null;
	}
	
}
