package com.team2.simpleOrder.service.order;

import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.order.IOrderDao3;

@Service
public class OrderMM3 {
	
	@Autowired
	private IOrderDao3 oDao;
	
	ModelAndView mav;

	public String gropPayMent(HashMap<String, String> oac_num, HttpSession session) {
		HashMap<String, Object> gropPayMent = new HashMap<String, Object>();
		Iterator<String> it = oac_num.keySet().iterator();
		while(oac_num.keySet().iterator().hasNext()) {
			HashMap<String, String> hm = new HashMap<String, String>();
			hm.put("oac_num", it.next());
			hm.put("c_code", session.getAttribute("c_code").toString());
//			oDao.gropPayMent(hm);
		}
		return null;
	}
	
}
