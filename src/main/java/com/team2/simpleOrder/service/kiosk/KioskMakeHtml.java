package com.team2.simpleOrder.service.kiosk;

import java.util.HashMap;
import java.util.List;

import com.team2.simpleOrder.dto.Bill;
import com.team2.simpleOrder.dto.Review;
import com.team2.simpleOrder.dto.ReviewImg;
import com.team2.simpleOrder.dto.SellProduct;

public class KioskMakeHtml {
	// 판매키에 올라가 있는 상품리스트 Html만드는 메소드
	public HashMap<String, Object> makeSellProListHtml(List<HashMap<String, Object>> skcList,
			List<SellProduct> sellProList) {
		// 해더 판매 카테고리 리스트
		StringBuilder sb1 = new StringBuilder();
		sb1.append("<ul>");
		sb1.append("<a href='kioskmenu'><li><img alt='simpleOrderLogo' src='resources/image/logo.png'></li></a>");
		for (int i = 0; i < skcList.size(); i++) {
			sb1.append("<li><a href='#skc" + skcList.get(i).get("SKC_CODE") + "'>" + skcList.get(i).get("SKC_NAME")
					+ "</a></li>");
		}
		sb1.append("</ul>");
		//상품 리스트
		StringBuilder sb2 = new StringBuilder();
		for (int i = 0; i < skcList.size(); i++) {
			sb2.append("<div id='skc" + skcList.get(i).get("SKC_CODE") + "' class='pList'>");
			sb2.append("<div id='pro"+skcList.get(i).get("SKC_CODE")+"'>" + skcList.get(i).get("SKC_NAME") + "</div>");
			for(int j=0; j<sellProList.size(); j++) {
				//판매키에 올라가 있는 상품리스트
				//skc_code가 같다면 추가
				if(skcList.get(i).get("SKC_CODE").equals(sellProList.get(j).getSkc_code())) {
					sb2.append("<div class='detail_body'><div class='pList_detail'><div class='pd_imgName'>");
					sb2.append("<img src='resources/productImg/" + sellProList.get(j).getPd_imgName() + "' alt='"
							+ sellProList.get(j).getPd_name() + "'></div>");
					sb2.append("<div class='text_detail'>");
					sb2.append("<div class='pdc_code'>" + sellProList.get(j).getPdc_code() + "</div>");
					sb2.append("<div class='pdc_date'>" + sellProList.get(j).getPdc_date() + "</div>");
					sb2.append("<div class='pd_code'>" + sellProList.get(j).getPd_code() + "</div>");
					sb2.append("<div class='pd_date'>" + sellProList.get(j).getPd_date() + "</div>");
					sb2.append("<div class='pd_name'>" + sellProList.get(j).getPd_name() + "</div>");
					sb2.append("<div class='pd_price'>" + sellProList.get(j).getPd_price()+ "</div></div></div></div>");
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
	public HashMap<String, String> makeReviewListHtml(List<Review> rList, List<ReviewImg> rImgList) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < rList.size(); i++) {
			sb.append("<li>");
			sb.append("<div class='rv_detail'>");
			sb.append("<div class='rv_code'><span class='rv_code_name'>");
			sb.append(rList.get(i).getBd_date() + "날의 " + rList.get(i).getOac_num() + "번째 손님");
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
			String rv = rList.get(i).getBd_date() + rList.get(i).getOac_num();
			for (int j = 0; j < rImgList.size(); j++) {
				String rvImg = rImgList.get(j).getBd_date() + rImgList.get(j).getOac_num();
				if (rv.equals(rvImg)) {
					sb.append("<div class='rv_img'>");
					sb.append("<img class='img' src='resources/reviewImg/" + rImgList.get(j).getRvImg_sysName()
							+ "' alt='" + rImgList.get(j).getRvImg_sysName() + "'></div>");
				}
			}
			sb.append("<div class='rv_text'>");
			sb.append(rList.get(i).getRv_text());
			sb.append("</div></div></li>");
		}
		sb.append("</ul>");
		sb.append("<div>");
		sb.append("<button id='addBtn' onclick='moreList();'>더보기</button>");
		sb.append("</div>");
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
		sb.append("<strong>계산서</strong><i id='bill_close_btn' class='fa fa-close' style='font-size:36px'></i>");
		for (int i = 0; i < bill.size(); i++) {
			sb.append("<div class='pList_detail'>");
			sb.append("<div class='pd_name'>" + bill.get(i).getPd_name() + "</div>");
			sb.append("<div class='pd_price'>" + bill.get(i).getPd_price() + "</div>");
			sb.append("<div class='oh_count'>" + bill.get(i).getOh_cnt() + "</div>");
			sb.append("</div>");
		}
		sb.append("<h2 id='sum'></h2>");

		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("bill", sb.toString());
		return hMap;
	}
}
