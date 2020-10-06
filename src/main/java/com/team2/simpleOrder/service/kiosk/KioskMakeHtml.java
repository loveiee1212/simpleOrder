package com.team2.simpleOrder.service.kiosk;

import java.util.HashMap;
import java.util.List;

import com.team2.simpleOrder.dto.Bill;
import com.team2.simpleOrder.dto.Review;
import com.team2.simpleOrder.dto.SellProduct;

public class KioskMakeHtml {
	// 판매키에 올라가 있는 상품리스트 Html만드는 메소드
	public HashMap<String, Object> makeSellProListHtml(List<HashMap<String, Object>> skcList,
			List<SellProduct> sellProList) {
		String iskc_code;
		String jskc_code;
		// 해더 판매 카테고리 리스트
		StringBuilder sb1 = new StringBuilder();
		sb1.append("<ul>");
		sb1.append("<a href='kioskmenu'><li><img alt='simpleOrderLogo' src='resources/image/logo.png'></li></a>");
		for (int i = 0; i < skcList.size(); i++) {
			sb1.append("<li><a href='#skc" + skcList.get(i).get("SKC_CODE") + "'>" + skcList.get(i).get("SKC_NAME")
					+ "</a></li>");
		}
		sb1.append("</ul>");
		// 상품 리스트
		StringBuilder sb2 = new StringBuilder();
		for (int i = 0; i < skcList.size(); i++) {
			sb2.append("<div class='pList' id='skc"+skcList.get(i).get("SKC_CODE")+"'>" + skcList.get(i).get("SKC_NAME"));
			sb2.append("<i class='fas fa-angle-up tgBtn' id='" + skcList.get(i).get("SKC_CODE")
					+ "' style='font-size:36px'></i></div>");
			sb2.append("<div id='pro" + skcList.get(i).get("SKC_CODE") + "' class='pro'>");
			for (int j = 0; j < sellProList.size(); j++) {
				// 판매키에 올라가 있는 상품리스트
				// skc_code가 같다면 추가
				iskc_code = skcList.get(i).get("SKC_CODE").toString();
				jskc_code = sellProList.get(j).getSkc_code().toString();
				if (iskc_code.equals(jskc_code)) {
					if (sellProList.get(j).getStk_stock() == 0) {
						System.out.println("0이다");
						sb2.append("<div class='soldOut'><div class='pList_detail'><div class='pd_imgName'>");
						sb2.append("<img src='resources/productImg/" + sellProList.get(j).getPd_imgName() + "' alt='"
								+ sellProList.get(j).getPd_name() + "'></div>");
						sb2.append("<div class='text_detail'>");
						sb2.append("<div class='pdc_code'>" + sellProList.get(j).getPdc_code() + "</div>");
						sb2.append("<div class='pd_code'>" + sellProList.get(j).getPd_code() + "</div>");
						sb2.append("<div class='pd_date'>" + sellProList.get(j).getPd_date() + "</div>");
						sb2.append("<div class='pd_name'>" + sellProList.get(j).getPd_name() + "</div>");
						sb2.append("<div class='pd_soldOut'>품절</div></div></div></div>");
					} else {
						sb2.append("<div class='detail_body'><div class='pList_detail'><div class='pd_imgName'>");
						sb2.append("<img src='resources/productImg/" + sellProList.get(j).getPd_imgName() + "' alt='"
								+ sellProList.get(j).getPd_name() + "'></div>");
						sb2.append("<div class='text_detail'>");
						sb2.append("<div class='pdc_code'>" + sellProList.get(j).getPdc_code() + "</div>");
						sb2.append("<div class='pd_code'>" + sellProList.get(j).getPd_code() + "</div>");
						sb2.append("<div class='pd_date'>" + sellProList.get(j).getPd_date() + "</div>");
						sb2.append("<div class='pd_name'>" + sellProList.get(j).getPd_name() + "</div>");
						sb2.append("<div class='pd_price'>" + sellProList.get(j).getPd_price()
								+ "</div></div></div></div>");
					}
				}
			}
			sb2.append("</div>");
		}

		HashMap<String, Object> hMap = new HashMap<>();
		hMap.put("sellCtList", sb1.toString());
		hMap.put("sellProList", sb2.toString());
		return hMap;
	}

	// 리뷰 리스트 HTML 만드는 메소드
	public HashMap<String, String> makeReviewListHtml(List<Review> rList, List<HashMap<String, Object>> rImgList,
			List<HashMap<String, Object>> orderList) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < rList.size(); i++) {
			sb.append("<div class='rv_detail'>");
			sb.append("<div class='rv_code'><span class='rv_code_name'>");
			sb.append(rList.get(i).getBd_date().substring(0, 11) + " " + Integer.parseInt(rList.get(i).getOac_num()) + "번 손님");
			sb.append("</span><span class='rv_code_time'>");
			sb.append(rList.get(i).getRv_date());
			sb.append("</span></div>");
			sb.append("<div class='rv_score'>");
			int ot;
			for (int s = 0; s < 10; s++) {
				if (s % 2 == 0) {
					ot = 1;
				} else {
					ot = 2;
				}
				if (rList.get(i).getRv_score() >= s) {
					sb.append("<span class='starR" + ot + " on'>" + s + "</span>");
				} else {
					sb.append("<span class='starR" + ot + "'>" + s + "</span>");
				}
			}
			sb.append("</div>");

			String rv = rList.get(i).getBd_date()+".0" + rList.get(i).getOac_num();
			String rvImg;
			String oh;
			sb.append("<div class='rv_img'>");
			for (int j = 0; j < rImgList.size(); j++) {
				rvImg = rImgList.get(j).get("BD_DATE").toString() + rImgList.get(j).get("OAC_NUM").toString();
				if (rv.equals(rvImg)) {
					sb.append("<img class='img' src='resources/reviewImg/"
							+ rImgList.get(j).get("RVIMG_SYSNAME").toString() + "' alt='"
							+ rImgList.get(j).get("RVIMG_SYSNAME").toString() + "'>");
				}
			}
			sb.append("</div>");
			for (int z = 0; z < orderList.size(); z++) {
				oh = orderList.get(z).get("BD_DATE").toString() + orderList.get(z).get("OAC_NUM").toString();
				if (rv.equals(oh)) {
					sb.append("<div><ui>");
					sb.append("<li>" + orderList.get(z).get("PD_NAME").toString() + "</li>");
					sb.append("</ui></div>");
				}
			}
			sb.append("<div class='rv_text'>");
			sb.append(rList.get(i).getRv_text());
			sb.append("</div></div>");
		}
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("rvList", sb.toString());
		return hMap;
	}

	// 요청사항 리스트 HTML 만드는 메소드
	public HashMap<String, String> reqListHtml(List<String> reqList) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < reqList.size(); i++) {
			sb.append("<div class='req' onclick='reqClick(this);'>" + reqList.get(i) + "</div>");
		}
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("reqList", sb.toString());
		return hMap;
	}

	// 계산서 리스트 Html 만드는 메소드
	public HashMap<String, String> billListHtml(List<Bill> bill) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < bill.size(); i++) {
			if (bill.get(i).getOh_cnt() != 0) {
				sb.append("<tr>");
				sb.append("<td class='bill_pd_name'>" + bill.get(i).getPd_name() + "</td>");
				sb.append("<td class='bill_pd_price'>" + bill.get(i).getPd_price() + "</td>");
				sb.append("<td class='bill_oh_cnt'>" + bill.get(i).getOh_cnt() + "</td>");
				sb.append("</tr>");
			}
		}
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("bill", sb.toString());
		return hMap;
	}
}
