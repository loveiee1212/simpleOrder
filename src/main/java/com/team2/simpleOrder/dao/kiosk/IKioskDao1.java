package com.team2.simpleOrder.dao.kiosk;

import java.util.List;

import com.team2.simpleOrder.dto.Review;

public interface IKioskDao1 {

	List<Review> getReviewList(String c_code);

}
