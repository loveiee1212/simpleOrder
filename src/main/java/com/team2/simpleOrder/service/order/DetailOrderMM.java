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

import com.team2.simpleOrder.dao.order.IOrderDao;
import com.team2.simpleOrder.dao.order.IDetailOrderDao;
import com.team2.simpleOrder.dao.order.IOrderDao3;
import com.team2.simpleOrder.dao.storeManagement.IProductDao;
import com.team2.simpleOrder.dto.Order;
import com.team2.simpleOrder.dto.SellProduct;
import com.team2.simpleOrder.dto.StoreManagement;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class DetailOrderMM {

	@Autowired
	private IDetailOrderDao oDao;

	@Autowired
	private IProductDao pDao;

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
						+ "'/><input type='Number' name ='pdcnt' id='pdcnt" + i + "' onchange='totalprice()' value='"
						+ stList.get(i).getOh_cnt() + "'/></td>");
				sb.append("<td><button>취소</button></td>");
				sb.append("</tr>");

			}
			sb.append("</table>");
		}
		return sb.toString();
	}

	@Transactional
	public String sendsaoList(HttpSession session, String sc_code, String oac_num, String st_num,
			ArrayList<String> pdc_code, ArrayList<String> pd_date,
			ArrayList<String> pd_code, ArrayList<String> oh_cnt, RedirectAttributes reat) {
		String c_code = session.getAttribute("c_code").toString();
		String bd_date = session.getAttribute("bd_date").toString();
		System.out.println(oac_num);
		System.out.println(oac_num.equals("null"));
		try {
			if (oac_num.equals("null")) {
				oac_num = oDao.getNewOacCode(c_code, bd_date);
				log.info("oac_num 찾기 :"+oac_num);
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
				oacInfo.put("pd_code", pd_code.get(i));
				oacInfo.put("pd_date", pd_date.get(i));
				oacInfo.put("oh_cnt", oh_cnt.get(i));
				oacInfo.put("oac_num", oac_num);
				System.out.println("oac_info:"+oacInfo);
				if (!oDao.sendsaoList(oacInfo)) {
					return "errorSellpage";
				}else {
					oDao.updatestkList(oacInfo);
				}
			}
			return "sellpage";
		} catch (Exception e) {
			System.out.println(e);
			return "errorSellpage";
		}
	}

	
	
	public HashMap<String, Object> getsellkeyList(HttpSession session) {
		
		List<HashMap<String, Object>> skcList = oDao.getsellkeyCtgList(session.getAttribute("c_code").toString());
		List<HashMap<String, Object>> skList = oDao.getSellKeyList(session.getAttribute("c_code").toString());
		HashMap<String,Object> hMap = new HashMap<String, Object>();
		hMap.put("ctgList", makeHtmlskcList(skcList));
		hMap.put("divList" ,makeHtmlskList(skcList));
		hMap.put("sellkeyList" ,skList);
		return hMap;
	}

	private String makeHtmlskList(List<HashMap<String, Object>> skcList) {
		StringBuilder sb = new StringBuilder();
		for(int i=0;i<skcList.size();i++) {
			System.out.println(skcList.get(i));
			sb.append("<div id='table" + i + "' class='tList'>");
			sb.append("<table>");
			int x = Integer.parseInt(skcList.get(i).get("SKC_X").toString());
			int y = Integer.parseInt(skcList.get(i).get("SKC_Y").toString());
			for (int a = 0; a < x * y; a += x) {
				sb.append("<tr>");
				for (int b = a; b < a + x; b++) {
					sb.append("<td class='protd'>");
						sb.append("<div class='tables' id='tnum" + Integer.parseInt(skcList.get(i).get("SKC_CODE").toString()) + (b + 1) + "' data-code="
								+  Integer.parseInt(skcList.get(i).get("SKC_CODE").toString()) + "-" + (b + 1) + " style = 'visibility: hidden;'>" + (b + 1) + "</div>");
					sb.append("</td>");
				}
				sb.append("</tr>");
			}
			sb.append("</table>");
			sb.append("</div>");
		}
		return sb.toString();
	}

	//카테고리 리스트 만들기
	private String makeHtmlskcList(List<HashMap<String, Object>> skcList) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < skcList.size(); i++) {
			sb.append("<button class='category' id='ctg" + (i + 1) + "'onclick='opentable(event,\"table" + i + "\")'>"
					+ skcList.get(i).get("SKC_NAME") + "</button>");
		}
		return sb.toString();
	}


	public ModelAndView reSell(HttpSession session, String bd_date, String oac_num, int oac_status) {
		// TODO Auto-generated method stub
		return null;
	}

	


}
