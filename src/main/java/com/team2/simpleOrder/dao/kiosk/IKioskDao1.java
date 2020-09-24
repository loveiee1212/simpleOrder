package com.team2.simpleOrder.dao.kiosk;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.team2.simpleOrder.dto.Bill;
import com.team2.simpleOrder.dto.Review;
import com.team2.simpleOrder.dto.ReviewImg;
import com.team2.simpleOrder.dto.SellProduct;

public interface IKioskDao1 {
	// 리뷰리스트 가져오기
	List<Review> getReviewList(String c_code);

	// 리뷰이미지리스트 가져오기
	List<ReviewImg> getReviewImgList(String c_code);

	// 요청사항리스트 가져오기
	List<String> getRequestList(String c_code);

	// 계산서리스트 가져오기
	List<Bill> getBillList(@Param("c_code") String c_code, @Param("oac_num") String oac_num,
			@Param("bd_date") String bd_date);

	// 판매키 카테고리 리스트 가져오기
	List<HashMap<String, Object>> getSkcList(String c_code);

	// 판매키에 등록 된 상품 리스트 가져오기
	List<SellProduct> getSellProList(String c_code);

	// 회사코드와 영업일자 기준으로 주문번호 개수 가져오기
	@Select("SELECT COUNT(*) FROM ORDER_AND_CREDIT WHERE C_CODE=#{c_code} AND BD_DATE=#{bd_date}")
	int checkOac_cnt(@Param("c_code") String c_code, @Param("bd_date") String bd_date);

	// 상품코드 등록날짜, 상품 등록날짜 가져오기
	List<HashMap<String, Object>> find_pdc_and_pd_date(@Param("c_code") String c_code, @Param("pdc_code") String pdc_code,
			@Param("pd_code") String pd_code);

//	// order_and_credit에 insert
//	int insertOac(@Param("c_code") String c_code, @Param("bd_date") String bd_date, @Param("oac_plusNum") int oac_num,
//			@Param("sc_code") String sc_code, @Param("st_num") String st_num);
//
//	int insertOh(@Param("c_code") String c_code, @Param("bd_date") String bd_date, @Param("oac_plusNum") int oac_num,
//			@Param("pdc_code") String pdc_code, @Param("pd_code") String pd_code, @Param("pd_date") String pd_date,
//			@Param("pd_date") String oh_cnt);

}
