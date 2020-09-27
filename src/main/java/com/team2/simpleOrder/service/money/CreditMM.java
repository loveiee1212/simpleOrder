package com.team2.simpleOrder.service.money;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.simpleOrder.dao.money.ICreditDao;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CreditMM {
	@Autowired
	ICreditDao cDao;

	// c_code와 주문상태코드가 0 인 데이터를 이용해 외상데이터를 받아옴
	public HashMap<String, String> getcreditList(HttpSession session, int oac_status) {
		HashMap<String, Object> selectMap = new HashMap<String, Object>();
		selectMap.put("c_code", session.getAttribute("c_code").toString());
		selectMap.put("oac_status", oac_status);
		List<HashMap<String, Object>> returnMap = cDao.getcreditList(selectMap);
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("data", makeHtmlcreditList(returnMap));

		return hMap;
	}

	// 받아온 외상데이터를 html로 만들어주기
	private String makeHtmlcreditList(List<HashMap<String, Object>> returnMap) {
		log.info("returnMap:" + returnMap);
		log.info("returnMap:" + returnMap.size());
		StringBuilder sb = new StringBuilder();
		sb.append("<table id = 'crdtableList'>");
		sb.append("<tr>");
		sb.append("<th>성함</th>");
		sb.append("<th>연락처</th>");
		sb.append("<th>외상일</th>");
		sb.append("<th>외상금액</th>");
		sb.append("</tr>");
		for (int i = 0; i < returnMap.size(); i++) {
			sb.append("<tr class ='crdinfo'>");
			sb.append("<input type = 'hidden' id='oac_num' value='" + returnMap.get(i).get("OAC_NUM") + "'>");
			sb.append("<input type = 'hidden' id='bd_date' value='" + returnMap.get(i).get("BD_DATE") + "'>");
			sb.append("<input type = 'hidden' id='crd_code' value='" + returnMap.get(i).get("CRD_CODE") + "'>");
			sb.append("<td>" + returnMap.get(i).get("CRD_NAME") + "님</td>");
			sb.append("<td>" + returnMap.get(i).get("CRD_PHONE") + "</td>");
			sb.append("<td>" + returnMap.get(i).get("CRD_DATE").toString().substring(0, 16) + "</td>");
			sb.append("<td>" + returnMap.get(i).get("TOTALPRICE") + "</td>");
			sb.append("</tr>");
		}
		sb.append("</table>");
		return sb.toString();
	}

	// 외상 상세정보 가져오기
	public HashMap<String, String> getdetailCredit(HttpSession session, String bd_date, String oac_num,
			int oac_status) {
		HashMap<String, Object> selecthMap = new HashMap<String, Object>();
		selecthMap.put("c_code", session.getAttribute("c_code").toString());
		selecthMap.put("bd_date", bd_date);
		selecthMap.put("oac_num", oac_num);
		selecthMap.put("oac_status", oac_status);
		HashMap<String, String> hMap = new HashMap<String, String>();
		List<HashMap<String, Object>> cList = cDao.getdetailCredit(selecthMap);
		log.info("cList" + cList);
		if (cList.size() > 0) {
			hMap.put("data", makeHtmldetailcredit(cList,selecthMap));
		}
		return hMap;
	}

	// 외상 상세정보 html형식으로 변환하여 반환하기
	private String makeHtmldetailcredit(List<HashMap<String, Object>> cList, HashMap<String, Object> hMap) {
		StringBuilder sb = new StringBuilder();
		sb.append("<table id='detailtable'>");
		sb.append("<input type='hidden' id='sendbd_date' value = '"+hMap.get("bd_date")+"'/>");
		sb.append("<input type='hidden' id='sendoac_num' value = '"+hMap.get("oac_num")+"'/>");
		for (int i = 0; i < cList.size(); i++) {
			sb.append("<tr>");
			sb.append("<td><input type='hidden' name='pdcode' id='pdcode" + i + "' data-code='"
					+ cList.get(i).get("PDC_CODE") + "' value='" + cList.get(i).get("PD_CODE") + "'/>"
					+ "<input type='hidden' name='pddate' id='pddate" + i + "' data-code='"
					+ cList.get(i).get("PDC_DATE") + "' value='" + cList.get(i).get("PD_DATE") + "'/>"
					+ cList.get(i).get("PD_NAME") + "</td>");
			sb.append("<td><p class ='price' id='totalprice" + i + "'></p>");
			sb.append("<input type='hidden' id='hiddenprice" + i + "' value='" + cList.get(i).get("PD_PRICE")
					+ "'/></td>");
			sb.append("<td><input type='hidden' id='hiddencnt" + i + "' value='" + cList.get(i).get("OH_CNT")
					+ "'/><input type='Number' class= 'pdcnt' name ='pdcnt' readonly='readonly' id='pdcnt" + i + "' value='"
					+ cList.get(i).get("OH_CNT") + "'/></td>");
			sb.append("<td><button>취소</button></td>");

		}
		sb.append("</table>");

		return sb.toString();
	}

}
