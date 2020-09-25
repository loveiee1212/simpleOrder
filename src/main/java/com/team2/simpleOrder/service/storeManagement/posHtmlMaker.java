package com.team2.simpleOrder.service.storeManagement;

import java.util.ArrayList;
import java.util.HashMap;

public class posHtmlMaker {
	StringBuilder sb = new StringBuilder();
	HashMap<String, String> hm = new HashMap<String, String>();

	public String makeProListHtml(ArrayList<HashMap<String, Object>> proList) {
		for (int i = 0; i < proList.size(); i++) {
			sb.append("<tr onmousedown ='getProInfo(this)' " + "data-pdc_date = '" + proList.get(i).get("PDC_DATE") + "' "
					+ "data-pdc_code ='" + proList.get(i).get("PDC_CODE") + "' " + "data-pd_date ='"
					+ proList.get(i).get("PD_DATE") + "' " + "data-pd_code ='" + proList.get(i).get("PD_CODE") + "'>");
			sb.append("<td>").append(proList.get(i).get("PD_NAME")).append("</td>");
			sb.append("<td>").append(proList.get(i).get("PD_PRICE")).append("</td>");
			if (proList.get(i).get("sellkey") != null) {
				sb.append("<td>").append("등록").append("</td>");
			} else {
				sb.append("<td>").append("미등록").append("</td>");
			}
			sb.append("</tr>");

		}
		return sb.toString();
	}

	public HashMap<String, String> sellkeyhtmlMake(ArrayList<HashMap<String, Object>> skCatList) {
		// 판매키 선택 버튼
		sb.append("<tr>");
		for (int i = 0; i < skCatList.size(); i++) {
			sb.append("<td data-skc_code = '" + skCatList.get(i).get("SKC_CODE") + "'>")
					.append("<button onclick ='selectSKC(this)'>").append(skCatList.get(i).get("SKC_NAME"))
					.append("</button>").append("</td>");
		}
		sb.append("</tr>");
		hm.put("categoriList", sb.toString());

		// 판매키
		sb = new StringBuilder();
		for (HashMap<String, Object> skc : skCatList) {
			ArrayList<HashMap<String, String>> skc_code = ((ArrayList<HashMap<String, String>>) skc
					.get("SKC_CODEList"));
			int x = Integer.parseInt(skc.get("SKC_X").toString());
			int y = Integer.parseInt(skc.get("SKC_Y").toString());
			boolean flag = true;
			sb.append("<table id = '" + skc.get("SKC_CODE") + "' hidden = 'hidden' class ='sellKeyBasicTable'>");
			sb.append("<tr><td>").append(skc.get("SKC_NAME")).append("</td></tr>");
			for (int i = 0; i < x * y; i += x) { //x값 마다 줄바꿈 <tr>
				sb.append("<tr>");
				for (int j = i; j < i + x; j++) { // sellkey의 갯수 만큼 반복
					flag = true;
					for (int f = 0; f < skc_code.size(); f++) {
						if (j == Integer.parseInt(String.valueOf(skc_code.get(f).get("SK_NUM"))) - 1) {
							sb.append("<td onmouseup = 'setProInfo(this)' "
									+ "data-pdc_date ='"+String.valueOf(skc_code.get(f).get("PDC_DATE"))+"' "
									+ "data-pdc_code ='"+String.valueOf(skc_code.get(f).get("PDC_CODE"))+"' "
									+ "data-pd_date = '"+String.valueOf(skc_code.get(f).get("PD_DATE"))+"' "
									+ "data-pd_code = '"+String.valueOf(skc_code.get(f).get("PD_CODE"))+"' "
											+ ">");
							sb.append("<div>").append(skc_code.get(f).get("PD_NAME")).append("</div>");
							sb.append("<div>").append(String.valueOf(skc_code.get(f).get("PD_PRICE"))).append("</div>");
							sb.append("<div>").append("버튼").append("</div>");
							sb.append("</td>");
							flag = false;
							break;
						}
					}
					if (flag) {
						sb.append("<td onmouseup = 'setProInfo(this)' "
								+ "data-pdc_date ='' "
								+ "data-pdc_code ='' "
								+ "data-pd_date = '' "
								+ "data-pd_code = '' "
										+ ">");
						sb.append("<div>").append(j + 1).append("</div>");
						sb.append("<div>").append(j + 1).append("</div>");
						sb.append("<div>").append("버튼").append("</div>");
						sb.append("</td>");
					}
				}
			}
			sb.append("</tr>");
			sb.append("<tr><td>").append("<input type = 'number' value = '" + skc.get("SKC_X") + "'>");
			sb.append("<input type = 'number' value = '" + skc.get("SKC_Y") + "'>").append("</td></tr>");
			sb.append("</table>");
		}
		hm.put("sellkeyList", sb.toString());
		return hm;
	}

}
