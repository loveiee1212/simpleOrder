package com.team2.simpleOrder.service.storeManagement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.posManagement.IPosDao1;
import com.team2.simpleOrder.dto.StoreManagement;

@Service
public class PosMM1 {
	@Autowired
	private IPosDao1 pDao1;

	ModelAndView mav;

	// productcontrol 왼쪽 상품 정보 출력
	public HashMap<String, String> getsellproductlist1(String c_code) {
		List<StoreManagement> pList = pDao1.getSellProductList1(c_code);
		System.out.println(pList);
		HashMap<String, String> hMap = makehtmlpList(pList);
		return hMap;
	}

	// productcontrol 왼쪽 상품 정보 출력 html 변환
	private HashMap<String, String> makehtmlpList(List<StoreManagement> pList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<tr>");
		sb.append("<th>" + "번호" + "</th>");
		sb.append("<th>" + "상품이름" + "</th>");
		sb.append("<th>" + "상품가격" + "</th>");
		sb.append("<th>" + "재고" + "</th>");
		sb.append("<th>" + "등록여부" + "</th>");
		sb.append("<th>" + "삭제" + "</th>");
		sb.append("</tr>");
		for (int i = 0; i < pList.size(); i++) {
			StoreManagement pd = pList.get(i);
			sb.append("<tr>");
			sb.append("<td>" + (i + 1) + "</td>");
			sb.append("<td>" + pd.getPd_name() + "</td>");
			sb.append("<td>" + pd.getPd_price() + "</td>");
			if (pd.getStk_stock() == null) {
				sb.append("<td>사용안함</td>");
			} else {
				sb.append("<td>" + pd.getStk_stock() + "</td>");
			}
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

	// stockcontrol 오른쪽 재고상품리스트 출력
	public HashMap<String, String> getStockList(StoreManagement sm) {
		List<StoreManagement> sList = pDao1.getStockList(sm);
		System.out.println(sList);
		HashMap<String, String> hMap = makehtmlsList(sList);
		return hMap;
	}

	// stockcontrol 오른쪽 재고상품리스트 출력 html 변환
	private HashMap<String, String> makehtmlsList(List<StoreManagement> sList) {
		System.out.println(sList.size());
		StringBuilder sb = new StringBuilder();
		if (sList.size() != 0) {
			for (int i = 0; i < sList.size(); i++) {
				StoreManagement sm = sList.get(i);
				sb.append("<tr>");
				sb.append("<td>" + (i + 1) + "</td>");
				sb.append("<td>" + sm.getPd_name() + "</td>");
				sb.append("<td>" + sm.getPd_date() + "</td>");
				sb.append("<td>" + sm.getStk_stock() + "개</td>");
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

	// stockcontrol 왼쪽 재고상품리스트 출력
	public HashMap<String, String> getPstockList(String c_code) {
		List<StoreManagement> psList = pDao1.getPstockList(c_code);
		System.out.println(psList);
		HashMap<String, String> hMap = makehtmlpsList(psList);
		return hMap;

	}

	// stockcontrol 왼쪽 재고상품리스트 출력 html변환
	private HashMap<String, String> makehtmlpsList(List<StoreManagement> psList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<tr>");
		sb.append("<th>상품 이름</th>");
		sb.append("<th>상품 개수</th>");
		sb.append("<th>증가</th>");
		sb.append("<th>감소</th>");
		sb.append("</tr>");
		for (int i = 0; i < psList.size(); i++) {
			StoreManagement pd = psList.get(i);
			sb.append("<tr>");

			sb.append("<td><input type='hidden' name='p_code' id='p_code" + i + "' data-code='" + pd.getPdc_code()
					+ "' value='" + pd.getPd_code() + "'/>" + pd.getPd_name() + "</td>");

			sb.append("<td>" + "<input type='number'name='stk_stock' class='num stk_stock'" + "value="
					+ pd.getStk_stock() + ">" + "개</td>");

			sb.append("<td>" + "<input type='button' value='▲' class='btnUp' id='btnUp'>" + "</td>");
			sb.append("<td>" + "<input type='button' value='▼' class='btnDown' id='btnDown'>" + "</td>");
			sb.append("</tr>");
		}
		HashMap<String, String> hMap = new HashMap<>();
		hMap.put("psList", sb.toString());
		return hMap;
	}

	// productragistration 오른쪽 상품 출력
	public HashMap<String, String> getSellProductList(String c_code) {
		List<StoreManagement> pList2 = pDao1.getProductList(c_code);
		System.out.println(pList2);
		HashMap<String, String> hMap = makehtmlpList2(pList2);
		return hMap;
	}

// productragistration 오른쪽 상품 출력 html 변환
	private HashMap<String, String> makehtmlpList2(List<StoreManagement> pList2) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < pList2.size(); i++) {
			StoreManagement pd = pList2.get(i);
			sb.append("<tr>");
			sb.append("<td>" + (i + 1) + "</td>");
			sb.append("<td>" + pd.getPd_name() + "</td>");
			sb.append("<td>" + pd.getPd_price() + "</td>");

			if (pd.getPd_status() == 1) {
				sb.append("<td>등록</td>");
			} else {
				sb.append("<td>미등록</td>");
			}
			sb.append("</tr>");
		}
		HashMap<String, String> hMap = new HashMap<>();
		hMap.put("pList2", sb.toString());
		return hMap;
	}

	public List<StoreManagement> getproductCategoryList() {
		String c_code = "123123123123";
		System.out.println("c_code:" + c_code);
		// 카테고리 가져오기
		List<StoreManagement> cList = pDao1.getproductCategoryList(c_code);
		System.out.println("cList:" + cList);

		List<StoreManagement> pList = pDao1.getProductList(c_code);
		System.out.println("pList : " + pList);

		List<StoreManagement> ctgList = new ArrayList<StoreManagement>();
		for (int i = 0; i < cList.size(); i++) {
			StoreManagement sm = new StoreManagement();
			List<String> pnameList = new ArrayList<String>();
			for (int j = 0; j < pList.size(); j++) {
				if (cList.get(i).getPdc_name().equals(pList.get(j).getPdc_name())) {
					System.out.println("cListname:" + cList.get(i).getPdc_name() + "상품이름:" + pList.get(j).getPd_name());
					pnameList.add(pList.get(j).getPd_name());
				}
				sm.setCpList(pnameList);
			}
			if (i < 10) {
				sm.setPdc_name("<button class='category' onclick='opentable(event,\"product" + "0" + i + "\")'>"
						+ cList.get(i).getPdc_name() + "</button>");
			} else {
				sm.setPdc_name("<button class='category' onclick='opentable(event,\"product" + i + "\")'>"
						+ cList.get(i).getPdc_name() + "</button>");
			}

			ctgList.add(sm);

		}
		return ctgList;
	}

	public HashMap<String, String> updateStock(StoreManagement sm) {
		String c_code = "123123123123";
		HashMap<String, String> hMap = new HashMap<String, String>();
		boolean result = pDao1.updateStock(c_code);
		if (result) {
			hMap.put("result", "수정되었습니다.");
		}
		return hMap;
	}

}
