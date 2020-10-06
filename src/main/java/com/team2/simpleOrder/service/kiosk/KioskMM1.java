package com.team2.simpleOrder.service.kiosk;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.team2.simpleOrder.dao.kiosk.IKioskDao1;
import com.team2.simpleOrder.dao.order.IDetailOrderDao;
import com.team2.simpleOrder.dto.Bill;
import com.team2.simpleOrder.dto.Review;
import com.team2.simpleOrder.dto.SellProduct;

@Service
public class KioskMM1 {
	@Autowired
	private IKioskDao1 kDao1;
	@Autowired
	private IDetailOrderDao oDao2;

	// 판매 카테고리 리스트 및 판매키에 올라가 있는 상품 리스트 가져오는 메소드
	public HashMap<String, Object> getSellProductList(HttpSession session) {
		// 판매 카테고리 리스트 가져오기
		List<HashMap<String, Object>> skcList = kDao1.getSkcList(session.getAttribute("c_code").toString());
		// 판매 등록 된 상품리스트 가져오기
		List<SellProduct> sellProList = kDao1.getSellProList(session.getAttribute("c_code").toString());
		return new KioskMakeHtml().makeSellProListHtml(skcList, sellProList,session.getAttribute("c_code").toString());
	}

	// 리뷰리스트 가져오는 메소드
	public HashMap<String, String> getReviewList(HttpSession session, int rvNum) {
		// 리뷰리스트 가져오기
		List<Review> rList = kDao1.getReviewList(session.getAttribute("c_code").toString(), rvNum);
		System.out.println(rList);
		// 리뷰 이미지 리스트 가져오기
		List<HashMap<String, Object>> rImgList = kDao1.getReviewImgList(session.getAttribute("c_code").toString(),
				rList.get(0).getOac_num(), rList.get(rList.size() - 1).getOac_num());
		System.out.println(rImgList);
		// 리뷰 주문내역 가져오기
		List<HashMap<String, Object>> orderList = kDao1.getOrderList(session.getAttribute("c_code").toString(),
				rList.get(0).getOac_num(), rList.get(rList.size() - 1).getOac_num());
		System.out.println(orderList);
		return new KioskMakeHtml().makeReviewListHtml(rList, rImgList, orderList);
	}

	// 요청사항 설정 해놓은 것 가져오는 메소드
	public HashMap<String, String> getRequestList(HttpSession session) {
		// 요청사항 리스트 가져오기
		List<String> reqList = kDao1.getRequestList(session.getAttribute("c_code").toString());
		return new KioskMakeHtml().reqListHtml(reqList);
	}

	// 계산서리스트 가져오는 메소드
	public HashMap<String, String> getBillList(HttpSession session) {
		// 계산서리스트 가져오기
		List<Bill> bill = kDao1.getBillList(session.getAttribute("c_code").toString(),
				session.getAttribute("oac_num").toString(), session.getAttribute("bd_date").toString());
		return new KioskMakeHtml().billListHtml(bill);
	}

	// 주문하기
	@Transactional
	public String insertOrder(HttpSession session, List<Map<String, String>> bArr) {
		KioskEntity kn = new KioskEntity();
		String c_code = session.getAttribute("c_code").toString();
		String bd_date = session.getAttribute("bd_date").toString();
		System.out.println(c_code);
		System.out.println(bd_date);
		try {
			// 주문번호가 저장유무 확인 (주문번호가 없다/있다)
			if (session.getAttribute("oac_num") == null) {
				String oac_num = oDao2.getNewOacCode(c_code, bd_date);
				System.out.println(oac_num);
				// 주문번호가 없으므로 손님은 최초주문(oac,oh 인서트)
				// order_and_credit안에 인서트 해줄 데이터들을 해쉬맵에 넣는다
				HashMap<String, String> oac = kn.getOac(c_code, bd_date, oac_num,
						session.getAttribute("sc_code").toString(), session.getAttribute("st_num").toString());
				System.out.println(oac);
				// order_and_credit insert
				if (!oDao2.createoacList(oac)) {
					return "kioskorder";
				}
				// order_history insert
				// order_history안에 인서트 해줄 데이터들을 해쉬맵에 넣는다
				List<HashMap<String, String>> ohList = kn.getOhList(c_code, bd_date, oac_num, bArr);
				for (int i = 0; i < ohList.size(); i++) {
					// insert결과가 false가 나오면 에러페이지
					if (!oDao2.sendsaoList(ohList.get(i))) {
						return "kioskorder";
					} else {
						oDao2.updatestkList(ohList.get(i));
					}
				}
				// 세션에 oac_num저장
				session.setAttribute("oac_num", oac_num);
			} else {
				String oac_num = session.getAttribute("oac_num").toString();
				// 주문번호가 있으므로 손님은 추가주문(oh 인서트)
				// order_history안에 인서트 해줄 데이터들을 해쉬맵에 넣는다
				List<HashMap<String, String>> ohList = kn.getOhList(c_code, bd_date, oac_num, bArr);
				for (int i = 0; i < ohList.size(); i++) {
					if (!oDao2.sendsaoList(ohList.get(i))) {
						return "kioskorder";
					} else {
						oDao2.updatestkList(ohList.get(i));
					}
				}
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return "kioskorder";
		}
		return "kioskmenu";
	}

	public HashMap<String, String> kioskMainReady(HttpSession session) {
		HashMap<String, String> mainInfo = new HashMap<String, String>();
		System.out.println(session.getAttribute("oac_num") == null);

		if (session.getAttribute("oac_num") == null) {// 만약 주문번호가 없다면 메시지 저장
			mainInfo.put("bill",
					"<br><br><br><br><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
					+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문내역이 없습니다");
			mainInfo.put("oac_time","null");
		} else {// 있다면 주문내역 전송
			//주문내역
			List<Bill> bill = kDao1.getBillList(session.getAttribute("c_code").toString(),
					session.getAttribute("oac_num").toString(), session.getAttribute("bd_date").toString());
			mainInfo.put("bill", new KioskMakeHtml().billListHtml(bill).get("bill"));
			// 주문 시작 시간
			String oac_time = kDao1.getOac_time(session.getAttribute("c_code").toString(),
					session.getAttribute("bd_date").toString(), session.getAttribute("oac_num").toString());
			mainInfo.put("oac_time", oac_time);
		}
		
		// 사업자 리뷰사용 여부
		String rvUseCode = kDao1.getReviewUse(session.getAttribute("c_code").toString());
		mainInfo.put("rvUseCode", rvUseCode);
		// 테이블 카테고리 명
		String sc_name = kDao1.getSc_name(session.getAttribute("c_code").toString(),
				session.getAttribute("sc_code").toString());
		mainInfo.put("sc_name", sc_name);

		return mainInfo;
	}

	public HashMap<String, String> getOac_status(HttpSession session) {
		int oac_status = kDao1.getOac_status(session.getAttribute("c_code").toString(),
				session.getAttribute("bd_date").toString(), session.getAttribute("oac_num").toString());
		if (oac_status == -1) {
			session.removeAttribute("sc_code");
			session.removeAttribute("st_num");
			HashMap<String, String> hMap = new HashMap<String, String>();
			hMap.put("view", "kioskreview");
			return hMap;
		}
		return null;
	}

}
