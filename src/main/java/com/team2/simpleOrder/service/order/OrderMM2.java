package com.team2.simpleOrder.service.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.order.IOrderDao1;
import com.team2.simpleOrder.dao.order.IOrderDao2;
import com.team2.simpleOrder.dao.order.IOrderDao3;
import com.team2.simpleOrder.dto.Order;
import com.team2.simpleOrder.dto.StoreManagement;

import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class OrderMM2 {
	
	@Autowired
	private IOrderDao2 oDao;
	
	@Autowired
	private IOrderDao3 oDao3;
	
	ModelAndView mav;

	public ModelAndView getsaoList(Order odr) {
		ModelAndView mav = new ModelAndView();
		StoreManagement stmm = new StoreManagement();
		List<Order> stList = oDao.getsaoList(odr);
		log.info(stList);
		System.out.println(odr);
		mav.addObject("list", makesaoList(stList,odr));
		mav.setViewName("seat/sellAndorder");
		return mav;
	}

	private String makesaoList(List<Order> stList, Order odr) {
		StringBuilder sb = new StringBuilder();
		sb.append("<form action='sendsaoinfo' method='post'>");
		sb.append("<table>");
		for (int i =0; i<stList.size(); i++) {
			sb.append("<tr>");
			sb.append("<input type='hidden' value='"+odr.getOac_num()+"'/>");
			sb.append("<td>"+stList.get(i).getPd_name()+"</td>");
			sb.append("<td><p class ='price'>"+(stList.get(i).getPd_price()*stList.get(i).getOh_cnt())+"</p></td>");
			sb.append("<td><input type='Number' value='"+stList.get(i).getOh_cnt()+"'/></td>");
			sb.append("<td><button>취소</button></td>");
		}
		sb.append("</table>");
		sb.append("</form>");
		return sb.toString();
	}
	
}
