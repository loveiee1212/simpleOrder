package com.team2.simpleOrder.service.kiosk;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.transaction.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.team2.simpleOrder.dao.kiosk.IKioskDao1;
import com.team2.simpleOrder.dao.order.IOrderDao2;
import com.team2.simpleOrder.dto.Bill;
import com.team2.simpleOrder.dto.KioskEntity;
import com.team2.simpleOrder.dto.Review;
import com.team2.simpleOrder.dto.ReviewImg;
import com.team2.simpleOrder.dto.SellProduct;

@Service
public class KioskMM1 {
	@Autowired
	private IKioskDao1 kDao1;
	@Autowired
	private IOrderDao2 oDao2;
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

	// 주문하기
	@Transactional
	public String insertOrder(HttpSession session, List<Map<String, String>> bArr, String c_code, String bd_date,
			String oac_num, String sc_code, String st_num) {
		KioskEntity kn = new KioskEntity();
		try {

			if (oac_num == null) {
				// 손님 초기주문
				oac_num = oDao2.getNewOacCode(c_code, bd_date);
				System.out.println(oac_num);
				// order_and_credit안에 인서트 해줄 데이터들을 해쉬맵으로 넣는다
				HashMap<String, String> oac = kn.getOac(c_code, bd_date, oac_num, sc_code, st_num);
				// order_and_credit insert
				// insert결과가 false가 나오면 에러페이지
				if (!oDao2.createoacList(oac)) {
					return "errorkioskpage";
				}
				// order_history insert
				// insert결과가 false가 나오면 에러페이지
				List<HashMap<String, String>> ohList = kn.getOhList(c_code, bd_date, oac_num, bArr);
				for (int i = 0; i < ohList.size(); i++) {
					if (!oDao2.sendsaoList(ohList.get(i))) {
						return "errorkioskpage";
					}
				}

				// 세션에 oac_num저장
				session.setAttribute("oac_num", oac_num);
			} else {
				// 손님 추가 주문
				// order_history insert
				// insert결과가 false가 나오면 에러페이지
				List<HashMap<String, String>> ohList = kn.getOhList(c_code, bd_date, oac_num, bArr);
				for (int i = 0; i < ohList.size(); i++) {
					if (!oDao2.sendsaoList(ohList.get(i))) {
						return "errorkioskpage";
					}
				}
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}

		return "kioskmenu";
	}

}
