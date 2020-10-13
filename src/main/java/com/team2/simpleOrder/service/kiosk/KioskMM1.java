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
		return new KioskMakeHtml().makeSellProListHtml(skcList, sellProList, session.getAttribute("c_code").toString());
	}

	// 리뷰리스트 가져오는 메소드
	public HashMap<String, String> getReviewList(HttpSession session, int rvNum) {
		// 리뷰리스트 가져오기
		List<Review> rList = kDao1.getReviewList(session.getAttribute("c_code").toString(), rvNum);
		if (rList.size() == 0) {
			HashMap<String, String> hMap = new HashMap<String, String>();
			hMap.put("rvList", "<div id='msg'>등록 된 리뷰가 없습니다<div>");
			return hMap;
		}
		// 리뷰 이미지 리스트 가져오기
		List<HashMap<String, Object>> rImgList = kDao1.getReviewImgList(session.getAttribute("c_code").toString(),
				rList.get(0).getOac_num(), rList.get(rList.size() - 1).getOac_num());
		// 리뷰 주문내역 가져오기
		List<HashMap<String, Object>> orderList = kDao1.getOrderList(session.getAttribute("c_code").toString(),
				rList.get(0).getOac_num(), rList.get(rList.size() - 1).getOac_num());

		return new KioskMakeHtml().makeReviewListHtml(rList, rImgList, orderList,
				session.getAttribute("c_code").toString());
	}

	// 요청사항 설정 해놓은 것 가져오는 메소드
	public HashMap<String, String> getRequestList(HttpSession session) {
		// 주문번호 기준으로 테이블번호 재설정
		HashMap<String, String> tabInfo = kDao1.checkTabNum(session.getAttribute("c_code").toString(),
				session.getAttribute("bd_date").toString(), session.getAttribute("oac_num").toString());
		session.setAttribute("sc_code", tabInfo.get("SC_CODE"));
		session.setAttribute("st_num", tabInfo.get("ST_NUM"));
		// 요청사항 리스트 가져오기
		List<String> reqList = kDao1.getRequestList(session.getAttribute("c_code").toString());
		return new KioskMakeHtml().reqListHtml(reqList);
	}

	// 계산서리스트 가져오는 메소드
	public HashMap<String, String> getBillList(HttpSession session) {
		// 계산서리스트 가져오기
		List<Bill> bill = kDao1.getBillList(session.getAttribute("c_code").toString(),
				session.getAttribute("oac_num").toString(), session.getAttribute("bd_date").toString());
		if (bill.size() == 0) {
			HashMap<String, String> hMap = new HashMap<String, String>();
			hMap.put("bill", "<div id='billMsg'>주문내역이 없습니다</div>");
			return hMap;
		} else {
			return new KioskMakeHtml().billListHtml(bill);
		}
	}

	// 주문하기
	@Transactional
	public HashMap<String, String> insertOrder(HttpSession session, List<Map<String, String>> bArr) {
		KioskEntity kn = new KioskEntity();
		String c_code = session.getAttribute("c_code").toString();
		String bd_date = session.getAttribute("bd_date").toString();
		HashMap<String, String> hMap = new HashMap<String, String>();
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
					hMap.put("msg", "주문에 실패하였습니다 다시 시도해주세요");
					hMap.put("view", "kioskorder");
				}
				// order_history insert
				// order_history안에 인서트 해줄 데이터들을 해쉬맵에 넣는다
				List<HashMap<String, String>> ohList = kn.getOhList(c_code, bd_date, oac_num, bArr);
				for (int i = 0; i < ohList.size(); i++) {
					HashMap<String, String> stk = kDao1.checkStock(ohList.get(i));
					if (stk != null) {
						hMap.put("msg", stk.get("PD_NAME")+"의 재고가 부족합니다");
						hMap.put("view", "kioskorder");
						TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						return hMap;
					} else {
						if (!oDao2.sendsaoList(ohList.get(i))) {
							hMap.put("msg", "주문에 실패하였습니다 다시 시도해주세요");
							hMap.put("view", "kioskorder");
						} else {
							oDao2.updatestkList(ohList.get(i));
						}
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
					HashMap<String, String> stk = kDao1.checkStock(ohList.get(i));
					if (stk != null) {
						hMap.put("msg", stk.get("PD_NAME")+"의 재고가 부족합니다");
						hMap.put("view", "kioskorder");
						TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						return hMap;
					} else {
						if (!oDao2.sendsaoList(ohList.get(i))) {
							hMap.put("msg", "주문에 실패하였습니다 다시 시도해주세요");
							hMap.put("view", "kioskorder");
						} else {
							oDao2.updatestkList(ohList.get(i));
						}
					}
				}
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			hMap.put("msg", "주문에 실패하였습니다 다시 시도해주세요");
			hMap.put("view", "kioskorder");
		}
		hMap.put("msg", "주문에 성공하였습니다 잠시 기다려주세요");
		hMap.put("view", "kioskmenu");
		return hMap;
	}

	public HashMap<String, String> kioskMainReady(HttpSession session) {
		String c_code = session.getAttribute("c_code").toString();
		String bd_date = session.getAttribute("bd_date").toString();
		HashMap<String, String> mainInfo = new HashMap<String, String>();
		if (session.getAttribute("oac_num") == null) {
			mainInfo.put("bill", "<div id='billMsg'>주문내역이 없습니다</div>");
			mainInfo.put("oac_time", "null");
		} else {
			String oac_num = session.getAttribute("oac_num").toString();
			// 주문내역
			List<Bill> bill = kDao1.getBillList(c_code, oac_num, bd_date);
			if (bill.size() == 0) {
				mainInfo.put("bill", "<div id='billMsg'>주문내역이 없습니다</div>");
				mainInfo.put("oac_time", "null");
			} else {
				mainInfo.put("bill", new KioskMakeHtml().billListHtml(bill).get("bill"));
				// 주문 시작 시간
				mainInfo.put("oac_time", kDao1.getOac_time(c_code, bd_date, oac_num));
			}
		}

		// 사업자 리뷰사용 여부
		String rvUseCode = kDao1.getReviewUse(c_code);
		mainInfo.put("rvUseCode", rvUseCode);
		// 테이블 카테고리 명
		String sc_name = kDao1.getSc_name(c_code, session.getAttribute("sc_code").toString());
		mainInfo.put("sc_name", sc_name);
		return mainInfo;

	}

	public HashMap<String, String> getOac_status(HttpSession session) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		int oac_status = kDao1.getOac_status(session.getAttribute("c_code").toString(), session.getAttribute("bd_date").toString(), session.getAttribute("oac_num").toString());
		if (oac_status == -1) {
			hMap.put("oac_status", oac_status+"");
			hMap.put("oac_num", session.getAttribute("oac_num").toString());
			session.removeAttribute("oac_num");
		}
		hMap.put("oac_status", oac_status+"");
		return hMap;
	}

	public String getOrderNum(HttpSession session) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("c_code", session.getAttribute("c_code").toString());
		hm.put("st_num", session.getAttribute("st_num").toString());
		hm.put("sc_code", session.getAttribute("sc_code").toString());
		String oac_num = kDao1.getOrderNum(hm);
		if(oac_num!=null) {
			session.setAttribute("oac_num", oac_num);
		}
		return oac_num;
	}
}
