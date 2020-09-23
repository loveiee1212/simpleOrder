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

//	@Transactional
//	public String insertOrder(List<String> bskList, String c_code, String oac_num, String bd_date, String sc_code,
//			String st_num) {
//		List<HashMap<String, Object>> result =  new ArrayList<HashMap<String,Object>>();
//		for (int i = 0; i < bskList.size(); i++) {
////			System.out.println(bskList.get(i));
//			String[] order = bskList.get(i).split("/");
//			for (int j = 0; j < order.length; j++) {
////				System.out.println(order[j]);
//				String pdc_code = order[0];
//				String pd_code = order[1];
//				String oh_cnt = order[2];
//				result = kDao1.find_pdc_and_pd_date(c_code, pdc_code, pd_code);
//				
////				ohResult[j]=kDao1.insertOh(c_code, bd_date, oac_plusNum, pdc_code, pd_code, pd_date, oh_cnt);
//			}
//		}
//		for (int z = 0; z < result.size(); z++) {
//			System.out.println(result.get(z).get("pdc_code"));
//			System.out.println(result.get(z).get("pd_code"));
//			result.get(z).get("pdc_code");
//			result.get(z).get("pd_code");
//		}
////		int oacResult=0;
////		int[] ohResult=null;
////		int oac_plusNum;
////		// 영업일 기준 주문번호 카운트
////		
////		int bd_cnt = kDao1.checkOac_cnt(c_code, bd_date);
////		if (bd_cnt == 0) {
////			// 주문번호를 +1해서 주문번호를 만들어준다
////			oac_plusNum = bd_cnt + 1;
////			System.out.println("count결과+1"+oac_plusNum);
////			// oac(c_code,bd_date,oac_num,sc_code,st_num,df,df)
////			oacResult = kDao1.insertOac(c_code, bd_date, oac_plusNum, sc_code, st_num);
////			// oh(c_code,bd_date,oac_num,pdc_code,pd_code,pd_date,df,oh_cnt)
////			ohResult=insertOh(c_code, bd_date, oac_plusNum, bskList);
////		} else {
////			// oac_num을 그대로
////			if (oac_num == null) {
////				oac_plusNum = bd_cnt + 1;
////				System.out.println("null값일때"+oac_plusNum);
////				// 초기주문
////				// oac(c_code,bd_date,oac_plusNum,sc_code,st_num,df,df)
////				oacResult = kDao1.insertOac(c_code, bd_date, oac_plusNum, sc_code, st_num);
////				// oh(c_code,bd_date,oac_num,pdc_code,pd_code,pd_date,df,oh_cnt)
////				ohResult=insertOh(c_code, bd_date, oac_plusNum, bskList);
////
////			} else {
////				// 주문번호 그대로
////				// 추가주문
////				oac_plusNum=Integer.parseInt(oac_num);
////				// oh(c_code,bd_date,oac_num,pdc_code,pd_code,pd_date,df,oh_cnt)
////				ohResult=insertOh(c_code, bd_date, oac_plusNum, bskList);
////			}
////
////		}
////		for(int i=0; i<ohResult.length; i++) {
////			System.out.println(ohResult[i]);
////		}
////		System.out.println(oacResult);
//
//		return null;
//	}
//
//	private int[] insertOh(String c_code, String bd_date, int oac_plusNum, List<String> bskList) {
//		int ohResult[] = null;
//		for (int i = 0; i < bskList.size(); i++) {
//			System.out.println(bskList.get(i));
//			String[] order = bskList.get(i).split("/");
//			for (int j = 0; j < order.length; j++) {
//				System.out.println(order[j]);
//				String pdc_code = order[0];
//				String pd_code = order[1];
//				String oh_cnt = order[2];
////				List<HashMap<String, Object>> result = kDao1.find_pdc_and_pd_date(c_code, pdc_code, pd_code);
////				ohResult[j] = kDao1.insertOh(c_code, bd_date, oac_plusNum, pdc_code, pd_code, pd_date, oh_cnt);
//			}
//		}
//		return ohResult;
//	}

}
