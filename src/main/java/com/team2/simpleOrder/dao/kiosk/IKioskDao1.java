package com.team2.simpleOrder.dao.kiosk;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	List<HashMap<String,Object>> getSkcList(String c_code);

	// 판매키에 등록 된 상품 리스트 가져오기
	List<SellProduct> getSellProList(String c_code);

}
