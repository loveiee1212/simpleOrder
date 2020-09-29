package com.team2.simpleOrder.service.storeManagement;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.anything;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.team2.simpleOrder.dto.StoreManagement;

public class posHtmlMaker {
	StringBuilder sb = new StringBuilder();
	HashMap<String, String> hm = new HashMap<String, String>();

	
	public HashMap<String, String> makehtmlpList(List<StoreManagement> pList) {
		StringBuilder sb = new StringBuilder();
		System.out.println(pList);
		sb.append("<tr>");
		sb.append("<th>" + "카테고리 코드" + "</th>");
		sb.append("<th>" + "카테고리 이름" + "</th>");
		sb.append("<th>" + "상품 코드" + "</th>");
		sb.append("<th>" + "상품이름" + "</th>");
		sb.append("<th>" + "상품가격" + "</th>");
		sb.append("<th>" + "재고" + "</th>");
		sb.append("<th>" + "수정" + "</th>");
		sb.append("<th>" + "삭제" + "</th>");
		sb.append("</tr>");
		for (int i = 0; i < pList.size(); i++) {
			StoreManagement pd = pList.get(i);
			sb.append("<tr >");
			sb.append("<td>" + pd.getPdc_code() + "</td>");
			sb.append("<td>" + pd.getPdc_name() + "</td>");
			sb.append("<td>" + pd.getPd_code() + "</td>");
			sb.append("<td>" + pd.getPd_name() + "</td>");
			sb.append("<td>" + pd.getPd_price() + "</td>");
			if (pd.getStk_stock() == null) {
				sb.append("<td>사용안함</td>");
			} else {
				sb.append("<td>" + pd.getStk_stock() + "</td>");
			}
			sb.append("<td><input type='button' onclick='updateproFrm(this)' value='수정'></td>");
			sb.append("<td><input type='button' onclick='deleteProduct(this)' value='삭제'></td>");
			sb.append("</tr>");
		}
		HashMap<String, String> hMap = new HashMap<>();
		hMap.put("pList", sb.toString());
		return hMap;
	}
	
	public String makeProListHtml(ArrayList<HashMap<String, Object>> proList) {
	
		for (int i = 0; i < proList.size(); i++) {
			sb.append("<tr onmousedown ='getProInfo(this)' " + "data-pdc_date = '" + proList.get(i).get("PDC_DATE")
					+ "' " + "data-pdc_code ='" + proList.get(i).get("PDC_CODE") + "' " + "data-pd_date ='"
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
		sb.append("<form action='#' method='post'>");
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
			for (int i = 0; i < x * y; i += x) { // x값 마다 줄바꿈 <tr>
				sb.append("<tr>");
				for (int j = i; j < i + x; j++) { // sellkey의 갯수 만큼 반복
					flag = true;
					for (int f = 0; f < skc_code.size(); f++) {
						if (j == Integer.parseInt(String.valueOf(skc_code.get(f).get("SK_NUM"))) - 1) {
							sb.append("<td onmouseup = 'setProInfo(this)' " + "data-pdc_date ='"
									+ String.valueOf(skc_code.get(f).get("PDC_DATE")) + "' " + "data-pdc_code ='"
									+ String.valueOf(skc_code.get(f).get("PDC_CODE")) + "' " + "data-pd_date = '"
									+ String.valueOf(skc_code.get(f).get("PD_DATE")) + "' " + "data-pd_code = '"
									+ String.valueOf(skc_code.get(f).get("PD_CODE")) + "' " + ">");
							sb.append("<div>").append(skc_code.get(f).get("PD_NAME")).append("</div>");
							sb.append("<div>").append(String.valueOf(skc_code.get(f).get("PD_PRICE"))).append("원"+"</div>");
							sb.append("<div>").append("<input type= 'button' value='삭제' onclcick='del()'").append("</div>");
							sb.append("</td>");
							flag = false;
							break;
						}
					}
					if (flag) {
						sb.append("<td onmouseup = 'setProInfo(this)' " + "data-pdc_date ='' " + "data-pdc_code ='' "
								+ "data-pd_date = '' " + "data-pd_code = '' " + ">");
						sb.append("<div>").append(j + 1).append("</div>");
						sb.append("<div>").append(j + 1).append("</div>");
						sb.append("<div>").append("<input type= 'button' value='삭제' onclick='del($(this))'")
								.append("</div>");
						sb.append("</td>");
					}
				}
			}
			sb.append("</tr>");
			sb.append("<tr><td>").append("<input type = 'number' value = '" + skc.get("SKC_X") + "'>");
			sb.append("<input type = 'number' value = '" + skc.get("SKC_Y") + "'>").append("</td></tr>");
	
			sb.append("</table>");
		}
		sb.append("<input type = 'button' value='저장'  oncilck='saveCategiriSellkey()'</input>");
		sb.append("</form>");
		hm.put("sellkeyList", sb.toString());
		return hm;
	}

}
