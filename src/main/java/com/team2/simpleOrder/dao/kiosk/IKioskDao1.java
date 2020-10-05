package com.team2.simpleOrder.dao.kiosk;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.team2.simpleOrder.dto.Bill;
import com.team2.simpleOrder.dto.Review;
import com.team2.simpleOrder.dto.SellProduct;

public interface IKioskDao1 {
	// 리뷰리스트 가져오기
	List<Review> getReviewList(@Param("c_code") String c_code, @Param("rvNum") int rvNum);

	// 리뷰이미지리스트 가져오기
	List<HashMap<String, Object>> getReviewImgList(@Param("c_code") String c_code, @Param("firNum") String firNum,
			@Param("finNum") String finNum);

	// 리뷰 주문 목록 리스트 가져오기
	List<HashMap<String, Object>> getOrderList(@Param("c_code") String c_code, @Param("firNum") String firNum,
			@Param("finNum") String finNum);

	// 요청사항리스트 가져오기
	List<String> getRequestList(String c_code);

	// 계산서리스트 가져오기
	List<Bill> getBillList(@Param("c_code") String c_code, @Param("oac_num") String oac_num,
			@Param("bd_date") String bd_date);

	// 판매키 카테고리 리스트 가져오기
	List<HashMap<String, Object>> getSkcList(String c_code);

	// 판매키에 등록 된 상품 리스트 가져오기
	List<SellProduct> getSellProList(String c_code);

	// 상품코드 등록날짜, 상품 등록날짜 가져오기
	List<HashMap<String, Object>> find_pdc_and_pd_date(@Param("c_code") String c_code,
			@Param("pdc_code") String pdc_code, @Param("pd_code") String pd_code);

	// 리뷰 인서트
	@Insert("INSERT INTO REVIEW VALUES(#{c_code},#{bd_date},#{oac_num},DEFAULT,#{rv_text},#{rv_score})")
	boolean insertReview(Review rv);

	// 리뷰이미지 인서트
	@Insert("INSERT INTO REVIEW_IMG VALUES(#{c_code},#{bd_date},#{oac_num},#{rvImg_sysName})")
	void insertRvImg(Review rv);

	// sc_name가져오기
	@Select("SELECT SC_NAME FROM SEAT_CT WHERE C_CODE=#{c_code} AND SC_CODE=#{sc_code}")
	String getSc_name(@Param("c_code") String c_code, @Param("sc_code") String sc_code);

	// 리뷰 사용 여부 가져오기
	@Select("SELECT C_REVIEWUSE FROM COMPANY WHERE C_CODE=#{c_code}")
	String getReviewUse(@Param("c_code") String c_code);

	// 최초 주문 시간 가져오기
	@Select("SELECT OAC_STATUSCHANGETIME FROM ORDER_AND_CREDIT WHERE c_code=#{c_code} AND BD_DATE=#{bd_date} AND OAC_NUM = #{oac_num}")
	String getOac_time(@Param("c_code") String c_code, @Param("bd_date") String bd_date,
			@Param("oac_num") String oac_num);

}
