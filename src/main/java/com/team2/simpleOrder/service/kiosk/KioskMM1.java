package com.team2.simpleOrder.service.kiosk;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.simpleOrder.dao.kiosk.IKioskDao1;
import com.team2.simpleOrder.dto.Bill;
import com.team2.simpleOrder.dto.Review;
import com.team2.simpleOrder.dto.ReviewImg;
import com.team2.simpleOrder.dto.SellProduct;

@Service
public class KioskMM1 {
	@Autowired
	private IKioskDao1 kDao1;

	// 판매 카테고리 리스트 및 판매키에 올라가 있는 상품 리스트 가져오는 메소드
	public HashMap<String, String> getSellProductList(String c_code) {
		// 판매 카테고리 리스트 가져오기
		List<HashMap<String, Object>> skcList = kDao1.getSkcList(c_code);
		// 판매 등록 된 상품리스트 가져오기
		List<SellProduct> sellProList = kDao1.getSellProList(c_code);
		HashMap<String, String> proList = makeSellProListHtml(skcList, sellProList);
		return proList;
	}

	// 판매키에 올라가 있는 상품리스트 Html만드는 메소드
	private HashMap<String, String> makeSellProListHtml(List<HashMap<String, Object>> skcList,
			List<SellProduct> sellProList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<ul>");
		sb.append("<li><img alt='simpleOrderLogo' src='resources/image/logo.png'></li>");
		for (int i = 0; i < skcList.size(); i++) {
			sb.append("<li><a href='#c" + i + "List'>" + skcList.get(i).get("SKC_NAME") + "</a></li>");
		}
		sb.append("</ul>");
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("sellProList", sb.toString());
		return hMap;
	}

	// 리뷰리스트 가져오는 메소드
	public HashMap<String, String> getReviewList(String c_code) {
		// 리뷰리스트 가져오기
		List<Review> rList = kDao1.getReviewList(c_code);
		// 리뷰 이미지 리스트 가져오기
		List<ReviewImg> rImgList = kDao1.getReviewImgList(c_code);
		HashMap<String, String> rvList = makeReviewListHtml(rList, rImgList);
		return rvList;
	}

	// 리뷰 리스트 Html 만드는 메소드
	private HashMap<String, String> makeReviewListHtml(List<Review> rList, List<ReviewImg> rImgList) {
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
					sb.append("<img class='img' src='resources/img/" + rImgList.get(j).getRvImg_sysName() + "' alt='"
							+ rImgList.get(j).getRvImg_sysName() + "'></div>");
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

	// 요청사항 설정 해놓은 것 가져오는 메소드
	public HashMap<String, String> getRequestList(String c_code) {
		// 요청사항 리스트 가져오기
		List<String> reqList = kDao1.getRequestList(c_code);
		HashMap<String, String> reqHtml = reqListHtml(reqList);
		return reqHtml;
	}

	// 요청사항 리스트 Html 만드는 메소드
	private HashMap<String, String> reqListHtml(List<String> reqList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<ul>");
		for (int i = 0; i < reqList.size(); i++) {
			sb.append("<li>" + reqList.get(i) + "</li>");
		}
		sb.append("</ul>");
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("reqList", sb.toString());
		return hMap;
	}

	// 계산서리스트 가져오는 메소드
	public HashMap<String, String> getBillList(String c_code, String st_num, String bd_date) {
		// 계산서리스트 가져오기
		List<Bill> bill = kDao1.getBillList(c_code, st_num, bd_date);
		HashMap<String, String> billHtml = billListHtml(bill);
		return billHtml;
	}

	// 계산서 리스트 Html 만드는 메소드
	private HashMap<String, String> billListHtml(List<Bill> bill) {
		StringBuilder sb = new StringBuilder();
		sb.append("<strong>계산서</strong><i id='bill_close_btn' class='fa fa-close' style='font-size:36px'></i>");
		for (int i = 0; i < bill.size(); i++) {
			sb.append("<div class='pList_detail'>");
			sb.append("<div class='pd_name'>" + bill.get(i).getPd_name() + "</div>");
			sb.append("<div class='pd_price'>" + bill.get(i).getPd_price() + "</div>");
			sb.append("<div class='oh_count'>" + bill.get(i).getOh_count() + "</div>");
			sb.append("</div>");
		}
		sb.append("<h2 id='sum'></h2>");

		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("bill", sb.toString());
		return hMap;
	}
}
