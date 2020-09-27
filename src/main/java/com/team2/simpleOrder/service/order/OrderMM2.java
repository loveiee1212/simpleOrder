package com.team2.simpleOrder.service.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	public ModelAndView getsaoList(HttpSession session, String sc_code, String st_num, String oac_num) {
		ModelAndView mav = new ModelAndView();
		if (oac_num.equals("undefined")) {
			oac_num = null;
		}
		Order odr = new Order();
		odr.setSc_code(sc_code);
		odr.setSt_num(Integer.parseInt(st_num));
		odr.setOac_num(oac_num);
		odr.setC_code(session.getAttribute("c_code").toString());
		odr.setBd_date(session.getAttribute("bd_date").toString());
		List<Order> stList = oDao.getsaoList(odr);
		mav.addObject("list", makesaoList(stList, odr));
		mav.setViewName("seat/sellAndorder");
		return mav;
	}

	private String makesaoList(List<Order> stList, Order odr) {
		StringBuilder sb = new StringBuilder();
		sb.append("<input type='hidden' id='sc_code' value='" + odr.getSc_code() + "'/>");
		sb.append("<input type='hidden' id='st_num' value='" + odr.getSt_num() + "'/>");
		sb.append("<input type='hidden' id='oac_num' value='" + odr.getOac_num() + "'/>");
		if (stList.size() > 0) {
			sb.append("<table>");
			for (int i = 0; i < stList.size(); i++) {
				sb.append("<tr>");
				sb.append("<td><input type='hidden' name='pdcode' id='pdcode" + i + "' data-code='"
						+ stList.get(i).getPdc_code() + "' value='" + stList.get(i).getPd_code() + "'/>"
						+ "<input type='hidden' name='pddate' id='pddate" + i + "' data-code='"
						+ stList.get(i).getPdc_date() + "' value='" + stList.get(i).getPd_date() + "'/>"
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
		}
		return sb.toString();
	}

	@Transactional
	public String sendsaoList(HttpSession session, String sc_code, String oac_num, String st_num,
			ArrayList<String> pdc_code, ArrayList<String> pdc_date, ArrayList<String> pd_date,
			ArrayList<String> pd_code, ArrayList<String> oh_cnt, RedirectAttributes reat) {
		String c_code = session.getAttribute("c_code").toString();
		String bd_date = "2020-08-29 14:19:00";
		try {
			if (oac_num == "") {
				oac_num = oDao.getNewOacCode(c_code, bd_date);
				HashMap<String, String> hMap = new HashMap<String, String>();
				hMap.put("c_code", c_code);
				hMap.put("bd_date", bd_date);
				hMap.put("sc_code", sc_code);
				hMap.put("st_num", st_num);
				hMap.put("oac_num", oac_num);
				log.info(hMap);
				if (!oDao.createoacList(hMap)) {
					return "errorSellpage";
				}
			}

			for (int i = 0; i < pdc_code.size(); i++) {
				System.out.println(pd_code.get(i));
				HashMap<String, String> oacInfo = new HashMap<String, String>();
				// oacInfo.put("bd_date", session.getAttribute("bd_date").toString());
				oacInfo.put("c_code", c_code);
				oacInfo.put("bd_date", bd_date);
				oacInfo.put("pdc_code", pdc_code.get(i));
				oacInfo.put("pdc_date", pdc_date.get(i));
				oacInfo.put("pd_code", pd_code.get(i));
				oacInfo.put("pd_date", pd_date.get(i));
				oacInfo.put("oh_cnt", oh_cnt.get(i));
				oacInfo.put("oac_num", oac_num);
				if (!oDao.sendsaoList(oacInfo)) {
					return "errorSellpage";
				}
			}
			return "sellpage";
		} catch (Exception e) {
			System.out.println(e);
			return "errorSellpage";
		}
	}

//	@Transactional
//	public HashMap<String, String> sendsaoList(HttpSession session, String oac_num, List<String> pdc_code,
//			List<String> pd_code, List<String> oh_cnt) {
//		HashMap<String, String> hMap = new HashMap<String, String>();
//
//		// String c_code=session.getAttribute("c_code").toString();
//		// String bd_date =session.getAttribute("bd_date").toString();
//		Order odr = new Order();
//		String c_code = "123123123123";
//		String bd_date = "2020-08-29 14:19:00";
//		List<Order> oList = new ArrayList<Order>();
//		List<Order> sList = oDao.selectsaoList(c_code, oac_num, bd_date);
//		for (int i = 0; i < sList.size(); i++) {
//			for (int j = 0; j < pdc_code.size(); j++) {
//				if (sList.get(i).getPdc_code().equals(pdc_code.get(j))
//						&& sList.get(i).getPd_code().equals(pd_code.get(j))) {
//					odr.setC_code(c_code);
//					odr.setBd_date(bd_date);
//					odr.setOac_num(oac_num);
//					odr.setPdc_code(pdc_code.get(j));
//					odr.setPdc_date(sList.get(i).getPdc_date());
//					odr.setPd_code(pd_code.get(j));
//					odr.setPd_date(sList.get(i).getPd_date());
//					odr.setOh_cnt(Integer.parseInt(oh_cnt.get(j)));
//					oList.add(odr);
//				}
//			}
//
//			System.out.println("oList" + oList);
//			if (oList.size() != 0) {
//				boolean result = oDao.sendsaoList(oList);
//				boolean stkresult = oDao.updatestkList(oList);
//				System.out.println(result);
//				System.out.println(stkresult);
//				if (result && stkresult) {
//					hMap.put("result", "주문이 완료되었습니다.");
//					return hMap;
//				}
//			}
//		}
//
//		return hMap;
//	}

}
