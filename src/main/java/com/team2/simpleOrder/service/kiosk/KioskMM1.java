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
	private KioskMakeHtml kmh;

	// 판매 카테고리 리스트 및 판매키에 올라가 있는 상품 리스트 가져오는 메소드
	public HashMap<String, Object> getSellProductList(String c_code) {
		// 판매 카테고리 리스트 가져오기
		List<HashMap<String, Object>> skcList = kDao1.getSkcList(c_code);
		// 판매 등록 된 상품리스트 가져오기
		List<SellProduct> sellProList = kDao1.getSellProList(c_code);
		kmh = new KioskMakeHtml();
		return kmh.makeSellProListHtml(skcList, sellProList);
	}

	// 리뷰리스트 가져오는 메소드
	public HashMap<String, String> getReviewList(String c_code) {
		// 리뷰리스트 가져오기
		List<Review> rList = kDao1.getReviewList(c_code);
		// 리뷰 이미지 리스트 가져오기
		List<ReviewImg> rImgList = kDao1.getReviewImgList(c_code);
		kmh = new KioskMakeHtml();
		return kmh.makeReviewListHtml(rList, rImgList);
	}

	// 요청사항 설정 해놓은 것 가져오는 메소드
	public HashMap<String, String> getRequestList(String c_code) {
		// 요청사항 리스트 가져오기
		List<String> reqList = kDao1.getRequestList(c_code);
		kmh = new KioskMakeHtml();
		return kmh.reqListHtml(reqList);
	}

	// 계산서리스트 가져오는 메소드
	public HashMap<String, String> getBillList(String c_code, String oac_num, String bd_date) {
		// 계산서리스트 가져오기
		List<Bill> bill = kDao1.getBillList(c_code, oac_num, bd_date);
		kmh = new KioskMakeHtml();
		return kmh.billListHtml(bill);
	}

}
