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

			System.out.println(tlist.get(i).getSc_name());
			System.out.println(tlist.get(i).getSc_code());
			System.out.println(tlist.get(i).getSt_num());
			;
			System.out.println();

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
									+ c_code + "/" + tlist.get(i).getSc_code() + "/" + tlist.get(i).getSt_num() + "'>")
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

}
