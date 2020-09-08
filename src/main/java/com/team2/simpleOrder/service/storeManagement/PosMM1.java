package com.team2.simpleOrder.service.storeManagement;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.posManagement.IPosDao1;
import com.team2.simpleOrder.dao.posManagement.IPosDao2;
import com.team2.simpleOrder.dao.posManagement.IPosDao3;
import com.team2.simpleOrder.dto.StoreManagement;

@Service
public class PosMM1 {
	@Autowired
	private IPosDao1 pDao1;

	@Autowired
	private IPosDao2 pDao2;

	@Autowired
	private IPosDao3 pDao3;

	ModelAndView mav;

	public HashMap<String, String> getProductList(String c_code) {
		List<StoreManagement> pList = pDao1.getProductList(c_code);
		System.out.println(pList);
		HashMap<String, String> hMap = makehtmlpList(pList);
		return hMap;
	}

	private HashMap<String, String> makehtmlpList(List<StoreManagement> pList) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < pList.size(); i++) {
			StoreManagement pd = pList.get(i);
			sb.append("<tr>");
			sb.append("<td>" + (i + 1) + "</td>");
			sb.append("<td>" + pd.getPd_name() + "</td>");
			sb.append("<td>" + pd.getPd_price() + "</td>");
			if (pd.getPd_status() == 1) {
				sb.append("<td>등록</td>");
			} else {
				sb.append("<td>미등록</td>");
			}
			sb.append("<td><input type='button' onclick='deleteProduct()' value='삭제'></td>");
			sb.append("</tr>");
		}
		HashMap<String, String> hMap = new HashMap<>();
		hMap.put("pList", sb.toString());
		return hMap;
	}

	public HashMap<String, String> getStockList(String c_code) {
		List<StoreManagement> sList = pDao1.getStockList(c_code);
		System.out.println(sList);
		HashMap<String, String> hMap = makehtmlsList(sList);
		return hMap;
	}

	private HashMap<String, String> makehtmlsList(List<StoreManagement> sList) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < sList.size(); i++) {
			StoreManagement pd = sList.get(i);
			sb.append("<tr>");
			sb.append("<td>" + (i + 1) + "</td>");
			sb.append("<td>" + pd.getPd_name() + "</td>");
			sb.append("<td>" + pd.getPd_date() + "</td>");
			sb.append("<td>" + pd.getStk_stock() + "개</td>");
			sb.append("</tr>");
		}
		HashMap<String, String> hMap = new HashMap<>();
		hMap.put("sList", sb.toString());
		return hMap;
	}

	public HashMap<String, String> getPstockList(String c_code) {
		List<StoreManagement> psList = pDao1.getPstockList(c_code);
		System.out.println(psList);
		HashMap<String, String> hMap = makehtmlpsList(psList);
		return hMap;
	
	}

	private HashMap<String, String> makehtmlpsList(List<StoreManagement> psList) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < psList.size(); i++) {
			StoreManagement pd = psList.get(i);
			sb.append("<tr>");
			sb.append("<td>" + (i + 1) + "</td>");
			sb.append("<td>" + pd.getPd_name() + "</td>");
			sb.append("<td>" + "<input type='number' placeholder='수량' value="+ pd.getStk_stock()+">" + "개</td>");
			sb.append("<td>" + "<input type='button' value='▲' class='btnUp' id='btn1'>" + "</td>");
			sb.append("<td>" + "<input type='button' value='▼' class='btnUp' id='btn2'>" + "</td>");
			sb.append("</tr>");
		}
		HashMap<String, String> hMap = new HashMap<>();
		hMap.put("psList", sb.toString());
		return hMap;
	}

}