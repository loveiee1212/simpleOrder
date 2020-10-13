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
	
	@Autowired
	private IOrderDao oDao2;

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
				if(stList.get(i).getStk_stock()!=0) {					
					sb.append("<td><input type='hidden' id='hiddencnt" + i + "' value='" + stList.get(i).getOh_cnt()
							+ "'/><input type='Number' name ='pdcnt' min='0' max='"+(stList.get(i).getOh_cnt()+stList.get(i).getStk_stock())+"' id='pdcnt" + i + "' onchange='totalprice()' value='"
							+ stList.get(i).getOh_cnt() + "'/></td>");
				}else {					
					sb.append("<td><input type='hidden' id='hiddencnt" + i + "' value='" + stList.get(i).getOh_cnt()
							+ "'/><input type='Number' name ='pdcnt' min='0' id='pdcnt" + i + "' onchange='totalprice()' value='"
							+ stList.get(i).getOh_cnt() + "'/></td>");
				}
				sb.append("<td><input type='button' id='cancelbutton"+i+"' class='cancelbutton_for_oac' onclick='cancelorder("+i+")' value='취소'/></td>");
				sb.append("</tr>");

			}
			sb.append("</table>");
		}
		return sb.toString();
	}

	@Transactional
	public HashMap<String, String> sendsaoList(HttpSession session, String sc_code, String oac_num, String st_num,
			ArrayList<String> pdc_code, ArrayList<String> pd_date,
			ArrayList<String> pd_code, ArrayList<String> oh_cnt, RedirectAttributes reat) {
		HashMap<String, String> resultMap = new HashMap<String, String>();
		String c_code = session.getAttribute("c_code").toString();
		String bd_date = session.getAttribute("bd_date").toString();
		try {
			if (oac_num.equals("null")) {
				System.out.println("oac_num이 null일 경우 출력");
				oac_num = oDao.getNewOacCode(c_code, bd_date);
				System.out.println("Dao작업 후 oac_num:"+oac_num);
				HashMap<String, String> hMap = new HashMap<String, String>();
				hMap.put("c_code", c_code);
				hMap.put("bd_date", bd_date);
				hMap.put("sc_code", sc_code);
				hMap.put("st_num", st_num);
				hMap.put("oac_num", oac_num);
				if (!oDao.createoacList(hMap)) {
					resultMap.put("result", "errorSellpage");
					return resultMap;
				}
			}

			for (int i = 0; i < pdc_code.size(); i++) {
				HashMap<String, String> oacInfo = new HashMap<String, String>();
				oacInfo.put("c_code", c_code);
				oacInfo.put("bd_date", bd_date);
				oacInfo.put("pdc_code", pdc_code.get(i));
				oacInfo.put("pd_code", pd_code.get(i));
				oacInfo.put("pd_date", pd_date.get(i));
				oacInfo.put("oh_cnt", oh_cnt.get(i));
				oacInfo.put("oac_num", oac_num);
				System.out.println("oacInfo값:"+oacInfo);
				if (!oDao.sendsaoList(oacInfo)) {
					resultMap.put("result", "errorSellpage");
					return resultMap;
				}else {
					oDao.updatestkList(oacInfo);
				}
			}
			resultMap.put("oac_num",oac_num);
			resultMap.put("result", "./sellpage");
			return resultMap;
		} catch (Exception e) {
			resultMap.put("result", "errorSellpage");
			return resultMap;
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


//	public ModelAndView reSell(HttpSession session, String bd_date, String oac_num, int oac_status) {
//		ModelAndView mav = new ModelAndView();
//		HashMap<String, Object> selectMap = new HashMap<String, Object>();
//		selectMap.put("c_code",session.getAttribute("c_code"));
//		selectMap.put("bd_date",bd_date);
//		selectMap.put("oac_num",oac_num);
//		selectMap.put("oac_status",oac_status);
//		List<HashMap<String, Object>> pList = oDao.resell(selectMap);
//		mav.addObject("list", makeresellList(selectMap,pList));
//		mav.setViewName("seat/sellAndorder");
//		return mav;
//	}

	private Object makeresellList(HashMap<String, Object> selectMap, List<HashMap<String, Object>> pList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<input type='hidden' id='oac_num' value='" + null + "'/>");
		sb.append("<input type='hidden' id='before_num' value='" + selectMap.get("oac_num") + "'/>");
		sb.append("<input type='hidden' id='oac_status' value='" + selectMap.get("oac_status") + "'/>");
		if (pList.size() > 0) {
			sb.append("<table>");
			for (int i = 0; i < pList.size(); i++) {
				sb.append("<tr>");
				sb.append("<td><input type='hidden' name='pdcode' id='pdcode" + i + "' data-code='"
						+ pList.get(i).get("PDC_CODE") + "' value='" + pList.get(i).get("PD_CODE") + "'/>"
						+ "<input type='hidden' name='pddate' id='pddate" + i + "' data-code='"
						+ pList.get(i).get("PD_DATE") + "' value='" + pList.get(i).get("PD_DATE") + "'/>"
						+ pList.get(i).get("PD_NAME") + "</td>");
				sb.append("<td><p class ='price' id='totalprice" + i + "'></p>");
				sb.append("<input type='hidden' id='hiddenprice" + i + "' value='" + pList.get(i).get("PD_PRICE")
						+ "'/></td>");
				sb.append("<td><input type='hidden' id='hiddencnt" + i + "' value='" + pList.get(i).get("OH_CNT")
						+ "'/><input type='Number' name ='pdcnt' min='0' id='pdcnt" + i + "' onchange='totalprice()' value='"
						+ pList.get(i).get("OH_CNT") + "'/></td>");
				sb.append("<td><input type='button' id='cancelbutton"+i+"' onclick='cancelorder("+i+")' value='취소'/></td>");
				sb.append("</tr>");

			}
			sb.append("</table>");
		}
		return sb.toString();
	}

	//주문번호 말소처리
	public HashMap<String, String> cancelOrdernum(HttpSession session, String oac_num) {
		HashMap<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("c_code", session.getAttribute("c_code").toString());
		insertMap.put("bd_date", session.getAttribute("bd_date").toString());
		insertMap.put("foac_num", oac_num);
		HashMap<String, String> hMap = new HashMap<String, String>();
		if(!oDao2.deleteOrdernum(insertMap)) {
			hMap.put("result", "말소 처리 실패. 다시 시도해주세요");
		}else {
			hMap.put("result", "말소처리 되었습니다.");
		}
		return hMap;
	}

	


}
