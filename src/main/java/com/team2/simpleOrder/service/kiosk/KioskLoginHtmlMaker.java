package com.team2.simpleOrder.service.kiosk;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.team2.simpleOrder.dto.Order;

public class KioskLoginHtmlMaker {
	StringBuilder sb = new StringBuilder();
	HashMap<String, String> hm = new HashMap<String, String>();

	public String getQrCodeListhtml(String c_code, List<Order> tlist) {
		for (int i = 0; i < tlist.size(); i += 3) {
			sb.append("<tr>");
			for (int j = i; j < i + 3; j++) {
				if (j < tlist.size()) {
					sb.append("<th>").append(tlist.get(j).getSc_name()).append("</th>");
				}
			}
			sb.append("</tr>");
			sb.append("<tr>");
			for (int j = i; j < i + 3; j++) {
				if (j < tlist.size()) {
					sb.append("<th>").append(tlist.get(j).getSt_num()).append("</th>");
				}
			}
			sb.append("</tr>");

			sb.append("<tr>");
			for (int j = i; j < i + 3; j++) {
				if (j < tlist.size()) {
					sb.append("<td>").append(
							"<img alt='qr코드' src='https://chart.googleapis.com/chart?cht=qr&chs=200x200&chl=http://121.65.47.76:3001/simpleOrder/kioskLogin/"
									+ c_code + "/" + tlist.get(j).getSc_code() + "/" + tlist.get(j).getSt_num() + "'>")
							.append("</td>");
				}
			}
			sb.append("</tr>");

		}
		return sb.toString();
	}

	public HashMap<String, String> requestList(ArrayList<HashMap<String, Object>> requsetList) {
		for (HashMap<String, Object> req : requsetList) {
			sb.append("<div class = 'reqDivList'>");
			sb.append("<input class = 'requestList' type = 'text' name ='" + req.get("RQ_NUM") +"' value ='" + req.get("RQ_KIND") + "' >");
			sb.append("</div>");
		}
		hm.put("reqList", sb.toString());
		return hm;

	}

	public HashMap<String, String> getClientRequestList(ArrayList<HashMap<String, String>> clientRequestList) {
		System.out.println(clientRequestList);
		sb.append("<tr>");
		sb.append("<td onclick='sortContent(0)'>").append("카테고리").append("</td>");
		sb.append("<td onclick='sortContent(1)'>").append("번호").append("</td>");
		sb.append("<td onclick='sortContent(2)'>").append("요청 사항").append("</td>");
		sb.append("<td onclick='sortContent(3)'>").append("응대 점원").append("</td>");
		sb.append("<td onclick='sortContent(4)'>").append("요청 시간").append("</td>");
		sb.append("</tr>");
		for (HashMap<String, String> cr : clientRequestList) {
			String sc_name = cr.get("SC_NAME");
			String st_num = cr.get("ST_NUM");
			String request = cr.get("REQUEST");
			String emp_name = cr.getOrDefault("EMP_NAME","응대 전");
			String request_time = String.valueOf(cr.get("REQUEST_TIME")).split(" ")[1];
			sb.append("<tr>");
			sb.append("<td>").append(sc_name).append("</td>");
			sb.append("<td>").append(st_num).append("</td>");
			sb.append("<td>").append(request).append("</td>");
			sb.append("<td>").append(emp_name).append("</td>");
			sb.append("<td>").append(request_time).append("</td>");
			sb.append("</tr>");
		}
		hm.put("requestList", sb.toString());
		return hm;
	}


}
