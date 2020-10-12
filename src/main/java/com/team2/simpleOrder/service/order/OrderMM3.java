package com.team2.simpleOrder.service.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

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
		Iterator<String> it = oac_num.keySet().iterator();
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("c_code", session.getAttribute("c_code").toString());
		List<String> oac_list = new ArrayList<>();
		while(it.hasNext()) {
			oac_list.add(it.next());
		}
		hm.put("oac_list", oac_list);
		System.out.println(oDao.gropPayMent(hm));
		return null;
	}
	
}
