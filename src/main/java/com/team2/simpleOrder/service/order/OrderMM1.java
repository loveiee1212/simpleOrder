package com.team2.simpleOrder.service.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.order.IOrderDao1;
import com.team2.simpleOrder.dao.order.IOrderDao2;
import com.team2.simpleOrder.dao.order.IOrderDao3;
import com.team2.simpleOrder.dto.Order;

@Service
public class OrderMM1 {
	
	@Autowired
	private IOrderDao1 oDao;
	
	@Autowired
	private IOrderDao2 oDao2;
	
	@Autowired
	private IOrderDao3 oDao3;
	
	ModelAndView mav;

	public List<Order> getTablelist() {
		String c_code = "123-123-123";
		c_code.replaceAll("-", "");
		//Seat st =oDao.getTablelist(c_code);
		List<Order> sList = new ArrayList<>();
		Order st = new Order();
		HashMap<String,Integer> hMap = new HashMap<String, Integer>();
		List<String> tList = new ArrayList<String>();
		st.setCategory("<button class='tablinks' onclick='opentable(event, 'sival')' id='defaultOpen'>실내</button>");
		hMap.put("x", 4);
		hMap.put("y", 3);
		st.setTSize(hMap);
		tList.add("1");
		tList.add("3");
		tList.add("4");
		tList.add("7");
		tList.add("8");
		tList.add("12");
		st.setTnumList(tList);
		sList.add(st);
		
		st.setCategory("<button class='tablinks' onclick='opentable(event, 'sivaaaaal')' id='defaultOpen'>야외</button>");
		hMap.put("x", 3);
		hMap.put("y", 4);
		st.setTSize(hMap);
		tList.add("2");
		tList.add("3");
		tList.add("4");
		tList.add("5");
		tList.add("8");
		tList.add("11");
		st.setTnumList(tList);
		sList.add(st);
		
		
		return sList;
	}
	
}
