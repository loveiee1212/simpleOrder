package com.team2.simpleOrder.dao.kiosk;

import java.util.List;

import com.team2.simpleOrder.dto.Review;
import com.team2.simpleOrder.dto.ReviewImg;

public interface IKioskDao1 {
	//리뷰리스트 가져오기
	List<Review> getReviewList(String c_code);

	//리뷰이미지리스트 가져오기
	List<ReviewImg> getReviewImgList(String c_code);

	//요청사항리스트 가져오기
	List<String> getRequestList(String c_code);

}
