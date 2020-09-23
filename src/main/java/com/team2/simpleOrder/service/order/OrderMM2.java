package com.team2.simpleOrder.service.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
		mav.addObject("list", makesaoList(stList, odr));
		mav.setViewName("seat/sellAndorder");
		return mav;
	}

	private String makesaoList(List<Order> stList, Order odr) {
		StringBuilder sb = new StringBuilder();
		sb.append("<form action='#' method='post'>");
		sb.append("<table>");
		sb.append("<input type='hidden' id='oac_num' value='" + odr.getOac_num() + "'/>");
		for (int i = 0; i < stList.size(); i++) {
				sb.append("<tr>");
				sb.append("<td><input type='hidden' name='pdcode' id='pdcode" + i + "' data-code='"
						+ stList.get(i).getPdc_code() + "' value='" + stList.get(i).getPd_code() + "'/>"
						+ stList.get(i).getPd_name() + "</td>");
				sb.append("<td><p class ='price' id='totalprice" + i + "'></p>");
				sb.append("<input type='hidden' id='hiddenprice" + i + "' value='" + stList.get(i).getPd_price()
						+ "'/></td>");
				sb.append("<td><input type='hidden' id='hiddencnt" + i + "' value='" + stList.get(i).getOh_cnt()
						+ "'/><input type='Number' name ='pdcnt' id='pdcnt" + i + "' value='"
						+ stList.get(i).getOh_cnt() + "'/></td>");
				sb.append("<td><button>취소</button></td>");

		}
		sb.append("</table>");
		sb.append("</form>");
		return sb.toString();
	}

	@Transactional
	public HashMap<String, String> sendsaoList(HttpSession session, String oac_num, List<String> pdc_code,
			List<String> pd_code, List<String> oh_cnt) {
		// String c_code=session.getAttribute("c_code").toString();
		// String bd_date =session.getAttribute("bd_date").toString();
		Order odr = new Order();
		String c_code = "123123123123";
		String bd_date = "2020-08-29 14:19:00";
		List<Order> oList = new ArrayList<Order>();
		for (int i = 0; i < pdc_code.size(); i++) {
			odr.setC_code("123123123123");
			odr.setBd_date("2020-08-29 14:19:00");
			odr.setOac_num(oac_num);
			odr.setPdc_code(pdc_code.get(i));
			odr.setPd_code(pd_code.get(i));
			odr.setOh_cnt(Integer.parseInt(oh_cnt.get(i)));
			oList.add(odr);
		}
		System.out.println(oList);
		HashMap<String, String> hMap =new HashMap<String, String>(); 
		if(pdc_code.size()<=0) {
			hMap.put("result", "추가한 주문이 없습니다.");
			return hMap;
		}else {
			boolean result = false;
			for(int i = 0; i<oList.size(); i++) {
				Order order = new Order();
				order = oList.get(i);
				result=oDao.sendsaoList(order);
				if(result==false) {
					hMap.put("result", "완료되지 않았습니다.");
					return hMap;
				}
			}
			boolean stkresult = oDao.updatestkList(oList);
			if(result&&stkresult) {
				hMap.put("result", "주문이 완료되었습니다.");
			}
		}
		return hMap;
	}

}
