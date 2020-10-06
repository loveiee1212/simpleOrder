package com.team2.simpleOrder.service.money;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.google.gson.Gson;
import com.team2.simpleOrder.dao.money.ISalesDao;

@Service
public class SalesMM {
	
	@Autowired
	private ISalesDao sDao;
	
	public String getMonthSales(HttpSession session, HashMap<String, String> smap) {
		smap.put("c_code", session.getAttribute("c_code").toString());
		
		List<HashMap<String, String>> slist = sDao.getMonthSales(smap);
		return new Gson().toJson(slist);
	}

	@Transactional
	public String getDaySales(HttpSession session, HashMap<String, String> smap) throws Exception{
		try {
		smap.put("c_code", session.getAttribute("c_code").toString());
		
		HashMap<String,List<HashMap<String,String>>> sNpMap = new HashMap<>();
		sNpMap.put("salesList", sDao.getDaySales(smap));
		sNpMap.put("totalSales",sDao.getDayTotalSales(smap));
		sNpMap.put("productList",sDao.getDayProduct(smap));
		sNpMap.put("refundList",sDao.getDayRefundProduct(smap));
		return new Gson().toJson(sNpMap);
		}
		catch(Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.out.println(e);
			return new Gson().toJson("noSales");
		}
	}
	
}
