package com.team2.simpleOrder.service.storeManagement;

import java.util.ArrayList;
import java.util.HashMap;

public class TableHtmlMaker {
	HashMap<String, String> hm = new HashMap<String, String>();
	StringBuilder sb = new StringBuilder();

	public HashMap<String, String> getSeatList(ArrayList<HashMap<String, Object>> seatCategoriList) {
		sb.append("<tr>");
		for (HashMap<String, Object> categori : seatCategoriList) {
			sb.append("<td class='categoriList' data-sc_code ='" + categori.get("SC_CODE") + "' onclick = 'showThisCategori(this)'>");
			sb.append(categori.get("SC_NAME"));
			sb.append("</td>");
		}
		sb.append("</tr>");
		hm.put("CategoriList", sb.toString());

		sb = new StringBuilder();

		for (HashMap<String, Object> categori : seatCategoriList) {
			int x = Integer.parseInt(String.valueOf(categori.get("SC_X")));
			int y = Integer.parseInt(String.valueOf(categori.get("SC_Y")));
			ArrayList<HashMap<String, String>> seatInfo = ((ArrayList<HashMap<String, String>>) categori.get("sc_codeInfo"));
			int cnt = 0;
			sb.append("<div hidden ='hidden' class='seatList' id='"+categori.get("SC_CODE")+"'>");
			sb.append("<table >");
			for (int i = 0; i < x * y; i += x) {
				sb.append("<tr>");
				for (int j = i; j < i + x; j++) {
					if (cnt < seatInfo.size()) {
						if (Integer.parseInt(String.valueOf(seatInfo.get(cnt).get("ST_NUM"))) == (j + 1)) {
							sb.append("<td data-sc_code='"+categori.get("SC_CODE")+"' data-st_num ='"+(j + 1)+"' onclick = changeOff(this)>");
							sb.append("<input type='hidden' name ='"+categori.get("SC_CODE")+"#"+(j+1)+"' value =''>");
							sb.append(j+1);
							sb.append("</td>");
							cnt++;
							continue;
						}
					}
					sb.append("<td data-sc_code ='"+categori.get("SC_CODE")+"' data-st_num ='"+(j+1)+"' style='opacity : 0.3' onclick = changeOn(this)>").append(j + 1).append("</td>");
				}
				sb.append("</tr>");
			}
			sb.append("</table >");
			sb.append("<div>");
			sb.append("<input type='hidden' id = 'sc_code' value='"+categori.get("SC_CODE")+"'>");
			sb.append("<input type='number' id = 'x' value='"+categori.get("SC_X")+"'>");
			sb.append("<input type='number' id = 'y' value='"+categori.get("SC_Y")+"'>");
			sb.append("<input type='button' value ='사이즈 변경' onclick ='updateSeatXYInfo(this)'>");
			sb.append("</div>");
			sb.append("</div>");
		}
		hm.put("seatList", sb.toString());
		
		sb = new StringBuilder();
		for (HashMap<String, Object> categori : seatCategoriList) {
			sb.append("<option value = '"+categori.get("SC_CODE")+"'>").append(categori.get("SC_NAME")).append("</option>");
		}
		hm.put("seatCTselect", sb.toString());
		
		
		
		return hm;
	}
}
