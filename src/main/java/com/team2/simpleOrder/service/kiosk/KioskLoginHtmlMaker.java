package com.team2.simpleOrder.service.kiosk;

import java.util.List;

import com.team2.simpleOrder.dto.Order;

public class KioskLoginHtmlMaker {
	StringBuilder sb = new StringBuilder();

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
							"<img alt='qr코드' src='https://chart.googleapis.com/chart?cht=qr&chs=200x200&chl=http://localhost/simpleOrder/kioskLogin/"
									+ c_code + "/" + tlist.get(i).getSc_code() + "/" + tlist.get(i).getSt_num() + "'>")
							.append("</td>");
				}
			}
			sb.append("</tr>");

		}
		return sb.toString();
	}

}
