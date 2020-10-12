package com.team2.simpleOrder.service.money;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
	public String getMonthDetail(HttpSession session, HashMap<String, String> smap) throws Exception {
		try {
			smap.put("c_code", session.getAttribute("c_code").toString());
			
			HashMap<String,List<HashMap<String,String>>> sNpMap = new HashMap<>();
			sNpMap.put("salesList", sDao.getMonthDetail(smap));
			sNpMap.put("totalSales",sDao.getMonthDetailTotalSales(smap));
			sNpMap.put("productList",sDao.getMonthDetailProduct(smap));
			sNpMap.put("refundList",sDao.getMonthDetailRefundProduct(smap));
			return new Gson().toJson(sNpMap);
		}
		catch(Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.out.println(e);
			return new Gson().toJson("noSales");
		}
	}

	@Transactional
	public String getDaySales(HttpSession session, HashMap<String, String> smap) throws Exception{
		try {
		smap.put("c_code", session.getAttribute("c_code").toString());
		if(smap.get("bd_date")=="") {
			String bd_date= session.getAttribute("bd_date").toString().substring(0,10);
			smap.put("bd_date",bd_date);
		}
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

	public String getCashSales(HttpSession session) {
		HashMap <String,String> smap = new HashMap<String, String>();
		smap.put("c_code", session.getAttribute("c_code").toString());
		smap.put("bd_date", session.getAttribute("bd_date").toString());
		return new Gson().toJson(sDao.getCashSales(smap));
	}

	public String getMonthEmailSales(HttpSession session, HashMap<String, String> smap) {
		smap.put("c_email", session.getAttribute("ce_email").toString());
		
		List<HashMap<String,String>> slist = sDao.getMonthEmailSales(smap);
		return new Gson().toJson(slist);
	}

	@Transactional
	public String getMonthEmailDetail(HttpSession session, HashMap<String, String> smap) throws Exception{
		try {
			smap.put("c_email", session.getAttribute("ce_email").toString());
			
			HashMap<String,List<HashMap<String,String>>> sNpMap = new HashMap<>();
			sNpMap.put("salesList", sDao.getMonthEmailDetail(smap));
			sNpMap.put("totalSales",sDao.getMonthEmailDetailTotalSales(smap));
			sNpMap.put("productList",sDao.getMonthEmailDetailProduct(smap));
			sNpMap.put("refundList",sDao.getMonthEmailDetailRefundProduct(smap));
			return new Gson().toJson(sNpMap);
		}
		catch(Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.out.println(e);
			return new Gson().toJson("noSales");
		}
	}

	@Transactional
	public String getDayEmailSales(HttpSession session, HashMap<String, String> smap) throws Exception {
		try {
			smap.put("c_email", session.getAttribute("ce_email").toString());
			if(smap.get("bd_date")=="") {
				String bd_date= session.getAttribute("bd_date").toString().substring(0,10);
				smap.put("bd_date",bd_date);
			}
			HashMap<String,List<HashMap<String,String>>> sNpMap = new HashMap<>();
			sNpMap.put("salesList", sDao.getDayEmailSales(smap));
			sNpMap.put("totalSales",sDao.getDayEmailTotalSales(smap));
			sNpMap.put("productList",sDao.getDayEmailProduct(smap));
			sNpMap.put("refundList",sDao.getDayEmailRefundProduct(smap));
			return new Gson().toJson(sNpMap);
			}
			catch(Exception e) {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				System.out.println(e);
				return new Gson().toJson("noSales");
			}
	}

	
}
