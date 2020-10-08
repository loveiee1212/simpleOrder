package com.team2.simpleOrder.service.storeManagement;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import com.team2.simpleOrder.dto.StoreManagement;

public class ProductHtmlMaker {
	StringBuilder sb = new StringBuilder();
	HashMap<String, String> hm = new HashMap<String, String>();

	
	public HashMap<String, String> makehtmlpList(List<StoreManagement> pList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<tr>");
		sb.append("<th>" + "카테고리" + "</th>");
		sb.append("<th>" + "상품" + "</th>");
		sb.append("<th>" + "상품가격" + "</th>");
		sb.append("<th>" + "재고" + "</th>");
		sb.append("<th colspan = '2'>" + "비고" + "</th>");
		sb.append("</tr>");
		System.out.println(pList.size());
		for (int i = 0; i < pList.size(); i++) {
			StoreManagement pd = pList.get(i);
			sb.append("<tr>");
			sb.append("<td>" + pd.getPdc_name() + "</td>");
			sb.append("<td>" + pd.getPd_name() + "</td>");
			sb.append("<td>" + pd.getPd_price() + "</td>");
			if (pd.getStk_stock() == null) {
				sb.append("<td>사용안함</td>");
			} else {
				sb.append("<td>" + pd.getStk_stock() + "</td>");
			}
			sb.append("<td onclick ='getProInfo(this)' "
					+ "data-pdc_code ='"+pd.getPdc_code()+"' "
					+ "data-pd_code ='"+pd.getPd_code()+"' "
					+ "data-pd_date ='"+pd.getPd_date()+"' "
					+ "data-pd_name ='"+pd.getPd_name()+"' "
					+ "data-pd_price ='"+pd.getPd_price()+"' "
					+ "data-stk_stock ='"+pd.getStk_stock()+"' "
							+ "'>");
			sb.append("<input type='button' value='수정' class ='aPUpdate'>");
			sb.append("</td>");
			
			sb.append("<td onclick='deleteProduct(this)'>");
			sb.append("<input type='button' value='삭제' class ='aPdelete'>");
			sb.append("</td>");
			sb.append("</tr>");
		}
		sb.append("<tr>").append("<td>").append("<input id= 'readyCreatProFrm' type ='button' value ='추가' onclick ='readyCreatProFrm()'>").append("</td>").append("</tr>");
		HashMap<String, String> hMap = new HashMap<>();
		hMap.put("pList", sb.toString());
		return hMap;
	}
	
	
	public String getProCategoriList(ArrayList<HashMap<String, Object>> proCategoriList) {
		for (HashMap<String, Object> categori : proCategoriList) {
			sb.append("<option value ='"+categori.get("PDC_CODE")+"'>");
			sb.append(categori.get("PDC_NAME"));
			sb.append("</option>");
		}
		return sb.toString();
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
			sb.append("<td data-skc_code = '" + skCatList.get(i).get("SKC_CODE") + "' onclick ='selectSKC(this)'>")
					.append(skCatList.get(i).get("SKC_NAME"))
					.append("</td>");
		}
		sb.append("</tr>");
		hm.put("categoriList", sb.toString());

		// 판매키
		sb = new StringBuilder();
		sb.append("<div id='aSellCTDiv'>");
		for (HashMap<String, Object> skc : skCatList) {
			ArrayList<HashMap<String, String>> skc_codes = ((ArrayList<HashMap<String, String>>) skc.get("SKC_CODEList"));
			int x = Integer.parseInt(skc.get("SKC_X").toString());
			int y = Integer.parseInt(skc.get("SKC_Y").toString());
			boolean flag = true;
			sb.append("<table id = '" + skc.get("SKC_CODE") + "' hidden = 'hidden' class ='sellKeyBasicTable'>");
			sb.append("<tr><th id= 'aSCK_name'>").append(skc.get("SKC_NAME")).append("</th></tr>");
			for (int i = 0; i < x * y; i += x) { // x값 마다 줄바꿈 <tr>
				sb.append("<tr>");
				for (int j = i; j < i + x; j++) { // sellkey의 갯수 만큼 반복
					flag = true;
					for (int f = 0; f < skc_codes.size(); f++) {
						if (j == Integer.parseInt(String.valueOf(skc_codes.get(f).get("SK_NUM"))) - 1) {
							HashMap<String, String> skc_codeInfo = skc_codes.get(f);
							String pdc_code = skc_codeInfo.get("PDC_CODE");
							String pd_date = String.valueOf(skc_codeInfo.get("PD_DATE"));
							String pd_code = skc_codeInfo.get("PD_CODE");
							String pd_name = skc_codeInfo.get("PD_NAME");
							String pd_price = String.valueOf(skc_codeInfo.get("PD_PRICE"));
							String skc_code = skc_codeInfo.get("skc_code");
							sb.append("<td onmouseup = 'setProInfo(this)' data-sk_num ='"+(j+1)+"' data-skc_code ='"+skc.get("SKC_CODE")+"'>");
							sb.append("<div>").append(pd_name).append("</div>");
							sb.append("<div>").append(pd_price).append("원"+"</div>");
							sb.append("<input type ='hidden' name ='pdc_code' value ='"+pdc_code+"'>");
							sb.append("<input type ='hidden' name ='pd_code' value ='"+pd_code+"'>");
							sb.append("<input type ='hidden' name ='pd_date' value ='"+pd_date+"'>");
							sb.append("<input type ='hidden' name ='skc_code' value ='"+String.valueOf(skc_codeInfo.get("SKC_CODE"))+"'>");
							sb.append("<input type ='hidden' name ='sk_num' value ='"+(j+1)+"'>");
							sb.append("<input type= 'button' value='삭제' class='adeletebtn' onclick='deleteSellKey(this)'");
							sb.append("</td>");
							flag = false;
							break;
						}
					}
					if (flag) {
						sb.append("<td onmouseup = 'setProInfo(this)' data-skc_code = '"+skc.get("SKC_CODE")+"' data-sk_num ='"+(j+1)+"'>");
						sb.append("<div>").append(j + 1).append("</div>");
						sb.append("</td>");
					}
				}
			}
			sb.append("</tr>");
			sb.append("<tr><td colspan='4' data-skc_code ='"+skc.get("SKC_CODE")+"'>").append("<input type = 'number' class='anumber' value = '" + skc.get("SKC_X") + "'>");
			sb.append("<input type = 'number' class='anumber' value = '" + skc.get("SKC_Y") + "'>");
			sb.append("<input type ='button' value ='사이즈 변경' id='Changebtn' onclick ='ChangeSellkeySize(this)'>");
			sb.append("</td></tr>");
	
			sb.append("</table>");
		}
		sb.append("</div>");
		sb.append("<input type ='submit' value ='저장' id='savebtn'>");
		hm.put("sellkeyList", sb.toString());
		return hm;
	}


	public HashMap<String, String> makehtmlsList(List<StoreManagement> sList) {
		if (sList.size() != 0) {
			for (int i = 0; i < sList.size(); i++) {
				StoreManagement sm = sList.get(i);
				sb.append("<tr>");
				sb.append("<td>" + (i + 1) + "</td>");
				sb.append("<td>" + sm.getPd_name() + "</td>");
				sb.append("<td>" + sm.getPd_date() + "</td>");
				sb.append("<td>" + sm.getStk_stock() + "개</td>");
				sb.append("<input type= 'hidden'" + sm.getStk_stock() + "개</input>");
				sb.append("</tr>");
			}
		} else {
			sb.append("<tr colspan='3'>");
			sb.append("<td>등록된 재고가 없습니다.</td>");
			sb.append("</tr>");
			
		}
		HashMap<String, String> hMap = new HashMap<>();
		hMap.put("sList", sb.toString());
		return hMap;
		
	}


	public HashMap<String, String> getSellKeyCategoriList(ArrayList<HashMap<String, String>> sellKeyCategoriList) {
		for(HashMap<String, String >skcinfo : sellKeyCategoriList) {
			sb.append("<option id ='"+String.valueOf(skcinfo.get("SKC_CODE"))+"'>").append(skcinfo.get("SKC_NAME")).append("</option>");
		}
		hm.put("sckList", sb.toString());
		return hm;
	}


	public HashMap<String, String> getStockList(ArrayList<HashMap<String, String>> stockList) {
		for(HashMap<String, String> stock : stockList) {
			sb.append("<tr data-pdc_code ='"+stock.get("PDC_CODE")+"' "
					+"		data-pd_code ='"+stock.get("PD_CODE")+"' "
					+ "		data-pd_date ='"+String.valueOf(stock.get("PD_DATE"))+"'>");
			sb.append("<td onclick ='getStockRecord(this)'>").append(stock.get("PDC_NAME")).append("</td>");
			sb.append("<td onclick ='getStockRecord(this)'>").append(stock.get("PD_NAME")).append("</td>");
			sb.append("<td onclick ='getStockRecord(this)'>").append(String.valueOf(stock.get("STK_STOCK"))).append("</td>");
			sb.append("<td>").append("<input type='number' class='anumber'> <input type ='button' value ='추가' class='aupdatebtn' onclick ='updateStock(this)'>").append("</td>");
		}
		hm.put("stockList", sb.toString());
		return hm;
	}


	public HashMap<String, String> getStockRecord(ArrayList<HashMap<String, String>> stockRecord) {
		int cnt = 0;
		String plus;
		sb.append("<tr>");
		sb.append("<th>").append("상품명").append("</th>");
		sb.append("<th>").append("변경 시간").append("</th>");
		sb.append("<th>").append("변경 수량").append("</th>");
		sb.append("</tr>");
		for(HashMap<String, String> record : stockRecord) {
			sb.append("<tr>");
			sb.append("<td>").append(record.get("PD_NAME"));
			sb.append("<td>").append(String.valueOf(record.get("OH_CHANGETIME")));
			int stock = (Integer.parseInt(String.valueOf(record.get("OH_CNT")))*-1);
			if(stock<0) {
				plus = ""+stock;
			}else {
				plus = "+"+stock;
			}
			sb.append("<td>").append(plus);
			sb.append("</tr>");
			cnt++;
		}
		hm.put("stockRecord", sb.toString());
		hm.put("length", cnt+"");
		return hm;
	}






















	
}
