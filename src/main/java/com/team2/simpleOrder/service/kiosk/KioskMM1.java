package com.team2.simpleOrder.service.kiosk;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import com.team2.simpleOrder.dao.kiosk.IKioskDao1;
import com.team2.simpleOrder.dao.order.IOrderDao2;
import com.team2.simpleOrder.dto.Bill;
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
	public HashMap<String, Object> getSellProductList(HttpSession session) {
		// 판매 카테고리 리스트 가져오기
		List<HashMap<String, Object>> skcList = kDao1.getSkcList(session.getAttribute("c_code").toString());
		// 판매 등록 된 상품리스트 가져오기
		List<SellProduct> sellProList = kDao1.getSellProList(session.getAttribute("c_code").toString());
		kmh = new KioskMakeHtml();
		return kmh.makeSellProListHtml(skcList, sellProList);
	}

	// 리뷰리스트 가져오는 메소드
	public HashMap<String, String> getReviewList(HttpSession session) {
		// 리뷰리스트 가져오기
		List<Review> rList = kDao1.getReviewList(session.getAttribute("c_code").toString());
		// 리뷰 이미지 리스트 가져오기
		List<ReviewImg> rImgList = kDao1.getReviewImgList(session.getAttribute("c_code").toString());
		kmh = new KioskMakeHtml();
		return kmh.makeReviewListHtml(rList, rImgList);
	}

	// 요청사항 설정 해놓은 것 가져오는 메소드
	public HashMap<String, String> getRequestList(HttpSession session) {
		// 요청사항 리스트 가져오기
		List<String> reqList = kDao1.getRequestList(session.getAttribute("c_code").toString());
		kmh = new KioskMakeHtml();
		return kmh.reqListHtml(reqList);
	}

	// 계산서리스트 가져오는 메소드
	public HashMap<String, String> getBillList(HttpSession session) {
		// 계산서리스트 가져오기
		String c_code="123123123123";
		String bd_date="2020-08-29 14:19:00";
		String oac_num="0001";
//		List<Bill> bill = kDao1.getBillList(session.getAttribute("c_code").toString(),
//				session.getAttribute("oac_num").toString(), session.getAttribute("bd_date").toString());
		List<Bill> bill = kDao1.getBillList(c_code,oac_num,bd_date);
		kmh = new KioskMakeHtml();
		return kmh.billListHtml(bill);
	}

	// 주문하기
	@Transactional
	public String insertOrder(HttpSession session, List<Map<String, String>> bArr) {
		KioskEntity kn = new KioskEntity();
		String c_code = session.getAttribute("c_code").toString();
		String bd_date = session.getAttribute("bd_date").toString();
		String oac_num = oDao2.getNewOacCode(c_code, bd_date);
		System.out.println(c_code);
		System.out.println(bd_date);
		System.out.println(oac_num);
		try {
			// 주문번호가 저장유무 확인 (주문번호가 없다/있다)
			if (session.getAttribute("oac_num") == null) {
				// 주문번호가 없으므로 손님은 최초주문(oac,oh 인서트)
				// order_and_credit안에 인서트 해줄 데이터들을 해쉬맵에 넣는다
				HashMap<String, String> oac = kn.getOac(c_code, bd_date, oac_num,
						session.getAttribute("sc_code").toString(), session.getAttribute("st_num").toString());
				System.out.println(oac);
				// order_and_credit insert
				if (!oDao2.createoacList(oac)) {
					return "errorkioskpage";
				}
				// order_history insert
				// order_history안에 인서트 해줄 데이터들을 해쉬맵에 넣는다
				List<HashMap<String, String>> ohList = kn.getOhList(c_code, bd_date, oac_num, bArr);
				System.out.println(ohList);
				for (int i = 0; i < ohList.size(); i++) {
					System.out.println(ohList.get(i));
					// insert결과가 false가 나오면 에러페이지
					if (!oDao2.sendsaoList(ohList.get(i))) {
						return "errorkioskpage";
					}
				}
				// 세션에 oac_num저장
				session.setAttribute("oac_num", oac_num);
			} else {
				// 주문번호가 있으므로 손님은 추가주문(oh 인서트)
				// order_history안에 인서트 해줄 데이터들을 해쉬맵에 넣는다
				List<HashMap<String, String>> ohList = kn.getOhList(c_code, bd_date, oac_num, bArr);
				System.out.println(ohList);
				for (int i = 0; i < ohList.size(); i++) {
					System.out.println(ohList.get(i));
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

	@Transactional
	public String insertReview(ArrayList<MultipartFile> rv_file, Review rv, HttpSession session) {
		if (kDao1.insertReview(rv)) { // 등록이 됐다면
			if (rv_file.size() != 0) {
				KioskEntity kn = new KioskEntity();

				for (int i = 0; i < rv_file.size(); i++) {
					rv.setRvImg_sysName(kn.makeSysName(rv, i, rv_file.get(i).getOriginalFilename()));
					kDao1.insertRvImg(rv);
				}
				kn.fileUp(rv, rv_file, session);
			}
			return "kioskmenu";
		} else {
			return "kioskmenu/aa";
		}
	}

	public String getReviewUse(HttpSession session) {
		
		return kDao1.getReviewUse(session.getAttribute("c_code").toString());
	}

}
