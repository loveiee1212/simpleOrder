package com.team2.simpleOrder.service.storeManagement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.posManagement.IPosDao1;
import com.team2.simpleOrder.dto.Order;
import com.team2.simpleOrder.dto.StoreManagement;

@Service
public class PosMM1 {
	@Autowired
	private IPosDao1 pDao1;

	ModelAndView mav;

	// productcontrol 왼쪽 상품 정보 출력
	public HashMap<String, String> getsellproductlist1(String c_code) {
		List<StoreManagement> pList = pDao1.getSellProductList1(c_code);
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
		HashMap<String, String> hMap = makehtmlsList(sList);
		return hMap;
	}

	// stockcontrol 오른쪽 재고상품리스트 출력 html 변환
	private HashMap<String, String> makehtmlsList(List<StoreManagement> sList) {
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
			sb.append("<td><input type='hidden' name='pd_code' id='pd_code" + i + "' data-code='" + pd.getPdc_code()
					+ "' value='" + pd.getPd_code() + "'/>" + pd.getPd_name() + "</td>");
			sb.append("<td hidden=''><input type='text' name='pd_name' id='pd_name" + i + "' data-code='"
					+ pd.getStk_stock() + "' value='" + pd.getPd_name() + "'/></td>");
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
		HashMap<String, String> hMap = makehtmlpList2(pList2);
		return hMap;
	}

// productragistration 오른쪽 상품 출력 html 변환
	private HashMap<String, String> makehtmlpList2(List<StoreManagement> pList2) {
		StringBuilder sb = new StringBuilder();
		sb.append("<tr>");
		sb.append("<th>" + "상품번호" + "</th>");
		sb.append("<th>" + "상품이름" + "</th>");
		sb.append("<th>" + "상품가격" + "</th>");
		sb.append("<th>" + "등록여부" + "</th>");
		sb.append("</tr>");
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
		// 카테고리 가져오기
		List<StoreManagement> cList = pDao1.getproductCategoryList(c_code);
		System.out.println("cList" + cList);
		List<StoreManagement> pList = pDao1.getProductList(c_code);
		System.out.println("pList" + cList);
		List<StoreManagement> ctgList = new ArrayList<StoreManagement>();
		System.out.println("ctgList" + cList);
		for (int i = 0; i < cList.size(); i++) {
			StoreManagement sm = new StoreManagement();
			List<String> pnameList = new ArrayList<String>();
			for (int j = 0; j < pList.size(); j++) {
				if (cList.get(i).getPdc_name().equals(pList.get(j).getPdc_name())) {
					pnameList.add(pList.get(j).getPd_name() + pList.get(j).getPd_price()
							+ "<input type='button' onclick='del($(this))' value='삭제'/>" + " </br>");
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

	public HashMap<String, String> updateStock(HttpSession session, List<String> pdc_code, List<String> pd_code,
			List<String> pd_name, List<String> stk_stock) {
		StoreManagement sm = new StoreManagement();
		String c_code = "123123123123";
		List<StoreManagement> sList = new ArrayList<StoreManagement>();
		for (int i = 0; i < pdc_code.size(); i++) {
			sm.setC_code("123123123123");
			sm.setPdc_code(pdc_code.get(i));
			sm.setPd_code(pd_code.get(i));
			sm.setStk_stock(stk_stock.get(i));
			sList.add(sm);
		}
		HashMap<String, String> hMap = new HashMap<String, String>();
		if (sList == null) {
			hMap.put("result", "수정한 재고가 없습니다.");
			return hMap;
		} else {
			List<StoreManagement> sOriList = pDao1.getStockList(sm);
			for (int i = 0; i < sList.size(); i++) {
				StoreManagement stm = new StoreManagement();
				for (int j = 0; i < sOriList.size(); j++) {
					if (sList.get(i).getStk_stock().equals(sOriList.get(j).getStk_stock())) {
					}
				}
			}
		}
		return hMap;
	}

	public HashMap<String, String> insertProduct(StoreManagement sm) {
		// TODO Auto-generated method stub
		return null;
	}

	public HashMap<String, String> getProList(HttpSession session) {
		posHtmlMaker phm = new posHtmlMaker(); // htmlmaker 생성
		ArrayList<HashMap<String, Object>> apl = pDao1.getProList(session.getAttribute("c_code").toString());
		ArrayList<HashMap<String, Object>> skl = pDao1.getSellKeyProList(session.getAttribute("c_code").toString());
		for (int i = 0; i < apl.size(); i++) {
			for (int j = 0; j < skl.size(); j++) {
				if (apl.get(i).get("PDC_DATE").equals(skl.get(j).get("PDC_DATE"))
						&& apl.get(i).get("PDC_CODE").equals(skl.get(j).get("PDC_CODE"))
						&& apl.get(i).get("PD_DATE").equals(skl.get(j).get("PD_DATE"))
						&& apl.get(i).get("PD_CODE").equals(skl.get(j).get("PD_CODE"))) {
					apl.get(i).put("sellkey", "sellkey");
				}
			}
		}
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("proList", phm.makeProListHtml(apl));
		return hm;
		
	}

	public HashMap<String, String> getSellKeyCatList(HttpSession session) {
		posHtmlMaker phm = new posHtmlMaker();
		ArrayList<HashMap<String, Object>> skCatList = pDao1.getSellKeyCatList(session.getAttribute("c_code").toString());
		for(int i = 0; i < skCatList.size(); i++) {
			String c_code = skCatList.get(i).get("C_CODE").toString();
			String skc_code = skCatList.get(i).get("SKC_CODE").toString();
			HashMap<String, String> hm = new HashMap<String, String>();
			hm.put("c_code", c_code);
			hm.put("skc_code", skc_code);
			skCatList.get(i).put("SKC_CODEList", pDao1.getsellKeyInfo(hm));
		}
		return phm.sellkeyhtmlMake(skCatList);
	}
}
