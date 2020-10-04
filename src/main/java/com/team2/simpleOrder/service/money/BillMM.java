package com.team2.simpleOrder.service.money;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.money.IBillDao;

@Service
public class BillMM {
	@Autowired
	IBillDao bDao;

	public ModelAndView getBillList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String c_code = session.getAttribute("c_code").toString();
		List<HashMap<String, Object>> bList = bDao.getBillList(c_code);
		mav.addObject("bList", makeHtmlbList(bList));
		mav.setViewName("money/billcontrol");
		return mav;
	}

	private String makeHtmlbList(List<HashMap<String, Object>> bList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<table>");
		sb.append("<tr>");
		sb.append("<th style='width : 10px;'>No.</th>");
		sb.append("<th>주문번호</th>");
		sb.append("<th>영업일</th>");
		sb.append("<th>총결제금액</th>");
		sb.append("<th>받은금액</th>");
		sb.append("<th>주문상태</th>");
		sb.append("</tr>");
		for (int i = 0; i < bList.size(); i++) {
			sb.append("<tr class='blist_tr'>");
			sb.append("<td style='width : 10px;'>" + i + "</td>");
			sb.append("<td><input type ='hidden' id='oac_num' value='" + bList.get(i).get("OAC_NUM").toString() + "'>"
					+ bList.get(i).get("OAC_NUM").toString() + "</td>");
			sb.append("<td><input type='hidden' id='bd_date' value='" + bList.get(i).get("BD_DATE") + "'>"
					+ bList.get(i).get("BD_DATE").toString().substring(0, 10) + "</td>");
			if (Integer.parseInt(bList.get(i).get("oac_status").toString()) != -1) {
				sb.append("<td></td>");
				sb.append("<td></td>");
			} else {
				sb.append("<td>" + "<input type='hidden' id='cashcard' data-code='" + bList.get(i).get("PMT_CASH")
						+ "' value='" + bList.get(i).get("PMT_CARD") + "'>" + bList.get(i).get("TOTAL") + "</td>");
				sb.append("<td>" + Integer.parseInt(bList.get(i).get("GET_CASH").toString()) + "</td>");
			}
			sb.append("<td><input type='hidden' id ='oac_status' data-code='" + bList.get(i).get("oac_status") + "'>"
					+ bList.get(i).get("oac_name") + "</td>");
			sb.append("</tr>");
		}
		sb.append("</table>");
		return sb.toString();
	}

	//영수증 상세정보 불러오기
	public HashMap<String, String> getDetailBill(HttpSession session, String bd_date, String oac_num, int oac_status) {
		String c_code = session.getAttribute("c_code").toString();
		HashMap<String, Object> comList = new HashMap<String, Object>();
		HashMap<String, String> hMap = new HashMap<String, String>();
		comList = bDao.getcompanyList(c_code);
		hMap.put("companyName", comList.get("C_NAME").toString());
		String companyList = makehtmlcList(comList);
		hMap.put("companyList", companyList);
		switch (oac_status) {
		case -2:
			
			break;
		case -1:
			List<HashMap<String, Object>> pList = new ArrayList<HashMap<String,Object>>();
			pList = bDao.getproductList(c_code,bd_date,oac_num);
			String productList = makehtmlproductList(pList);
			hMap.put("productList",productList);
			break;
		case 0:
			
			break;
		case 1:
			
			break;
		}
		return hMap;
	}

	private String makehtmlproductList(List<HashMap<String, Object>> pList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<table>");
		sb.append("<tr>");
		sb.append("<td colspan='2'>제품명</td>");
		sb.append("<td>수량</td>");
		sb.append("<td>총금액</td>");
		sb.append("</tr>");
		int totalprice = 0;
		for(int i = 0; i<pList.size();i++) {
			totalprice+=Integer.parseInt(pList.get(i).get("TOTALPRICE").toString());
			sb.append("<tr>");
			sb.append("<td>"+i+"</td>");
			sb.append("<td>"+pList.get(i).get("PD_NAME")+"</td>");
			sb.append("<td>"+pList.get(i).get("OH_CNT")+"</td>");
			sb.append("<td>"+pList.get(i).get("TOTALPRICE")+"</td>");
			sb.append("</tr>");
		}
		sb.append("<tr>");
		sb.append("<th class='leftT' colspan='2'>합계금액</th>");
		sb.append("<td class='rightT' colspan='2'>"+totalprice+"</td>");
		sb.append("</tr>");
		sb.append("<tr>");
		sb.append("<th class='leftT' colspan='2'>받은금액</th>");
		sb.append("<td class='rightT' colspan='2' id='t_getcash'></td>");
		sb.append("</tr>");
		sb.append("</table>");
		return sb.toString();
	}

	//사업장정보
	private String makehtmlcList(HashMap<String, Object> comList) {
		StringBuilder sb = new StringBuilder();
		sb.append("상호명:"+comList.get("C_NAME")+"<br/>");
		sb.append("사업자번호:"+comList.get("C_CODE")+"<br/>");
		sb.append("전화번호:"+comList.get("C_PHONE")+"<br/>");
		sb.append("주소:"+comList.get("C_ADDRESS")+"<br/>");
		return sb.toString();
	}

}
