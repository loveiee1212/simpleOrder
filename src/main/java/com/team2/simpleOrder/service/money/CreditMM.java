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

//받아온 외상데이터를 html로 만들어주기 
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
			sb.append("<td>"+returnMap.get(i).get("CRD_NAME")+"님</td>");
			sb.append("<td>"+returnMap.get(i).get("CRD_PHONE")+"</td>");
			sb.append("<td>"+returnMap.get(i).get("CRD_DATE").toString().substring(0,16)+"</td>");
			sb.append("<td>"+returnMap.get(i).get("TOTALPRICE")+"</td>");
			sb.append("</tr>");
		}
		sb.append("</table>");
		return sb.toString();
	}

}
